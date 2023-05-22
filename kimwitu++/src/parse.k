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
// parse.k
//
%{
  static char parse_kAccesSid[] = "@(#)$Id: parse.k,v 1.34 2007-01-30 14:10:30 piefel Exp $";
%}

/***************************************************************************/

%{ KC_TYPES_HEADER
extern int pg_lineno;					/* global line # */
extern int pg_column;					/* global column # */
extern int pg_charpos;					/* global charpos # */
extern casestring pg_filename;				/* global file name */
extern int pg_no_of_arguments;				/* no_of_arguments */
extern phylumdeclarations Thephylumdeclarations;	/* global phylumdecls */
extern rwdeclarations Therwdeclarations;		/* global rw-decls */
extern fndeclarations Thefndeclarations;		/* fn-decls for the file being parsed */
extern fnfiles Thefnfiles;				/* global fn-decls */
extern includefiles Theincludefiles;			/* global incl-decls */
extern unparsedeclarations Theunparsedeclarations;	/* global unp-decls */
extern argsnumbers Theargsnumbers;			/* global list of argsnumbers */
extern viewnames Theuviewnames;				/* global list of u-viewnames */
extern viewnames Therviewnames;				/* global list of r-viewnames */
extern storageclasses Thestorageclasses;		/* global list of storageclasses */
extern languagenames Thelanguages;			/* global list of used languages */
extern baseclass_declarations Thebaseclasses;		/* global list of defined baseclasses */
extern bool pg_uviewshavebeendefined;			/* global indication */
extern bool pg_rviewshavebeendefined;			/* global indication */
extern bool pg_storageclasseshavebeendefined;		/* global indication */
extern bool pg_languageshavebeendefined;		/* global indication */
%}

%{
int pg_lineno = 1;					/* global line # */
int pg_column = 0;					/* global column # */
int pg_charpos = 0;					/* global charpos # */
casestring pg_filename;					/* global file name */
int pg_no_of_arguments;					/* no_of_arguments */
phylumdeclarations Thephylumdeclarations;		/* global phylumdecls */
rwdeclarations Therwdeclarations;			/* global rw-decls */
fndeclarations Thefndeclarations;			/* fn-decls for the file being parsed */
fnfiles Thefnfiles;					/* global fn-decls */
includefiles Theincludefiles;				/* global incl-decls */
unparsedeclarations Theunparsedeclarations;		/* global unp-decls */
argsnumbers Theargsnumbers;				/* global list of argsnumbers */
viewnames Theuviewnames;				/* global list of u-viewnames */
viewnames Therviewnames;				/* global list of r-viewnames */
storageclasses Thestorageclasses;			/* global list of storageclasses */
languagenames Thelanguages;				/* global list of used languages */
baseclass_declarations Thebaseclasses;			/* global list of defined baseclasses */
bool pg_uviewshavebeendefined;				/* global indication */
bool pg_rviewshavebeendefined;				/* global indication */
bool pg_storageclasseshavebeendefined;			/* global indication */
bool pg_languageshavebeendefined;			/* global indication */

static long language_text_nr=0;
static bool language_text_nr_used=false;
%}

/***************************************************************************/

%{
#include "util.h"
%}


phylumdeclarations
mergephylumdeclarations(phylumdeclaration $pd, phylumdeclarations pds)
{   PhylumDeclaration( pd_id, pd_stopt, pd_pb, pd_ccopt ): {
    phylumdeclaration fpd = f_lookupuserdecl( pd_id );
    if (!fpd) {
	v_add( pd_id );
	return Consphylumdeclarations( pd, pds );
    } else if ( pd == fpd ) {
	if ( f_added( pd_id ) ) {
	    return pds;
	} else {
	    v_add( pd_id );
	    return Consphylumdeclarations( pd, pds );
	}
    }
    /* else */
    with( fpd ) { PhylumDeclaration( fpd_id, fpd_stopt, fpd_pb, fpd_ccopt ): {
	with( pd_stopt, fpd_stopt ) {
	    * & NoStorageOption(): { static_cast<impl_phylumdeclaration_PhylumDeclaration*>(fpd)->storageoption_1 = pd_stopt; }
	    NoStorageOption() & *: { /*EMPTY*/ /* nothing to do... keep the old storageoption */ }
	    NegativeStorageOption( id ) & NegativeStorageOption( id ): { /* nothing to do */ }
	    PositiveStorageOption( id ) & PositiveStorageOption( id ): { /* nothing to do */ }
	    NegativeStorageOption( id ) & PositiveStorageOption( id ): {
		v_report(NonFatal( FileLine( id->file, id->line ), Problem1S1storageoption1S1ID( "storage option mismatch  ( declared as ", fpd_stopt, ")  for phylum", fpd_id )));
	    }
	    PositiveStorageOption( id ) & NegativeStorageOption( id ): {
		v_report(NonFatal( FileLine( id->file, id->line ), Problem1S1storageoption1S1ID( "storage option mismatch  ( declared as ", fpd_stopt, ")  for phylum", fpd_id )));
	    }
	    * & *: {
		/* nothing to do, as long as we only have _one_ storage ID
		 * as soon as we get more different storage ID's we need to keep a list of them.
		 */
		v_report(NonFatal( FileLine( pd_id->file, pd_id->line ), Problem1S1storageoption1S1ID( "storage option mismatch  ( declared as ", fpd_stopt, ")  for phylum", fpd_id )));
	    }
	}
	with( pd_pb, fpd_pb ) {
	    Emptyproductionblock() & Emptyproductionblock(): { /*EMPTY*/ /* nothing to do... keep the old productionblock */ }
	    Emptyproductionblock() & *: { /*EMPTY*/ /* nothing to do... keep the old productionblock */ }
	    ListAlternatives( *, * ) & Emptyproductionblock(): { static_cast<impl_phylumdeclaration_PhylumDeclaration*>(fpd)->productionblock_1 = pd_pb; }
	    ListAlternatives( *, * ) & * : {
		v_report(NonFatal( FileLine( pd_id->file, pd_id->line ), Problem1S1ID( "production block mismatch: trying to redefine list phylum", pd_id )));
	    }
	    PredefinedAlternatives( * ) & Emptyproductionblock(): { static_cast<impl_phylumdeclaration_PhylumDeclaration*>(fpd)->productionblock_1 = pd_pb; }
	    PredefinedAlternatives( * ) & *: {
		v_report(NonFatal( FileLine( pd_id->file, pd_id->line ), Problem1S1ID( "production block mismatch: trying to predefine phylum", pd_id )));
	    }
	    NonlistAlternatives( * ) & Emptyproductionblock(): { static_cast<impl_phylumdeclaration_PhylumDeclaration*>(fpd)->productionblock_1 = pd_pb; }
	    NonlistAlternatives( pd_pb_a ) & NonlistAlternatives( fpd_pb_a ): {
		static_cast<impl_productionblock_NonlistAlternatives*>(fpd_pb)->alternatives_1 = concat(pd_pb_a, fpd_pb_a );
	    }
	    NonlistAlternatives( * ) & *: {
		v_report(NonFatal( FileLine( pd_id->file, pd_id->line ), Problem1S1ID( "production block mismatch: trying to extend phylum", pd_id )));
	    }
	}
	with( pd_ccopt, fpd_ccopt ) {
	    CcodeOption( pd_ccopt_attr, pd_ccopt_ct ) & CcodeOption( fpd_ccopt_attr, fpd_ccopt_ct ): {
		 static_cast<impl_phylumdeclaration_PhylumDeclaration*>(fpd)->Ccode_option_1 = CcodeOption( concat(pd_ccopt_attr, fpd_ccopt_attr), concat(pd_ccopt_ct, fpd_ccopt_ct ));
	    }
	}
    }   }
    return pds;
}   }


/*
 * build the correct list declarations from the list and the element phylum
 */
alternatives
makeListAlternatives(ID listphylum, ID elementphylum)
{
    ID Nil_id, Cons_id;
    alternative Nil_alternative, Cons_alternative;
    Nil_id = Id( Str( mkcasestring((string("Nil")+f_strofID(listphylum)).c_str())));
    Cons_id = Id( Str( mkcasestring((string("Cons")+f_strofID(listphylum)).c_str())));
    Nil_id->line = elementphylum->line;
    Nil_id->file = elementphylum->file;
    Cons_id->line = elementphylum->line;
    Cons_id->file = elementphylum->file;
    Nil_alternative = Alternative( Nil_id, Nilarguments() );
    Cons_alternative = Alternative( Cons_id, Consarguments( listphylum, Consarguments( elementphylum, Nilarguments() ) ) );
    v_extendoccur( Nil_id, ITUserOperator( Nil_alternative, listphylum ) );
    v_extendoccur( Cons_id, ITUserOperator( Cons_alternative, listphylum ) );
    return Consalternatives( Cons_alternative, Consalternatives( Nil_alternative, Nilalternatives() ) );
}

/***************************************************************************/

const char*
f_strofID(ID $id)
{
    Id( Str( cs ) ): { return cs->name; }
}

/***************************************************************************/

phylumdeclaration
f_lookupuserdecl(ID $id)
{
    Id( uid ): {
	with( uid->type ) {
	    ITUnknown(): {
		v_report(NonFatal( FileLine( id->file, id->line ), Problem1S1ID( "undefined phylum:", id )));
		return 0;
	    }
	    ITPredefinedPhylum( * ): {
		v_report(NonFatal( FileLine( id->file, id->line ), Problem1S1ID( "expected user-defined phylum instead of predefined phylum:", id )));
		return 0;
	    }
	    ITUserPhylum( pd ): { return pd; }
	    ITPredefinedOperator( *, * ): {
		v_report(NonFatal( FileLine( id->file, id->line ), Problem1S1ID( "expected user-defined phylum instead of predefined operator:", id )));
		return 0;
	    }
	    ITUserOperator( *, * ): {
		v_report(NonFatal( FileLine( id->file, id->line ), Problem1S1ID( "expected user-defined phylum instead of user-defined operator:", id )));
		return 0;
	    }
	    ITPredefinedStorageClass(): {
		v_report(NonFatal( FileLine( id->file, id->line ), Problem1S1ID( "expected user-defined phylum instead of predefined storage class:", id )));
		return 0;
	    }
	    ITStorageClass(): {
		v_report(NonFatal( FileLine( id->file, id->line ), Problem1S1ID( "expected user-defined phylum instead of user-defined storage class:", id )));
		return 0;
	    }
	    ITPredefinedUView(): {
		v_report(NonFatal( FileLine( id->file, id->line ), Problem1S1ID( "expected user-defined phylum instead of predefined unparse view:", id )));
		return 0;
	    }
	    ITUserUView(): {
		v_report(NonFatal( FileLine( id->file, id->line ), Problem1S1ID( "expected user-defined phylum instead of user-defined unparse view:", id )));
		return 0;
	    }
	    ITPredefinedRView(): {
		v_report(NonFatal( FileLine( id->file, id->line ), Problem1S1ID( "expected user-defined phylum instead of predefined rewrite view:", id )));
		return 0;
	    }
	    ITUserRView(): {
		v_report(NonFatal( FileLine( id->file, id->line ), Problem1S1ID( "expected user-defined phylum instead of user-defined rewrite view:", id )));
		return 0;
	    }
	    ITUserFunction( * ): {
		v_report(NonFatal( FileLine( id->file, id->line ), Problem1S1ID( "expected user-defined phylum instead of user-defined function:", id )));
		return 0;
	    }
}   }   }

phylumdeclaration
f_lookupdecl(ID $id)
{
    Id( uid ): {
	with( uid->type ) {
	    ITUnknown(): {
		v_report(NonFatal( FileLine( id->file, id->line ), Problem1S1ID( "undefined phylum:", id )));
		return 0;
	    }
	    ITPredefinedPhylum( pd ): { return pd; }
	    ITUserPhylum( pd ): { return pd; }
	    ITPredefinedOperator( *, * ): {
		v_report(NonFatal( FileLine( id->file, id->line ), Problem1S1ID( "expected user-defined phylum instead of predefined operator:", id )));
		return 0;
	    }
	    ITUserOperator( *, * ): {
		v_report(NonFatal( FileLine( id->file, id->line ), Problem1S1ID( "expected user-defined phylum instead of user-defined operator:", id )));
		return 0;
	    }
	    ITPredefinedStorageClass(): {
		v_report(NonFatal( FileLine( id->file, id->line ), Problem1S1ID( "expected user-defined phylum instead of predefined storage class:", id )));
		return 0;
	    }
	    ITStorageClass(): {
		v_report(NonFatal( FileLine( id->file, id->line ), Problem1S1ID( "expected user-defined phylum instead of user-defined storage class:", id )));
		return 0;
	    }
	    ITPredefinedUView(): {
		v_report(NonFatal( FileLine( id->file, id->line ), Problem1S1ID( "expected user-defined phylum instead of predefined unparse view:", id )));
		return 0;
	    }
	    ITUserUView(): {
		v_report(NonFatal( FileLine( id->file, id->line ), Problem1S1ID( "expected user-defined phylum instead of user-defined unparse view:", id )));
		return 0;
	    }
	    ITPredefinedRView(): {
		v_report(NonFatal( FileLine( id->file, id->line ), Problem1S1ID( "expected user-defined phylum instead of predefined rewrite view:", id )));
		return 0;
	    }
	    ITUserRView(): {
		v_report(NonFatal( FileLine( id->file, id->line ), Problem1S1ID( "expected user-defined phylum instead of user-defined rewrite view:", id )));
		return 0;
	    }
	    ITUserFunction( * ): {
		v_report(NonFatal( FileLine( id->file, id->line ), Problem1S1ID( "expected user-defined phylum instead of user-defined function:", id )));
		return 0;
	    }
}   }   }


argsnumbers
insert_in_argsnumbers(int i, argsnumbers $a)
{
    Nilargsnumbers(): { return Consargsnumbers( mkinteger(i), a ); }
    Consargsnumbers( j, ra ): {
	if ( i < j->value )
	    return Consargsnumbers( mkinteger(i), a );
	else if ( i == j->value )
	    return a;
	else
	    return Consargsnumbers( j, insert_in_argsnumbers( i, ra ));
}   }

void
set_includefiles(includefiles ifs, includedeclaration i)
{
    foreach( pl_includefile; includefiles ifs ) {
	assertCond((pl_includefile->inc_type == include_file) || (pl_includefile->inc_type == include_header));
	pl_includefile->inc[pl_includefile->inc_type] =
	    Consincludedeclarations( i, pl_includefile->inc[pl_includefile->inc_type] );
    }   }

languagenames
merge_languagenames(languagenames names, languagenames name_list)
{
    languagenames res=name_list;
    foreach(id=Id( u_id ) ; languagenames names ) {
	if(u_id->type->eq(ITUnknown())) {
	    res=Conslanguagenames(id,res);
	    u_id->type=ITLanguageName(
		    mkinteger(res->length()-1));
	}
    }
    return res;
}

long
get_text_nr() {
    language_text_nr_used=true;
    return language_text_nr;
}

void
inc_text_nr() {
    if(language_text_nr_used) {
	language_text_nr++;
	language_text_nr_used=false;
    }
}

long
last_text_nr() {
    if(language_text_nr_used)
	return language_text_nr;
    else
	return language_text_nr-1;
}

/***************************************************************************/

/* routines to help parsing of Ansi-C style function defs */

ID
f_ID_of_declarator(ac_declarator $d) {
    AcDeclarator( *, *, dd ): {
	return f_ID_of_direct_decl( dd );
    }
}

ID
f_ID_of_fn_declarator(ac_declarator $d, fnclass fnc)
{
    AcDeclarator( *, *, dd ): {
	ID id=f_ID_of_direct_decl( dd );
	with(fnc) {
	    ConstructorFn(): {
		static int ctor_nr=0;
		char buf[30];
		sprintf(buf,"constructor_%d",++ctor_nr);
		ID new_id=Id(Str(mkcasestring(buf)));
		new_id->file=id->file;
		new_id->line=id->line;
		return new_id;
	    }
	    DestructorFn(): {
		static int dtor_nr=0;
		char buf[30];
		sprintf(buf,"destructor_%d",++dtor_nr);
		ID new_id=Id(Str(mkcasestring(buf)));
		new_id->file=id->file;
		new_id->line=id->line;
		return new_id;
	    }
	    default: { return id; }
	}
    }
}

static ID
f_ID_of_direct_decl(ac_direct_declarator $d)
{
    AcDirectDeclId( i ): { return i; }
    AcDirectDeclPack( a_d ): { return f_ID_of_declarator( a_d ); }
    AcDirectDeclArray( a_d, * ): { return f_ID_of_direct_decl( a_d ); }
    AcDirectDeclProto( a_d, * ): { return f_ID_of_direct_decl( a_d ); }
    AcQualifiedDeclProto( *, a_d, *, * ): { return f_ID_of_direct_decl( a_d ); }
    default: { return f_emptyId(); }
}

/*********/

int
f_stars_of_declarator(ac_declarator $d)
{
    AcDeclarator( po, *, * ): { return f_stars_of_ac_pointer_option( po ); }
    default: { return 0; }
}

static int
f_stars_of_ac_pointer_option(ac_pointer_option $d)
{
    Yespointer( p ): { return f_stars_of_ac_pointer( p ); }
    default: { return 0; }
}

static int
f_stars_of_ac_pointer(ac_pointer $d)
{
    AcPointerCons( *, p ): { return 1 + f_stars_of_ac_pointer( p ); }
    default: { return 1; }
}

/*********/
static bool
f_is_member_fn(ac_declarator $dec) {
	AcDeclarator(*,*,AcQualifiedDeclProto(Consac_class_qualifier_list(*,*),*,*,*)): { return true; }
	default: { return false; }
}

fnclass
f_fnclass_info(ac_declaration_specifiers $ds, casestring fn, ac_declarator dec)
{
    Nilac_declaration_specifiers(): {
	assertCond(!f_is_member_fn(dec)); // MPi 25022002
	return
	// f_is_member_fn(dec) ? static_cast<fnclass>(MemberFn()) :
	GlobalFn(); }
    Consac_declaration_specifiers( h, t ): {
	if (f_static_in_ac_decl_spec( h )) {
	    return StaticFn( fn );
	} else {
	    return f_is_member_fn(dec)?MemberFn():f_fnclass_info( t, fn , dec);
	}
    }
}

fnclass
f_member_class_info(ac_declaration_specifiers $ds, casestring fn)
{
    Nilac_declaration_specifiers(): { return MemberFn(); }
    Consac_declaration_specifiers( h, t ): {
	if (f_static_in_ac_decl_spec( h )) {
	    return StaticFn( fn );
	} else {
	    return f_member_class_info( t, fn);
	}
    }
}

bool
f_static_in_ac_decl_specs(ac_declaration_specifiers $ds)
{
    Consac_declaration_specifiers(head,tail): {
	return f_static_in_ac_decl_spec(head) || f_static_in_ac_decl_specs(tail);
    }
    Nilac_declaration_specifiers(): { return false; }
}

static bool
f_static_in_ac_decl_spec(ac_declaration_specifier $ds)
{
    AcDeclSpecStorageSpec( a_sc ): { return f_static_in_ac_stor_class( a_sc ); }
    AcDeclSpecTypeSpec( * ): { return false; }
    AcDeclSpecTypeQual( * ): { return false; }
}

static bool
f_static_in_ac_stor_class(ac_storage_class_specifier $sc)
{
    AcAuto(): { return false; }
    AcRegister(): { return false; }
    AcStatic(): { return true; }
    AcExtern(): { return false; }
    AcTypedef(): { return false; }
}

/*********/

ID
f_ID_of_ac_declaration_specifiers(ac_declaration_specifiers $d)
{
    Nilac_declaration_specifiers(): { return 0;	}
    Consac_declaration_specifiers( h, t ): {
	ID tmp = f_ID_of_ac_declaration_specifier( h );
	if (tmp)
	    return tmp;
	else
	    return f_ID_of_ac_declaration_specifiers( t );
    }
}

static ID
f_ID_of_ac_declaration_specifier(ac_declaration_specifier $d)
{
    AcDeclSpecStorageSpec( * ),
    AcDeclSpecTypeQual( * ): { return 0; }
    AcDeclSpecTypeSpec( t ): {
	return f_ID_of_ac_type_specifier( t );
    }
}

static ID
f_ID_of_ac_type_specifier(ac_type_specifier $d)
{
    AcTypeSpec( i ): { return i; }
}

/***************************************************************************/

void
check_no_patternchaingroup_in_patternchain(casestring f, int l, patternchain $a_patternchain, const char *ctxt)
{
    Conspatternchain( h, t ): {
	check_no_patternchaingroup_in_patternchain( f, l, t, ctxt );
	with( h ) {
	    PatternchainitemOutmost( * ),
	    PatternchainitemDollarid( * ): {/*EMPTY*/}
	    PatternchainitemGroup( * ): {
		v_report(NonFatal( FileLine( f, l ), Problem3S( "no pattern grouping () allowed in", ctxt, "context." )));
	    }
	}
    }
    Nilpatternchain(): {/*EMPTY*/}
}

void
check_no_patternchaingroup_in_patternchains(casestring f, int l, patternchains $a_patternchains,const char *ctxt)
{
    Conspatternchains( h, t ): {
	check_no_patternchaingroup_in_patternchains( f, l, t, ctxt );
	check_no_patternchaingroup_in_patternchain( f, l, h, ctxt );
    }
    Nilpatternchains(): {/*EMPTY*/}
}

/***************************************************************************/

void
check_no_patternchaingroup_or_pattern_in_patternchain(casestring f, int l, patternchain $a_patternchain, const char *ctxt)
{
    Conspatternchain( h, t ): {
	check_no_patternchaingroup_or_pattern_in_patternchain( f, l, t, ctxt );
	with( h ) {
	    PatternchainitemOutmost( op ): {
		/* check_no_pattern_in_outmostpattern( op ); */
	    }
	    PatternchainitemDollarid( * ): {/*EMPTY*/}
	    PatternchainitemGroup( * ): {
		v_report(NonFatal( FileLine( f, l ), Problem3S( "no pattern grouping () allowed in", ctxt, "context." )));
	    }
	}
    }
    Nilpatternchain(): {/*EMPTY*/}
}

void
check_no_patternchaingroup_or_pattern_in_patternchains(casestring f, int l, patternchains $a_patternchains, const char *ctxt)
{
    Conspatternchains( h, t ): {
	check_no_patternchaingroup_or_pattern_in_patternchains( f, l, t, ctxt );
	check_no_patternchaingroup_or_pattern_in_patternchain( f, l, h, ctxt );
    }
    Nilpatternchains(): {/*EMPTY*/}
}

/***************************************************************************/

patternchains
syn_patternchains_fileline( patternchains $a_patternchains, casestring a_file, int a_line )
{
    Conspatternchains( h, t ): {
	syn_patternchains_fileline( t, a_file, a_line  );
	syn_patternchain_fileline( h, t->file, t->line );
	$0->file = h->file;
	$0->line = h->line;
	return a_patternchains;
    }
    Nilpatternchains(): {
	$0->file = a_file;
	$0->line = a_line;
	return a_patternchains;
    }
}

patternchain
syn_patternchain_fileline( patternchain $a_patternchain, casestring a_file, int a_line  )
{
    Conspatternchain( h, t ): {
	syn_patternchain_fileline( t, a_file, a_line  );
	$0->file = h->file;
	$0->line = h->line;
	return a_patternchain;
    }
    Nilpatternchain(): {
	$0->file = a_file;
	$0->line = a_line;
	return a_patternchain;
    }
}

/***************************************************************************/

/* generate unique variable names for the foreach variables generated for
 * the with-expression in a foreach or foreach-after context.
 */
withexpressions
pf_gen_foreachwith_vars( idCexpressions a_idCexpressions )
{
    static int nrof_foreach_occ = 0;
    nrof_foreach_occ++;
    return t_pf_gen_foreachwith_vars(a_idCexpressions, nrof_foreach_occ, a_idCexpressions->length(), false);
}

withexpressions
pf_gen_foreachwith_listvars( idCexpressions a_idCexpressions )
{
    static int nrof_foreach_occ = 0;
    nrof_foreach_occ++;
    return t_pf_gen_foreachwith_vars(a_idCexpressions, nrof_foreach_occ, a_idCexpressions->length(), true);
}

withexpressions
t_pf_gen_foreachwith_vars( idCexpressions $a_idCexpressions, int occ, int nr, bool listvars )
{
    ConsidCexpressions( ice = IdCexpression( id, ce ), t ): {
	char tmp[BUFSIZ];
	withexpression w;
	withexpressions ws;
	ID w_id;
	if (listvars)
	    sprintf(tmp, "kc_fe_withlistvar_%d_%d", occ, nr);
	else
	    sprintf(tmp, "kc_fe_withvar_%d_%d", occ, nr);
	w_id = Id(Str(mkcasestring(tmp)));
	w = WEVariable(w_id);
	w->type = (listvars ? id : f_listelementphylum(id));
	w->file = ce->file;
	w->line = ce->line;
	ice->id = w_id;
	ws =  Conswithexpressions(
		w,
		t_pf_gen_foreachwith_vars( t, occ, nr-1, listvars));
	ws->file = w->file;
	ws->line = w->line;
	return ws;
    }
    NilidCexpressions(): { return Nilwithexpressions(); }
}

ac_class_qualifier_list
f_check_build_qualifier_tail(ac_class_qualifier_help_list $qh_list)
{
    Consac_class_qualifier_help_list( AcDirectDeclId(id) , tail): {
	return Consac_class_qualifier_list(id,f_check_build_qualifier_tail(tail));
    }
    Consac_class_qualifier_help_list( AcOperatorDeclId(op=AcOperatorName(str)) , *): {
	v_report(NonFatal( FileLine( op->file, op->line ), Problem3S( "operator ",str->name, "is not a type name" )));
	return Nilac_class_qualifier_list();
    }
    Nilac_class_qualifier_help_list(): { return Nilac_class_qualifier_list(); }
}

ac_class_qualifier_list
f_check_build_qualifier(ac_class_qualifier_help_list $qh_list,ac_direct_declarator& decl)
{
    Consac_class_qualifier_help_list( dd, tail): {
	decl=dd;
	return f_check_build_qualifier_tail(tail);
    }
    default: { assertCond(false); return NULL; }
}



/***************************************************************************/

ID
subst_name( ID $n, casestring oldname, casestring newname )
{
    Id( Str( s )): {
	if (s->eq(oldname)) {
	    ID tmp = Id(Str(newname));
	    tmp->file = n->file;
	    tmp->line = n->line;
	    return tmp;
	} else
	    return n;
    }
}

// vim:sts=4:ts=8:cino=g0,t0,\:0
