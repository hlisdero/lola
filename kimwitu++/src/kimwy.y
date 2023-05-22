%{
//
// The Termprocessor Kimwitu++
//
// Copyright (C) 1991 University of Twente, Dept TIOS.
// Copyright (C) 1998-2007 Humboldt-University at Berlin, Institute of Informatics
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


//
// kimwy.y
//
static char kimwy_yAccesSid[] = "@(#)$Id: kimwy.y,v 1.52 2007-01-30 14:10:30 piefel Exp $";

void yyerror_1(const char *s, int state_no);
#define yyerror(s) yyerror_1(s, yystate)

#ifdef BISON_RECOVER
  /* Note that setting YYDEBUG is required even if you do not want to
   * set the yydebug variable because we use the symbol strings in
   * 'yytname' for initialising costs and also for error messages.
   */
#define YYDEBUG             1
#define yyinsertcost(token) (token[0]=='\''?1:strlen(token))
#define yydeletecost(token) (token[0]=='\''?1:strlen(token))
#endif /* BISON_RECOVER */

/////////////////////////////////////////////////////////////////////////////
//
// Name conventions: tokens are in CAPITALS
// nonterminals are in lowercase
// operators are capitalized
//

// For windows (NT at least) we need to redefine alloca
#if defined(_WIN32) && ! defined (__GNUC__)
# define alloca _alloca
# include <malloc.h>
#endif

#include "k.h"
#include "parse.h"
#include "occur.h"
#include "util.h"	// for the v_add_to routines
#include "rk.h"		// for the patternchains::rewrite routine
#include "yystype.h"	// for YYSTYPE
#include "error.h"

#include <stdlib.h>
#include <string.h>
#include <stack>


namespace { // local kimwy.y vars
static ID pl_phylum;
static withexpressions pl_withvariables;
static std::stack<withexpressions> pl_withvariablesstack;
static std::stack<idCexpressions> pl_idCexpressionsstack;
static std::stack<fileline> pl_filelinestack;
static std::stack<int> pl_nooperatorsstack;
static int non_default_outmostpattern = 0;
}

#define dollar_mark_set() (!pl_withvariables->eq(Nilwithexpressions()))
#define do_MainC() do { if ( dollar_mark_set() ) do_NORMAL(); else do_C(); } while(0)
extern void do_NORMAL();
extern void do_CEXPR();
extern void do_CEXPRDQ();
extern void do_CEXPRSQ();
extern void do_C();
extern int yylex();


#define pf_setfileline(x) do { (x)->file = pg_filename; \
		   (x)->line = pg_lineno; \
		 } while(0)
#define pf_pushfileline() pl_filelinestack.push(FileLine(pg_filename, pg_lineno))
#define pf_setstacktopfileline(x) do { (x)->file = pl_filelinestack.top()->file; \
		       (x)->line = pl_filelinestack.top()->line; \
		     } while(0)
#define pf_topfileline() pl_filelinestack.top()
#define pf_popfileline() pl_filelinestack.pop()

#define pf_setwithvariable(x) pl_withvariables = Conswithexpressions(WEVariable(x), pl_withvariables)
#define pf_resetwithvariable() pl_withvariables = Nilwithexpressions()

#define pf_push_no_operators() pl_nooperatorsstack.push(non_default_outmostpattern)
#define pf_pop_no_operators() do{non_default_outmostpattern = pl_nooperatorsstack.top();pl_nooperatorsstack.pop();}while(0)

/* XXX - why is there no need to restore pl_withvariables on pop? MvL */
#define pf_pushwithvariable() pl_withvariablesstack.push(pl_withvariables)
#define pf_topwithvariable() pl_withvariablesstack.top()
#define pf_popwithvariable() pl_withvariablesstack.pop()

#define pf_pushidCexpressions(x) pl_idCexpressionsstack.push(x)
#define pf_topidCexpressions() pl_idCexpressionsstack.top()
#define pf_popidCexpressions() pl_idCexpressionsstack.pop()

%}

%token <yt_casestring>	T_ID
%token <yt_casestring>	T_OPNAME
%token <yt_integer>	T_INT
%token <yt_integer>	T_CNEWLINES
%token <yt_casestring>	T_CLINE
%token <yt_casestring>	T_CEXPRESSION
%token <yt_integer>	T_DOLLARVAR
%token <yt_casestring>	T_INCLUDEEND
%token <yt_casestring>	T_INCLUDESTART
%token T_ENDOFINCLUDESTART
%token T_LIST
%token T_ARROW
%token T_PROVIDED
%token T_STATIC
%token T_WITH
%token T_FOREACH
%token T_FOREACH_AFTER
%token T_DEFAULT
%token T_UNPBLOCKSTART
%token T_UNPBLOCKEND
%token T_PERCENTRVIEW
%token T_PERCENTRVIEWVAR
%token T_PERCENTUVIEW
%token T_PERCENTUVIEWVAR
%token T_PERCENTSTORAGECLASS
%token T_PERCENTLANGUAGE

%token T_AUTO
%token T_REGISTER
%token T_EXTERN
%token T_TYPEDEF
%token T_CONST
%token T_VOLATILE
%token T_UNSIGNED
%token T_VIRTUAL
%token T_DOTDOTDOT
%token T_COLONCOLON
%token T_OPERATOR

%token T_CONSTRUCTOR
%token T_DESTRUCTOR
%token T_MEMBER
%token T_ATTR
%token T_BASECLASS

%type <yt_INT>				dollarvar
%type <yt_ID>				id
%type <yt_INT>				integer
/* %type <yt_STRING>		string */
/* no %type for			specification */
/* no %type for			declarations */
/* no %type for			declaration */
%type <yt_phylumdeclaration>		phylumdeclaration
%type <yt_storageoption>		storageoption
%type <yt_productionblock>		productionblock
%type <yt_alternatives>			alternatives
%type <yt_alternative>			alternative
%type <yt_arguments>			arguments
%type <yt_Ccode_option>			Ccode_option
%type <yt_attributes>			attributes_option
%type <yt_attribute>			attribute
%type <yt_attribute_initialisation_option>  attribute_init_option
%type <yt_idCexpressions>		idCexpressions
%type <yt_idCexpression>		idCexpression
%type <yt_withexpressions>		withCexpressions
%type <yt_withexpression>		withCexpression
%type <yt_Cexpression>			Cexpression
%type <yt_Cexpression>			Cexpression_inner
%type <yt_Cexpression_elem>		Cexpression_elem
%type <yt_Cexpression_elem>		Cexpression_elem_inner
%type <yt_CexpressionDQ>		CexpressionDQ
%type <yt_CexpressionDQ_elem>		CexpressionDQ_elem
%type <yt_CexpressionSQ>		CexpressionSQ
%type <yt_CexpressionSQ_elem>		CexpressionSQ_elem
%type <yt_Ctext>			MainCbody
%type <yt_Ctext>			MainCbodyinC
%type <yt_Ctext>			MainCBodycontinuation
%type <yt_Ctext>			Cbody
%type <yt_Ctext>			Ctext
%type <yt_Ctext_elem>			Ctext_elem
%type <yt_Ctext_elem>			foreach_continuation
%type <yt_Ctexts>			init_option
%type <yt_foreach_after>		foreach_end_continuation
%type <yt_includedeclaration>		includedeclaration
%type <yt_includefiles>			includefiles_option
%type <yt_includefiles>			includefiles
%type <yt_rwdeclaration>		rwdeclaration
%type <yt_rewriteclauses>		rwclauses
%type <yt_rewriteclause>		rwclause
%type <yt_patternchains>		patternchains
%type <yt_patternchain>			patternchain
%type <yt_patternchainitem>		patternchainitem
%type <yt_patternchainitem>		patternchainitem_lineinfo
%type <yt_outmostpatterns>		outmostpatterns
%type <yt_outmostpattern>		outmostpattern
%type <yt_Cexpression>			provideds
%type <yt_pattern>			pattern
%type <yt_patterns>			patternsoption
%type <yt_patterns>			patterns
%type <yt_term>				term
%type <yt_terms>			termsoption
%type <yt_terms>			terms
%type <yt_withcases>			withcases
%type <yt_withcase>			withcase
%type <yt_unparsedeclaration>		unparsedeclaration
%type <yt_unparseclauses>		unparseclauses
%type <yt_unparseclause>		unparseclause
%type <yt_viewnames>			defuviewnames
%type <yt_viewnames>			defrviewnames
%type <yt_viewnames>			useviewnames
%type <yt_unparseitems>			unparseitems
%type <yt_unparseitem>			unparseitem
%type <yt_unpsubterm>			unpsubterm
%type <yt_unpattributes>		unpattributes
%type <yt_ID>				unpattribute
%type <yt_viewnameoption>		viewnameoption
%type <yt_viewnames>			uviewdeclaration
%type <yt_viewnames>			rviewdeclaration
%type <yt_storageclasses>		storageclassdeclaration
%type <yt_storageclasses>		defstorageclasses
%type <yt_languageoption>		languageoption
%type <yt_languagenames>		languageoptions
%type <yt_languagenames>		languagedeclaration
%type <yt_languagenames>		deflanguagenames


%type <yt_fndeclaration>		ac_function_definition
%type <yt_ac_class_qualifier_help_list> ac_qualifier
%type <yt_ac_direct_declarator>		ac_fn_declarator_id
%type <yt_ac_declaration_specifiers>	ac_declaration_specifiers
%type <yt_ac_declaration_specifiers>	ac_member_declaration_specifiers
%type <yt_ac_declaration_specifiers>	opt_virtual
%type <yt_ac_storage_class_specifier>	ac_storage_class_specifier
%type <yt_ac_storage_class_specifier>	ac_member_storage_class_specifier
%type <yt_ac_type_specifier>		ac_type_specifier
%type <yt_ac_type_qualifier>		ac_type_qualifier
%type <yt_ac_type_qualifier>		ac_opt_const
%type <yt_ac_declarator>		ac_declarator
%type <yt_ac_declarator>		ac_member_declarator
%type <yt_ac_declarator>		ac_pointer_declarator
%type <yt_ac_direct_declarator>		ac_direct_declarator
%type <yt_ac_direct_declarator>		ac_direct_member_declarator
%type <yt_ac_declarator>		ac_fn_declarator
%type <yt_ac_direct_declarator>		ac_direct_fn_declarator
%type <yt_ac_pointer>			ac_pointer
%type <yt_ac_type_qualifier_list>	ac_type_qualifier_list
%type <yt_ac_parameter_type_list>	ac_parameter_type_list
%type <yt_ac_parameter_list>		ac_parameter_list
%type <yt_ac_parameter_declaration>	ac_parameter_declaration
%type <yt_ac_abstract_declarator>	ac_abstract_declarator
%type <yt_ac_direct_abstract_declarator>  ac_direct_abstract_declarator
%type <yt_ac_constant_expression_option>  ac_constant_expression_option
%type <yt_ac_constant_expression_option>  ac_opt_member_init
%type <yt_ac_constant_expression_option>  ac_default_arg_init
%type <yt_ac_constant_expression>	ac_constant_expression
%type <yt_ac_constant_expression_list>	ac_constant_expression_list ac_constant_expression_init_list
%type <yt_ac_opt_base_init_list>	ac_opt_base_init_list
%type <yt_ac_base_init_list>		ac_base_init_list
%type <yt_ac_base_init>			ac_base_init
%type <yt_baseclass_decl>		baseclassdeclaration
%type <yt_baseclass_list>		baseclass_list
%type <yt_ID>				ac_identifier
%type <yt_Ctext>			ac_compound_statement

%start specification


%%

dollarvar:
    T_DOLLARVAR
	{ $$ = Int( $1 ); pf_setfileline( $$ ); }
;

id:
    T_ID
	{ $$ = Id( Str( $1 )); pf_setfileline( $$ ); }
;

integer:
    T_INT
	{ $$ = Int( $1 ); pf_setfileline( $$ ); }
;

/*
string:
    STRING
	{ $$ = String( $1 ); pf_setfileline( $$ ); }
;
 */

specification:
	{ /* initialize variables and scanner state */
	  pl_phylum = 0;
	  pl_withvariables = Nilwithexpressions();
	  do_NORMAL();
	}
    declarations
;

declarations:
    /* declaration */
|   declarations declaration
;

declaration:
    phylumdeclaration
	{ Thephylumdeclarations = mergephylumdeclarations( $1, Thephylumdeclarations ); }
|   rwdeclaration
	{ Therwdeclarations = Consrwdeclarations( $1, Therwdeclarations ); }
/*
|   functiondeclaration
	{ Thefndeclarations = Consfndeclarations( $1, Thefndeclarations ); }
 */
|   ac_function_definition
	{ Thefndeclarations = Consfndeclarations( $1, Thefndeclarations ); }
|   includedeclaration
	{ }
|   unparsedeclaration
	{ Theunparsedeclarations = Consunparsedeclarations( $1, Theunparsedeclarations ); }
|   uviewdeclaration
	{ }
|   rviewdeclaration
	{ }
|   storageclassdeclaration
	{ }
|   languagedeclaration
	{ Thelanguages = merge_languagenames( $1, Thelanguages ); }
|   baseclassdeclaration
	{ Thebaseclasses = Consbaseclass_declarations( $1, Thebaseclasses ); }
;

baseclassdeclaration:
	T_BASECLASS id ':' baseclass_list ';'
	{ $$=BaseClassDecl( $2, $4 ); }
;

baseclass_list:
	id
	{ $$=Consbaseclass_list($1,Nilbaseclass_list()); }
|	baseclass_list ',' id
	{ $$=Consbaseclass_list($3,$1); }
;

phylumdeclaration:
    id storageoption ':'
	{ pl_phylum = $1; }
		  productionblock Ccode_option ';'
	{ $$ = PhylumDeclaration( $1, $2, $5, $6 ); v_extendoccur( pl_phylum, ITUserPhylum( $$ ) ); }
;

storageoption:
    /* empty */
	{ $$ = NoStorageOption(); }
|   '{' id '}'
	{ $$ = PositiveStorageOption( $2 ); v_extendoccur( $2, ITStorageClass() ); }
|   '{' '!' id '}'
	{ $$ = NegativeStorageOption( $3 ); v_extendoccur( $3, ITStorageClass() ); }
|   '{' error
	{ $$ = NoStorageOption(); }
|   '{' '!' error
	{ $$ = NoStorageOption(); }
;

productionblock:
    /* empty */
	{ $$ = Emptyproductionblock(); }
|   T_LIST id
	{ $$ = ListAlternatives( makeListAlternatives( pl_phylum, $2 ), $2 );
	  Theargsnumbers = insert_in_argsnumbers(0, Theargsnumbers);
	  Theargsnumbers = insert_in_argsnumbers(2, Theargsnumbers);
	}
|   alternatives
	{ $$ = NonlistAlternatives( $1 ); }
;

alternatives:
    alternative
	{ $$ = Consalternatives( $1, Nilalternatives() ); }
|   alternatives '|' alternative
	{ yyerrok; $$ = Consalternatives( $3, $1 ); }
|   error
	{ $$ = Nilalternatives(); }
|   alternatives '|' error
	{ $$ = $1; }
|   alternatives error alternative
	{ yyerrok; $$=Consalternatives( $3, $1 ); }
;

alternative:
    id '(' { pg_no_of_arguments = 0; } arguments { Theargsnumbers = insert_in_argsnumbers(pg_no_of_arguments, Theargsnumbers); } ')'
	{ $$ = Alternative( $1, $4 );
	  v_extendoccur( $1, ITUserOperator( $$, pl_phylum ) ); }
|   id '(' error
	{ $$ = Alternative( $1, Nilarguments()); }
;

arguments:
    /* empty */
	{ $$ = Nilarguments(); }
|   arguments id
	{ $$ = Consarguments( $2, $1 ); pg_no_of_arguments++; }
|   arguments T_ID ':' id
	{ $4->named_subphylum = $2;
	  $$ = Consarguments( $4, $1 ); pg_no_of_arguments++; }
;

Ccode_option:
    /* empty */
	{ $$ = CcodeOption( Nilattributes(), NilCtexts() ); }
|   '{' attributes_option init_option '}'
	{ $$ = CcodeOption( $2, $3 ); }
|   '{' error
	{ $$ = CcodeOption( Nilattributes(), NilCtexts() ); }
;

attributes_option:
    /* empty */
	{ $$ = Nilattributes(); }
|   attributes_option attribute
	{ $$ = Consattributes( $2, $1 ); }
;

attribute:
    id id attribute_init_option ';'
	{ $$ = Attribute( $1, $2, $3 ); }
;

attribute_init_option:
    /* empty */
	{ $$ = Noattribute_initialisation(); }
|   '='
				    { do_CEXPR(); }
	 Cexpression
				    { do_NORMAL();
	  $$ = Yesattribute_initialisation( $3 ); }
;

/*
 * we use the fact that the empty list is the first 'element' that is
 * parsed into the list
 */
Cexpression:
    /* empty */
	{ $$ = NilCexpression(); pf_setfileline( $$ ); }
|   Cexpression Cexpression_elem
	{ $$ = ConsCexpression( $2, $1 ); $$->file = $1->file; $$->line = $1->line; }
;

Cexpression_elem:
    T_CEXPRESSION
	{ $$ = CExpressionPart( $1 ); }
|   dollarvar
	{ $$ = CExpressionDollarvar( $1 ); }
|   '\n'
	{ $$ = CExpressionNl(); }
|   '"' CexpressionDQ '"'
	{ $$ = CExpressionDQ( $2 ); }
|   '\'' CexpressionSQ '\''
	{ $$ = CExpressionSQ( $2 ); }
|   '(' Cexpression_inner ')'
	{ $$ = CExpressionPack( $2 ); }
|   '[' Cexpression_inner ']'
	{ $$ = CExpressionArray( $2 ); }
|   '"' error
	{ $$ = CExpressionPart(mkcasestring("")); }
|   '\'' error
	{ $$ = CExpressionPart(mkcasestring("")); }
|   '(' error
	{ $$ = CExpressionPart(mkcasestring("")); }
|   '[' error
	{ $$ = CExpressionArray( ConsCexpression( CExpressionPart(mkcasestring("")), NilCexpression())); }
;

Cexpression_inner:
    /* empty */
	{ $$ = NilCexpression(); pf_setfileline( $$ ); }
|   Cexpression_inner Cexpression_elem_inner
	{ $$ = ConsCexpression( $2, $1 ); $$->file = $1->file; $$->line = $1->line; }
;

Cexpression_elem_inner:
    Cexpression_elem
	{ $$ = $1; }
|   ','
	{ $$ = CExpressionPart( mkcasestring(",") ); }
;

quote_or_error:
    '\"'
|   error
;

CexpressionDQ:
    /* empty */
	{ $$ = NilCexpressionDQ(); }
|   CexpressionDQ CexpressionDQ_elem
	{ $$ = ConsCexpressionDQ( $2, $1 ); }
;

CexpressionDQ_elem:
    T_CEXPRESSION
	{ $$ = CExpressionDQPart( $1 ); }
|   '\n'
	{ $$ = CExpressionDQNl(); }
;

CexpressionSQ:
    /* empty */
	{ $$ = NilCexpressionSQ(); }
|   CexpressionSQ CexpressionSQ_elem
	{ $$ = ConsCexpressionSQ( $2, $1 ); }
;

CexpressionSQ_elem:
    T_CEXPRESSION
	{ $$ = CExpressionSQPart( $1 ); }
|   '\n'
	{ $$ = CExpressionSQNl(); }
;

idCexpressions:
    idCexpression
	{ $$ = ConsidCexpressions( $1, NilidCexpressions() ); }
|   idCexpressions ',' idCexpression
	{ $$ = ConsidCexpressions( $3, $1 ); }
;

idCexpression:
    id
			    { do_CEXPR(); }
    Cexpression
			    { do_NORMAL(); }
	{ $$ = IdCexpression( $1, $3 ); }
;

withCexpression:
    Cexpression
	{ $$ = WECexpression( $1 ); pf_setstacktopfileline( $$ ); }
;

withCexpressions:
    withCexpression
	{ $$ = Conswithexpressions( $1, Nilwithexpressions() ); }
|   withCexpressions ',' { pf_pushfileline(); } withCexpression
	{ $$ = Conswithexpressions( $4, $1 );
	  pf_popfileline();  }
;

/*
 * use global variable to pass/save the $fnargument that can be picked up
 * and inserted in the withcases in the MainCbody continuation so that
 * it can return a complete CtextWithexpression
 */
MainCbody:
    '{'
				    { do_MainC(); pf_pushfileline(); pf_pushwithvariable(); pf_resetwithvariable(); }
	MainCBodycontinuation
				    { do_NORMAL(); }
	  '}'
	{ yyerrok; $$ = $3; pf_setstacktopfileline( $$ ); pf_popfileline(); pf_popwithvariable(); }
;

MainCbodyinC:
    '{'
				    { do_MainC(); pf_pushfileline(); pf_pushwithvariable(); pf_resetwithvariable(); }
	MainCBodycontinuation
				    { do_C(); }
	  '}'
	{ yyerrok; $$ = $3; pf_setstacktopfileline( $$ ); pf_popfileline(); pf_popwithvariable(); }
;

MainCBodycontinuation:
    Ctext
	{ $$ = $1; pf_setstacktopfileline( $$ ); }
|   withcases
	{ Ctext_elem tmp = CTextWithexpression( pf_topwithvariable(), $1, NotInForeachContext() );
	  pf_setstacktopfileline( tmp );
	  $$ = ConsCtext( tmp, NilCtext() );
	  pf_setstacktopfileline( $$ );
	  if (! non_default_outmostpattern ) v_report(NonFatal( NoFileLine(), Problem1S( "can not infer type from 'default' pattern(s)" )));
	  non_default_outmostpattern = 0; }
|   error
    { $$ = NilCtext(); }
;

Cbody:
    '{'
				    { do_C(); pf_pushfileline(); pf_push_no_operators(); }
	Ctext
				    { do_NORMAL(); }
	 '}'
	{ $$ = $3; pf_setstacktopfileline( $$ ); pf_popfileline(); pf_pop_no_operators(); }
;

Ctext:
    /* empty */
	{ $$ = NilCtext(); pf_setfileline( $$ ); }
|   Ctext
	{ pf_pushfileline(); }
    Ctext_elem
	{ $$ = ConsCtext( $3, $1 ); pf_setstacktopfileline( $3 ); pf_popfileline(); $$->file = $1->file; $$->line = $1->line; }
;

Ctext_elem:
    T_CLINE
	{ $$ = CTextLine( $1 ); }
|   dollarvar
	{ $$ = CTextDollarVar( $1 ); }
|   '\n'
	{ $$ = CTextNl( mkinteger(1) ); }
|   T_CNEWLINES
	{ $$ = CTextNl( $1 ); }
|   '"'
				    { do_CEXPRDQ(); }
	 CexpressionDQ '"'
				    { do_C();
	  $$ = CTextCexpressionDQ( $3 ); }
|   '\''
				    { do_CEXPRSQ(); }
	 CexpressionSQ '\''
				    { do_C();
	  $$ = CTextCexpressionSQ( $3 ); }
/* |	'('  Cexpression   ')' */
|   Cbody
				    { do_C();
	  $$ = CTextCbody( $1 ); }
|   T_FOREACH
				    { do_NORMAL(); }
	foreach_continuation
				    { do_C();
	  $$ = $3; }
|   T_WITH
				    { do_NORMAL(); }
	    '('
				    { do_CEXPR(); pf_pushfileline(); }
			withCexpressions
				    { do_NORMAL(); pf_popfileline(); }
				')' '{' withcases '}'
				    { do_C();
	  $$ = CTextWithexpression( $5, $9, NotInForeachContext() );
	  if (! non_default_outmostpattern ) v_report(NonFatal( NoFileLine(), Problem1S( "can not infer type from 'default' pattern(s)" )));
	  non_default_outmostpattern = 0; }
;

foreach_continuation:
	'(' patternchain ';' { non_default_outmostpattern = 0; }
	    idCexpressions ')' MainCbodyinC /* or something similar */
	    {
	      pf_pushidCexpressions($5);
	    }
	foreach_end_continuation
	{ patternchains pc_list = Conspatternchains($2, Nilpatternchains());
	  patternchains rewritten = pc_list->rewrite(base_rview);
	  withexpressions wexpr = pf_gen_foreachwith_vars( $5 );
	  Ctext_elem ctwe =
		    CTextWithexpression(
			wexpr,
			Conswithcases(
			    Withcase(
				syn_patternchains_fileline(
				    rewritten, pg_filename, pg_lineno ),
				$7 ),
			    Nilwithcases()
			),
			InForeachContext($2) );
	  Ctext ctxts0 = NilCtext();
	  Ctext ctxts1 = ConsCtext( ctwe, ctxts0 );
	  pf_setstacktopfileline( ctwe );
	  pf_setstacktopfileline( ctxts0 );
	  pf_setstacktopfileline( ctxts1 );
	  check_no_patternchaingroup_in_patternchain(
		  $2->file, $2->line, $2, "'foreach variable/pattern'" );
	  $$ = CTextForeachexpression( $2, $5, wexpr, ctxts1, $9);
	  pf_popidCexpressions();
	}
;

foreach_end_continuation:
    /* empty */
	{ $$ = NoForeachAfter(); }
|   T_FOREACH_AFTER
						{ do_NORMAL(); pf_pushfileline(); }
    '(' patternchain  { non_default_outmostpattern = 0; }
    ')' MainCbodyinC
	{ patternchains pc_list = Conspatternchains($4, Nilpatternchains());
	  patternchains rewritten = pc_list->rewrite(base_rview);
	  withexpressions wexpr = pf_gen_foreachwith_listvars( pf_topidCexpressions() );
	  Ctext_elem ctwe =
	      CTextWithexpression(
		      wexpr,
		      Conswithcases(
			  Withcase(
			      syn_patternchains_fileline(
				  rewritten, pg_filename, pg_lineno ),
			      $7 ),
			  Nilwithcases()
				   ),
		      InForeachContext($4) );
	  Ctext ctxts0 = NilCtext();
	  Ctext ctxts1 = ConsCtext( ctwe, ctxts0 );
	  pf_setstacktopfileline( ctwe );
	  pf_setstacktopfileline( ctxts0 );
	  pf_setstacktopfileline( ctxts1 );
	  check_no_patternchaingroup_or_pattern_in_patternchain(
		$4->file, $4->line, $4, "'foreach variable/pattern'" );
	  $$ = ForeachAfter( $4, pf_topidCexpressions(), wexpr, ctxts1 );
	  pf_setstacktopfileline( $$ );
	  pf_popfileline();
	}
;

init_option:
    /* empty */
	{ $$ = NilCtexts(); }
|   Cbody
	{ $$ = ConsCtexts( $1, NilCtexts() ); }
;

includedeclaration:
    T_INCLUDESTART includefiles_option { pf_pushfileline(); } T_ENDOFINCLUDESTART T_INCLUDEEND
	{{includedeclaration pl_includedeclaration = IncludeDeclaration( $5 );
	  set_includefiles( $2, pl_includedeclaration );
	  pf_setstacktopfileline( pl_includedeclaration );
	  pf_popfileline();
	}}
|   T_INCLUDESTART error T_INCLUDEEND
	 { $$ =IncludeDeclaration(mkcasestring("")); }
;

includefiles_option:
    /* empty */
	{{ includefile pl_includefile = IncludeFile( mkcasestring("CODE") );
	  $$ = Consincludefiles( pl_includefile, Nilincludefiles() );
	}}
|   includefiles
	{ $$ = $1; }
;

includefiles:
    T_ID
	{{ includefile pl_includefile = IncludeFile( $1 );
	  if ((pl_includefile->inc_type == include_file) || (pl_includefile->inc_type == include_header)) {
		$$ = Consincludefiles( pl_includefile, Nilincludefiles() );
	  } else {
	    v_report(NonFatal( NoFileLine(), ProblemSC( "unknown include redirection keyword:", $1 )));
		$$ = Nilincludefiles();
	  }
	}}
|   includefiles T_ID
	{{ includefile pl_includefile = IncludeFile( $2 );
	  if ((pl_includefile->inc_type == include_file) || (pl_includefile->inc_type == include_header)) {
		$$ = Consincludefiles( pl_includefile, $1 );
	  } else {
	    v_report(NonFatal( NoFileLine(), ProblemSC( "unknown include redirection keyword:", $2 )));
		$$ = $1;
	  }
	}}
;

rwdeclaration:
    outmostpatterns T_ARROW
	{ if (! non_default_outmostpattern ) v_report(NonFatal( NoFileLine(), Problem1S( "can not infer type from 'default' pattern(s)" )));
	  non_default_outmostpattern = 0; }
		rwclauses semi_or_error /*';'*/
	{ yyerrok; $$ = RwDeclaration( $1, $4 ); }
;

rwclauses:
    rwclause
	{ $$ = Consrewriteclauses( $1, Nilrewriteclauses() ); }
|   rwclauses rwclause
	{ $$ = Consrewriteclauses( $2, $1 ); }
;

rwclause:
    '<' useviewnames  ':' term  '>'
    /* if no view was defined, we replace the implicit base_rview
     * (Nilviewnames) by an explicit one (ie. base_rview)
     */
	{ if ($2->eq(Nilviewnames())) {
	      $$ = RewriteClause( Consviewnames( Id( Str( mkcasestring( "base_rview" ))), $2 ), $4 );
	  } else {
	      $$ = RewriteClause( $2, $4 );
	} }
;

semi_or_error:
    ';'
|   error
;

patternchains:
    patternchain
	{ $$ = Conspatternchains( $1, Nilpatternchains() ); }
|   patternchains ',' patternchain
	{ $$ = Conspatternchains( $3, $1 ); }
;

patternchain:
    patternchainitem_lineinfo
	{ $$ = Conspatternchain( $1, Nilpatternchain() ); }
|   patternchain '&' patternchainitem_lineinfo
	{ $$ = Conspatternchain( $3, $1 ); }
;

patternchainitem_lineinfo:
	{ pf_pushfileline(); }
    patternchainitem
	{ $$ = $2; pf_setstacktopfileline($$); pf_popfileline(); }
;

patternchainitem:
    outmostpattern
	{ $$ = PatternchainitemOutmost( $1 ); }
|   '(' patternchains ')'
	{ $$ = PatternchainitemGroup( $2 ); }
|   '$' id  /* this rule is to be used only in foreach statements */
	{ $$ = PatternchainitemDollarid( $2 ); pf_setwithvariable( $2 );  }
;

outmostpatterns:
    outmostpattern
	{ $$ = Consoutmostpatterns( $1, Niloutmostpatterns() ); }
|   outmostpatterns ',' outmostpattern
	{ yyerrok; $$ = Consoutmostpatterns( $3, $1 ); }
|   error
	{ $$ = Niloutmostpatterns(); }
|   outmostpatterns error
	{ $$=$1; }
|   outmostpatterns ',' error
	{ $$=$1; }
|   outmostpatterns error outmostpattern
	{ yyerrok; $$ = Consoutmostpatterns( $3, $1 ); }
;

outmostpattern:
    id provideds		    /* operator (wildcard for subterms) */
	{ $$ = OPOperatorWildcard( $1, $2 ); non_default_outmostpattern = 1;
	$$->file = pg_filename; $$->line = pg_lineno; }
|   id '(' patternsoption ')' provideds	/* operator + subterms */
	{ $$ = OPOperator( $1, $3, $5 ); non_default_outmostpattern = 1;
	$$->file = pg_filename; $$->line = pg_lineno; }
|   id '=' outmostpattern	    /* non-leaf variable */
	{ $$ = OPNonLeafVariable( $1, $3 ); non_default_outmostpattern = 1;
	$$->file = pg_filename; $$->line = pg_lineno; }
|   '*' provideds		    /* wildcard */
	{ $$ = OPWildcard( $2 );
	$$->file = pg_filename; $$->line = pg_lineno; }
|   T_DEFAULT provideds		    /* wildcard */
	{ $$ = OPDefault( $2 );
	$$->file = pg_filename; $$->line = pg_lineno;}
;

provideds:
    /* empty */
	{ $$ = NilCexpression(); }
|   T_PROVIDED '(' { do_CEXPR(); } Cexpression { do_NORMAL(); } ')'
	{ $$ = $4; }
;

pattern:
    id				    /* variable */
	{ $$ = PVariable( $1 ); }
|   id '(' patternsoption ')'	    /* operator + subterms */
	{ $$ = POperator( $1, $3 ); }
|   '*'				    /* wildcard */
	{ $$ = PWildcard(); }
|   T_DEFAULT			    /* wildcard */
	{ $$ = PWildcard(); }
|   id '=' pattern		    /* non-leaf variable */
	{ $$ = PNonLeafVariable( $1, $3 ); }
|   '"'
				    { do_CEXPRDQ(); }
	CexpressionDQ '"'	    /* string literal */
				    { do_NORMAL();
	  $$ = PStringLiteral( $3 ); }
|   integer			    /* int literal */
	{ $$ = PIntLiteral( $1 ); }
;

patternsoption:
    /* empty */
	{ $$ = Nilpatterns(); }
|   patterns
	{ $$ = $1; }
;

patterns:
    pattern
	{ $$ = Conspatterns( $1, Nilpatterns() ); }
|   patterns ',' pattern
	{ yyerrok; $$ = Conspatterns( $3, $1 ); }
|   error
	{ $$ = Nilpatterns(); }
|   patterns error
	{ $$ = $1; }
|   patterns ',' error
	{ $$ = $1; }
|   patterns error pattern
	{ yyerrok; $$ = Conspatterns( $3, $1 ); }
;

term:
    id				/* variable */
	{ $$ = TVariable( $1 );
		$$->file = pg_filename; $$->line = pg_lineno; }
|   id '(' termsoption ')'	/* operator (or function) + subterms (or arguments) */
	{ $$ = TOperator( $1, $3 );
	  $$->file = pg_filename; $$->line = pg_lineno;
	}
|   term T_ARROW id '(' termsoption ')' /* method invocation */
	{ $$ = TMethod( $1, $3, $5 );
	  $$->file = pg_filename; $$->line = pg_lineno; }
|   term '.' id '(' termsoption ')' /* method invocation */
	{ $$ = TMethodDot( $1, $3, $5 );
	  $$->file = pg_filename; $$->line = pg_lineno; }
|   term T_ARROW id /* member variable */
	{ $$ = TMemberVar( $1, $3 );
	  $$->file = pg_filename; $$->line = pg_lineno; }
|   term '.' id /* member variable */
	{ $$ = TMemberVarDot( $1, $3 );
	  $$->file = pg_filename; $$->line = pg_lineno; }
|   '\''
				    { do_CEXPRSQ(); }
	CexpressionSQ '\''	/* C text */
				    { do_NORMAL();
	  $$ = TCTerm( $3 );
	  $$->file = pg_filename; $$->line = pg_lineno; }
|   '"'
				    { do_CEXPRDQ(); }
	CexpressionDQ '"'	/* string literal */
				    { do_NORMAL();
	  $$ = TStringLiteral( $3 );
	  $$->file = pg_filename; $$->line = pg_lineno; }
|   integer			/* int literal */
	{ $$ = TIntLiteral( $1 );
	$$->file = pg_filename; $$->line = pg_lineno; }
;

termsoption:
    /* empty */
	{ $$ = Nilterms(); }
|   terms
	{ $$ = $1; }
;

terms:
    term
	{ $$ = Consterms( $1, Nilterms() ); }
|   terms ',' term
	{ yyerrok; $$ = Consterms( $3, $1 ); }
|   error
	{ $$ = Nilterms(); }
|   terms error
	{ $$ = $1; }
|   terms ',' error
	{ $$ = $1; }
|   terms error term
	{ yyerrok; $$ = Consterms( $3, $1 ); }
;

withcases:
    withcase
	{ $$ = Conswithcases( $1, Nilwithcases() ); }
|   withcases withcase
	{ $$ = Conswithcases( $2, $1 ); }
;

withcase:
    patternchains ':' Cbody
	{ $$ = Withcase( syn_patternchains_fileline($1->rewrite(base_rview), pg_filename, pg_lineno ), $3 ); }
;

unparsedeclaration:
    outmostpatterns T_ARROW
	{ if (! non_default_outmostpattern ) v_report(NonFatal( NoFileLine(), Problem1S( "can not infer type from 'default' pattern(s)" )));
	  non_default_outmostpattern = 0; }
		  unparseclauses ';'
	{ $$ = UnparseDeclaration( $1, $4 ); }
|   outmostpatterns T_ARROW error ';'
	{ $$ = UnparseDeclaration( $1, Nilunparseclauses()); }
;

unparseclauses:
    unparseclause
	{ $$ = Consunparseclauses( $1, Nilunparseclauses() ); }
|   unparseclauses unparseclause
	{ $$ = Consunparseclauses( $2, $1 ); }
;

unparseclause:
    '[' useviewnames  ':' unparseitems  ']'
    /* if no view was defined, we replace the implicit base_uview
     * (Nilviewnames) by an explicit one (ie. base_uview)
     */
	{ if ($2->eq( Nilviewnames())) {
	      $$ = UnparseClause( Consviewnames( Id( Str( mkcasestring( "base_uview" ))), $2 ), $4 );
	  } else {
	      $$ = UnparseClause( $2, $4 );
	} inc_text_nr(); yyerrok;
	}
|   '[' useviewnames ':' error
	{ $$ = UnparseClause( $2, Nilunparseitems()); }
|   '[' error ':' unparseitems ']'
	{ yyerrok; $$ = UnparseClause( Nilviewnames(), $4); }
|   '[' error ':' error
	{ $$ = UnparseClause( Nilviewnames(), Nilunparseitems()); }
|   '[' error
	{ $$ = UnparseClause( Nilviewnames(), Nilunparseitems()); }
;

useviewnames:
    /* EMPTY */
	{ $$ = Nilviewnames(); }
|   useviewnames id
	{ $$ = Consviewnames( $2, $1 ); }
;

unparseitems:
    /* EMPTY */
	{ $$ = Nilunparseitems(); }
|   unparseitems unparseitem
	{ $$ = Consunparseitems( $2, $1 ); }
;

unparseitem:
    languageoption '"'
				    { do_CEXPRDQ(); }
	CexpressionDQ quote_or_error /*'"'*/	    /* string literal */
				    { do_NORMAL(); }
    viewnameoption
	{ $$ = UnpStr( $1, $4, $7 );
	  $$->text_nr=get_text_nr();
	  if(!$7->eq(NoViewname()))
	    inc_text_nr();
	}
|   languageoption unpsubterm viewnameoption
	{ $$ = UnpSubexpr( $1, $2, $3 ); inc_text_nr(); }
|   languageoption Cbody
	{ $$ = UnpCtext( $1, $2 ); inc_text_nr(); }
|   languageoption T_UNPBLOCKSTART unparseitems T_UNPBLOCKEND
	{ $$ = UnpBody( $1, $3 ); inc_text_nr(); }
|   T_PERCENTUVIEWVAR id id
	{ do_CEXPR(); } Cexpression { do_NORMAL(); }
	';'
	{ $$ = UViewVarDecl( $2, $3, $5 ); }
;

unpsubterm:
    id
	{ $$ = UnpSubTerm( $1 ); }
|   dollarvar
	{ $$ = UnpDollarvarTerm( $1 ); }
|   id unpattributes
	{ $$ = UnpSubAttr( $1, $2 ); }
|   dollarvar unpattributes
	{ $$ = UnpDollarvarAttr( $1, $2 ); }
/*|   id '(' id ')'
	{ $$ = UnpSubTerm (  <-- MPi too lazy to implement now */
/* MPi This is not needed anymore, but keep it in as it doesn't hurt */
|   '(' id ')' id
	{ $$ = UnpCastedVariable( $2, $4 ); }
;

unpattributes:
    unpattribute
	{ $$ = Consunpattributes( $1, Nilunpattributes() ); }
|   unpattributes unpattribute
	{ $$ = Consunpattributes( $2, $1 ); }
;

unpattribute:
    T_ARROW id
	{ $$ = $2; }
|   T_ARROW error
	{ $$ = Id(Str(mkcasestring("error"))); }
;

viewnameoption:
    /*empty*/
	{ $$ = NoViewname(); }
|   ':' id
	{ $$ = YesViewname( $2 ); }
|   ':' error
	{ $$ = NoViewname(); }
;

uviewdeclaration:
    T_PERCENTUVIEW defuviewnames ';'
	{ yyerrok; $$ = $2; pg_uviewshavebeendefined = true; }
|   T_PERCENTUVIEW error ';'
	{ yyerrok; $$ = Nilviewnames(); }
;

defuviewnames:
    id
	{ $$ = Consviewnames( $1, Nilviewnames());
	  v_add_to_uviewnames( $1 );
	  v_extendoccur( $1, ITUserUView() ); }
|   '(' id ')'
	{ $$ = Consviewnames( $2, Nilviewnames());
	  v_add_to_uviewnames_ext( $2 );
	  v_extendoccur( $2, ITUserUView() ); }
|   defuviewnames id
	{ $$ = Consviewnames( $2, $1 );
	  v_add_to_uviewnames( $2 );
	  v_extendoccur( $2, ITUserUView() ); }
|   defuviewnames '(' id ')'
	{ $$ = Consviewnames( $3, $1 );
	  v_add_to_uviewnames_ext( $3 );
	  v_extendoccur( $3, ITUserUView() ); }
|   defuviewnames ',' id
	{ $$ = Consviewnames( $3, $1 );
	  v_add_to_uviewnames( $3 );
	  v_extendoccur( $3, ITUserUView() ); }
|   defuviewnames ',' '(' id ')'
	{ $$ = Consviewnames( $4, $1 );
	  v_add_to_uviewnames_ext( $4 );
	  v_extendoccur( $4, ITUserUView() ); }
|   defuviewnames error
	{ $$ = $1; }
|   defuviewnames ',' error
	{ $$ = $1; }
;

rviewdeclaration:
    T_PERCENTRVIEW defrviewnames ';'
	{ yyerrok; $$ = $2; pg_rviewshavebeendefined = true; }
|   T_PERCENTRVIEW error ';'
	{ yyerrok; $$ = Nilviewnames(); }
;

defrviewnames:
    id
	{ $$ = Consviewnames( $1, Nilviewnames());
	  v_add_to_rviewnames( $1 );
	  v_extendoccur( $1, ITUserRView() ); }
|   '(' id ')'
	{ $$ = Consviewnames( $2, Nilviewnames());
	  v_add_to_rviewnames_ext( $2 );
	  v_extendoccur( $2, ITUserRView() ); }
|   defrviewnames id
	{ $$ = Consviewnames( $2, $1 );
	  v_add_to_rviewnames( $2 );
	  v_extendoccur( $2, ITUserRView() ); }
|   defrviewnames '(' id ')'
	{ $$ = Consviewnames( $3, $1 );
	  v_add_to_rviewnames_ext( $3 );
	  v_extendoccur( $3, ITUserRView() ); }
|   defrviewnames ',' id
	{ $$ = Consviewnames( $3, $1 );
	  v_add_to_rviewnames( $3 );
	  v_extendoccur( $3, ITUserRView() ); }
|   defrviewnames ',' '(' id ')'
	{ $$ = Consviewnames( $4, $1 );
	  v_add_to_rviewnames_ext( $4 );
	  v_extendoccur( $4, ITUserRView() ); }
|   defrviewnames error
	{ $$ = $1; }
|   defrviewnames ',' error
	{ $$ = $1; }
;

storageclassdeclaration:
    T_PERCENTSTORAGECLASS defstorageclasses ';'
	{ yyerrok; $$ = $2; pg_storageclasseshavebeendefined = true; }
|   T_PERCENTSTORAGECLASS error ';'
	{ yyerrok; $$ = Nilstorageclasses(); }
;

defstorageclasses:
    id
	{ $$ = Consstorageclasses( $1, Nilstorageclasses());
	  v_add_to_storageclasses( $1, f_emptyId() );
	  v_extendoccur( $1, ITStorageClass() ); }
|   defstorageclasses id
	{ $$ = Consstorageclasses( $2, $1 );
	  v_add_to_storageclasses( $2, f_emptyId() );
	  v_extendoccur( $2, ITStorageClass() ); }
|   defstorageclasses ',' id
	{ $$ = Consstorageclasses( $3, $1 );
	  v_add_to_storageclasses( $3, f_emptyId() );
	  v_extendoccur( $3, ITStorageClass() ); }
|   defstorageclasses error
	{ $$ = $1; }
|   defstorageclasses ',' error
	{ $$ = $1; }
;

ac_function_definition:
	ac_declaration_specifiers ac_fn_declarator ac_compound_statement
	{
	    fnclass tmp_type = f_fnclass_info($1, pg_filename, $2 );
	    ID tmp_id = f_ID_of_fn_declarator($2, tmp_type);
	    $$ = FnAcDeclaration( $1, $2, Nilac_declaration_list(), AcNoBaseInit(), $3, tmp_id, tmp_type );
	    pf_resetwithvariable();
	    v_defoccur( tmp_id, ITUserFunction( tmp_type ) );
	    $$->file = pg_filename; $$->last_line = pg_lineno;
	}
|	/* Conversion operators */
	id T_COLONCOLON T_OPERATOR id '(' ')' ac_opt_const ac_compound_statement
	{
	    fnclass tmp_type=ConvOperatorFn();
	    ac_declarator decl= AcDeclarator(Nopointer(),AcNoRef(),
		    AcQualifiedDeclProto(
			    Nilac_class_qualifier_list(),
			    AcConvOperatorDecl($1, $4),
			    AcParList(Nilac_parameter_list()),
			    $7 )
		    );
	    ID tmp_id = $4;
	    $$ = FnAcDeclaration(
		    Nilac_declaration_specifiers(),
		    decl,
		    Nilac_declaration_list(), AcNoBaseInit(), $8, tmp_id, tmp_type
	    );
	    pf_resetwithvariable();
	    v_defoccur( tmp_id, ITUserFunction( tmp_type ) );
	    $$->file = pg_filename; $$->last_line = pg_lineno;
	}
|	T_CONSTRUCTOR id '(' ac_parameter_type_list ')' ac_opt_base_init_list ac_compound_statement
	{
		fnclass tmp_type=ConstructorFn();
		ac_declarator decl= AcDeclarator(Nopointer(),AcNoRef(),
			AcQualifiedDeclProto(
				Nilac_class_qualifier_list(),
				AcDirectDeclId($2),
				$4,
				AcNoQualifier() )
			);
		ID tmp_id = f_ID_of_fn_declarator(decl, tmp_type);
		$$ = FnAcDeclaration(
			Nilac_declaration_specifiers(),
			decl,
			Nilac_declaration_list(), $6, $7, tmp_id, tmp_type
		);
		pf_resetwithvariable();
		v_defoccur( tmp_id, ITUserFunction( tmp_type ) );
		$$->file = pg_filename; $$->last_line = pg_lineno;
	}
|	T_DESTRUCTOR opt_virtual id '(' ')' ac_compound_statement
	{
		fnclass tmp_type=DestructorFn();
		ac_declarator decl= AcDeclarator(Nopointer(),AcNoRef(),
			AcQualifiedDeclProto(
				Nilac_class_qualifier_list(),
				AcDirectDeclId($3),
				AcParList( Nilac_parameter_list() ),
				AcNoQualifier() )
			);
		ID tmp_id = f_ID_of_fn_declarator(decl, tmp_type);
		$$ = FnAcDeclaration(
			$2,
			decl,
			Nilac_declaration_list(), AcNoBaseInit(), $6, tmp_id, tmp_type
		);
		pf_resetwithvariable();
		v_defoccur( tmp_id, ITUserFunction( tmp_type ) );
		$$->file = pg_filename; $$->last_line = pg_lineno;
	}
|	T_MEMBER ac_member_declaration_specifiers ac_member_declarator ac_opt_member_init ';'
	{
		fnclass tmp_type = f_member_class_info($2, pg_filename);
		$$=AcMemberDeclaration($2,$3,$4,tmp_type);
		$$->is_attr=false;
		$$->file = pg_filename; $$->last_line = pg_lineno;
	}
|	T_ATTR ac_member_declaration_specifiers ac_member_declarator ac_opt_member_init ';'
	{
		fnclass tmp_type = f_member_class_info($2, pg_filename);
		$$=AcMemberDeclaration($2,$3,$4,tmp_type);
		$$->is_attr=true;
		$$->file = pg_filename; $$->last_line = pg_lineno;
	}
;

ac_opt_base_init_list:
	/* noting */
	{ $$ = AcNoBaseInit(); }
|	':' ac_base_init_list
	{ $$ = AcYesBaseInit( $2 ); }
;

ac_base_init_list:
	ac_base_init
	{ $$ = Consac_base_init_list( $1, Nilac_base_init_list() ); }
|	ac_base_init_list ',' ac_base_init
	{ $$ = Consac_base_init_list( $3, $1 ); }
;

ac_base_init:
	id '(' ac_constant_expression_init_list ')'
	{ $$= AcBaseInit( $1, $3 ); }
;

ac_default_arg_init:
	/* EMPTY */
	{ $$=Noac_constant_expression(); }
|
	'=' ac_constant_expression
	{ $$=Yesac_constant_expression($2); }
;

ac_opt_member_init:
	/* EMPTY */
	{ $$=Noac_constant_expression(); }
|
	'=' ac_constant_expression
	{ $$=Yesac_constant_expression($2); }
|
	'(' ac_constant_expression ')'
	{ $$=Yesac_constant_expression($2); }
;

/* simplified: we now _need_ exactely one type,
 * no more (eg. 'long long' not supported),
 * no less (implicit 'int' not supported)
 */
/* now we allow to have no type specifier for constructors and destructors */

ac_declaration_specifiers:
    ac_type_specifier						/* fred */
    { $$ = Consac_declaration_specifiers(
		AcDeclSpecTypeSpec( $1 ),
		Nilac_declaration_specifiers() ); }
|   ac_storage_class_specifier ac_type_specifier		/* static fred */
    { $$ = Consac_declaration_specifiers(
	     AcDeclSpecTypeSpec( $2 ),
	     Consac_declaration_specifiers(
		AcDeclSpecStorageSpec( $1 ),
		Nilac_declaration_specifiers() )); }
|   ac_type_qualifier ac_type_specifier				/* const fred */
    { $$ = Consac_declaration_specifiers(
	     AcDeclSpecTypeSpec( $2 ),
	     Consac_declaration_specifiers(
	       AcDeclSpecTypeQual( $1 ),
	       Nilac_declaration_specifiers() )); }
|   ac_storage_class_specifier ac_type_qualifier ac_type_specifier
    { $$ = Consac_declaration_specifiers(
	     AcDeclSpecTypeSpec( $3 ),
	     Consac_declaration_specifiers(
	       AcDeclSpecTypeQual( $2 ),
	       Consac_declaration_specifiers(
		 AcDeclSpecStorageSpec( $1 ),
		 Nilac_declaration_specifiers() )));
	}
;

ac_member_declaration_specifiers:
    ac_type_specifier
    { $$ = Consac_declaration_specifiers(
		AcDeclSpecTypeSpec( $1 ),
		Nilac_declaration_specifiers() ); }
|   ac_member_storage_class_specifier ac_type_specifier
    { $$ = Consac_declaration_specifiers(
	     AcDeclSpecTypeSpec( $2 ),
	     Consac_declaration_specifiers(
		AcDeclSpecStorageSpec( $1 ),
		Nilac_declaration_specifiers() )); }
|   ac_type_qualifier ac_type_specifier
    { $$ = Consac_declaration_specifiers(
	     AcDeclSpecTypeSpec( $2 ),
	     Consac_declaration_specifiers(
	       AcDeclSpecTypeQual( $1 ),
	       Nilac_declaration_specifiers() )); }
|   ac_member_storage_class_specifier ac_type_qualifier ac_type_specifier
    { $$ = Consac_declaration_specifiers(
	     AcDeclSpecTypeSpec( $3 ),
	     Consac_declaration_specifiers(
	       AcDeclSpecTypeQual( $2 ),
	       Consac_declaration_specifiers(
		 AcDeclSpecStorageSpec( $1 ),
		 Nilac_declaration_specifiers() )));
	}
;

ac_storage_class_specifier:
    T_AUTO
    { $$ = AcAuto(); }
|   T_REGISTER
    { $$ = AcRegister(); }
|   T_STATIC
    { $$ = AcStatic(); }
|   T_EXTERN
    { $$ = AcExtern(); }
|   T_TYPEDEF
    { $$ = AcTypedef(); }
|   T_VIRTUAL
    { $$ = AcVirtual(); }
;

ac_member_storage_class_specifier:
    T_STATIC
    { $$ = AcStatic(); }
;

opt_virtual:
    /* nothing */
    { $$ = Nilac_declaration_specifiers(); }
|   T_VIRTUAL
    { $$ = Consac_declaration_specifiers(
			AcDeclSpecStorageSpec( AcVirtual() ),
			Nilac_declaration_specifiers()
		);
	}
;

ac_type_specifier:
    id // to simplify
    { $$ = AcTypeSpec( $1 ); }
;

ac_type_qualifier:
    T_CONST
    { $$ = AcConst(); }
|   T_VOLATILE
    { $$ = AcVolatile(); }
|   T_UNSIGNED
    { $$ = AcUnsigned(); }
;

ac_fn_declarator:
    ac_direct_fn_declarator
    { $$ = AcDeclarator( Nopointer(), AcNoRef(), $1 ); }
|   ac_pointer ac_direct_fn_declarator
    { $$ = AcDeclarator( Yespointer( $1 ), AcNoRef(), $2 ); }
|   '&' ac_direct_fn_declarator
    { $$ = AcDeclarator( Nopointer(), AcRef(), $2 ); }
|   ac_pointer '&' ac_direct_fn_declarator
    { $$ = AcDeclarator( Yespointer( $1 ), AcRef(), $3 ); }
;

ac_declarator:
    ac_direct_declarator
    { $$ = AcDeclarator(Nopointer(), AcNoRef(), $1 ); }
|   ac_pointer ac_direct_declarator
    { $$ = AcDeclarator( Yespointer( $1 ), AcNoRef(), $2 ); }
|   '&' ac_direct_declarator
    { $$ = AcDeclarator(Nopointer(), AcRef(), $2 ); }
|   ac_pointer '&' ac_direct_declarator
    { $$ = AcDeclarator( Yespointer( $1 ), AcRef(), $3 ); }
;

ac_member_declarator:
    ac_direct_member_declarator
    { $$ = AcDeclarator( Nopointer(), AcNoRef(), $1 ); }
|   ac_pointer ac_direct_member_declarator
    { $$ = AcDeclarator( Yespointer( $1 ), AcNoRef(), $2 ); }
|   '&' ac_direct_member_declarator
    { $$ = AcDeclarator( Nopointer(), AcRef(), $2 ); }
|   ac_pointer '&' ac_direct_member_declarator
    { $$ = AcDeclarator( Yespointer( $1 ), AcRef(), $3 ); }
;

ac_pointer_declarator:
    ac_pointer ac_direct_declarator
    { $$ = AcDeclarator( Yespointer( $1 ), AcNoRef(), $2 ); }
|   ac_pointer '&' ac_direct_declarator
    { $$ = AcDeclarator( Yespointer( $1 ), AcRef(), $3 ); }
;

ac_direct_declarator:
    ac_identifier
    { $$ = AcDirectDeclId( $1 ); }
|   '(' ac_pointer_declarator ')'
    { $$ = AcDirectDeclPack( $2 ); }
|   ac_direct_declarator '[' ac_constant_expression_option ']'
    { $$ = AcDirectDeclArray( $1, $3 ); }
|   ac_direct_declarator '(' ac_parameter_type_list ')'
    { $$ = AcDirectDeclProto( $1, $3 ); }
;

ac_direct_member_declarator:
    id T_COLONCOLON id ac_constant_expression_list
    { $$ = AcMemberDecl( $1, $3, $4 ); }
;

ac_constant_expression_list:
    /* nothing */
    { $$=Nilac_constant_expression_list(); }
|   ac_constant_expression_list '[' ac_constant_expression ']'
    { $$=Consac_constant_expression_list($3,$1); }
;

ac_constant_expression_init_list:
    ac_constant_expression
    { $$=Consac_constant_expression_list($1, Nilac_constant_expression_list()); }
|   ac_constant_expression_init_list ',' ac_constant_expression
    { $$=Consac_constant_expression_list($3,$1); }
;

ac_direct_fn_declarator:
    ac_qualifier '(' ac_parameter_type_list ')' ac_opt_const
    {
    ac_direct_declarator decl=NULL;
	ac_class_qualifier_list q=f_check_build_qualifier($1,decl);
	$$ = AcQualifiedDeclProto( q, decl, $3 ,$5 );
	}
|   ac_qualifier '(' error ')' ac_opt_const
    {
	ac_direct_declarator decl=NULL;
	ac_class_qualifier_list q=f_check_build_qualifier($1,decl);
	$$ = AcQualifiedDeclProto( q, decl, AcParList( Nilac_parameter_list() ),$5 );
        yyerrok;
    }
;

ac_qualifier:
    ac_fn_declarator_id
    { $$=Consac_class_qualifier_help_list($1,Nilac_class_qualifier_help_list()); }
|   ac_qualifier T_COLONCOLON ac_fn_declarator_id
    { $$=Consac_class_qualifier_help_list($3,$1); }
;

ac_fn_declarator_id:
    id
    { $$=AcDirectDeclId($1); }
|   T_OPERATOR T_OPNAME
    {
	ac_operator_name op_name=AcOperatorName($2);
	pf_setfileline( op_name );
	$$=AcOperatorDeclId(op_name);
    }
;

ac_opt_const:
	/* empty */
	{ $$=AcNoQualifier(); }
|	T_CONST
	{ $$=AcConst(); }
;

ac_pointer:
    '*'
    { $$ = AcPointerNil( Nilac_type_qualifier_list() ); }
|   '*' ac_type_qualifier_list
    { $$ = AcPointerNil( $2 ); }
|   '*' ac_pointer
    { $$ = AcPointerCons( Nilac_type_qualifier_list(), $2 ); }
|   '*' ac_type_qualifier_list ac_pointer
    { $$ = AcPointerCons( $2, $3 ); }
;

ac_type_qualifier_list:
    ac_type_qualifier
    { $$ = Consac_type_qualifier_list( $1, Nilac_type_qualifier_list() ); }
|   ac_type_qualifier_list ac_type_qualifier
    { $$ = Consac_type_qualifier_list( $2, $1 ); }
;

ac_parameter_type_list:
    /* Empty */
    { $$ = AcParList( Nilac_parameter_list() ); }
|   T_DOTDOTDOT
    { $$ = AcParList3Dot( Nilac_parameter_list() ); }
|   ac_parameter_list
    { $$ = AcParList( $1 ); }
|   ac_parameter_list T_DOTDOTDOT
    { $$ = AcParList3Dot( $1 ); }
|   ac_parameter_list ',' T_DOTDOTDOT
    { $$ = AcParList3Dot( $1 ); }
;

ac_parameter_list:
    ac_parameter_declaration
    { $$ = Consac_parameter_list( $1, Nilac_parameter_list() ); }
|   ac_parameter_list ',' ac_parameter_declaration
    { $$ = Consac_parameter_list( $3, $1 ); }
;

ac_parameter_declaration:
    ac_declaration_specifiers ac_declarator ac_default_arg_init
    { $$ = AcParDeclDecl( $1, $2, $3 ); }
|   ac_declaration_specifiers ac_abstract_declarator ac_default_arg_init
    { $$ = AcParDeclAbsdecl( $1, $2, $3 ); }
;

ac_abstract_declarator:
    ac_pointer
    { $$ = AcAbsdeclPointer( $1 ); }
|   ac_direct_abstract_declarator
    { $$ = AcAbsdeclDirdecl( Nopointer(), $1 ); }
|   ac_pointer ac_direct_abstract_declarator
    { $$ = AcAbsdeclDirdecl( Yespointer( $1 ), $2 ); }
;

ac_direct_abstract_declarator:
    '(' ac_abstract_declarator ')'
    { $$ = AcDirAbsdeclPack( $2 ); }
|   ac_direct_abstract_declarator '[' ac_constant_expression_option ']'
    { $$ = AcDirAbsdeclArray( Yesac_direct_abstract_declarator( $1 ), $3 ); }
|   '[' ac_constant_expression_option ']'
    { $$ = AcDirAbsdeclArray( Noac_direct_abstract_declarator(), $2 ); }
|   ac_direct_abstract_declarator '(' ac_parameter_type_list ')'
    { $$ = AcDirAbsdeclFn( Yesac_direct_abstract_declarator( $1 ), $3 ); }
|   '(' ac_parameter_type_list ')'
    { $$ = AcDirAbsdeclFn( Noac_direct_abstract_declarator(), $2 ); }
;

/* trivial rule, because a Cexpression can be empty,
 * so we don't need an 'empty' rule here
 */
ac_constant_expression_option:
    ac_constant_expression
	{ $$ = Yesac_constant_expression( $1 ); }
;
ac_constant_expression:
				    { do_CEXPR(); }
	 Cexpression
				    { do_NORMAL();
	 $$ = AcConstExpr( $2 ); }
;

ac_identifier:
    id
	{ $$ = $1; }
|   '$' id				    /* added $ var */
	{ $$ = $2; pf_setwithvariable( $2 ); }
;

ac_compound_statement:
    MainCbody
    { $$ = $1; }
|   error ';' { yyerrok; } ac_compound_statement { $$ = $4; }
;

languageoption:
    '<' languageoptions '>' ':'
    { yyerrok; $$ = LanguageList($2); }
|   /* EMPTY */
    { yyerrok; $$ = NoLanguagename(); }
;

languageoptions:
    id
        { $$ = Conslanguagenames( $1, Nillanguagenames()); }
|   languageoptions ',' id
        { yyerrok; $$ = Conslanguagenames( $3, $1 ); }
|   error
	{ $$ = Nillanguagenames(); }
|   languageoptions error
	{ $$ = $1; }
|   languageoptions ',' error
	{ $$ = $1; }
|   languageoptions error id
        { yyerrok; $$ = Conslanguagenames( $3, $1 ); }
;

languagedeclaration:
    T_PERCENTLANGUAGE deflanguagenames ';'
        { yyerrok; $$ = $2; pg_languageshavebeendefined = true; }
|   T_PERCENTLANGUAGE error ';'
	{ yyerrok; $$ = Nillanguagenames(); }
;

deflanguagenames:
    id
        { $$ = Conslanguagenames( $1, Nillanguagenames()); }
|   deflanguagenames id
        { $$ = Conslanguagenames( $2, $1 ); }
|   deflanguagenames ',' id
        { $$ = Conslanguagenames( $3, $1 ); }
|   deflanguagenames error
	{ $$ = $1; }
|   deflanguagenames ',' error
	{ $$ = $1; }
;

%%

#include "errmsg.inc"

void
yyerror_1(const char *s, int state_no)
{
    extern int yychar;
    extern char yytext[];
    int rule_pos, i;

    v_report( NonFatal( PosNoFileLine(), Problem1S( s )));
    for (rule_pos = error_state[state_no]; error_rules[rule_pos][0] != 0; rule_pos++)
    {
	int rule = error_rules[rule_pos][0];
	int rhs = yyprhs[rule+1];
	int pos = error_rules[rule_pos][1];
	fprintf(stderr, "\t%s ->", yytname[yyr1[rule+1]]);
	for (i = 0; yyrhs[rhs+i] != -1; i++)
	{
	    if (i == pos) fprintf(stderr, " .");
	    fprintf(stderr, " %s", yytname[yyrhs[rhs+i]]);
	}
	if (i == pos) fprintf(stderr, " .");
	fprintf(stderr, "\n");
    }
    if (strlen(yytext) > 0)
	fprintf(stderr, "\ttoken last read was: '%s'\n", yytext);
    throw 22;
}

// vim:sts=4:ts=8:cino=g0,t0,\:0
