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
// gutil.k
//
%{
  static char gutil_kAccesSid[] = "@(#)$Id: gutil.k,v 1.49 2007-01-30 14:10:29 piefel Exp $";
%}
/***************************************************************************/

%{ KC_UNPARSE
#include "gutil.h"

#include <map>
#include <string>
#include <stack>
namespace { // everything here is local to unpk.cc
int g_no_of_phyla;
int g_no_of_operators;
int gl_no_of_args;
int gl_generic_counter;
bool gl_isnotlist;

std::map<string, path> gl_bindings;

const int PHYLUMNUMBEROFFSET=0; /* should be >= 0; == the index of the last dummy element */
const int OPERATORNUMBEROFFSET=0; /* should be >= 0; == the index of the last dummy element */

std::stack<ID> selvarstack;
#define cf_pushselvar(o) do { selvarstack.push(o); \
			      g_ctext_level++; \
			    } while(0)
#define cf_topselvar() selvarstack.top()
#define cf_popselvar() do { selvarstack.pop();\
			    g_ctext_level--; \
			  } while(0)

std::stack<ID> dollarvarstack;
std::stack<ID> dollarvarextstack;

ID gl_phylum = 0;
phylumdeclaration gl_phydecl = 0;
ID gl_view = 0;
ID gl_operator = 0;
alternative gl_alternative = 0;
Ccode_option gl_cco = 0;
storageoption gl_storageoption = 0;
bool gl_atomicity;
arguments gl_args = 0;
ac_identifier_list gl_idents = 0;
fndeclarations gl_members = 0;
rewriterulesinfo gl_rewrite_rewriteinfo = 0;
const char *g_emptystring = "";
int g_ctext_level = 0;
int g_withexpr_nr = 0;
int g_fe_selvar_nr = 0;
const char *gl_return_type = "";
ID gl_return_ID = 0;
int gl_star_count = 0;
const char *gl_function = "";
ID gl_sto = 0;
bool gl_rewrite_goto_used = false;
bool gl_unparse_goto_used = false;
ID gl_type = 0;
int gl_j = 0;
bool gl_print_line_directive = false;
uview_enum gl_outer_view;
}

%}
%{ HEADER
extern phylumdeclaration The_abstract_phylum_decl;
extern phylumdeclaration The_abstract_phylum_ref_decl;
extern phylumdeclaration The_abstract_list_decl;
%}

%{
/* string(s) stuff */
#include <sstream>
#include <string.h>
#include <ctype.h>

phylumdeclaration The_abstract_phylum_decl;
phylumdeclaration The_abstract_phylum_ref_decl;
phylumdeclaration The_abstract_list_decl;
%}

/***************************************************************************/

bool
f_something_to_initialize(Ccode_option cco)
{
    with( cco ) {
	CcodeOption( attr, ct ): {
	    return (f_attributes_to_initialize( attr ) || (! f_NilCtexts( ct )));
}   }   }

bool
f_something_to_initialize(alternative a)
{
    return false;
}

bool
f_NilCtexts(Ctexts c)
{
    with( c ) {
	NilCtexts(): { return true; }
	ConsCtexts( *, * ): { return false; }
}   }



static bool
f_attributes_to_initialize(attributes attr)
{
    foreach( a; attributes attr ) {
	with( a ) {
	    Attribute( *, *, Noattribute_initialisation() ): {/*EMPTY*/}
	    Attribute( *, *, Yesattribute_initialisation( * )): {
		return true;
	    }
	}
    }
    return false;
}

static bool
f_constructors_in_members(fndeclarations $dcl) {
    Consfndeclarations(FnAcDeclaration(*,*,*,*,*,*,ConstructorFn()),*):
	{ return true; }
    Consfndeclarations(*, tail): { return f_constructors_in_members(tail); }
    default: { return false; }
}

bool
f_constructors_in_operatordecl(alternative op) {
    return f_constructors_in_members(op->additional_members);
}

bool
f_constructors_in_phylumdecl(phylumdeclaration ph) {
    return f_constructors_in_members(ph->additional_members);
}

static bool
f_destructors_in_members(fndeclarations $dcl) {
    Consfndeclarations(FnAcDeclaration(*,*,*,*,*,*,DestructorFn()),*):
	{ return true; }
    Consfndeclarations(*, tail): { return f_destructors_in_members(tail); }
    default: { return false; }
}

bool
f_destructors_in_operatordecl(alternative op) {
    return f_destructors_in_members(op->additional_members);
}

bool
f_destructors_in_phylumdecl(phylumdeclaration ph) {
    return f_destructors_in_members(ph->additional_members);
}

bool
f_no_params(ac_parameter_type_list $p) {
    AcParList( Nilac_parameter_list() )	: { return true; }
    default: { return false; }
}

static bool
f_post_create_in_members(fndeclarations $dcl) {
    Consfndeclarations(
	    FnAcDeclaration(
		*,
		AcDeclarator(*,*,
		    AcQualifiedDeclProto(*,
			AcDirectDeclId(Id(Str("post_create"))),
			*,*)),
		*,*,*,*,MemberFn()),*):
	{ return true; }
    Consfndeclarations(*, tail): { return f_post_create_in_members(tail); }
    default: { return false; }
}

bool
f_post_create_in_operatordecl(alternative op) {
    return f_post_create_in_members(op->additional_members);
}

bool
f_post_create_in_phylumdecl(phylumdeclaration ph) {
    return f_post_create_in_members(ph->additional_members);
}

static bool
f_rewrite_in_members(fndeclarations $dcl) {
    Consfndeclarations(
	    FnAcDeclaration(
		*,
		AcDeclarator(*,*,
		    AcQualifiedDeclProto(*,
			AcDirectDeclId(Id(Str("rewrite"))),
			*,*)),
		*,*,*,*,MemberFn()),*):
	{ return true; }
    Consfndeclarations(*, tail): { return f_rewrite_in_members(tail); }
    default: { return false; }
}

bool
f_rewrite_in_phylumdecl(phylumdeclaration ph) {
    return f_rewrite_in_members(ph->additional_members);
}

bool
f_rewrite_in_operatordecl(alternative $op) {
    Alternative(oid,*) : {
        if(f_rewrite_in_members(op->additional_members))
	   return true;
	return f_rewrite_in_phylumdecl(f_phylumdeclofid(f_phylumofoperator(oid)));
    }
    default: { return false; } 
}

/************************************************************************/

%{
#include "util.h"
%}

ID f_phylumofwithcasesinfo(withcasesinfo wcso)
{
    ID id;
    with( wcso ) {
	Nilwithcasesinfo(): {
	    v_report(NonFatal( NoFileLine(), Problem1S( "Error: can not find type of with expression" )));
	    return Id( Str( mkcasestring( "KC_ERRORunknownTYPE" )));
	}
	Conswithcasesinfo( wco, r_wcso ): {
	    with( wco ) {
	        Withcaseinfo( patrep, *, * ): {
		    if ( (id = f_phylumofpatternrepresentation( patrep ))->eq( f_emptyId() )) {
			return f_phylumofwithcasesinfo( r_wcso );
		    } else {
			return id;
}   }   }   }   }   }

ID f_phylumofpatternrepresentation(patternrepresentation a_patrep)
{
    with( a_patrep ) {
	Nilpatternrepresentation(): {
	    return f_emptyId();
	}
	Conspatternrepresentation( a_patrep_elem, r_patrep ): {
	    with( a_patrep_elem ) {
		PROperPredicate( *, id ): {
		    return f_phylumofoperator( id );
		}
		default: {
		    return f_phylumofpatternrepresentation( r_patrep );
}   }   }   }   }

/***************************************************************************/

%{
#include "parse.h"
%}
ac_parameter_type_list
sort_extend_parameter_type_list(ac_declaration_list C_vardecls, ac_declarator $decl)
{
    AcDeclarator( *, *, add ): {
	with( add ) {
	    AcDirectDeclId( * ),
	    AcDirectDeclPack( * ),
	    AcDirectDeclArray( *, * ): { return AcParList( Nilac_parameter_list() ); }
	    AcDirectDeclProto( *, fn_proto ): { return fn_proto; }
	    AcQualifiedDeclProto( *, *, fn_proto,* ): { return fn_proto; }
	}
    }
}

ac_parameter_list
t_sort_extend_parameter_list(ac_declaration_list C_vardecls, ac_identifier_list fn_args, ac_parameter_list temp)
{
    with( fn_args ){
	Nilac_identifier_list() : { return temp; }
	Consac_identifier_list( a_fnarg, r_fnargs ): {
	    temp =  t_sort_extend_parameter_list( C_vardecls, r_fnargs, temp );
	    return Consac_parameter_list( lookup_and_create_ac_parameter_declaration( a_fnarg, C_vardecls ), temp );
}   }   }

static ac_parameter_declaration
lookup_and_create_ac_parameter_declaration( ID a_fnarg, ac_declaration_list C_vardecls)
{
    ac_parameter_declaration result = 0;
    int number_of_results = 0;
    foreach( AcDeclaration( type, cvars); ac_declaration_list C_vardecls ) {
	foreach( AcInitDecl( decl ); ac_init_declarator_list cvars ) {
	    ID name = f_ID_of_declarator( decl );
	    if (name->eq( a_fnarg ) ) {
		result = AcParDeclDecl( type, decl, Noac_constant_expression());
		number_of_results++;
	}   }	}
    if (number_of_results == 1) {
	return result;
    } else {
	// error
	if (number_of_results > 1) {
	    v_report(Warning( FileLine( a_fnarg->file, a_fnarg->line ), Problem1S1ID( "more than one type defined for function argument:", a_fnarg )));
	} else { // (number_of_results < 1)
	    v_report(Warning( FileLine( a_fnarg->file, a_fnarg->line ), Problem1S1ID( "can not find type of function argument:", a_fnarg )));
	}
	// should be handled more gracefully
	return AcParDeclDecl(
		Consac_declaration_specifiers(
		    AcDeclSpecTypeSpec(
			AcTypeSpec( Id( Str( mkcasestring( "KC_ERRORunknownTYPE" ))))),
		    Nilac_declaration_specifiers()),
		AcDeclarator(
		    Nopointer(),
		    AcNoRef(),
		    AcDirectDeclId( a_fnarg )),
		Noac_constant_expression());
    }
}

/***************************************************************************/

%{
#include "unpk.h"
%}
void unparse(const char *s, printer_functor printer_fn, uview v)
{
    printer_fn( s, v );
}

charruns {uniq}:
    Newlines()
    | QuotedNewlines()
    | Stars()
    { int number; }
    ;

charruns
charruns::set(int _n = 0) { number=_n; return this; }

Newlines() provided (this->number>0) -> [: "\n" { this->number--; } this ];
QuotedNewlines() provided (this->number>0) -> [: "\\\n\\n" { this->number--; } this ];
Stars() provided (this->number>0) -> [: "*" { this->number--; } this ];

ID
f_mkselvar(const char *prefix, int level)
{
    std::ostringstream os;
    os << prefix << level;
    return Id( Str( mkcasestring( os.str().c_str() )));
}


/*
 * Make a file name from a (possibly quoted) string, that may contain
 * a complete (absolute or relative path), and may or may not end in
 * '.k'. If the ending is .k, then replace it by the suffix;
 * if we don't have a .k ending, it will probably be stdin, so we
 * extend the name.
 * We keep in mind that we may have to remove quotes ("")
 */
string
f_mk_filename(casestring a_casestring, const string& suffix)
{
    char const *basename;

    if ((basename = strrchr( a_casestring->name, '/' )) == 0)
	basename = a_casestring->name;
    if (basename[0] == '/')
	basename++;
    else if (basename[0] == '"')
	basename++;
    size_t baselen = strlen(basename);

    string filename = basename;
    if (baselen > 0 && filename[baselen-1] == '"' ) {
	filename.erase(baselen-1);
	baselen--;
    }
    if ( baselen > 1 && (filename[baselen-1] == 'k' && filename[baselen-2] == '.' ))
	filename.erase(baselen-2);
    if (suffix.length()==0)
	return filename;

    filename += '.';
    filename += suffix;

    return filename;
}

/***************************************************************************/
/*
 * make a name that can be used in the #define file/guard name
 * derive it from the .cc or .h file
 * (we expect a basename with suffix)
 */
%{
#include <ctype.h>
%}
string
f_make_identifier_basename(string fn)
{
    size_t baselen = fn.length();
    // cut off extension
    baselen -= (fn[baselen-1] == 'h') ? 2 : 3;

    string nn;
    for (size_t i=0; i < baselen; ++i)
	nn += isalnum(fn[i]) ? fn[i] : '_';
    return nn;
}

/**************************************************************************/

/*
 * this function reorders the rewrite/unparsedeclsinfo in a phylum as follows:
 * the rewrite/unparsedeclsinfos per phylum are collected
 * (concatenated one after the other)
 * and then, for each view a rewrite/unparseviewsinfo is created, containing
 * the 'projection' of the collected rewrite/unparsedeclsinfo on this
 * particular view.
 */

%{
static ID global_filterview; /* to be used by filteronview */
%}

rewriterulesinfo
f_rewriterulesinfoofalternativeinview(alternative a_alternative, ID a_view)
{
    global_filterview = a_view;
    return a_alternative->rewriteinfo->filter( filterrewriteruleinfoonview );
}

rewriteviewsinfo
f_rewriteviewsinfo_of_alternative(alternative a_alternative, viewnames a_views)
{
    rewriterulesinfo tmp_rulesinfo = a_alternative->rewriteinfo;
    rewriteviewsinfo tmp_viewsinfo = Nilrewriteviewsinfo();
    foreach (a_view; viewnames a_views ) {
	global_filterview = a_view;
	tmp_viewsinfo = Consrewriteviewsinfo( Rewriteviewinfo( a_view, tmp_rulesinfo->filter( filterrewriteruleinfoonview )), tmp_viewsinfo );
    }
    return tmp_viewsinfo;
}

unparseviewsinfo
f_unparseviewsinfo_of_alternative(alternative a_alternative, viewnames a_views)
{
    unparsedeclsinfo tmp_declsinfo = a_alternative->unparseinfo;
    unparseviewsinfo tmp_viewsinfo = Nilunparseviewsinfo();
    foreach (a_view; viewnames a_views ) {
	global_filterview = a_view;
	tmp_viewsinfo = Consunparseviewsinfo( Unparseviewinfo( a_view, tmp_declsinfo->filter( filterunparsedeclinfoonview )), tmp_viewsinfo );
    }
    return tmp_viewsinfo;
}

// Filter functions uses from above
static bool
filterrewriteruleinfoonview(rewriteruleinfo a_rewriteruleinfo)
{
    return is_viewname_in_rewriteruleinfo( global_filterview, a_rewriteruleinfo );
}

static bool
filterunparsedeclinfoonview(unparsedeclinfo a_unparsedeclinfo)
{
    return is_viewname_in_unparsedeclinfo( global_filterview, a_unparsedeclinfo );
}

static bool
is_viewname_in_rewriteruleinfo(ID a_view, rewriteruleinfo a_rewriteruleinfo)
{
    with( a_rewriteruleinfo ) {
	Rewriteruleinfo( *, *, RewriteClause( a_viewnames, * )): {
	    return is_viewname_in_viewnames( a_view, a_viewnames );
}   }   }

static bool
is_viewname_in_unparsedeclinfo(ID a_view, unparsedeclinfo a_unparsedeclinfo)
{
    with( a_unparsedeclinfo ) {
	Unparsedeclinfo( *, *, UnparseClause( a_viewnames, * )): {
	    return is_viewname_in_viewnames( a_view, a_viewnames );
}   }   }

static bool
is_viewname_in_viewnames(ID a_view, viewnames a_viewnames)
{
    foreach( a_viewname; viewnames a_viewnames ) {
	if ( a_view->eq( a_viewname ) ) {
	    return true;
    }   }
    return false;
}

ID
f_typeof(path a_path)
{
    if (a_path->id->eq(f_emptyId())) {
	with( a_path ) {
	    Nilpath(): {
		return f_phylumofoperator( a_path->op );
	    }
	    Conspath( i, r_path ): {
		return f_subphylumofoperator( r_path->op, Int( i ) );
	}   }
    } else {
	return a_path->id;
    }
}


ID
f_operatorofpatternrepresentation(patternrepresentation a_patternrepresentation)
{
    with( a_patternrepresentation ) {
	Nilpatternrepresentation(): {
	    return f_emptyId();
	}
	Conspatternrepresentation( e, * ): {
	    return f_operatorofelem_patternrepresentation( e );
}   }   }

static ID
f_operatorofelem_patternrepresentation(elem_patternrepresentation a_elem_patternrepresentation)
{
    with( a_elem_patternrepresentation ) {
	PRVarPredicate( ps, *, * )  : { return f_operatorofpaths( ps ); }
	PRBinding( p, * ),
	PROperPredicate( p, * ),
	PRNonLeafBinding( p, *, * ),
	PRWildcard( p ),
	PRStringLiteral( p, * ),
	PRIntLiteral( p, * )	    : { return f_operatorofpath( p ); }
	PRUserPredicate( * ),
	PRDefault()		    : { return f_emptyId(); }
}   }

static ID
f_operatorofpaths(paths a_paths)
{
    with( a_paths ) {
	Nilpaths(): {
	    return f_emptyId();
	}
	Conspaths( p, * ): {
	    return f_operatorofpath( p );
}   }   }

static ID
f_operatorofpath(path a_path)
{
    with( a_path ) {
	Nilpath(): {
	    return a_path->op;
	}
	Conspath( *, r_path ): {
	    return r_path->op;
}   }   }

ID
f_typeofunpsubterm(unpsubterm a_unpsubterm, ID a_operator)
{
    with( a_unpsubterm ) {
	UnpSubTerm( a_id ): { return f_phylumofpatternID( a_id ); }
	UnpDollarvarTerm( i ): { return f_subphylumofoperator( a_operator, i ); }
	UnpSubAttr( an_id, an_unpattributes ): { return f_check_unpattributes_in_phylum( an_unpattributes, f_phylumofpatternID( an_id ) ); }
	UnpDollarvarAttr( i, a_unpattributes ): { return f_check_unpattributes_in_phylum( a_unpattributes, f_subphylumofoperator( a_operator, i ) ); }
	UnpCastedVariable( a_cast, * ): { return a_cast; }
}   }

/**************************************************************************/

elem_patternrepresentation
f_outmost_nl_preds_in_rewriterulesinfo(rewriterulesinfo ri)
{
    with( ri ) {
	Nilrewriterulesinfo(): { return 0; }
	Consrewriterulesinfo( Rewriteruleinfo( preds, *, * ), r_ri ): {
	    elem_patternrepresentation epr =
		f_outmost_nl_preds_in_patternrepresentation( preds );
	    return epr ? epr
		: f_outmost_nl_preds_in_rewriterulesinfo( r_ri );
}   }   }

elem_patternrepresentation
f_outmost_nl_preds_in_unparsedeclsinfo(unparsedeclsinfo ri)
{
    with( ri ) {
	Nilunparsedeclsinfo(): { return 0; }
	Consunparsedeclsinfo( Unparsedeclinfo( preds, *, * ), r_ri ): {
	    elem_patternrepresentation epr =
		f_outmost_nl_preds_in_patternrepresentation( preds );
	    return epr ? epr
		: f_outmost_nl_preds_in_unparsedeclsinfo( r_ri );
}   }   }

static elem_patternrepresentation
f_outmost_nl_preds_in_patternrepresentation(patternrepresentation p)
{
    with( p ) {
	Nilpatternrepresentation(): { return 0; }
	Conspatternrepresentation( a_p, r_p ): {
	    return f_outmost_nl_preds_in_elem_patternrepresentation( a_p ) ? a_p
		: f_outmost_nl_preds_in_patternrepresentation( r_p );
}   }   }

static bool
f_outmost_nl_preds_in_elem_patternrepresentation(elem_patternrepresentation e_p)
{
    with( e_p ) {
	PRVarPredicate( a_p, *, * ): {
	    return f_outmost_nl_preds_in_paths( a_p );
	}
	default: { return false; }
}   }

static bool
f_outmost_nl_preds_in_paths(paths p)
{
    with( p ) {
	Nilpaths(): { return false; }
	Conspaths( Nilpath(), * ): { return true; }
	Conspaths( Conspath( *, * ), r_p ): {
	    return f_outmost_nl_preds_in_paths( r_p );
}   }   }

/***************************************************************************/

/*
 * this function is called when deciding to print (dummy) 'return (cast)0;'
 * code in a default with case of a non-void function, to suppress compiler
 * messages about functions falling off the end of non-void functions.
 *
 * the idea is that when this function is called we know that the return-type
 * is not a ptr type, nor is it a phylum.
 * This routine should check if it is something else that we know (ie. that we
 * generate in kc (eg. a view, a hashtable, a bool, etc.))
 *
 * right now we use a terrible search strategy (linear!),
 * we should use the the uniq strategy, and have a new IDtype
 * for types.
 */
bool
f_is_known_ptr_type(ID id)
{
    static phylumnames known = 0;

    if (! known ) {		/* to be extended with new types */
	known = Nilphylumnames();
	known = Consphylumnames( Id( Str( mkcasestring( "size_t" ))), known );
	known = Consphylumnames( Id( Str( mkcasestring( "unsigned" ))), known );
	known = Consphylumnames( Id( Str( mkcasestring( "enum_phyla" ))), known );
	known = Consphylumnames( Id( Str( mkcasestring( "enum_operators" ))), known );
	known = Consphylumnames( Id( Str( mkcasestring( "KC_UNIQ_INFO" ))), known );
	known = Consphylumnames( Id( Str( mkcasestring( "bool" ))), known );
	known = Consphylumnames( Id( Str( mkcasestring( "hashtable_t" ))), known );
	known = Consphylumnames( Id( Str( mkcasestring( "KC_IO_STATUS" ))), known );
	known = Consphylumnames( Id( Str( mkcasestring( "uview" ))), known );
	known = Consphylumnames( Id( Str( mkcasestring( "rview" ))), known );
    }
    foreach( pn; phylumnames known ) {
	if ( pn->eq( id )) {
	    return true;
	}	}
    return false;
}

/***************************************************************************/

/*
 * rewrite rules to simplify the pattern representations,
 * by eliminating the PRWildcard(*) and PRDefault()
 * This rules will be used just before code is generated
 */

Conspatternrepresentation( PRWildcard( * ), r )	->	<: r >;
Conspatternrepresentation( PRDefault(), r )	->	<: r >;

/*
 * we need the routine below to make sure that we only rewrite the
 * predicates in the withcaseinfo.
 * If we would also rewrite the bindings, we would lose the 'type'
 * attribute that contains important type information.
 */
%{
#include "rk.h"		/* for the rewrite_withcasesinfo call below */
%}

withcasesinfo
rewrite_withcasesinfo(withcasesinfo $a_withcasesinfo)
{
    Nilwithcasesinfo(): { return $0; }
    Conswithcasesinfo( Withcaseinfo( p, b, ct ), r ): {
	return Conswithcasesinfo(
		Withcaseinfo( p->rewrite(base_rview), b, ct ),
		rewrite_withcasesinfo( r ) );
    }
}

/***************************************************************************/

/*
 * Compute the position of the sole (single) dollar variable or
 * pattern in a patternchain. This is to be used to set the right $0
 * for a foreach statement.
 * NOTE: if there is more than a single pattern or dollar variable,
 * then we don't set $0. We call this failure.
 * We indicate failure by returning -1.
 * We start with inital return value of -2, meaning: mothing found, but
 * no failure yet.
 * A zero or positive return value indicates the index of the pattern
 * or dollar variable.
 */

int
pos_of_sole_dollar_or_pattern_in_patternchain(patternchain a_patternchain)
{
    return t_pos_of_sole_dollar_or_pattern_in_patternchain(a_patternchain, -2, 1);
}

int
t_pos_of_sole_dollar_or_pattern_in_patternchain(patternchain a_patternchain, int tmp_result, int pos)
{
    if (tmp_result == -1) { /*failure*/
	return tmp_result;
    }
    with( a_patternchain ) {
	Conspatternchain( h, t ): {
	    tmp_result = t_pos_of_sole_dollar_or_pattern_in_patternchain( t, tmp_result, pos+1 );
	    if (tmp_result == -1) { /*failure*/
		return tmp_result;
	    }
	    with( h ) {
		PatternchainitemOutmost( p ): {
		    with( p ) {
			OPOperatorWildcard( Id(uid), * ): {
			    with( uid->type ) {
				ITPatternVariable( *, * ),
				ITUnknown(): { /* only variable */
				    return tmp_result;
				}
				default: {
				    if (tmp_result >= 0) {
					return -1; /*failure*/
				    } else {
					return pos;
			}   }	}   }
			default: {
			    return tmp_result >= 0 ?  -1 /*failure*/ : pos;
		}   }	}
		PatternchainitemDollarid( * ): {
		    return tmp_result >= 0 ?  -1 /*failure*/ : pos;
		}
		default: /* PatternchainitemGroup( * ): */ {
		    return -1; /* ERROR found */
		}
	    }
	}
	default /* Nilpatternchain() */: {
	    return tmp_result;
	}
    }
}

//////////////////////////////////////////////////////////////////
// get identifiers ([[:alnum:]_]+) from a string
string f_getidentfromstring(const char **c)
{
    string s="";
    if (isalnum(**c) || **c=='_')
	while (isalnum(**c) || **c=='_') s+=*(*c)++;
    else
	while (!(isalnum(**c) || **c=='_' || **c=='\0')) s+=*(*c)++;
    return s;
}

// vim:sts=4:ts=8:cino=g0,t0,\:0
