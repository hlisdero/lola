%{ CODE HEADER
//
// The Termprocessor Kimwitu++
//
// Copyright (C) 1991 University of Twente, Dept TIOS.
// Copyright (C) 1998-2007 Humboldt-University of Berlin, Institute of Informatics
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
// abs.k
//
%{
  static char abs_kAccesSid[] = "@(#)$Id: abs.k,v 1.35 2007-01-30 14:10:29 piefel Exp $";
%}

/***************************************************************************/
/*
 * Name conventions: atom phyla are in CAPITALS (like ID, INT)
 * other phyla are in lowercase
 * operators are capitalized
 *
 */
/***************************************************************************/
/*
 * ABSTRACT SYNTAX
 *
 * Phyla used only as attribute value follow below in a separate section
 */

uniqID { uniq }:
	Str( casestring )
{	IDtype type = ITUnknown();
	int line = 0;
	casestring file = mkcasestring("");
	scopetypefilelinestack scopeinfo = Nilscopetypefilelinestack();
	/*
	 * in the scopeinfo we store the last (previous) typeinfo,
	 * together with the _current_ scope, ie the same scope as
	 * in the current typeinfo.
	 * this scope is used to check whether we need to pop the
	 * scopeinfo, or have to wait. This should handle things like:
	 *   void foo( v ) phylum v; {
	 *      with( v ) {
	 *	  Operator( s1, x, y ): {
	 *	    with( s1 ) {
	 *	      Operator( s2, *, y ): {
	 *		with( s2 ) {
	 *		  Operator( *, y, x ): {
	 * etc.
	 * ie. where we have 'holes' in the scopestack, for certain
	 * variables, like 'x' in the example above
	 */
};

ID:
	Id( uniqID )
{	IDtype type = ITUnknown();
	casestring named_subphylum = 0;
	int line = 0;
	casestring file = mkcasestring("");
};

INT:
	Int( integer )
{	int line = 0;
	casestring file = mkcasestring("");
};

STRING:
	String( casestring )
{	int line = 0;
	casestring file = mkcasestring("");
};

phylumdeclarationsroot:
	PhylumDeclarations( phylumdeclarations )
;

phylumdeclarations:
	list phylumdeclaration
;

phylumnames:
	list ID
;

phylumdeclaration:
	PhylumDeclaration( ID storageoption  productionblock Ccode_option )
{	int marked = 0;
	fndeclarations additional_members=Nilfndeclarations();
	baseclass_list base_classes =Nilbaseclass_list();
};

storageoption:
	NoStorageOption()
|	NegativeStorageOption( ID )
|	PositiveStorageOption( ID )
;

storageclasses:
	list ID
{	phylumnames phyla = Nilphylumnames();
}
;

productionblock:
	Emptyproductionblock()
|	ListAlternatives( alternatives ID )
|	NonlistAlternatives( alternatives )
|	PredefinedAlternatives( alternatives )
;

alternatives:
	list alternative
;

alternative:
	Alternative( ID arguments )
{	rewriterulesinfo rewriteinfo = Nilrewriterulesinfo();
	unparsedeclsinfo unparseinfo = Nilunparsedeclsinfo();
	fndeclarations additional_members=Nilfndeclarations();
	baseclass_list base_classes =Nilbaseclass_list();
}
;

arguments:
	list ID
{	int seqnr;
};

argument:
	Argument( ID /*seqnr*/integer )
;

Ccode_option:
	CcodeOption( attributes Ctexts )
;

attributes:
	list attribute
;

attribute:
	Attribute( ID ID attribute_initialisation_option )
;

attribute_initialisation_option:
	Noattribute_initialisation()
|	Yesattribute_initialisation( Cexpression )
;

Cexpression:
	list Cexpression_elem
{	int line = 0;
	casestring file = mkcasestring("");
};

Cexpression_elem:
	CExpressionPart( casestring )
|	CExpressionDollarvar( INT )
|	CExpressionNl()
|	CExpressionDQ( CexpressionDQ )
|	CExpressionSQ( CexpressionSQ )
|	CExpressionPack( Cexpression )
|	CExpressionArray( Cexpression )
;


CexpressionDQ:
	list CexpressionDQ_elem
;

CexpressionDQ_elem:
	CExpressionDQPart( casestring )
|	CExpressionDQNl()
;

CexpressionSQ:
	list CexpressionSQ_elem
;

CexpressionSQ_elem:
	CExpressionSQPart( casestring )
|	CExpressionSQNl()
;

idCexpressions:
	list idCexpression
;

idCexpression:
	IdCexpression( ID Cexpression )
{	ID id = f_emptyId();
}
;

Ctexts:
	list Ctext
;

%{ KC_TYPES_HEADER
typedef enum {include_header =0, include_file =1, include_unknown, include_both} include_type;
class twoIncludedeclarations {
    includedeclarations inc1, inc2;
public:
    includedeclarations& operator[](int i)
    { return (i==0) ? inc1 : inc2; }
};
%}
includefiles:
	list includefile
;

includefile {uniq}:
	IncludeFile( casestring )
{
	include_type inc_type = include_unknown; /* indexes in includes */
	twoIncludedeclarations inc;
	{ $0->inc[0] = Nilincludedeclarations();
	  $0->inc[1] = Nilincludedeclarations();
	 if (Theincludefiles == 0) {
	     Theincludefiles = Consincludefiles( $0, Nilincludefiles());
	  } else {
	     Theincludefiles = Consincludefiles( $0, Theincludefiles);
	  }
	}
};

includedeclarations:
	list includedeclaration
;

includedeclaration:
	IncludeDeclaration( casestring )
{	int line = 0;
	casestring file = mkcasestring("");
};

rwdeclarations:
	list rwdeclaration
;

rwdeclaration:
	RwDeclaration( outmostpatterns rewriteclauses )
;

rewriteclauses:
	list rewriteclause
;

rewriteclause:
	RewriteClause( viewnames term )
;

/* concrete syntax: patternchains = patternchain, patternchain,.... */
patternchains:
	list patternchain
{	int line = 0;
	casestring file = mkcasestring("");
}
;

/* concrete syntax: patternchain = patternchainitem & patternchainitem & .... */
patternchain:
	list patternchainitem
{	int line = 0;
	casestring file = mkcasestring("");
}
;

outmostpatterns:
	list outmostpattern
;

patternchainitem:
	PatternchainitemOutmost( outmostpattern )
|	PatternchainitemGroup( patternchains )
|	PatternchainitemDollarid( ID )
{	int line = 0;
	casestring file = mkcasestring("");
	ID type = f_emptyId();
}
;

outmostpattern:
	OPOperatorWildcard( ID Cexpression )
|	OPOperator( ID patterns Cexpression )
|	OPNonLeafVariable( ID outmostpattern )
|	OPWildcard(Cexpression)
|	OPDefault(Cexpression) /* HACK!! */ /* MPi What does 'HACK' mean? How to do it better? */
{	int line = 0;
	casestring file = mkcasestring("");
	ID type = f_emptyId();
}
;

pattern:
	PVariable( ID )
|	POperator( ID patterns )
|	PNonLeafVariable( ID pattern )
|	PWildcard()
|	PStringLiteral( CexpressionDQ )
|	PIntLiteral( INT )
;

patterns:
	list pattern
;

term:
	TVariable( ID )
|	TOperator( ID terms )
|	TMethod( term ID terms )
|	TMethodDot( term ID terms )
|	TMemberVar( term ID )
|	TMemberVarDot( term ID )
|	TCTerm( CexpressionSQ )
|	TStringLiteral( CexpressionDQ )
|	TIntLiteral( INT )
{	int line = 0;
	casestring file = mkcasestring("");
}
;

terms:
	list term
;


fnfiles:
	list fnfile
;

fnfile {uniq}:
	FnFile( casestring )
{
	fndeclarations fns;
	{ $0->fns = Nilfndeclarations();
	 if (Thefnfiles == 0) {
	     Thefnfiles = Consfnfiles( $0, Nilfnfiles());
	  } else {
	     Thefnfiles = Consfnfiles( $0, Thefnfiles);
	  }
	}
};

fndeclarations:
	list fndeclaration
;

/* needed for sort_extend_parameter_type_list */
%{ KC_TYPES
#include "gutil.h"
%}
fndeclaration:
	FnAcDeclaration( ac_declaration_specifiers ac_declarator ac_declaration_list ac_opt_base_init_list Ctext ID/*name*/ fnclass )
|	AcMemberDeclaration( ac_declaration_specifiers ac_declarator ac_constant_expression_option fnclass )
{	ac_parameter_type_list sorted;
	int last_line = 0; // line nr of _last_ line of body (contains close-brace)
	casestring file = mkcasestring("");
	bool is_attr; // whether it's from %attr or %member
	{ with($0) {
	    FnAcDeclaration(*, fn_args, C_vardecls, *, *, *, *): {
	      $0->sorted = sort_extend_parameter_type_list( C_vardecls, fn_args );
	}
	    default: { $0->sorted = AcParList( Nilac_parameter_list() ); }
	} }
}
;

fnclass:
	GlobalFn()
|	StaticFn( casestring/*filename*/ )
|	MemberFn()
|	ConstructorFn()
|	DestructorFn()
|	ConvOperatorFn()
;

Ctext:
	list Ctext_elem
{	int line = 0;
	casestring file = mkcasestring("");
}
;

Ctext_elem:
	CTextLine( casestring )
|	CTextDollarVar( INT )
|	CTextNl( integer )
|	CTextCexpressionDQ( CexpressionDQ )
|	CTextCexpressionSQ( CexpressionSQ )
|	CTextCbody( Ctext )
|	CTextForeachexpression( patternchain idCexpressions withexpressions Ctext foreach_after )
|	CTextWithexpression( withexpressions withcases contextinfo )
{	int line = 0;
	casestring file = mkcasestring("");
}
;

foreach_after:
	NoForeachAfter()
|	ForeachAfter( patternchain idCexpressions withexpressions Ctext )
{	int line = 0;
	casestring file = mkcasestring("");
}
;

contextinfo:
	InForeachContext( patternchain )
|	NotInForeachContext()
;

withexpressions:
	list withexpression
{	phylumnames type = 0;
	int line = 0;
	casestring file = mkcasestring("");
 {	with($0) {
		Nilwithexpressions(): {
			$0->type = Nilphylumnames();
		}
		Conswithexpressions( h, t ): {
			$0->type = Consphylumnames( h->type, t->type );
			$0->line = h->line;
			$0->file = h->file;
	}	}
 }
}
;

withexpression:
	WEVariable( ID )
|	WECexpression( Cexpression )
{	ID type = f_emptyId();
	int line = 0;
	casestring file = mkcasestring("");
 {
	with($0) {
		WEVariable( id ): {
			$0->line = id->line;
			$0->file = id->file;
		}
		WECexpression( e ): {
			$0->line = e->line;
			$0->file = e->file;
		}
	}
 }

}
;

withcases:
	list withcase
{	withcasesinfo wcinfo;
}
;

withcase:
	Withcase( patternchains Ctext )
{	withcasesinfo wcinfo;
}
;

unparsedeclarations:
	list unparsedeclaration
;

unparsedeclaration:
	UnparseDeclaration( outmostpatterns unparseclauses )
{	patternrepresentations patternreps;
}
;

unparseclauses:
	list unparseclause
;

unparseclause:
	UnparseClause( viewnames unparseitems )
;

viewnames:
	list ID
{	bool is_extern=false;
}
;

unparseitems:
	list unparseitem
;

unparseitem:
	UnpStr( languageoption CexpressionDQ viewnameoption )
|	UnpSubexpr( languageoption unpsubterm viewnameoption )
|	UnpCtext( languageoption Ctext )
|	UnpBody( languageoption unparseitems )
|	UViewVarDecl( ID ID Cexpression )
{	int text_nr=0; }
;

unpsubterm:
	UnpSubTerm( ID )
|	UnpDollarvarTerm( INT )
|	UnpSubAttr( ID unpattributes )
|	UnpDollarvarAttr( INT unpattributes )
|	UnpCastedVariable( ID ID )
;

unpattributes:
	list ID
;

viewnameoption:
	NoViewname()
|	YesViewname( ID )
;

languageoption:
	NoLanguagename()
|	LanguageList( languagenames )
;

languagenames:
	list ID
;
/***************************************************************************/
/*
 * ATTRIBUTE TYPES
 *
 */

fileline:
	FileLine()
|	NoFileLine()
|	PosNoFileLine()
{
    casestring file;
    int line;
}
;

%ctor FileLine(casestring _file=0, int _line=0)
{
    file = (_file!=0) ? _file : mkcasestring("");
    line=_line;
}

scopetypefilelinestack:
	list scopetypefileline
;

scopetypefileline:
	ScopeTypeFileLine( integer IDtype casestring integer )
;

IDtype:
	ITUnknown()
|	ITPredefinedPhylum( phylumdeclaration )
|	ITUserPhylum( phylumdeclaration )
|	ITPredefinedOperator( alternative /*phylum*/ID )
|	ITUserOperator( alternative /*phylum*/ID )
|	ITPredefinedStorageClass()
|	ITStorageClass()
|	ITPredefinedUView()
|	ITUserUView()
|	ITUViewVar()
|	ITPredefinedRView()
|	ITUserRView()
|	ITUserFunction( fnclass )
|	ITPatternVariable( /*phylum*/ID /*scope*/ integer )
|	ITLanguageName( integer )
{
}
;

operators:
	list ID
;

phyla:
	list ID
;

variables:
	list ID
;

dollarvarstatus:
	DVAllowed()
|	DVDisallowed()
;

/***************************************************************************/
/*
 * Stuff for patterns etc.
 */

tribool:
	Equal()
|	Smaller()
|	Bigger()
;

patternrepresentations:
	list patternrepresentation
;

patternrepresentation:
	list elem_patternrepresentation
;

elem_patternrepresentation:
	PRBinding( path ID )
|	PRVarPredicate( paths ID patternrepresentation )
|	PROperPredicate( path ID )
|	PRUserPredicate( Cexpression )
|	PRNonLeafBinding( path ID patternrepresentation )
|	PRWildcard( path )
|	PRDefault()
|	PRStringLiteral( path CexpressionDQ )
|	PRIntLiteral( path INT )
{	int line = 0;
	casestring file = mkcasestring("");
	ID type = f_emptyId();
};

path:
	list integer
{	ID op = f_emptyId();
        ID id = f_emptyId(); /* we use this only to store info for OPNonLeafVariable */
}
;

paths:
	list path
;

/***************************************************************************/

argsnumbers:
	list integer
;

/***************************************************************************/


rewriterulesinfo:
	list rewriteruleinfo
;

rewriteruleinfo:
	Rewriteruleinfo( patternrepresentation/*predicates*/ patternrepresentation/*bindings*/ rewriteclause )
;

withcasesinfo:
	list withcaseinfo
;

withcaseinfo:
	Withcaseinfo( patternrepresentation/*predicates*/ patternrepresentation/*bindings*/ Ctext )
;

rewriteviewsinfo:
	list rewriteviewinfo
;

rewriteviewinfo:
	Rewriteviewinfo( ID rewriterulesinfo )
;

unparseviewsinfo:
	list unparseviewinfo
;

unparseviewinfo:
	Unparseviewinfo( ID unparsedeclsinfo )
;

unparsedeclsinfo:
	list unparsedeclinfo
;

unparsedeclinfo:
	Unparsedeclinfo( patternrepresentation/*predicates*/ patternrepresentation/*bindings*/ unparseclause )
;

ac_declaration:
	AcDeclaration( ac_declaration_specifiers ac_init_declarator_list )
;

ac_declaration_list:
	list ac_declaration
;

ac_declaration_specifiers:
	list ac_declaration_specifier
;

ac_declaration_specifier:
	AcDeclSpecStorageSpec( ac_storage_class_specifier )
|	AcDeclSpecTypeSpec( ac_type_specifier )
|	AcDeclSpecTypeQual( ac_type_qualifier )
;

ac_storage_class_specifier:
	AcAuto()
|	AcRegister()
|	AcStatic()
|	AcExtern()
|	AcTypedef()
|	AcVirtual()
;

ac_type_specifier:
	AcTypeSpec( ID )		/* to simplify */
;

ac_type_qualifier:
	AcConst()
|	AcVolatile()
|	AcUnsigned()
|	AcNoQualifier()
;

ac_init_declarator_list:
	list ac_init_declarator
;

ac_init_declarator:
	AcInitDecl( ac_declarator )
/* this one commented out for simplification
|	ac_declarator '=' ac_initializer
*/
;

ac_declarator:
	AcDeclarator( ac_pointer_option ac_ref_option ac_direct_declarator )
;

ac_direct_declarator:
	AcDirectDeclId( ID )
|	AcDirectDeclPack( ac_declarator )
|	AcDirectDeclArray( ac_direct_declarator ac_constant_expression_option )
|	AcDirectDeclProto(ac_direct_declarator ac_parameter_type_list )
|	AcQualifiedDeclProto(ac_class_qualifier_list ac_direct_declarator ac_parameter_type_list ac_type_qualifier )
|	AcMemberDecl( /*class*/ ID /*member*/ ID ac_constant_expression_list )
|	AcConvOperatorDecl( /*class*/ ID /*member*/ ID )
|	AcOperatorDeclId( ac_operator_name )
;

ac_pointer_option:
	Nopointer()
|	Yespointer( ac_pointer )
;
ac_pointer:
	AcPointerNil( ac_type_qualifier_list )
|	AcPointerCons( ac_type_qualifier_list ac_pointer )
;

ac_ref_option:
	AcNoRef()
|	AcRef()
;

ac_operator_name:
	AcOperatorName( casestring )
	{
		int line = 0;
		casestring file = mkcasestring("");
	 }
;

ac_class_qualifier_help_list:
	list ac_direct_declarator
;

ac_class_qualifier_list:
	list ID
;

ac_type_qualifier_list:
	list ac_type_qualifier
;

ac_parameter_type_list:
	AcParList( ac_parameter_list )
|	AcParList3Dot( ac_parameter_list )
;

ac_parameter_list:
	list ac_parameter_declaration
;

ac_parameter_declaration:
	AcParDeclDecl( ac_declaration_specifiers ac_declarator ac_constant_expression_option )
|	AcParDeclAbsdecl( ac_declaration_specifiers ac_abstract_declarator ac_constant_expression_option )
;

ac_identifier_list:
	list ID
;

ac_abstract_declarator:
	AcAbsdeclPointer( ac_pointer )
|	AcAbsdeclDirdecl( ac_pointer_option ac_direct_abstract_declarator )
;

ac_direct_abstract_declarator_option:
	Noac_direct_abstract_declarator()
|	Yesac_direct_abstract_declarator( ac_direct_abstract_declarator )
;
ac_direct_abstract_declarator:
	AcDirAbsdeclPack( ac_abstract_declarator )
|	AcDirAbsdeclArray( ac_direct_abstract_declarator_option ac_constant_expression_option )
|	AcDirAbsdeclFn( ac_direct_abstract_declarator_option ac_parameter_type_list )
;

/* we don't need a Noac_constant_expression here, because Cexpression
 * can be the empty string
 */
 /* we need it for static class members */
ac_constant_expression_option:
	Yesac_constant_expression( ac_constant_expression )
|	Noac_constant_expression()
;
ac_constant_expression:
	AcConstExpr( Cexpression ) /* to make things easier, I hope... */
;

ac_constant_expression_list:
	list ac_constant_expression
;

ac_opt_base_init_list:
	AcNoBaseInit()
|	AcYesBaseInit( ac_base_init_list )
;

ac_base_init_list:
	list ac_base_init
;

ac_base_init:
	AcBaseInit( ID ac_constant_expression_list )
;

baseclass_declarations:
	list baseclass_decl
;

baseclass_decl:
	BaseClassDecl( ID baseclass_list )
;

baseclass_list:
	list ID
;

// vim:sts=4:ts=8:cino=g0,t0,\:0
