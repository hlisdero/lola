%{ CODE HEADER KC_TYPES KC_TYPES_HEADER KC_REWRITE KC_REWRITE_HEADER KC_UNPARSE KC_UNPARSE_HEADER KC_CSGIO KC_CSGIO_HEADER
//
// The Termprocessor Kimwitu++
//
// Copyright (C) 1991 University of Twente, Dept TIOS.
// Copyright (C) 1998-2007 Humboldt-Universität zu Berlin, Institute of Informatics
// All rights reserved.
//
// Kimwitu++ is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// Kimwitu++ is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Kimwitu++; if not, write to the Free Software
// Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA
//
%}
//
// main.cc
//
%{
#include "defs.h"
#ifndef KIMWITUCOPYRIGHT
# define KIMWITUCOPYRIGHT "@(#) Kimwitu++ version: (unknown) (c) 2007 Humboldt-University of Berlin"
#endif
#ifndef RCSMAKEID
# define RCSMAKEID "@(#) Makefile version unknown"
#endif
static char kimwc_cAccesSid[] = "@(#)$Id: main.k,v 1.89 2007-04-19 08:31:50 piefel Exp $";
static char kimwitu_release[] = KIMWITURELEASE; // defined in Makefile
static char kimwitu_version[] = KIMWITUVERSIONSTRING; // defined in Makefile
static char Makefile_AccesSid[] = RCSMAKEID; // defined in Makefile
char kimwitu_copyright[] = KIMWITUCOPYRIGHT; // defined in Makefile (used in gen.k)

// For access
#ifdef HAVE_UNISTD_H
# include <unistd.h>
#else
  inline int
  access(const char*, int) { return 0; }
# define R_OK 4
#endif
#if defined(_WIN32) && ! defined (__GNUC__)
#  define popen _popen
#endif

// next include files needed for stat
#if defined(KC_USE_STAT)
# include <sys/stat.h>
# if defined(_WIN32) && ! defined (__GNUC__)
#  define stat _stat
# endif
#endif

// for signal/sigvec
#include <signal.h>
#ifdef  SIGHOLD			// must be SVR4
# define signal  sigset		// use reliable signals on SVR4
#endif


#include <iostream>
using std::cout;
using std::endl;
using std::flush;

// string(s) stuff
#include <sstream>
#include <string>
#include <vector>
using std::string;

#include "getopt.h"

extern int yyparse(void);
extern void yyrestart(FILE*);
extern void do_NORMAL(void);

#include "unpk.h"

#include "gutil.h"
#include "util.h"
#include "pat.h"

#define STDINPUTNAME "stdin"

extern FILE *yyin;
static const char *const Thetempccfile=".kc.cc.temp";
static const char *const Thetemphfile=".k.h.temp" ;

/*
 * the following (3) variables are used by processargs and prepare_for_next_file
 */
static char **inputfilenames = 0;
static int no_inputfiles = 0;
static int current_inputfile;

%}

%{ KC_TYPES_HEADER
#include "config.h"

extern char kimwitu_copyright[] ; // defined above
extern casestring g_progname;
extern const char* pg_line;
struct cmdline_options {
    std::string hfilename;
    std::string ccfilename;
    bool quiet;
    bool verbose;
    bool no_csgio;
    bool no_unparse;
    bool no_rewrite;
    bool no_printdot;
    bool no_hashtables;
    bool operator_cast;
    bool smart_pointer;
    bool weak_pointer;
    char covariant;
    std::string for_bison;
    bool for_yxx;
    bool overwrite;
    bool linedirec;
    bool rw_loop;
    std::string stdafx;
    std::string dllexports;
    std::string prefix;
    std::string suffix;
    std::string filter;
    std::string msg_format;
    std::string dir_line;
    bool warn_drop_identical_patterns; // actually dropped from generated code (old test)
    bool warn_equivalent_patterns; // informational only (new test)
    bool warn_overlapping_patterns;
    cmdline_options(): hfilename(""), ccfilename(""),
	quiet(false), verbose(false), no_csgio(false), no_unparse(false), no_rewrite(false),
	no_printdot(false), no_hashtables(false), operator_cast(false), smart_pointer(false),
	weak_pointer(false), covariant('y'), for_bison(""), for_yxx(false), overwrite(false),
	linedirec(true), rw_loop(false), stdafx(""), dllexports(""), prefix(""), suffix("cc"),
	filter(""), msg_format(""), dir_line(""),
	warn_drop_identical_patterns(true),
	warn_equivalent_patterns(true),
	warn_overlapping_patterns(false) { }
};
extern cmdline_options g_options;
%}
%{
casestring g_progname;
const char* pg_line("#line ");
static const char *progname_initvalue = "kc++";

cmdline_options g_options;

%}


static FILE*
openfile(const char* file, const char* mode)
{
    if(g_options.filter=="")
	return fopen(file,mode);
    else
	return popen((g_options.filter+" "+file).c_str(),mode);
}

static char*
get_basename(char *s)
{
    char *basename = strrchr( s, '/');
    if (basename == NULL) {
	basename = s;
    } else {
	basename++;
    }
    return basename;
}

static void
print_version()
{
    printf("Kimwitu++ version %s\n\n\
Copyright (C) 1997-2007 Michael Piefel, Humboldt-University Berlin\n\
Kimwitu++ comes with ABSOLUTELY NO WARRANTY; for details see GPL.\n\
This is free software, and you are welcome to redistribute it under\n\
certain conditions; for details see GPL.\n", kimwitu_version);
}

static void
print_help()
{
    printf("Usage: %s [options] file...\n\n", g_progname->name);
    printf("\
Options:\n\
  Kimwitu++ Features:\n\
  -c, --no-csgio          no read/write functions (csgio.{h,cc}) are generated\n\
  -r, --no-rewrite        no code for rewrite rules (rk.{h,cc}) is generated\n\
  -u, --no-unparse        no code for unparse rules (unpk.{h,cc}) is generated\n\
  -d, --no-printdot       no printdot functions are generated\n\
  -t, --no-hashtables     no code for hashtables is generated (works only when\n\
                            both --no-csgio and --no-printdot are specified)\n\
      --operator-cast     generate operatork.h for operator_cast<>\n");
    printf("\
  C++ Compiler Options:\n\
  -n, --covariant=C       use covariant return types: yes|no|pre\n\
      --stdafx[=FILE]     include for Microsoft precompiled header files is\n\
                            generated (default stdafx.h)\n\
  -e, --dllexport=STRING  generates string between keyword class and the\n\
                            class name of all operators and phyla\n\
  -m, --smart-pointer     generates code for smart pointers (reference counting)\n\
  -w, --weak-pointer      generates code for weak pointers\n\
                            (implies --smart-pointer)\n");
    printf("\
  Files:\n\
  -s, --suffix=EXT        extension for generated source files (default cc)\n\
  -f, --file-prefix=PREF  prefix for generated files\n\
  -o, --overwrite         always write generated files even if not changed.\n\
  -b, --yystype[=FILE]    generates file (default yystype.h) containing YYSTYPE\n\
                            for yacc or bison\n\
  -y, --yxx-union         generates file yxx_union.h for yacc++\n");
    printf("\
  Advanced:\n\
  -l, --no-linedirec      doesn't print line directives ('#line')\n\
      --comment-line      print line comments ('//line') instead of directives\n\
      --dir-line          prepends the current working directory to the file\n\
                            name in line directives\n\
      --rw-loop           generates a non recursive rewrite function\n\
  -p, --pipe=CMD          process all files while piping them through CMD.\n");
    printf("\
  Other:\n\
  -M, --msg-format=PAT    specifies format of (error) messages, PAT can contain:\n\
                            %%p (program name), %%s (severity), %%f (file name),\n\
                            %%d (current working directory), %%l (line number),\n\
                            %%c (column); the actual message is appended\n\
  -q, --quiet             quiet operation\n\
  -v, --verbose           print additional status information while processing\n\
  -W                      enable all warnings; use comma-seperated list for\n\
                            detailed control (can be prefixed with 'no')\n\
                            drop - dropped rule bodies (no code generated)\n\
                            equiv - equivalent patterns (cannot match)\n\
                            overlap - possibly overlapping patterns\n\
  -h, --help              display this help and exit\n\
  -V, --version           output version information and exit\n");
}

static void
processargs(int argc, char* argv[])
{
    g_progname = mkcasestring(get_basename(argv[0]));

    enum { O_stdafx = 1, O_commment_line, O_dir_line, O_rw_loop, O_operator_cast };
    static struct option const long_options[] = {
	{"no-csgio", no_argument, 0, 'c'},
	{"no-rewrite", no_argument, 0, 'r'},
	{"no-unparse", no_argument, 0, 'u'},
	{"no-printdot", no_argument, 0, 'd'},
	{"no-hashtables", no_argument, 0, 't'},
	{"operator-cast", no_argument, 0, O_operator_cast},
	{"suffix", required_argument, 0, 's'},
	{"file-prefix", required_argument, 0, 'f'},
	{"covariant", required_argument, 0, 'n'},
	{"stdafx", optional_argument, 0, O_stdafx},
	{"dllexport", required_argument, 0, 'e'},
	{"smart-pointer", no_argument, 0, 'm'},
	{"weak-pointer", no_argument, 0, 'w'},
	{"no-linedirec", no_argument, 0, 'l'},
	{"comment-line", no_argument, 0, O_commment_line},
	{"dir-line", no_argument, 0, O_dir_line},
	{"rw-loop", no_argument, 0, O_rw_loop},
	{"yystype", optional_argument, 0, 'b'},
	{"yxx-union", no_argument, 0, 'y'},
	{"overwrite", no_argument, 0, 'o'},
	{"pipe", required_argument, 0, 'p'},
	{"msg-format", required_argument, 0, 'M'},
	{"quiet", no_argument, 0, 'q'},
	{"silent", no_argument, 0, 'q'},
	{"verbose", no_argument, 0, 'v'},
	{"help", no_argument, 0, 'h'},
	{"version", no_argument, 0, 'V'},
	{0, 0, 0, 0}
    };

    int c;
    while ((c = getopt_long (argc, argv,
		    "c"     // no-csgio
		    "r"     // no-rewrite
		    "u"     // no-unparse
		    "d"     // no-printdot
		    "t"     // no-hastables
		    "s:"    // suffix
		    "f:"    // file-prefix
		    "n:"    // covariant
		    "e:"    // dllexport
		    "m"     // smart-pointer
		    "w"     // weak-pointer
		    "l"     // no-linedirec
		    "b::"   // yystype
		    "y"     // yxx-union
		    "o"     // overwrite
		    "p:"    // pipe
		    "M:"    // msg_format
		    "q"     // quiet or silent
		    "v"     // verbose
		    "W::"   // warning level
		    "h"	    // help
		    "V"	    // version
		    , long_options, 0)) != -1)
	switch (c) {
	case 'V':
	    print_version();
	    leave(0);
	case '?':
	    // unknown option, FALLTHROUGH, message from getopt_long
	case ':':
	    // not enough arguments to option, FALLTHROUGH, message from getopt_long
	case 'h':
	    print_help();
	    leave(0);
	case 'p':
	    g_options.filter=optarg;
	    continue;
	case 'q':
	    g_options.quiet=true;
	    if (g_options.verbose)
		v_report(Warning(NoFileLine(),
			    Problem1S("Can't be quiet when asked to be verbose.")));
	    continue;
	case 'v':
	    g_options.verbose=true;
	    if (g_options.quiet)
		v_report(Warning(NoFileLine(),
			    Problem1S("Can't be verbose when asked to be quiet.")));
	    continue;
	case 'W':
	    if (!optarg) {
		g_options.warn_drop_identical_patterns = true; // default
		g_options.warn_equivalent_patterns = true; // default
		g_options.warn_overlapping_patterns = true;
	    } else {
		// use a small scanner here to find out which options to set
		std::vector<string> warn_options;
		warn_options.push_back("");
		int option_count=0;
		// Tokenize
		while (*optarg) {
		    if (*optarg == ',') {
			warn_options.push_back("");
			option_count++;
		    } else
			warn_options[option_count] += *optarg;
		    optarg++;
		}
		// evaluate
		for (int i=0; i <= option_count; ++i) {
		    if (warn_options[i] == "drop")
			g_options.warn_drop_identical_patterns = true;
		    else if (warn_options[i] == "nodrop")
			g_options.warn_drop_identical_patterns = false;
		    else if (warn_options[i] == "equiv")
			g_options.warn_equivalent_patterns = true;
		    else if (warn_options[i] == "noequiv")
			g_options.warn_equivalent_patterns = false;
		    else if (warn_options[i] == "overlap")
			g_options.warn_overlapping_patterns = true;
		    else if (warn_options[i] == "noverlapo")
			g_options.warn_overlapping_patterns = false;
		    else
			v_report(Warning(NoFileLine(),
				Problem2S("Unknown warning sub-option:", warn_options[i].c_str())));
		}
	    }
	    continue;
	case 's':
	    g_options.suffix=optarg;
	    continue;
	case 'f':
	    g_options.prefix = optarg;
	    continue;
	case 'y':
	    g_options.for_yxx=true;
	    continue;
	case 'b':
	    g_options.for_bison= optarg ? optarg : "yystype.h";
	    continue;
	case 'c':
	    g_options.no_csgio=true;
	    continue;
	case 'u':
	    g_options.no_unparse=true;
	    continue;
	case 'r':
	    g_options.no_rewrite=true;
	    continue;
	case 'd':
	    g_options.no_printdot=true;
	    continue;
	case 't':
	    g_options.no_hashtables=true;
	    continue;
	case O_operator_cast:
	    g_options.operator_cast=true;
	    continue;
	case 'm':
	    g_options.smart_pointer=true;
	    continue;
	case 'w':
	    g_options.smart_pointer=true;
	    g_options.weak_pointer=true;
	    continue;
	case 'o':
	    g_options.overwrite=true;
	    continue;
	case 'n':
	    if (optarg[0]!='y' && optarg[0]!='n' && optarg[0]!='p')
		v_report(Warning(NoFileLine(),
			    Problem1S("Covariant option must be yes or no or pre.")));
	    g_options.covariant = optarg[0];
	    continue;
	case 'l':
	    g_options.linedirec=false;
	    continue;
	case O_commment_line:
	    pg_line="// line ";
	    continue;
	case O_dir_line:
	    {
		    char* dir=getcwd(0, 0);
		    g_options.dir_line=dir;
		    free(dir);
		    if(!g_options.dir_line.empty() &&
			    g_options.dir_line[g_options.dir_line.length()-1]!='/')
			g_options.dir_line+='/';
	    }
	    continue;
	case O_stdafx:
	    g_options.stdafx = optarg ? optarg : "stdafx.h";
	    continue;
	case O_rw_loop:
	    g_options.rw_loop=true;
	    continue;
	case 'e':
	    if (optarg[0]=='-' || (optarg[strlen(optarg)-1]=='k' && optarg[strlen(optarg)-2]=='.'))
		v_report(Warning(NoFileLine(),
			    Problem3S("Do you really want ", optarg, " as dllexport?")));
	    g_options.dllexports=optarg;
	    continue;
	case 'M':
	    g_options.msg_format=optarg;
	    continue;
	}

    // Can only omit hashtables when neither csgio nor printdot is used
    if(!(g_options.no_csgio && g_options.no_printdot))
	g_options.no_hashtables=false;

    char *basename;

    // argv[optind] is next
    for (int i=optind; i < argc; ++i) {
	// Check filenames and files
	size_t len = strlen(argv[i]);
	basename = get_basename( argv[i] );
	if ( ! (argv[i][len-1] == 'k') && (argv[i][len-2] == '.') ) {
	    v_report( NonFatal( NoFileLine(), Problem2S( "input file must have '.k' suffix:", argv[i] )));
	} else if (  (strcmp(basename, (g_options.prefix+"k.k").c_str()) == 0)
		|| (strcmp(basename,  (g_options.prefix+"rk.k").c_str()) == 0)
		|| (strcmp(basename,  (g_options.prefix+"unpk.k").c_str()) == 0)
		|| (strcmp(basename,  (g_options.prefix+"csgiok.k").c_str()) == 0)
		|| (strcmp(basename, "stdin.k") == 0)
		  ) {
	    string tmp="reserved file basenames '"+g_options.prefix+"k.k', '"+g_options.prefix+"rk.k', '"+g_options.prefix+"unpk.k', '"+g_options.prefix+"csgiok.k' and 'stdin.k' not allowed:";
	    v_report( NonFatal( NoFileLine(), Problem2S(tmp.c_str(), argv[i] )));
	} else if ((yyin = fopen(argv[i], "r"))== NULL){
	    v_report( NonFatal( NoFileLine(), Problem2S( "cannot open ", argv[i] )));
	} else {
	    fclose(yyin);
	}
    }

    if ( gp_no_fatal_problems ) {
	if ( argc > optind ) {
	    // add the filename to a list of filenames
	    inputfilenames = argv+optind;
	    no_inputfiles = argc-optind;
	    current_inputfile = 0;
	    pg_filename = make_pg_filename( inputfilenames[current_inputfile] );
	    if ((yyin = openfile(inputfilenames[current_inputfile],"r"))== NULL){
		v_report( Fatal( NoFileLine(), Problem2S( "cannot open ", inputfilenames[current_inputfile] )));
	    }
	    pg_lineno = 1;	// not sure if this is really necessary
	    pg_column = 0;	// not sure if this is really necessary
	    pg_charpos = 0;	// not sure if this is really necessary
	} // else read from stdin
    } else {
	leave(1);
    }
}

static int
prepare_for_next_file()
{
    if ( current_inputfile < no_inputfiles-1 ) {
	current_inputfile++;
	pg_filename = make_pg_filename( inputfilenames[current_inputfile] );
	pg_lineno = 1;	// really necessary
	pg_column = 0;	// really necessary
	pg_charpos = 0;	// really necessary
	fclose(yyin);
	if ((yyin = openfile(inputfilenames[current_inputfile],"r"))== NULL){
	    v_report( Fatal( NoFileLine(), Problem2S( "cannot open ", inputfilenames[current_inputfile] )));
	}
	yyrestart(yyin); // needed for flex
	return 1;
    }
    do_NORMAL(); // reset scannner if error occurred
    if ( no_inputfiles > 0 ) // test that we don't close the stdin
	fclose( yyin );
    return 0;
}

static casestring
mkfunctionincname(const casestring fn, bool header)
{
    std::ostringstream os;
    os << "KC_FUNCTIONS_" << f_make_identifier_basename(fn->name);
    if (header)
	os << "_HEADER";
    return mkcasestring(os.str().c_str());
}

static void
do_parse()
{
    // initialize the variables that hold the declarations
    includefile Theincheader =  IncludeFile( mkcasestring("HEADER"));
    includefile Theinccfile =  IncludeFile( mkcasestring("CODE"));
    ID Thebase_uview = Id( Str( mkcasestring( "base_uview" )));
    ID Thebase_rview = Id( Str( mkcasestring( "base_rview" )));
    ID Thekc_not_uniq = Id( Str( mkcasestring( "kc_not_uniq" )));
    ID Theuniq = Id( Str( mkcasestring( "uniq" )));

    The_abstract_phylum_decl=v_predefined_abstract_phylum();
    The_abstract_phylum_ref_decl=v_predefined_abstract_phylum_ref();
    The_abstract_list_decl=v_predefined_abstract_list();

    Thephylumdeclarations = f_add_predefined_phyla( Nilphylumdeclarations() );
    Therwdeclarations = Nilrwdeclarations();
    Theunparsedeclarations = Nilunparsedeclarations();
    Theargsnumbers = Nilargsnumbers();
    Thefndeclarations = Nilfndeclarations();
    Thelanguages = Nillanguagenames();
    Thebaseclasses = Nilbaseclass_declarations();
    Theincheader->inc_type = include_header;
    Theinccfile->inc_type = include_file;
    IncludeFile( mkcasestring("KC_TYPES_HEADER"))->inc_type = include_header;
    IncludeFile( mkcasestring("KC_TYPES"))->inc_type = include_file;
    IncludeFile( mkcasestring("KC_REWRITE_HEADER"))->inc_type = include_header;
    IncludeFile( mkcasestring("KC_REWRITE"))->inc_type = include_file;
    IncludeFile( mkcasestring("KC_CSGIO_HEADER"))->inc_type = include_header;
    IncludeFile( mkcasestring("KC_CSGIO"))->inc_type = include_file;
    IncludeFile( mkcasestring("KC_UNPARSE_HEADER"))->inc_type = include_header;
    IncludeFile( mkcasestring("KC_UNPARSE"))->inc_type = include_file;
    v_defoccur( Thebase_uview, ITPredefinedUView() );
    v_defoccur( Thebase_rview, ITPredefinedRView() );
    v_defoccur( Theuniq, ITPredefinedStorageClass() );
    Theuviewnames = Consviewnames( Thebase_uview, Nilviewnames() );
    Therviewnames = Consviewnames( Thebase_rview, Nilviewnames() );
    Thestorageclasses = Consstorageclasses( Theuniq, Consstorageclasses( Thekc_not_uniq, Nilstorageclasses() ));

    do {

	IncludeFile( mkfunctionincname(pg_filename, false))->inc_type = include_file;
	IncludeFile( mkfunctionincname(pg_filename, true))->inc_type = include_header;
	if (g_options.verbose) cout << " " << pg_filename->name << flush;
	try {
	yyparse(); // Throws 22 on first parse error
	FnFile( pg_filename )->fns = Thefndeclarations;
	IncludeFile( pg_filename )->inc[include_header] = Theincheader->inc[Theincheader->inc_type] ;
	IncludeFile( pg_filename )->inc[include_file] = Theinccfile->inc[Theinccfile->inc_type] ;
	IncludeFile( pg_filename )->inc_type = include_both;
	Theincheader->inc[Theincheader->inc_type] = Nilincludedeclarations();
	Theinccfile->inc[Theinccfile->inc_type] = Nilincludedeclarations();
	}
	catch (int) { /* Catch 22 */ }
	Thefndeclarations = Nilfndeclarations();
    } while( prepare_for_next_file() );

    if (! gp_no_fatal_problems) {
	leave(1);
    }
}

int
main (int argc, char* argv[])
{
#ifdef YYDEBUG
    extern int yydebug;
    yydebug = 1;
#endif
    g_progname = mkcasestring( progname_initvalue );

    pg_filename = make_pg_filename( STDINPUTNAME );
    gp_no_fatal_problems = true;
    pg_uviewshavebeendefined = false;
    pg_rviewshavebeendefined = false;
    pg_storageclasseshavebeendefined = false;

    pg_lineno = 0;	// to show that we are not parsing
    pg_column = 0;	// not really necessary
    pg_charpos = 0;	// not really necessary
    processargs(argc, argv);

    set_signals();	// don't do this _before_ processargs, because we depend
			// on initialized g_progname

    pg_lineno = 1;	// we start parsing
    pg_column = 0;	// really necessary
    pg_charpos = 0;	// really necessary
    if (g_options.verbose) cout << "Reading input files ..." << flush;
    do_parse();		// calls yyparse on each input file; if wrong exit
    if (g_options.verbose) cout << " - done.\n";
    pg_lineno = 0;	// to show that we are no longer parsing
    pg_column = 0;	// not really necessary
    pg_charpos = 0;	// not really necessary
    Thebindingidmarks = 0; // one of the things to initialize unparsing stuff

    //
    // begin the real work
    //

    // start real work by checking the input
    if (g_options.verbose) cout << "Checking input.\n";
    Thephylumdeclarations->unparse( v_null_printer, view_check_count );
    Thephylumdeclarations->unparse( v_null_printer, view_check );
    Therwdeclarations->unparse( v_null_printer, view_check );
    foreach ( a_fnfile; fnfiles Thefnfiles ) {
	a_fnfile->fns->unparse( v_null_printer, view_check );
    }

    // collect additional members of phyla and operators
    foreach ( a_fnfile; fnfiles Thefnfiles ) {
	f_collect_members( a_fnfile->fns );
    }
    // add additional base classes to phyla and operators
    prepare_base_classes(Thebaseclasses);

    Theunparsedeclarations->unparse( v_null_printer, view_check );
    Theunparsedeclarations->unparse( v_null_printer, view_check_viewnames );
    // ADD a list of views that should be defined if no views are defined
    Thephylumdeclarations->unparse( v_null_printer, view_check_uniq );
    Theunparsedeclarations->unparse( v_null_printer, view_checklanguagenames );
    /*
     * compute the attributes that we need for pattern match code
     */
    Thephylumdeclarations->unparse( v_null_printer, view_make_patternreps );
    Therwdeclarations->unparse( v_null_printer, view_make_patternreps );
    foreach( a_fnfile; fnfiles Thefnfiles ) {
	a_fnfile->fns->unparse( v_null_printer, view_make_patternreps );
    }
    Theunparsedeclarations->unparse( v_null_printer, view_make_patternreps );
    // Check all the unparse and rewrite patterns for overlapping
    // Patterns in with have already been handled in view_make_patternreps
    foreach( PhylumDeclaration(*, *, prod_block, *); phylumdeclarations Thephylumdeclarations) {
	with(prod_block) {
	    ListAlternatives(alts, *), NonlistAlternatives(alts): {
		foreach( alt; alternatives alts ) {
		    unparseviewsinfo uvi = f_unparseviewsinfo_of_alternative( alt, Theuviewnames );
		    foreach( Unparseviewinfo(*, decl_info); unparseviewsinfo uvi) {
			check_unparse_patterns(decl_info);
		    }
		    rewriteviewsinfo rvi = f_rewriteviewsinfo_of_alternative( alt, Therviewnames );
		    foreach( Rewriteviewinfo(*, rule_info); rewriteviewsinfo rvi) {
			check_rewrite_patterns(rule_info);
		    }
		}
	    }
	    default: { /* Don't care about empty and predefined */ }
	}
    }

    if(pg_languageshavebeendefined) {
	collect_strings();
    }

    /*
     * TODO:
     * check viewnames and build a list of them
     */

    /*
     * test if anything fatal happened
     */
    if ( ! gp_no_fatal_problems ) {
	leave( 1 );
    } // else go on

    phylumdeclarationsroot proot = PhylumDeclarations( Thephylumdeclarations );

    // to avoid problems in rare situations (eg. if no phyla defined at all)
    if (Theargsnumbers->length() == 0) {
	Theargsnumbers = Consargsnumbers( mkinteger(0), Theargsnumbers );
    }

    if (g_options.verbose) cout << "Writing output files ..." << flush;
    // create temporary file, open this file and reset the printer functions
    v_hfile_printer.init(Thetemphfile, "w", g_options.prefix+"k.h");
    v_ccfile_printer.init(Thetempccfile, "w", g_options.prefix+"k." + g_options.suffix);
    if (g_options.verbose) cout << " "+g_options.prefix+"k" << flush;

    proot->unparse( v_hfile_printer, view_gen_k_h );
    proot->unparse( v_ccfile_printer, view_gen_k_c );
    proot->unparse( v_hfile_printer, view_gen_enumphyla_h );
    proot->unparse( v_hfile_printer, view_gen_enumoperators_h );
    proot->unparse( v_hfile_printer, view_gen_classdecls1_h );
    proot->unparse( v_hfile_printer, view_gen_nodetypedefs_h );
    proot->unparse( v_hfile_printer, view_gen_operatormap_type_h );
    proot->unparse( v_ccfile_printer, view_gen_subphylumdefs_c );
    proot->unparse( v_ccfile_printer, view_gen_set_subphylumdefs_c );
    proot->unparse( v_ccfile_printer, view_gen_copy_attributes_c );
    proot->unparse( v_ccfile_printer, view_gen_phylummap_c );
    proot->unparse( v_ccfile_printer, view_gen_operatormap_c );
    Thestorageclasses->unparse( v_ccfile_printer, view_gen_uniqmap_c );
    proot->unparse( v_hfile_printer, view_gen_nodetypes_h );
    proot->unparse( v_hfile_printer, view_gen_noofoperators_h );
    proot->unparse( v_hfile_printer, view_close_namespace );
    proot->unparse( v_ccfile_printer, view_close_namespace );
    IncludeFile(mkcasestring("KC_TYPES_HEADER"))->inc[IncludeFile(mkcasestring("KC_TYPES_HEADER"))->inc_type]->unparse( v_hfile_printer, view_gen_includes );
    IncludeFile(mkcasestring("KC_TYPES"))->inc[IncludeFile(mkcasestring("KC_TYPES"))->inc_type]->unparse( v_ccfile_printer, view_gen_includes );
    proot->unparse( v_hfile_printer, view_open_namespace );
    proot->unparse( v_ccfile_printer, view_open_namespace );
    proot->unparse( v_hfile_printer, view_gen_assertmacros_h );
    proot->unparse( v_ccfile_printer, view_gen_assertmacros_c );
    proot->unparse( v_hfile_printer, view_gen_operatordecls_h );
    proot->unparse( v_hfile_printer, view_gen_classdecls2_h );
    proot->unparse( v_ccfile_printer, view_gen_classdefs_c );
    proot->unparse( v_hfile_printer, view_gen_alloc_h );
    proot->unparse( v_ccfile_printer, view_gen_alloc_c );
    proot->unparse( v_hfile_printer, view_gen_hashtables_h );
    proot->unparse( v_ccfile_printer, view_gen_operatordefs_c );
    proot->unparse( v_ccfile_printer, view_gen_hashtables_c );
    proot->unparse( v_hfile_printer, view_gen_error_decls_h );
    proot->unparse( v_ccfile_printer, view_gen_error_defs_c );

    if(!g_options.no_printdot) {
	proot->unparse( v_hfile_printer, view_gen_printdotdecls_h );
	proot->unparse( v_ccfile_printer, view_gen_printdotdefs_c );
    }
    proot->unparse( v_ccfile_printer, view_gen_listdefs_c );
    proot->unparse( v_ccfile_printer, view_gen_copydefs_c );

    // next lines should be last for k.* unparsing
    proot->unparse( v_hfile_printer, view_gen_end_k_h );
    proot->unparse( v_ccfile_printer, view_close_namespace );

    // try to find out if anything went wrong while writing the files
    if (v_ccfile_printer.fclose() == EOF) {
	v_report( Fatal( NoFileLine(), Problem2S( "writing temporary k.cc file failed:", Thetempccfile )));
    }
    if (v_hfile_printer.fclose() == EOF) {
	v_report( Fatal( NoFileLine(), Problem2S( "writing temporary k.h file failed:", Thetemphfile )));
    }
    compare_and_delete_or_move(Thetempccfile, g_options.prefix+"k."+g_options.suffix);
    compare_and_delete_or_move(Thetemphfile, g_options.prefix+"k.h");

    if(!g_options.no_csgio) {
	// create temporary files, open this file and reset the printer functions
	v_hfile_printer.init(Thetemphfile, "w", g_options.prefix+"csgiok.h");
	v_ccfile_printer.init(Thetempccfile, "w", g_options.prefix+"csgiok."+g_options.suffix);
	if (g_options.verbose) cout << " "+g_options.prefix+"csgiok" << flush;

	proot->unparse( v_hfile_printer, view_gen_csgio_start_h );
	IncludeFile(mkcasestring("KC_CSGIO_HEADER"))->inc[IncludeFile(mkcasestring("KC_CSGIO_HEADER"))->inc_type]->unparse( v_hfile_printer, view_gen_includes );
	proot->unparse( v_hfile_printer, view_open_namespace );
	proot->unparse( v_hfile_printer, view_gen_csgio_h );
	proot->unparse( v_hfile_printer, view_close_namespace );
	proot->unparse( v_hfile_printer, view_gen_csgio_end_h );
	proot->unparse( v_ccfile_printer, view_gen_csgio_start_c );
	IncludeFile(mkcasestring("KC_CSGIO"))->inc[IncludeFile(mkcasestring("KC_CSGIO"))->inc_type]->unparse( v_ccfile_printer, view_gen_includes );
	proot->unparse( v_ccfile_printer, view_open_namespace );
	proot->unparse( v_ccfile_printer, view_gen_csgio_c );
	proot->unparse( v_ccfile_printer, view_close_namespace );

	// try to find out if anything went wrong while writing the files
	if (v_ccfile_printer.fclose() == EOF) {
	    v_report( Fatal( NoFileLine(), Problem2S( "writing temporary csgiok.cc file failed:", Thetempccfile )));
	}
	if (v_hfile_printer.fclose() == EOF) {
	    v_report( Fatal( NoFileLine(), Problem2S( "writing temporary csgiok.h file failed:", Thetemphfile )));
	}
	compare_and_delete_or_move(Thetempccfile, g_options.prefix+"csgiok."+g_options.suffix);
	compare_and_delete_or_move(Thetemphfile, g_options.prefix+"csgiok.h");
    }

    if(!g_options.no_unparse) {
	// create temporary files, open this file and reset the printer functions
	v_hfile_printer.init(Thetemphfile, "w", g_options.prefix+"unpk.h");
	v_ccfile_printer.init(Thetempccfile, "w", g_options.prefix+"unpk."+g_options.suffix);
	if (g_options.verbose) cout << " "+g_options.prefix+"unpk" << flush;

	proot->unparse( v_hfile_printer, view_gen_unpk_h );
	IncludeFile(mkcasestring("KC_UNPARSE_HEADER"))->inc[IncludeFile(mkcasestring("KC_UNPARSE_HEADER"))->inc_type]->unparse( v_hfile_printer, view_gen_includes );
	proot->unparse( v_hfile_printer, view_open_namespace );
	proot->unparse( v_hfile_printer, view_uview_class_decl );
	proot->unparse( v_hfile_printer, view_gen_unparsedecls_h );
	proot->unparse( v_hfile_printer, view_close_namespace );
	proot->unparse( v_hfile_printer, view_gen_end_unpk_h );
	proot->unparse( v_ccfile_printer, view_gen_unpk_c ); // opens namespace
	proot->unparse( v_ccfile_printer, view_close_namespace );
	IncludeFile(mkcasestring("KC_UNPARSE"))->inc[IncludeFile(mkcasestring("KC_UNPARSE"))->inc_type]->unparse( v_ccfile_printer, view_gen_includes );
	proot->unparse( v_ccfile_printer, view_open_namespace );
	proot->unparse( v_ccfile_printer, view_gen_default_types_unpk_c );
	proot->unparse( v_ccfile_printer, view_gen_unparsedefs_c );
	if(pg_languageshavebeendefined) {
	    unparse_string_collection();
	}
	proot->unparse( v_ccfile_printer, view_close_namespace );

	// try to find out if anything went wrong while writing the files
	if (v_ccfile_printer.fclose() == EOF) {
	    v_report( Fatal( NoFileLine(), Problem2S( "writing temporary unpk.cc file failed:", Thetempccfile )));
	}
	if (v_hfile_printer.fclose() == EOF) {
	    v_report( Fatal( NoFileLine(), Problem2S( "writing temporary unpk.h file failed:", Thetemphfile )));
	}
	compare_and_delete_or_move(Thetempccfile, g_options.prefix+"unpk."+g_options.suffix);
	compare_and_delete_or_move(Thetemphfile, g_options.prefix+"unpk.h");
    }

    if(!g_options.no_rewrite) {
	// create temporary file, open this file and reset the printer functions
	v_hfile_printer.init(Thetemphfile, "w", g_options.prefix+"rk.h");
	v_ccfile_printer.init(Thetempccfile, "w", g_options.prefix+"rk."+g_options.suffix);
	if (g_options.verbose) cout << " "+g_options.prefix+"rk" << flush;

	proot->unparse( v_hfile_printer, view_gen_rewritek_h );
	IncludeFile(mkcasestring("KC_REWRITE_HEADER"))->inc[IncludeFile(mkcasestring("KC_REWRITE_HEADER"))->inc_type]->unparse( v_hfile_printer, view_gen_includes );
	proot->unparse( v_hfile_printer, view_open_namespace );
	proot->unparse( v_hfile_printer, view_rview_class_decl );
	proot->unparse( v_hfile_printer, view_gen_rewritedecls_h );
	proot->unparse( v_hfile_printer, view_close_namespace );
	proot->unparse( v_hfile_printer, view_gen_end_rewritek_h );
	proot->unparse( v_ccfile_printer, view_gen_rewritek_c ); // opens namespace
	proot->unparse( v_ccfile_printer, view_close_namespace );
	IncludeFile(mkcasestring("KC_REWRITE"))->inc[IncludeFile(mkcasestring("KC_REWRITE"))->inc_type]->unparse( v_ccfile_printer, view_gen_includes );
	proot->unparse( v_ccfile_printer, view_open_namespace );
	proot->unparse( v_ccfile_printer, view_gen_rewritedefs_c );
	proot->unparse( v_ccfile_printer, view_close_namespace );

	// try to find out if anything went wrong while writing the files
	if (v_ccfile_printer.fclose() == EOF) {
	    v_report( Fatal( NoFileLine(), Problem2S( "writing temporary rk.cc file failed:", Thetempccfile )));
	}
	if (v_hfile_printer.fclose() == EOF) {
	    v_report( Fatal( NoFileLine(), Problem2S( "writing temporary rk.h file failed:", Thetemphfile )));
	}
	compare_and_delete_or_move(Thetempccfile, g_options.prefix+"rk."+g_options.suffix);
	compare_and_delete_or_move(Thetemphfile, g_options.prefix+"rk.h");
    }
    foreach ( a_fnfile; fnfiles Thefnfiles ) { // this should be a foreach file; and a FnFile() in the fndeclarations::unparse calls
	with( a_fnfile ) {
	    FnFile( a_filename ): {
		g_options.hfilename = f_mk_filename( a_filename, "h" );
		g_options.ccfilename = f_mk_filename( a_filename, g_options.suffix);
		pg_filename = a_filename;
		// create temporary files, open these files and reset the printer functions
		v_hfile_printer.init(Thetemphfile, "w", g_options.hfilename);
		v_ccfile_printer.init(Thetempccfile, "w", g_options.ccfilename);
		if (g_options.verbose) cout << " " << f_mk_filename(a_filename, "") << flush;

		proot->unparse( v_hfile_printer, view_gen_fns_start_h );
		IncludeFile( a_filename )->inc[include_header]->unparse( v_hfile_printer, view_gen_includes );
		IncludeFile( mkfunctionincname(a_filename, true))->inc[include_header]->unparse( v_hfile_printer, view_gen_includes );
		proot->unparse( v_hfile_printer, view_open_namespace );
		a_fnfile->fns->unparse( v_hfile_printer, view_gen_fnk_h );
		proot->unparse( v_hfile_printer, view_close_namespace );
		proot->unparse( v_hfile_printer, view_gen_fns_end_h );
		proot->unparse( v_ccfile_printer, view_gen_fns_start_c );
		proot->unparse( v_ccfile_printer, view_gen_fns_owninclude_c );
		IncludeFile( a_filename )->inc[include_file]->unparse( v_ccfile_printer, view_gen_includes );
		IncludeFile( mkfunctionincname(a_filename, false))->inc[include_file]->unparse( v_ccfile_printer, view_gen_includes );
		proot->unparse( v_ccfile_printer, view_open_namespace );
		a_fnfile->fns->unparse( v_ccfile_printer, view_gen_fnkdecls_c );
		a_fnfile->fns->unparse( v_ccfile_printer, view_gen_fnk_c );
		proot->unparse( v_ccfile_printer, view_close_namespace );
		// close .cc and .h file based on  a_filename
		// try to find out if anything went wrong while writing the files
		if (v_ccfile_printer.fclose() == EOF) {
		    v_report( Fatal( NoFileLine(), Problem4S( "writing temporary ", g_options.ccfilename.c_str(), " file failed:", Thetempccfile )));
		}
		if (v_hfile_printer.fclose() == EOF) {
		    v_report( Fatal( NoFileLine(), Problem4S( "writing temporary ", g_options.hfilename.c_str(), " file failed:", Thetemphfile )));
		}
		compare_and_delete_or_move(Thetempccfile, g_options.ccfilename);
		compare_and_delete_or_move(Thetemphfile, g_options.hfilename);
	    }   }
    }

    if(g_options.operator_cast) {
	// create temporary file, open this file and reset the printer functions
	v_hfile_printer.init(Thetemphfile, "w", g_options.prefix+"operatork.h");
	if (g_options.verbose) cout << " "+g_options.prefix+"operatork.h" << flush;

	proot->unparse( v_hfile_printer, view_gen_operatorcast_h );

	if (v_hfile_printer.fclose() == EOF) {
	    v_report( Fatal( NoFileLine(), Problem2S( "writing temporary operatork.h file failed:", Thetemphfile )));
	}
	compare_and_delete_or_move(Thetemphfile, g_options.prefix+"operatork.h");
    }
    if(g_options.for_bison!="") {
	// create temporary file, open this file and reset the printer functions
	v_hfile_printer.init(Thetemphfile, "w", g_options.prefix+g_options.for_bison);
	if (g_options.verbose) cout << " "+g_options.prefix+g_options.for_bison << flush;

	proot->unparse( v_hfile_printer, view_gen_yaccstacktype_h );

	if (v_hfile_printer.fclose() == EOF) {
	    v_report( Fatal( NoFileLine(), Problem4S( "writing temporary ", g_options.for_bison.c_str(), " file failed:", Thetemphfile )));
	}
	compare_and_delete_or_move(Thetemphfile, g_options.prefix+g_options.for_bison);
    }
    if(g_options.for_yxx) {
	// create temporary file, open this file and reset the printer functions
	v_hfile_printer.init(Thetemphfile, "w", g_options.prefix+"yxx_union.h");
	if (g_options.verbose) cout << " "+g_options.prefix+"yxx_union.h" << flush;

	proot->unparse( v_hfile_printer, view_gen_yxx_union_h );

	if (v_hfile_printer.fclose() == EOF) {
	    v_report( Fatal( NoFileLine(), Problem2S( "writing temporary yxx_union.h file failed:", Thetemphfile )));
	}
	compare_and_delete_or_move(Thetemphfile, g_options.prefix+"yxx_union.h");
    }
    if (g_options.verbose) cout << " - done.\n";
    leave( 0 );
    exit( 0 );
    return 0;
}


/*
 * f1 = file struct of first file
 * f2 = file struct of second file
 * these files should be opened at start of file: read starts at first byte in file
 * fn1 = name of first file
 * fn2 = name of second file
 * these file names are used in error messages
 */
static bool
different(FILE *f1, FILE *f2, const char *fn1, const char *fn2)
{
    char buf1[BUFSIZ], buf2[BUFSIZ] ;
    size_t characters_read1, characters_read2;
#ifdef KC_USE_STAT
    // we could extend this by first comparing the file sizes if we have a portable way of
    // doing that - or just assume it will work until somebody complains
    struct stat stbuf1, stbuf2;

    if (stat(fn1, &stbuf1) != 0) {
	perror("kc++ error (in 'different')");
	v_report( NonFatal( NoFileLine(), Problem2S( "error stat'ing", fn1 )));
    }
    if (stat(fn2, &stbuf2) != 0) {
	perror("kc++ error (in 'different')");
	v_report( NonFatal( NoFileLine(), Problem2S( "error stat'ing", fn2 )));
    }
    if (stbuf1.st_size != stbuf2.st_size) {
	return true;
    }
#endif // KC_USE_STAT
    while(true) {
	characters_read1 = fread(buf1, 1, BUFSIZ, f1);
	if (ferror(f1)) {
	    perror("kc++ error (in 'different')");
	    v_report( Fatal( NoFileLine(), Problem2S( "error while reading from", fn1 )));
	}
	characters_read2 = fread(buf2, 1, BUFSIZ, f2);
	if (ferror(f2)) {
	    perror("kc++ error (in 'different')");
	    v_report( Fatal( NoFileLine(), Problem2S( "error while reading from", fn2 )));
	}
	if (characters_read1 == 0 && characters_read2 == 0)
	    return false;
	else if ( (characters_read1 != characters_read2)
		|| (memcmp(buf1, buf2, characters_read1) != 0)
		)
	    return true;
    } /*NOTREACHED*/
}

/*
 * WARNING: the erename routine does _not_ check whether 'newfilename'
 * already exists.
 * the _caller_ should make sure of this
 */
static void
erename(const char *oldfilename, const char *newfilename)
{
    if (rename(oldfilename, newfilename) != 0) {
	perror("kc++ error (in 'erename')");
	v_report( NonFatal( NoFileLine(), Problem4S( "error while renaming", oldfilename, "to", newfilename )));
    }
}

static void
eremove(const char *filename)
{
    if (remove(filename) != 0) {
	perror("kc++ error (in 'eremove')");
	v_report( NonFatal( NoFileLine(), Problem2S( "error while removing", filename )));
    }
}

static void
compare_and_delete_or_move(const char *tmp_filename, const string &filenamestring)
{
    FILE *tmp_file, *file;
    const char *filename=filenamestring.c_str();
    if ((file = fopen(filename, "r")) == 0) {
	erename(tmp_filename, filename);
    } else if ((tmp_file = fopen(tmp_filename, "r")) == 0) {
	perror("kc++ error (in 'compare_and_delete_or_move')");
	v_report( Fatal( NoFileLine(), Problem2S( "could not open temporary file", tmp_filename )));
    } else {
	bool they_are_different=different(tmp_file, file, tmp_filename, filename);
	if (fclose(tmp_file) == -1) {
	    perror("kc++ error (in 'compare_and_delete_or_move')");
	    v_report( NonFatal( NoFileLine(), Problem2S( "error while closing", tmp_filename )));
	}
	if (fclose(file) == -1) {
	    perror("kc++ error (in 'compare_and_delete_or_move')");
	    v_report( NonFatal( NoFileLine(), Problem2S( "error while closing", filename )));
	}
	if (they_are_different || g_options.overwrite) {
	    eremove(filename);
	    erename(tmp_filename, filename);
	} else {
	    if (g_options.verbose) cout << "(unchanged:" << filename << ')' << flush;
	    eremove(tmp_filename);
}   }	}

static phylumdeclarations
f_add_predefined_phyla(phylumdeclarations p)
{
    return Consphylumdeclarations(
	      v_predefined_voidptr(),
	      Consphylumdeclarations(
		v_predefined_int(),
		Consphylumdeclarations(
			v_predefined_real(),
			Consphylumdeclarations(
				v_predefined_casestring(),
				Consphylumdeclarations(
					v_predefined_nocasestring(),
					p
			      )  )	  )   )       );
}

static phylumdeclaration
v_predefined_int()
{
    ID int_pid, int_oid, int_sto;
    alternative int_alternative;
    phylumdeclaration int_phylumdeclaration;
    int_pid = Id( Str( mkcasestring( "integer" ) ));
    int_sto = Id( Str( mkcasestring( "uniq" ) ));
    int_oid = Id( Str( mkcasestring( "_Int" ) ));
    int_alternative = Alternative( int_oid, Nilarguments() );
    int_phylumdeclaration = PhylumDeclaration(
				int_pid,
				PositiveStorageOption( /*f_emptyId()*/ int_sto ),
				PredefinedAlternatives( Consalternatives( int_alternative, Nilalternatives() )),
				CcodeOption( Nilattributes(), NilCtexts() )
			      );
    v_defoccur( int_oid, ITPredefinedOperator( int_alternative, int_pid ) );
    v_defoccur( int_pid, ITPredefinedPhylum( int_phylumdeclaration ) );
    return int_phylumdeclaration;
}

static phylumdeclaration
v_predefined_real()
{
    ID real_pid, real_oid, real_sto;
    alternative real_alternative;
    phylumdeclaration real_phylumdeclaration;
    real_pid = Id( Str( mkcasestring( "real" ) ));
    real_sto = Id( Str( mkcasestring( "uniq" ) ));
    real_oid = Id( Str( mkcasestring( "_Real" ) ));
    real_alternative = Alternative( real_oid, Nilarguments() );
    real_phylumdeclaration = PhylumDeclaration(
				real_pid,
				PositiveStorageOption( /*f_emptyId()*/ real_sto ),
				PredefinedAlternatives( Consalternatives( real_alternative, Nilalternatives() )),
				CcodeOption( Nilattributes(), NilCtexts() )
			      );
    v_defoccur( real_oid, ITPredefinedOperator( real_alternative, real_pid ) );
    v_defoccur( real_pid, ITPredefinedPhylum( real_phylumdeclaration ) );
    return real_phylumdeclaration;
}

static phylumdeclaration
v_predefined_casestring()
{
    ID casestring_pid, casestring_oid, casestring_sto;
    alternative casestring_alternative;
    phylumdeclaration casestring_phylumdeclaration;
    casestring_pid = Id( Str( mkcasestring( "casestring" ) ));
    casestring_sto = Id( Str( mkcasestring( "uniq" ) ));
    casestring_oid = Id( Str( mkcasestring( "_Str" ) ));
    casestring_alternative = Alternative( casestring_oid, Nilarguments() );
    casestring_phylumdeclaration = PhylumDeclaration(
				casestring_pid,
				PositiveStorageOption( /*f_emptyId()*/ casestring_sto ),
				PredefinedAlternatives( Consalternatives( casestring_alternative, Nilalternatives() )),
				CcodeOption( Nilattributes(), NilCtexts() )
			      );
    v_defoccur( casestring_oid, ITPredefinedOperator( casestring_alternative, casestring_pid ) );
    v_defoccur( casestring_pid, ITPredefinedPhylum( casestring_phylumdeclaration ) );
    return casestring_phylumdeclaration;
}

static phylumdeclaration
v_predefined_nocasestring()
{
    ID nocasestring_pid, nocasestring_oid, nocasestring_sto;
    alternative nocasestring_alternative;
    phylumdeclaration nocasestring_phylumdeclaration;
    nocasestring_pid = Id( Str( mkcasestring( "nocasestring" ) ));
    nocasestring_sto = Id( Str( mkcasestring( "uniq" ) ));
    nocasestring_oid = Id( Str( mkcasestring( "NoCaseStr" ) ));
    nocasestring_alternative = Alternative( nocasestring_oid, Nilarguments() );
    nocasestring_phylumdeclaration = PhylumDeclaration(
				nocasestring_pid,
				PositiveStorageOption( /*f_emptyId()*/ nocasestring_sto ),
				PredefinedAlternatives( Consalternatives( nocasestring_alternative, Nilalternatives() )),
				CcodeOption( Nilattributes(), NilCtexts() )
			      );
    v_defoccur( nocasestring_oid, ITPredefinedOperator( nocasestring_alternative, nocasestring_pid ) );
    v_defoccur( nocasestring_pid, ITPredefinedPhylum( nocasestring_phylumdeclaration ) );
    return nocasestring_phylumdeclaration;
}

static phylumdeclaration
v_predefined_voidptr()
{
    ID voidptr_pid, voidptr_oid, voidptr_sto;
    alternative voidptr_alternative;
    phylumdeclaration voidptr_phylumdeclaration;
    voidptr_pid = Id( Str( mkcasestring( "voidptr" ) ));
    voidptr_sto = Id( Str( mkcasestring( "uniq" ) ));
    voidptr_oid = Id( Str( mkcasestring( "_VoidPtr" ) ));
    voidptr_alternative = Alternative( voidptr_oid, Nilarguments() );
    voidptr_phylumdeclaration = PhylumDeclaration(
				voidptr_pid,
				PositiveStorageOption( /*f_emptyId()*/ voidptr_sto ),
				PredefinedAlternatives( Consalternatives( voidptr_alternative, Nilalternatives() )),
				CcodeOption( Nilattributes(), NilCtexts() )
			      );
    v_defoccur( voidptr_oid, ITPredefinedOperator( voidptr_alternative, voidptr_pid ) );
    v_defoccur( voidptr_pid, ITPredefinedPhylum( voidptr_phylumdeclaration ) );
    return voidptr_phylumdeclaration;
}

static phylumdeclaration
v_predefined_abstract_phylum()
{
    ID a_ph_pid;
    phylumdeclaration a_ph_phylumdeclaration;
    a_ph_pid = Id( Str( mkcasestring( "abstract_phylum" ) ));
    a_ph_phylumdeclaration = PhylumDeclaration(
		a_ph_pid,
		PositiveStorageOption( f_emptyId() ),
		Emptyproductionblock(),
		CcodeOption( Nilattributes(), NilCtexts() )
	);
    v_defoccur( a_ph_pid, ITPredefinedPhylum( a_ph_phylumdeclaration ) );
    return a_ph_phylumdeclaration;
}

static phylumdeclaration
v_predefined_abstract_phylum_ref()
{
    ID a_ph_pid;
    phylumdeclaration a_ph_phylumdeclaration;
    a_ph_pid = Id( Str( mkcasestring( "abstract_phylum_ref" ) ));
    a_ph_phylumdeclaration = PhylumDeclaration(
		a_ph_pid,
		PositiveStorageOption( f_emptyId() ),
		Emptyproductionblock(),
		CcodeOption( Nilattributes(), NilCtexts() )
	);
    v_defoccur( a_ph_pid, ITPredefinedPhylum( a_ph_phylumdeclaration ) );
    return a_ph_phylumdeclaration;
}

static phylumdeclaration
v_predefined_abstract_list()
{
    ID a_list_pid;
    phylumdeclaration a_list_phylumdeclaration;
    a_list_pid = Id( Str( mkcasestring( "abstract_list" ) ));
    a_list_phylumdeclaration = PhylumDeclaration(
		a_list_pid,
		PositiveStorageOption( f_emptyId() ),
		Emptyproductionblock(),
		CcodeOption( Nilattributes(), NilCtexts() )
	);
    v_defoccur( a_list_pid, ITPredefinedPhylum( a_list_phylumdeclaration ) );
    return a_list_phylumdeclaration;
}

static casestring
make_pg_filename(const char *s)
{
    char *tmpinpfilename;
    char *str;
    casestring tmp;

    tmpinpfilename=new char[strlen(s)+3];
    strcpy(tmpinpfilename,s);
    for(str=tmpinpfilename;(str=strchr(str,'\\'));) *str='/';
    tmp = mkcasestring( tmpinpfilename );
    delete[] tmpinpfilename;
    return tmp;
}


// signal handling, to be able to clean up if we are interupted
static void
set_signals()
{
#ifdef SIGINT
    signal(SIGINT, cleanup_and_die);
#endif
#ifdef SIGTERM
    signal(SIGTERM, cleanup_and_die);
#endif
#ifdef SIGSEGV
    signal(SIGSEGV, cleanup_and_abort);
#endif
#ifdef SIGILL
    signal(SIGILL, cleanup_and_abort);
#endif
#ifdef SIGSYS
    signal(SIGSYS, cleanup_and_abort);
#endif
#ifdef SIGIOT
    signal(SIGIOT, cleanup_and_abort);
#endif
#ifdef SIGHUP
    signal(SIGHUP, cleanup_and_die);
#endif
#ifdef SIGQUIT
    signal(SIGQUIT, cleanup_and_die);
#endif
#ifdef SIGBUS
    signal(SIGBUS, cleanup_and_abort);
#endif
}

// empty. Should we do something here to make sure we don't get interupted?
static void
block_signals()
{
}

%{
// cleanup the generated intermediate files if we are interupted
extern "C" RETSIGTYPE
cleanup_and_die(int i)
{
    fprintf(stderr, "%s: received signal %d, cleaning up\n", g_progname->name, i);
     /* even though we don't die a violent death, we still do inform
      * our environment that we didn't finish as planned, by exiting
      * with non-zero exit status
      */
    leave(1);
}
// cleanup the generated intermediate files if we are interupted
extern "C" RETSIGTYPE
cleanup_and_abort(int i)
{
    if (i==SIGSEGV)
	fprintf(stderr, "kc++: segmentation violation\n");
    else
	fprintf(stderr, "kc++: something horrible happened\n");
    fprintf(stderr, "%s: received signal %d, cleaning up\n", g_progname->name, i);
    leave(1);
}
%}

// cleanup the generated intermediate files if we are interupted
static void
cleanup()
{
    // first, we try to make sure that we will not be interupted
    block_signals();

    // then, we close the open files
    if (v_ccfile_printer.fclose() == EOF) {
	v_report( Fatal( NoFileLine(), Problem2S( "writing temporary file failed:", Thetempccfile )));
    }
    if (v_hfile_printer.fclose() == EOF) {
	v_report( Fatal( NoFileLine(), Problem2S( "writing temporary file failed:", Thetemphfile )));
    }

    // next, we unlink the tempfiles, if they exist
    if (access(Thetempccfile, R_OK) == 0) {
	if (g_options.verbose) cout << "removing " << Thetempccfile << endl;
	eremove(Thetempccfile);
    }
    if (access(Thetemphfile, R_OK) == 0) {
	if (g_options.verbose) cout << "removing " << Thetemphfile << endl;
	eremove(Thetemphfile);
    }
}

%{ KC_TYPES_HEADER
namespace kc { void leave(int); }
%}

void
leave(int status)
{
    cleanup();
    if (gp_no_fatal_problems) {
	exit( (status==0) ? 0 : status );
    }
    else {
	exit( (status==0) ? 1 : status );
    }
}

// vim:sts=4:ts=8:cino=g0,t0,\:0
