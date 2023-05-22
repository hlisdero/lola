%{ CODE HEADER
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
// error.k
//
%{
  static char error_kAccesSid[] = "@(#)$Id: error.k,v 1.48 2007-04-19 08:31:49 piefel Exp $";
%}
/***************************************************************************/
/*
 * For ERROR Reporting
 */

/*
 * we want it global... so include the fndecls in k.h
 */
%{ KC_TYPES_HEADER
#include "error.h"
%}

%{ HEADER
#include "unpk.h" /* for the definition of uview and printer_functor_class */
extern bool gp_no_fatal_problems;
#include <cstdlib>
#include <cctype>
#include <string>
using std::string;

// Cater for broken compilers (eg. MacOS gcc)
#ifndef isalpha
using std::isalpha;
using std::isalnum;
#endif
%}
%{
bool gp_no_fatal_problems;
%}

/* we have three sorts of errors:
 *  Fatal    causes an exit right after they are reported
 *  NonFatal does not cause an immediate exit, but
 *           does reset gp_no_fatal_problems
 *  Warning  does not cause an exit, does not reset gp_no_fatal_problems
 */

error
:	Fatal( fileline problem )
|	NonFatal( fileline problem )
|	Warning( fileline problem )
;

problem
:	Problem1( casestring )
|	Problem1ID( casestring ID )
|	Problem1tID( casestring ID )
|	Problem1we( casestring withexpression )
|	Problem1ID1ID( casestring ID casestring ID )
|	Problem1t1ID( casestring IDtype casestring ID )
|	Problem1INT( casestring INT )
|	Problem1int1( casestring integer casestring )
|	Problem1INT1ID( casestring INT casestring ID )
|	Problem1ID1ID1ID( casestring ID casestring ID casestring ID )
|	Problem1INT1ID1ID( casestring INT casestring ID casestring ID )
|	Problem1storageoption1ID( casestring storageoption casestring ID )
|	Problem2( casestring casestring )
|	Problem3( casestring casestring casestring )
|	Problem3int1( casestring casestring casestring integer casestring )
|	Problem4( casestring casestring casestring casestring )
|	Problem5( casestring casestring casestring casestring casestring )
|	Problem6( casestring casestring casestring casestring casestring casestring )
;

problem Problem1S(const char *s1)
{
	return Problem1( mkcasestring( s1 ));
}
problem Problem1S1we(const char *s1, withexpression we)
{
	return Problem1we( mkcasestring( s1 ), we );
}
problem Problem1S1ID(const char *s1, ID id)
{
	return Problem1ID( mkcasestring( s1 ), id );
}
problem Problem1S1tID(const char *s1, ID id)
{
	return Problem1tID( mkcasestring( s1 ), id );
}

problem Problem1S1ID1S1ID(const char *s1, ID id1, const char *s2, ID id2)
{
	return Problem1ID1ID( mkcasestring( s1 ), id1, mkcasestring( s2 ), id2 );
}
problem Problem1S1t1S1ID(const char *s1, IDtype id1, const char *s2, ID id2)
{
	return Problem1t1ID( mkcasestring( s1 ), id1, mkcasestring( s2 ), id2 );
}

problem Problem1S1INT(const char *s1, INT i1)
{
	return Problem1INT( mkcasestring( s1 ), i1 );
}

problem Problem1S1int1S(const char *s1, int i1, const char *s2)
{
	return Problem1int1( mkcasestring( s1 ), mkinteger(i1), mkcasestring( s2 ) );
}

problem Problem1S1INT1S1ID(const char *s1, INT i1, const char *s2, ID id2)
{
	return Problem1INT1ID( mkcasestring( s1 ), i1, mkcasestring( s2 ), id2 );
}

problem Problem1S1ID1S1ID1S1ID(const char *s1, ID id1, const char *s2, ID id2, const char *s3, ID id3)
{
	return Problem1ID1ID1ID( mkcasestring( s1 ), id1, mkcasestring( s2 ), id2, mkcasestring( s3 ), id3 );
}

problem Problem1S1INT1S1ID1S1ID(const char *s1, INT i1, const char *s2, ID id2, const char *s3, ID id3)
{
	return Problem1INT1ID1ID( mkcasestring( s1 ), i1, mkcasestring( s2 ), id2, mkcasestring( s3 ), id3 );
}

problem Problem1S1storageoption1S1ID(const char *s1, storageoption so, const char *s2, ID id)
{
	return Problem1storageoption1ID( mkcasestring( s1 ), so, mkcasestring( s2 ), id );
}
problem Problem2S(const char *s1, const char *s2)
{
	return Problem2( mkcasestring( s1 ), mkcasestring( s2 ));
}
problem ProblemSC(const char *s1,  casestring s2)
{
	return Problem2( mkcasestring( s1 ), s2 );
}
problem Problem3S(const char *s1, const char *s2, const char *s3)
{
	return Problem3( mkcasestring( s1 ), mkcasestring( s2 ), mkcasestring( s3 ));
}
problem Problem4S(const char *s1, const char *s2, const char *s3, const char *s4)
{
	return Problem4( mkcasestring( s1 ), mkcasestring( s2 ), mkcasestring( s3 ), mkcasestring( s4 ) );
}

problem Problem3S1int1S(const char *s1, const char *s2, const char *s3, int i1, const char *s4)
{
	return Problem3int1( mkcasestring( s1 ), mkcasestring( s2 ), mkcasestring( s3 ), mkinteger(i1), mkcasestring( s4 ) );
}

Problem1( s1 )					-> [ view_error: s1 ];
Problem1we( s1, we1 )				-> [ view_error: s1 " " we1 ];
Problem1ID( s1, id )				-> [ view_error: s1 " " id ];
Problem1tID( s1, id )				-> [ view_error: s1 " " id:view_error_tID ];
Problem1ID1ID( s1, id1, s2, id2 )		-> [ view_error: s1 " " id1 " " s2 " " id2 ];
Problem1t1ID( s1, t, s2, id )			-> [ view_error: s1 " " t " " s2 " " id ];
Problem1INT( s1, i1 )				-> [ view_error: s1 " " i1 ];
Problem1int1( s1, i1, s2 )			-> [ view_error: s1 " " i1 " " s2 ];
Problem1INT1ID( s1, i1, s2, id1 )		-> [ view_error: s1 " " i1 " " s2 " " id1 ];
Problem1ID1ID1ID( s1, id1, s2, id2, s3, id3 )	-> [ view_error: s1 " " id1 " " s2 " " id2 " " s3 " " id3 ];
Problem1INT1ID1ID( s1, i1, s2, id1, s3, id2 )	-> [ view_error: s1 " " i1 " " s2 " " id1 " " s3 " " id2 ];
Problem1storageoption1ID( s1, so, s2, id )	-> [ view_error: s1 " " so " " s2 " " id ];
Problem2( s1, s2 )				-> [ view_error: s1 " " s2 ];
Problem3( s1, s2, s3 )				-> [ view_error: s1 " " s2 " " s3 ];
Problem3int1( s1, s2, s3, i1, s4 )		-> [ view_error: s1 " " s2 " " s3 " " i1 " " s4 ];
Problem4( s1, s2, s3, s4 )			-> [ view_error: s1 " " s2 " " s3 " " s4 ];
Problem5( s1, s2, s3, s4, s5 )			-> [ view_error: s1 " " s2 " " s3 " " s4 " " s5 ];
Problem6( s1, s2, s3, s4, s5, s6 )		-> [ view_error: s1 " " s2 " " s3 " " s4 " " s5 " " s6 ];

Id( uid )					-> [ view_error: uid { if (uid->line != 0) } ${ " (introduced at " uid->file ":" uid->line ")" $} ];
Id( uid )					-> [ view_error_tID:  uid->type " " uid { if (uid->line != 0) } ${ " (introduced at " uid->file ":" uid->line ")" $} ];
ITUnknown()					-> [ view_error_tID view_error: /* EMPTY */ ];


ITPredefinedPhylum,
ITUserPhylum,
ITPredefinedOperator,
ITPredefinedStorageClass,
ITStorageClass,
ITPredefinedUView,
ITUserUView,
ITPredefinedRView,
ITUserRView,
ITUserFunction,
ITPatternVariable				-> [view_error_tID: "(it's a " $0:view_error ")" ];
ITUserOperator					-> [view_error_tID: "(it's an " $0:view_error ")" ];

ITPredefinedPhylum				-> [view_error: "predefined phylum" ];
ITUserPhylum					-> [view_error: "phylum" ];
ITPredefinedOperator				-> [view_error: "predefined operator" ];
ITUserOperator					-> [view_error: "operator" ];
ITPredefinedStorageClass			-> [view_error: "predefined storageclass" ];
ITStorageClass					-> [view_error: "storageclass" ];
ITPredefinedUView				-> [view_error: "predefined unparse view" ];
ITUserUView					-> [view_error: "unparse view" ];
ITPredefinedRView				-> [view_error: "predefined rewrite view" ];
ITUserRView					-> [view_error: "rewrite view" ];
ITUserFunction					-> [view_error: "function" ];
ITPatternVariable				-> [view_error: "pattern variable" ];

WEVariable( i )					-> [view_error: i ];
WECexpression( ce )				-> [view_error: ce ];
ConsCexpression( h, t )				-> [view_error: t h ];
NilCexpression()				-> [view_error: /* EMPTY */ ];
CExpressionPart( s )				-> [view_error: s ];
CExpressionDollarvar( i )			-> [view_error: "$" i ];
CExpressionNl()					-> [view_error: " " ];
CExpressionDQ( cedq )				-> [view_error: "\"" cedq "\"" ];
CExpressionSQ( cesq )				-> [view_error: "'" cesq "'" ];
CExpressionPack( ce )				-> [view_error: "(" ce ")" ];
CExpressionArray( ce )				-> [view_error: "[" ce "]" ];
ConsCexpressionDQ( h, t )			-> [view_error: t h ];
NilCexpressionDQ()				-> [view_error: /* EMPTY */ ];
CExpressionDQPart( s )				-> [view_error: s ];
CExpressionDQNl()				-> [view_error: " " ];
ConsCexpressionSQ( h, t )			-> [view_error: t h ];
NilCexpressionSQ()				-> [view_error: /* EMPTY */ ];
CExpressionSQPart( s )				-> [view_error: s ];
CExpressionSQNl()				-> [view_error: " " ];

Str( cs )					-> [ view_error: cs ];
Int( i )					-> [ view_error: i ];
NoStorageOption()				-> [ view_error: /* EMPTY */ ];
NegativeStorageOption( id )			-> [ view_error: "{! " id/*:base_uview*/ " } at " id->file ":" id->line ];
PositiveStorageOption( id )			-> [ view_error: "{ " id/*:base_uview*/ " } at " id->file ":" id->line ];

%uview (view_error_format);

%{ HEADER

#include <unistd.h>

namespace kc {

class view_error_format_class : public view_error_format_baseclass {
public:
    view_error_format_class(const std::string& fmt): msg(fmt) { }

    void program(const char* p) { replace("%p",p); }
    void file(const char* f) { replace("%f",f); }
    void line(INTEGER l) {
	char buf[30];
	sprintf(buf,"%d",l);
	replace("%l",buf);
    }
    void column(INTEGER c) {
	char buf[30];
	sprintf(buf,"%d",c);
	replace("%c",buf);
    }
    void severity(const char* s) { replace("%s",s); }

    const char* get_msg() {
	// discard unused patterns
	program("");
	file("");
	replace("%l","");
	replace("%c","");
	char* buf;
	replace("%d",buf=getcwd(NULL,0)); // current directory
	free(buf);
	severity("");
	return msg.c_str();
    }

    void replace(const char* s1, const char* s2) {
	std::string::size_type pos;
	while((pos=msg.find(s1)) != std::string::npos) {
	    msg.replace(pos,strlen(s1),s2);
	}
    }
private:
    std::string msg;
};

}

%}

/*
 * This can be easier if we are allowed to use strings/ints
 * in the pattern
 */
FileLine()				-> [ view_error:
			 { if (line != 0) } ${
			       " at "
			       { if (strcmp(file->name, "") != 0) } ${
				    file
			       $}
			       ":" line
			 $} { else  if (pg_lineno != 0) } ${
			       " at "
			       { if (strcmp(pg_filename->name, "") != 0) } ${
			            pg_filename
			       $}
			       ":" pg_lineno
			 $}
					]
					[ view_error_format:
			 { if (line != 0) {
			       if (strcmp(file->name, "") != 0) {
				    kc_current_view.file(file->name);
			       }
				kc_current_view.line(line);
			 } else  if (pg_lineno != 0) {
			       if (strcmp(pg_filename->name, "") != 0) {
				    kc_current_view.file(pg_filename->name);
			       }
				kc_current_view.line(pg_lineno);
			 } }
					];

NoFileLine()				-> [ view_error:
			 { if (pg_lineno != 0) } ${
			       " at "
			       { if (strcmp(pg_filename->name, "") != 0) } ${
			            pg_filename
			       $}
			       ":" pg_lineno
			 $}
					]
					[ view_error_format:
			 { if (pg_lineno != 0) {
			       if (strcmp(pg_filename->name, "") != 0) {
				    kc_current_view.file(pg_filename->name);
			       }
				kc_current_view.line(pg_lineno);
			 } }
					];

PosNoFileLine()				-> [ view_error:
			 { if (pg_lineno != 0) } ${
			       " at "
			       { if (strcmp(pg_filename->name, "") != 0) } ${
			            pg_filename
			       $}
			       ":" pg_lineno
			       " col:" pg_column
			 $}
					]
					[ view_error_format:
			 { if (pg_lineno != 0) {
			        if (strcmp(pg_filename->name, "") != 0) {
				    kc_current_view.file(pg_filename->name);
			        }
				kc_current_view.line(pg_lineno);
				kc_current_view.column(pg_column);
			 } }
					];

Fatal( fl, e )				-> [ view_error:
			 { gp_no_fatal_problems=false; }
			 g_progname
			 ": fatal error" fl ": " e "\n"
			 { leave( 1 ); }
					]
					[ view_error_format:
			 { gp_no_fatal_problems=false;
			 kc_current_view.program(g_progname->name);
                         kc_current_view.severity("fatal error");
			 }
			 fl
			 { PRINT(kc_current_view.get_msg()); }
			 e:view_error "\n"
			 { leave( 1 ); }
					];

NonFatal( fl, e )			-> [ view_error:
			 { gp_no_fatal_problems=false; }
			 g_progname
			 ": error" fl ": " e "\n"
					]
					[ view_error_format:
			 { gp_no_fatal_problems=false;
			 kc_current_view.program(g_progname->name);
                         kc_current_view.severity("error");
			 }
			 fl
			 { PRINT(kc_current_view.get_msg()); }
			 e:view_error "\n"
					];

Warning( fl, e )			-> [ view_error:
			 g_progname
			 ": warning" fl ": " e "\n"
					   ]
					   [ view_error_format:
			 {
			 kc_current_view.program(g_progname->name);
                         kc_current_view.severity("warning");
			 }
			 fl
			 { PRINT(kc_current_view.get_msg()); }
			 e:view_error "\n"
					];

void
v_report(error e)
{
    if(g_options.msg_format.length()) {
	view_error_format_class v(g_options.msg_format);
	e->unparse( v_stderr_printer, v );
    }
    else
	e->unparse( v_stderr_printer, view_error );
}

static void
v_stderr_printer(const char *s, uview v)
{
    fflush( stdout );
    fprintf( stderr, "%s", s );
    fflush( stderr );
}


/*
 * HACK to get rid of backslash problems
 */
%{
#define QUOTEDBACKSLASH '\\'
%}

%{
#ifndef KC_MAX_STRING_LEN
# define KC_MAX_STRING_LEN 200
#endif /* !KC_MAX_STRING_LEN */

viewnameoption ug_viewnameopt;
%}
%{ KC_TYPES_HEADER
extern viewnameoption ug_viewnameopt;
%}
%{ HEADER
class kc_filePrinter : public printer_functor_class {
public:
    kc_filePrinter(FILE *f=0);
    virtual void operator()(const char* s, uview v);
    int fclose()
    {
	int temp=0;
	if (file)
	    temp=::fclose(file);
	file=0;
	return temp;
    }
    void init(const char *name, const char *mode, const string &type);
    bool check_keyword(const char*);
    FILE *destination() { return file; }
private:
    FILE *file;
    int lineno;
    string filename;
    int no_of_printed_string_chars; /* to split long double-quoted strings */
    bool doit;
    char lastChar;
    int indent;
    int bs_cnt;
    bool inString;
    bool inChar;
    bool inComment;
    bool inCppComment;
    bool spacePending;
    bool beginOfLine;
    const char* keyword;
    bool indentKeyword;
    bool inPreProStmt;
    static int indent_level;
};

extern kc_filePrinter v_stdout_printer;
extern kc_filePrinter v_hfile_printer;
extern kc_filePrinter v_ccfile_printer;
extern printer_functor_class v_null_printer;

%}

%{
int kc_filePrinter::indent_level = 4;
kc_filePrinter::kc_filePrinter(FILE* f):file(f)
{
    lineno=0;
    no_of_printed_string_chars=0;
    doit=false;
    lastChar='\n';
    indent=0;
    bs_cnt=0;
    inString=false;
    inChar=false;
    inComment=false;
    inCppComment=false;
    spacePending=false;
    beginOfLine = false;
    keyword=0;
    indentKeyword=false;
    inPreProStmt=false;
}

kc_filePrinter v_stdout_printer(stdout);
kc_filePrinter v_hfile_printer;
kc_filePrinter v_ccfile_printer;
printer_functor_class v_null_printer;

bool kc_filePrinter::check_keyword(const char* s)
{
    bool res=false;
    if(inPreProStmt) { // just to ignore #if and #else
	if(!isspace(*s))
	   inPreProStmt=false;
    }
    else if(!keyword) {
	if(*s=='#')
	    inPreProStmt=true;
	else if(*s=='i' || *s=='e' || *s=='d' || *s=='w') // 'if', 'else', 'do', 'while'
	    keyword=s; // 'for' not supported yet
    }
    else if(!isalnum(*s) && *s!='_') { // end of identifier
	    ptrdiff_t length=s-keyword;
	    if(
		(length==2 && strncmp(keyword,"if",length)==0) ||
		(length==4 && strncmp(keyword,"else",length)==0) ||
		(length==2 && strncmp(keyword,"do",length)==0) ||
		(length==5 && strncmp(keyword,"while",length)==0))
		res=true; // keyword found
	    keyword=0;
    }
    return res;
}

void kc_filePrinter::operator()(const char *s, uview v)
{
    char c;

    assertCond(file != 0);

    switch(v) {
    case view_no_of_printed_string_chars_reset_enum:
	no_of_printed_string_chars = 0;
	break;
    case view_printer_outputfileline_enum:
	fprintf( file, "\n" ); lineno = lineno +1;
	if(g_options.linedirec)
	    fprintf( file, "%s %d \"%s%s\"\n", pg_line, lineno+1, g_options.dir_line.c_str(),filename.c_str() );
	lineno = lineno +1;
	lastChar='\n';
	break;
    default:
	while((c=*s++)) {
	    switch( c ) {
	    case '\0': return;
	    case '\n':
		/* if (*s == QUOTEDBACKSLASH) s++; */
		lineno = lineno +1;
		beginOfLine = true;
		/* FALLTHROUGH */
	    default:
		if (v == view_gen_unpstr_c) {
		    if (no_of_printed_string_chars >= KC_MAX_STRING_LEN) {
			if (doit) {
			    fprintf( file, "\"), " );
			    ug_viewnameopt->unparse( *this, view_gen_unparsedefs_other_c );
			    fprintf( file, " );\n		  kc_printer(kc_t(\"" );
			    lineno = lineno +1;
			    no_of_printed_string_chars = 0;
			    doit = false;
			} else {
			    switch( c ) {
			    case '\\':
			    case '\n':
				break;
			    default:
				doit = true;
			    }
			}
		    }
		    no_of_printed_string_chars = no_of_printed_string_chars +1;
		} else if (v == view_filename) {
		    /* duplicate (= escape) backslashes in file names.
		     * we do this to help those that work on windows etc.
		     */
		    if (c == QUOTEDBACKSLASH) { /* we have to quote it! */
			putc( c, file );
		    }
		}
		if(inString) {
		    if(c=='"' && bs_cnt%2==0)
			inString=false;
		    putc( c, file );
		    lastChar=c;
		}
		else if(inChar) {
		    if(c=='\'' && bs_cnt%2==0)
			inChar=false;
		    putc( c, file );
		    lastChar=c;
		}
		else if(inComment) {
		    if(c=='/' && lastChar=='*')
			inComment=false; /* C comments */
		    switch(c) {
		    case '\v': case '\r': case '\b': break;
		    default:
			putc( c, file );
			lastChar=c;
		    }
		}
		else if(inCppComment) {
		    if(c=='\n')
			inCppComment=false; /* C++ comments */
		    switch(c) {
		    case '\v': case '\r': case '\b': break;
		    default:
			putc( c, file );
			lastChar=c;
		    }
		}
		else {
		    int indent_offset=0;
		    if(!indentKeyword) {
			indentKeyword=check_keyword(s-1);
			if(indentKeyword)
			    ++indent;
		    }
		    switch(c) {
		    case ';':
			if(indentKeyword) {
			    --indent;
			    indentKeyword=false;
			}
			goto default_case;
		    case '{':
			if(indentKeyword) {
			    --indent;
			    indentKeyword=false;
			}
			// no break
		    case '(':
			indent_offset=1;
			goto default_case;
		    case '\v':
			++indent;
			break;
		    case '}':
		    case ')':
			if(indent) --indent;
			goto default_case;
		    case '\r':
			if(indent) --indent;
			break;
		    case '\b':
			lastChar=c;
			break;
		    case ' ':
		    case '\t':
			if(lastChar=='\b' || !beginOfLine)
			    goto default_case;
			if(isspace(lastChar))
			    break;
			if(isalnum(lastChar) || lastChar=='_' || lastChar=='"' || lastChar=='\'' || lastChar==')' || lastChar=='}') {
			    if(isalnum(*(s+1))|| *(s+1)=='_'|| *(s+1)=='"' || *(s+1)=='\'') {
				c=' ';
				goto default_case;
			    }
			    spacePending=true;
			}
			break;
		    default:
		    default_case:
			if(lastChar=='\n' && c!='\n' && c!='#') {
			    for(int i=indent*indent_level;i>0;)
				if(i>=8) {
				    putc('\t',file);
				    i-=8;
				} else {
				    for(int k=0;k<i;k++)
					putc(' ',file);
				    i=0;
				}
			}
			if(!isspace(c))
			    beginOfLine = false;
			if(c=='"' && bs_cnt%2==0)
			    inString=true;
			else if(c=='\'' && bs_cnt%2==0)
			    inChar=true;
			else if(c=='/' && lastChar=='/')
			    inCppComment=true; /* C++ comments */
			else if(c=='*' && lastChar=='/')
			    inComment=true; /* C comments */
			if(spacePending) {
			    if(isalnum(c)|| c=='_' || c=='"' || c=='\'')
				putc( ' ', file );
			    spacePending=false;
			}
			putc( c, file );
			lastChar=c;
			indent+=indent_offset;
		    }
		}
		if(c=='\\')
		    ++bs_cnt;
		else
		    bs_cnt=0;
	    }
	}
	keyword=0; // no keyword check between different strings
    }
}

void kc_filePrinter::init(const char *name, const char *mode, const string &_filename)
{
    file=fopen(name, mode);
    if (file==0) v_report( Fatal( NoFileLine(), Problem4S( "cannot create temporary ", _filename.c_str(), " file:", name )));
    lineno = 1;
    filename = _filename;
    lastChar='\n';
    indent=0;
    inString=false;
    inComment=false;
    inCppComment=false;
    spacePending=false;
    beginOfLine=false;
}


%}

// vim:sts=4:ts=8:cino=g0,t0,\:0
