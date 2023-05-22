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
// util.k
//
%{
static char util_kAccesSid[] = "@(#)$Id: util.k,v 1.53 2007-01-30 14:10:30 piefel Exp $";
%}

/***************************************************************************/

%{
addedphylumdeclarations pl_addedphylumdeclarations = 0;
%}
%{ KC_TYPES_HEADER
extern addedphylumdeclarations pl_addedphylumdeclarations;
%}
addedphylumdeclarations
:	list addedphylumdeclaration
;
addedphylumdeclaration
:	AddedPhylumdeclaration( uniqID )
{	bool added = false;
    {	if (!pl_addedphylumdeclarations)
	    pl_addedphylumdeclarations =
		Consaddedphylumdeclarations( $0, Niladdedphylumdeclarations() );
	else
	    pl_addedphylumdeclarations =
		Consaddedphylumdeclarations( $0, pl_addedphylumdeclarations );
}   }
;

bool
f_added(ID id)
{
    with( id ) {
	Id( uid ): {
	    return AddedPhylumdeclaration( uid )->added;
}  }   }

void
v_add(ID id)
{
    with( id ) {
	Id( uid ): {
	    AddedPhylumdeclaration( uid )->added = true;
}  }   }

void
v_freeadded()
{
    pl_addedphylumdeclarations->free( true );
    pl_addedphylumdeclarations = 0;
}


/***************************************************************************/

%{
countedphylumdeclarations pl_countedphylumdeclarations = 0;
%}
%{ KC_TYPES_HEADER
extern countedphylumdeclarations pl_countedphylumdeclarations;
%}


uniqID {uniq}:;	/* necessary because of the way it is used here */

countedphylumdeclarations
:	list countedphylumdeclaration
;

countedphylumdeclaration {uniq}
:	CountedPhylumdeclaration( uniqID )
{	int count = 0;
	{	if (!pl_countedphylumdeclarations)
			pl_countedphylumdeclarations =
				Conscountedphylumdeclarations( $0, Nilcountedphylumdeclarations() );
		else
			pl_countedphylumdeclarations =
				Conscountedphylumdeclarations( $0, pl_countedphylumdeclarations );
	}
}
;

int
f_getcount(ID id)
{
    with( id ) {
	Id( uid ): { return ++(CountedPhylumdeclaration( uid ) -> count); }
	default : { return 0; /* NOTREACHED */ }
}   }

void
v_resetcount()
{
    if (pl_countedphylumdeclarations) {
	foreach( c; countedphylumdeclarations pl_countedphylumdeclarations ) {
	    c->count = 0;
}   }   }

void
v_freecount()
{
    if (pl_countedphylumdeclarations) {
	v_resetcount();
	pl_countedphylumdeclarations->free( true );
	pl_countedphylumdeclarations = 0;
}   }


/***************************************************************************/
%{ KC_UNPARSE
#include "util.h"
#include "occur.h"

static int cl_scope = 0;
%}

/*
 * check used occurences of phyla in the phylumdeclarations
 * and set the seqnr attribute of the arguments
 * and warn if a phylum has an empty production block
 * and check/collect the storage classes
 * use gl_phylum as defined in gutil.k
 */
Consphylumdeclarations( pd, pds )	-> [view_check:
	pds
	pd
					];
Nilphylumdeclarations()			-> [view_check: /* EMPTY */ ];
PhylumDeclaration( i, *, *, cco )	-> [view_check:
{	outmostoperators.push( Niloperators() );
	dollarvarsallowed.push( DVAllowed() );
	phylumstack.push( i );
}
	cco
{	outmostoperators.top()->freelist();
	outmostoperators.pop();
	dollarvarsallowed.pop();
	phylumstack.pop();
}
					];
CcodeOption( *, ct )			-> [view_check:
	ct
					];

Consphylumdeclarations( *, * )		-> [view_check_count:
	$0:view_check_count1
	{ v_freecount(); }
					];
Consphylumdeclarations( pd, rpds )	-> [view_check_count1: rpds pd];
Nilphylumdeclarations()			-> [view_check_count1: /* EMPTY */ ];
PhylumDeclaration( id, stopt, pb, * )	-> [view_check_count1:
	{ gl_phylum = id; }
	stopt
	{ gl_phylum = 0; }
	pb
					];
PhylumDeclaration( id, stopt, Emptyproductionblock(), * )
					-> [view_check_count1:
	{ gl_phylum = id; }
	stopt
	{ gl_phylum = 0; }
	{ v_report(NonFatal( NoFileLine(),
			   Problem1S1ID( "no operators defined for phylum", id ))); }
					];
NoStorageOption()			-> [view_check_count1: /* EMPTY */ ];
NegativeStorageOption( sc ),
PositiveStorageOption( sc )		-> [view_check_count1:
{	if (pg_storageclasseshavebeendefined)
		f_useoccurstorageclass( sc );
	  else v_extendoccur( sc, ITStorageClass() );
		v_add_to_storageclasses( sc, gl_phylum );
}
					];

ListAlternatives( alt, * ),
NonlistAlternatives( alt )		-> [view_check_count1: alt ];
PredefinedAlternatives( * )
					-> [view_check_count1: /* EMPTY */ ];
Consalternatives( alt = Alternative( id, args ), ralts )
					-> [view_check_count1:
	ralts args
{	v_resetcount();
}
					];
Nilalternatives()			-> [view_check_count1: /* EMPTY */ ];
Consarguments( id, rargs )		-> [view_check_count1:
	rargs
{	f_useoccurphylum( id );
	$0->seqnr = f_getcount( id );
}
					];
Nilarguments()				-> [view_check_count1: /* EMPTY */ ];

bool
is_uview_var(ID id) {
    if(!The_current_unparseitems)
	return false;
    foreach($item; unparseitems The_current_unparseitems) {
	UViewVarDecl(*,var,*): {
	    if(var->eq(id)) {
		id->type=ITUViewVar();
		return true;
	    }
	}
	default: {}
    }
    return false;
}

%{
#include <string.h>	/* for strcmp */
%}
/***************************************************************************/

/* rewrite the patternchains to normal form.
 * this normal form consists of a list of patternchain, where
 * patternchainitem's do not contain PatternchainitemGroup's
 */

/* In the rules below, capitals represent lists, and lowercase letters
 * represent list elements. () represents empty list.
 * we use &  and ,  for Cons
 * we use && and ,, for concat
 *
 * Expand:
 * (h_pc, T_pcs) & Y_pc		=> ( h_pc&&Y_pc , (T_pcs)&Y_pc, () ), ()
 * p & (h_pc, T_pcs) & ()	=> ( p&h_pc, p&(T_pcs)&(), () ) & ()
 *
 * Simplify:
 * ( h_p&(), () )		=> h_p
 * (P_pcs)&(), ()		=> P_pcs
 * (P_pcs)&(), Q_pcs		=> P_pcs ,, Q_pcs
 * p & (P_pc,()) & ()		=> p & P_pc
 * (P_pc,()) & Q_pc		=> P_pc&&Q_pc
 *
 * One step combinations:
 * (P_pc,()) & (Q_pc,()) & ()		=> P_pc&&Q_pc
 * (h_pc, T_pcs) & (Y_pc,()) & ()	=> ( h_pc&&Y_pc , (T_pcs)&Y_pc, () ), ()
 */


/* rules for expansion (insertion of list elements in sublists */

// One step combination for the following pattern and a simplification
// (h_pc, T_pcs) & (Y_pc,()) & () => ( h_pc&&Y_pc , (T_pcs)&Y_pc, () ), ()
Conspatternchain(
	PatternchainitemGroup(
	    Conspatternchains( h_pc, T_pcs = Conspatternchains(*,*) )
	),
	Conspatternchain(
	    PatternchainitemGroup(
		Conspatternchains( Y_pc, Nilpatternchains() )),
	    Nilpatternchain() ) ),
/* (h_pc, T_pcs) & Y_pc		=> ( h_pc&&Y_pc , (T_pcs)&Y_pc, () ), ()  */
Conspatternchain(
	PatternchainitemGroup(
	    Conspatternchains( h_pc, T_pcs = Conspatternchains(*,*) )
	),
	Y_pc = Conspatternchain(*,*) ),
Conspatternchain(PatternchainitemGroup(Conspatternchains( h_pc, T_pcs = Conspatternchains(*,*) )),
	Y_pc=Conspatternchain(PatternchainitemGroup(Conspatternchains( *, Conspatternchains(*,*) )),
	    Nilpatternchain() ) ) // combination
	->
	<: Conspatternchain(
		PatternchainitemGroup(
			Conspatternchains(
				concat( h_pc, Y_pc ),
				Conspatternchains(
					Conspatternchain( PatternchainitemGroup( T_pcs ), Y_pc ),
					Nilpatternchains()
		)	)	),
		Nilpatternchain()
	) >;

/* p & (h_pc, T_pcs) & ()	=> ( p&h_pc, p&(T_pcs)&(), () ) & () */
Conspatternchain(
	p,
	Conspatternchain(
	    PatternchainitemGroup(
		Conspatternchains( h_pc, T_pcs = Conspatternchains(*,*) )),
	    Nilpatternchain() ) )
	->
	<: Conspatternchain(
		PatternchainitemGroup(
			Conspatternchains(
				Conspatternchain( p, h_pc ),
				Conspatternchains(
					Conspatternchain(
					p,
						Conspatternchain(
						PatternchainitemGroup( T_pcs ),
						Nilpatternchain()
				    )	),
				    Nilpatternchains()
		)	)	),
		Nilpatternchain()
	) >;

/* symplifying the generated grouped lists of lists etc. */
/* ( h_p&(), () ) -> h_p */
PatternchainitemGroup(
	Conspatternchains(
		Conspatternchain( h_p, Nilpatternchain()),
		Nilpatternchains()
)	)
	->
	<: h_p >;

/* (P_pcs)&(), () -> P_pcs */
Conspatternchains(
	Conspatternchain(
		PatternchainitemGroup( P_pcs ),
		Nilpatternchain()
	),
	Nilpatternchains()
)
	->
	<: P_pcs >;

/* (P_pcs)&(), Q_pcs -> P_pcs ,, Q_pcs */
Conspatternchains(
	Conspatternchain(
		PatternchainitemGroup( P_pcs ),
		Nilpatternchain()
	),
	Q_pcs = Conspatternchains(*,*)
)
	->
	<: concat( P_pcs, Q_pcs ) >;

// One step combination for the following two patterns
// (P_pc,()) & (Q_pc,()) & () => (P_pc,()) & Q_pc -> P_pc&&Q_pc
Conspatternchain(
	PatternchainitemGroup(
	    Conspatternchains( P_pc, Nilpatternchains() )
	),
	Conspatternchain(
	    PatternchainitemGroup(
		Conspatternchains( Q_pc, Nilpatternchains() )),
	    Nilpatternchain() ) )
	->
	<: concat( P_pc, Q_pc ) >;

/* (P_pc,()) & Q_pc => P_pc&&Q_pc */
Conspatternchain(
	PatternchainitemGroup(
	    Conspatternchains( P_pc, Nilpatternchains() )
	),
	Q_pc = Conspatternchain(*, *) ),
Conspatternchain(PatternchainitemGroup(Conspatternchains( P_pc, Nilpatternchains() )),
	Q_pc=Conspatternchain(PatternchainitemGroup(Conspatternchains( *, Conspatternchains(*,*) )),
	    Nilpatternchain() ) ) // combination
	->
	<: concat( P_pc, Q_pc ) >;

/* p & (P_pc,()) & () => p & P_pc */
Conspatternchain(
	p,
	Conspatternchain(
	    PatternchainitemGroup(
		Conspatternchains( P_pc, Nilpatternchains() )),
	    Nilpatternchain() ) )
	->
	<: Conspatternchain( p, P_pc ) >;

/***************************************************************************/

/*
 * check used occurences of operators in the multi patterns (using the
 * existing code for checking (outmost)patterns
 *
 */
/***************************************************************************/

/*
 * check used occurences of operators in the (outmost)patterns
 *
 */
Consoutmostpatterns( p, rp )		-> [view_check: rp p ];
Niloutmostpatterns()			-> [view_check: /* EMPTY */ ];

OPOperatorWildcard( o, * )		-> [view_check_outmostopers_in_phylum:
{	if (f_useoccuroperator( o )) {
		if ( phylumstack.top()->eq(f_emptyId() )) {
			phylumstack.pop();
			phylumstack.push( f_phylumofoperator( o ) );
		}
		if (! f_operatorinphylum( o, phylumstack.top())) {
			v_report(NonFatal( FileLine( o->file, o->line ),
					 Problem1S1ID1S1ID( "outermost operator", o,
								"not in expected phylum",
								phylumstack.top() )));
		} else {
			operators tmp = Consoperators( o, outmostoperators.top() );
			outmostoperators.pop();
			outmostoperators.push( tmp );
		}
	}
}
					];
OPOperatorWildcard( o, * )		-> [view_check:
{	if (f_useoccuroperator( o )) {
		if ( phylumstack.top()->eq( f_emptyId() )) {
			phylumstack.pop();
			phylumstack.push( f_phylumofoperator( o ) );
		}
		{	operators tmp = Consoperators( o, outmostoperators.top() );
			outmostoperators.pop();
			outmostoperators.push( tmp );
		}
	}
}
					];
OPOperator( o, p, * )			-> [view_check_outmostopers_in_phylum:
{	if (f_useoccuroperator( o )) } ${
{		if ( phylumstack.top()->eq( f_emptyId() )) {
			phylumstack.pop();
			phylumstack.push( f_phylumofoperator( o ) );
}		}
{		if (f_operatorinphylum( o, phylumstack.top())) } ${
{			operators tmp = Consoperators( o, outmostoperators.top() );
			outmostoperators.pop();
			outmostoperators.push( tmp );
			argumentsstack.push( f_argumentsofoperator( o )->reverse());
			operatorstack.push( o );
}
			p:view_check
{			if (! f_Nilarguments( argumentsstack.top() )) {
				v_report(NonFatal( FileLine( o->file, o->line ),
					 Problem1S1ID( "too few subpatterns for operator", o )));
			}
			argumentsstack.pop();
			operatorstack.pop();
}
		$}
{		else {
			v_report(NonFatal( FileLine( o->file, o->line ),
				Problem1S1ID1S1ID( "outermost operator", o,
					"not in expected phylum", phylumstack.top() )));
}		}
	$}
					];
OPOperator( o, p, * )			-> [view_check:
{	if (f_useoccuroperator( o )) } ${
{		if ( phylumstack.top()->eq( f_emptyId() )) {
			phylumstack.pop();
			phylumstack.push( f_phylumofoperator( o ) );
}		}
		${
{			operators tmp = Consoperators( o, outmostoperators.top() );
			outmostoperators.pop();
			outmostoperators.push( tmp );
			argumentsstack.push( f_argumentsofoperator( o )->reverse());
			operatorstack.push( o );
}
			p
{			if (! f_Nilarguments( argumentsstack.top() )) {
				v_report(NonFatal( FileLine( o->file, o->line ),
					Problem1S1ID( "too few subpatterns for operator", o )));
			}
			argumentsstack.pop();
			operatorstack.pop();
}
	$}	$}
					];
OPNonLeafVariable( v, p )		-> [view_check:
	{ variables tmp = Consvariables( v, variablesstack.top() );
	  variablesstack.pop(); variablesstack.push( tmp );
	  v_extendoccur( v, ITPatternVariable( f_phylumofoutmostpattern( p ),
							   mkinteger(cl_scope)));
	}
	p
					];
OPNonLeafVariable( v, p )		-> [view_check_outmostopers_in_phylum:
	{ variables tmp = Consvariables( v, variablesstack.top() );
	  ID tmp_pid = f_phylumofoutmostpattern( p );
	  ID tmp_vid = f_phylumofpatternvariable( v );
	  ID tmp_resid = tmp_pid->eq(f_emptyId() ) ? tmp_vid : tmp_pid;
	  if ( phylumstack.top()->eq(f_emptyId()) ) {
			phylumstack.pop();
			phylumstack.push( tmp_resid );
	  }
	  variablesstack.pop(); variablesstack.push( tmp );
	  v_extendoccur( v, ITPatternVariable( tmp_resid, mkinteger(cl_scope)));
	}
	p:view_check
					];

OPDefault,
OPWildcard				-> [view_check: /* EMPTY */ ];

Conspatterns( p, rp )			-> [view_check:
	rp
{	if (f_Nilarguments( argumentsstack.top() )) {
		ID o = operatorstack.top();
		v_report(NonFatal( FileLine( o->file, o->line ),
			Problem1S1ID( "too many subpatterns for operator", o )));
	} else } ${
{		arguments tmp;
}
		p
{		tmp = argumentsstack.top();
		argumentsstack.pop();
		argumentsstack.push( f_tl_arguments( tmp ));
}
	$}
					];
Nilpatterns()				-> [view_check: /* EMPTY */
	/* we don't test here, because at this point we are in front of
	  the first element in the list */
					];
PVariable( v )				-> [view_check:
{	variables tmp = Consvariables( v, variablesstack.top() );
	variablesstack.pop();
	variablesstack.push( tmp );
	v_extendoccur( v, ITPatternVariable( f_hd_arguments( argumentsstack.top() ),
										 mkinteger(cl_scope) ));
}
					];
POperator( o, p )			-> [view_check:
{	if (f_useoccuroperator( o )) } ${
{		if (f_Nilarguments( argumentsstack.top() )) {
			ID o = operatorstack.top();
			v_report(NonFatal( FileLine( o->file, o->line ),
				Problem1S1ID( "too many subpatterns for operator", o )));
		} else if (f_operatorinphylum( o, f_hd_arguments( argumentsstack.top() ))) } ${
{			argumentsstack.push( f_argumentsofoperator( o )->reverse());
			operatorstack.push( o );
}
			p
{			if (! f_Nilarguments( argumentsstack.top() )) {
				v_report(NonFatal( FileLine( o->file, o->line ),
					Problem1S1ID( "too few subpatterns for operator", o )));
			}
			argumentsstack.pop();
			operatorstack.pop();
}
		$} {else} ${
{			v_report(NonFatal( FileLine( o->file, o->line ),
				Problem1S1ID1S1ID( "operator", o, "not in phylum",
					f_hd_arguments( argumentsstack.top() ) )));
}
	$}	$}
					];
PNonLeafVariable( v,  p )		-> [view_check:
{	variables tmp = Consvariables( v, variablesstack.top() );
	variablesstack.pop();
	variablesstack.push( tmp );
	v_extendoccur( v, ITPatternVariable( f_hd_arguments( argumentsstack.top() ),
						mkinteger(cl_scope) ));
}
	p
					];
PWildcard()				-> [view_check: /* EMPTY */ ];
PStringLiteral( * )			-> [view_check:
{	if ( (! f_hd_arguments( argumentsstack.top() )->eq(Id( Str( mkcasestring( "casestring" ))))) &&
		 (! f_hd_arguments( argumentsstack.top() )->eq(Id( Str( mkcasestring( "nocasestring" ))))))
	{
		v_report(NonFatal( FileLine( operatorstack.top()->file, operatorstack.top()->line ),
			 Problem1S( "unexpected string subterm" )));
	}
}
					];
PIntLiteral( i )			-> [view_check:
{	if ((! f_hd_arguments( argumentsstack.top() )->eq(Id( Str( mkcasestring( "integer" ))))) &&
	    (! f_hd_arguments( argumentsstack.top() )->eq(Id( Str( mkcasestring( "real" ))))) ) {
		v_report(NonFatal( FileLine( i->file, i->line ),
			Problem1S( "unexpected int subterm" )));
	}
}
					];

/*
 * check used occurences of operators in the rwdeclarations
 *
 */
/*
 * Basic idea: when we check a Ctext that is part of a withcase, we expect
   that we can find the type of the outmost-opers in stacktopphylum
   and the outmostoperators (a list of ID) in stacktopoperators
 */

Consrwdeclarations( rwd, rrwd )		-> [view_check: rrwd rwd ];
Nilrwdeclarations()			-> [view_check: /* EMPTY */ ];
RwDeclaration( op, rc )			-> [view_check:
{	outmostoperators.push( Niloperators() );
	dollarvarsallowed.push( DVAllowed() );
	phylumstack.push( f_emptyId() );
	variablesstack.push( Nilvariables());
	cl_scope++;
}
	op
	rc
{	outmostoperators.top()->freelist();
	outmostoperators.pop(); phylumstack.pop();
	dollarvarsallowed.pop();
	v_reset_variables_type( variablesstack.top() );
	cl_scope--;
	variablesstack.top()->freelist();
	variablesstack.pop();
}
					];
Consrewriteclauses( rc, rcs )		-> [view_check: rcs rc ];
Nilrewriteclauses()			-> [view_check: /* EMPTY */ ];
RewriteClause( vn, * )			-> [view_check: vn:view_check_r ];
Consfndeclarations( fnd, fnds )		-> [view_check: fnds fnd];
Nilfndeclarations()			-> [view_check: /* EMPTY */ ];
FnAcDeclaration( *, *, *, *, ct, *, * )	-> [view_check: ct ];
FnAcDeclaration( Nilac_declaration_specifiers(), AcDeclarator(Nopointer(), AcNoRef(),
	    AcQualifiedDeclProto(
		Nilac_class_qualifier_list(),
		AcDirectDeclId(pid),
		*,
		AcNoQualifier())),
	Nilac_declaration_list(), *, ct, *, ConstructorFn())
					-> [view_check:
    ct
    {	with(pid) { Id( uid ): { with( uid->type ) {
	    ITUnknown(): {
		v_report(Warning( FileLine(file, last_line),
			    Problem1S1ID( "constructor does not belong to phylum or operator:",
				pid)));
	    }
	    default: { /* ALRIGHT */ }
    } } } }
					];
FnAcDeclaration( *, AcDeclarator(Nopointer(), AcNoRef(),
	    AcQualifiedDeclProto(
		Nilac_class_qualifier_list(),
		AcDirectDeclId(pid),
		AcParList( Nilac_parameter_list() ),
		AcNoQualifier())),
	Nilac_declaration_list(), AcNoBaseInit(), ct, *, DestructorFn())
					-> [view_check:
    ct
    {	with(pid) { Id( uid ): { with( uid->type ) {
	    ITUnknown(): {
		v_report(Warning( FileLine(file, last_line),
			    Problem1S1ID( "destructor does not belong to phylum or operator:",
				pid)));
	    }
	    default: { /* ALRIGHT */ }
    } } } }
					];

AcMemberDeclaration( *, *, *, * )	-> [view_check: /* EMPTY */ ];
AcMemberDeclaration( *, AcDeclarator(*, *, AcMemberDecl(pid, aid, *)), *, StaticFn(*) )
	provided (is_attr)		-> [view_check:
    {	v_report(NonFatal( FileLine(file, last_line) ,
		Problem1S1ID1S1ID( "attribute", aid,
		    "(with %attr) should not be static in phylum", pid)));
    }
					];
AcMemberDeclaration( *, AcDeclarator(*, *, AcMemberDecl(pid, aid, *)), *, *)
					-> [view_check:
    {	with(pid) { Id( uid ): { with( uid->type ) {
	    ITUnknown(): {
		v_report(NonFatal( FileLine(file, last_line),
			    Problem1S1ID1S1ID( "attribute", aid,
				"is not part of any phylum or operator; defined in", pid)));
	    }
	    default: { /* ALRIGHT */ }
    } } } }
    {	if (f_ispredefinedphylum(pid) && strcmp(f_strofID(pid), "abstract_phylum")!=0
		&& strcmp(f_strofID(pid), "abstract_list")!=0)
	    v_report(NonFatal( FileLine($0->file, $0->last_line) ,
			Problem1S1ID1S1ID( "attribute", aid,
			    "must not be defined in predefined phylum", pid)));
    }
    {	if(!f_listelementphylum(f_phylumofoperator(pid))->eq(f_emptyId()))
	    v_report(NonFatal( FileLine(file, last_line) ,
		Problem1S1ID1S1ID( "attribute", aid,
		    "must not be declared in list operator", pid)));
    }
					];

CTextLine( * )				-> [view_check: /* EMPTY */ ];
CTextDollarVar( i = Int( iv ) )		-> [view_check:
{	if ( /*(i != 0) &&*/ f_DvIsDisallowed( dollarvarsallowed.top() )) {
		v_report(NonFatal( FileLine( i->file, i->line ),
			Problem1S1INT(
				"illegal dollar variable (not allowed in &-ed pattern context)", i )));
	} else if (!outmostoperators.empty()) {
		v_check_dollarvar_attribute_in_operators( i, Nilunpattributes(),
			outmostoperators.top() );
	} else if (iv->value != 0) {
		v_report(NonFatal( FileLine( i->file, i->line ),
			Problem1S1INT( "illegal dollar variable", i )));
	}
}
					];
CTextNl( * )				-> [view_check: /* EMPTY */ ];
CTextCexpressionDQ( * )			-> [view_check: /* EMPTY */ ];
CTextCexpressionSQ( * )			-> [view_check: /* EMPTY */ ];
CTextCbody( ct )			-> [view_check: ct ];

/* for the patternchains, we check in the following way:
 * We have a list of types (on top of a stack of such lists),
 * and a list of patterns: the term we are unparsing.
 * Note that we first unparse tail, then head.
 * We start by taking the head and tail of the top-of-types-stack.
 * Just before we unparse the tail of the patterns list,
 * we pop the types list, and push the tail of the types list back.
 * Just before we unparse the head of the patterns list,
 * we push the head of the original type list to make it available
 * to the code that will check the pattern.
 * During checking, this type may be updated, eg. if it wasn't known
 * so far. Such an update will replace the value on top of the type stack.
 * After unparsing the head and the tail of the patterns list, we restore the
 * 'old' types list on top the stack, at the same time taking into account the
 * possible changes, by replacing the top of the type-list stack by the
 * prepending the top of the type stack (used/updated during checking the pattern head)
 * to the top of the types-stack (used/updated during checking the pattern tail).
 */
Nilpatternchains()			-> [view_check view_set_type: /* EMPTY */ ];
Conspatternchains( h, t )		-> [view_check view_set_type:
	t
	h
					];
p = Nilpatternchain()			-> [view_check:
{	with( phylumnamesstack.top() ) {
		Consphylumnames( p_h, p_t ): {
			v_report(NonFatal( FileLine( p->file, p->line ),
				Problem1S( "fewer &-ed patterns than expressions")));
		}
		Nilphylumnames(): { /* EMPTY */ }
	}
}
					];
p = Conspatternchain( h, t )		-> [view_check:
{	ID tmp_type = 0;
	phylumnames tmp_types = 0;
	with( phylumnamesstack.top() ) {
		Consphylumnames( p_h, p_t ): {
			tmp_type = p_h;
			tmp_types = p_t;
		}
		Nilphylumnames(): {
			tmp_type = f_emptyId();
			tmp_types = Nilphylumnames();
			v_report(NonFatal( FileLine( p->file, p->line ),
				Problem1S( "more &-ed patterns than expressions")));
		}
	}
	phylumnamesstack.pop();
	phylumnamesstack.push( tmp_types );
}
	t
{	tmp_types = phylumnamesstack.top();
	phylumnamesstack.pop();
	phylumstack.push( tmp_type ); }
	h
{	tmp_type = phylumstack.top();
	phylumstack.pop();
	phylumnamesstack.push( Consphylumnames( tmp_type, tmp_types ) );
}
					];
Conspatternchain( PatternchainitemOutmost( OPDefault(*) ), Nilpatternchain() )
					-> [view_check: /* EMPTY */ ];
Conspatternchain( p = PatternchainitemOutmost( OPDefault(*) ), Conspatternchain( PatternchainitemOutmost( OPDefault(*) ), * )),
Conspatternchain( *, Conspatternchain( p = PatternchainitemOutmost( OPDefault(*) ), * )),
Conspatternchain( p = PatternchainitemOutmost( OPDefault(*) ), Conspatternchain( *, * ))
					-> [view_check:
{	v_report(NonFatal( FileLine( p->file, p->line ),
		Problem1S( "'default' can not be &-ed with (other) patterns")));
}
					];
mpg = PatternchainitemGroup( mp )	-> [view_check:
{	v_report( NonFatal(  FileLine( mpg->file, mpg->line ),
			   Problem1S( "Internal Error: PatternchainitemGroup was not handled correctly" )));
}
					];
PatternchainitemOutmost( p )		-> [view_check:
{	if (inforeachcontext.top()!=0) } ${
		p:view_check_is_var
	$} {else} ${
		p:view_check_outmostopers_in_phylum
	$}
					];

Nilpatternchain()			-> [view_set_type: /* EMPTY */ ];
Conspatternchain( h, t )		-> [view_set_type:
{	ID tmp_type = 0;
	phylumnames tmp_types = 0;
	with( phylumnamesstack.top() ) {
		Consphylumnames( p_h, p_t ): {
			tmp_type = p_h;
			tmp_types = p_t;
		}
		Nilphylumnames(): {
			tmp_type = f_emptyId();
			tmp_types = Nilphylumnames();
		}
	}
	phylumnamesstack.pop();
	phylumnamesstack.push( tmp_types );
}
	t
{	tmp_types = phylumnamesstack.top();
	phylumnamesstack.pop();
	phylumstack.push( tmp_type );
	if (! phylumstack.top()->eq( f_emptyId() )) {
		h->type = phylumstack.top();

	}
}
	h
{	tmp_type = phylumstack.top();
	phylumstack.pop();
	phylumnamesstack.push( Consphylumnames( tmp_type, tmp_types ) );
}
					];
PatternchainitemGroup( mp )		-> [view_set_type: /* EMPTY */ ];
PatternchainitemOutmost( p )		-> [view_set_type:
{	if (! phylumstack.top()->eq( f_emptyId() )) } ${
{		p->type = phylumstack.top();
}
	$}
					];

OPOperatorWildcard( i, * )		-> [view_check_is_var:
	{ f_warnifnotvariable( i ); }
					];
OPOperator( *, *, * )			-> [view_check_is_var: /* EMPTY */ ];
OPNonLeafVariable( *, * )		-> [view_check_is_var: /* EMPTY */ ];
OPDefault,
OPWildcard				-> [view_check_is_var: /* EMPTY */ ];
ConsidCexpressions( h, t )
					-> [view_check: t h ];
IdCexpression( t, * )			-> [view_check: { f_useoccurlistphylum( t ); } ];

CTextForeachexpression( *, ide, *, ct, fa )
					-> [view_check:
{	phylumnames tmp = f_phylumnames_foreachwith_vars( ide );
	phylumnamesstack.push( tmp );
}
	ide
	ct
{	phylumnamesstack.pop();
	/* free_phylumnames(tmp); ??? */
}
	fa
					];

NoForeachAfter()			-> [view_check: /* EMPTY */ ];
ForeachAfter( mp, ide, *, ct )		-> [view_check:
{	phylumnames tmp = f_phylumnames_foreachwith_listvars( ide );
	phylumnamesstack.push( tmp );
}
	ct
{	phylumnamesstack.pop();
	/* free_phylumnames(tmp); ??? */
}
					];

CTextWithexpression( we, wc, in_foreach_context )
					-> [view_check:
{
	withexpressionsstack.push( we );
	with(in_foreach_context) {
		InForeachContext(*): {
			inforeachcontext.push(1);
		}
		NotInForeachContext(): {
			inforeachcontext.push(0);
			phylumnamesstack.push( we->type );
		}
	}
	if (we->length() == 1) {
		dollarvarsallowed.push( DVAllowed() );
	} else {
		dollarvarsallowed.push( DVDisallowed() );
	}
}
	wc
	wc:view_set_type
{	we->type = phylumnamesstack.top();
	withexpressionsstack.pop();
	dollarvarsallowed.pop();
}
	we
{	if (! inforeachcontext.top() ) {
		phylumnamesstack.pop();
	}
	inforeachcontext.pop();
}
					];
Nilwithexpressions()			-> [view_check: /* EMPTY */ ];
Conswithexpressions( h, t )		-> [view_check:
{	ID tmp_type = 0;
	phylumnames tmp_types = 0;
	t->type = phylumnamesstack.top();
	with( t->type ) {
		Consphylumnames( p_h, p_t ): {
			tmp_type = p_h;
			tmp_types = p_t;
		}
		Nilphylumnames(): {
			tmp_type = f_emptyId();
			tmp_types = Nilphylumnames();
		}
	}
	phylumnamesstack.pop();
	phylumnamesstack.push( tmp_types );
}
	t
{	h->type = tmp_type;
	if (tmp_type->eq( f_emptyId())) {
		v_report(NonFatal( FileLine( h->file, h->line ),
				Problem1S1we( "could not infer type of with-expression argument:", h )));
	}
}
					];

Conswithcases( wc, wcs )		-> [view_check: wcs wc ];
Nilwithcases()				-> [view_check: /* EMPTY */ ];
Withcase( mp, ct )			-> [view_check:
{	outmostoperators.push( Niloperators() );
	variablesstack.push( Nilvariables());
	cl_scope++;
}
	/* the context (Ctext) has called phylumstack.push */
	mp
	ct
	/* the context (Ctext) calls phylumstack.pop */
{	outmostoperators.top()->freelist();
	outmostoperators.pop();
	v_reset_variables_type( variablesstack.top() );
	cl_scope--;
	variablesstack.top()->freelist();
	variablesstack.pop();
}
					];
Conswithcases( wc, wcs )		-> [view_set_type: wcs wc ];
Nilwithcases()				-> [view_set_type: /* EMPTY */ ];
Withcase( mp, * )			-> [view_set_type:
	mp
					];

Consunparsedeclarations( ud, uds )	-> [view_check: uds ud ];
Nilunparsedeclarations()		-> [view_check: /* EMPTY */ ];
UnparseDeclaration( op, uc )		-> [view_check:
{	outmostoperators.push( Niloperators() );
	dollarvarsallowed.push( DVAllowed() );
	phylumstack.push( f_emptyId() );
	variablesstack.push( Nilvariables());
	cl_scope++;
}
	op
	uc
{	outmostoperators.top()->freelist();
	outmostoperators.pop();
	dollarvarsallowed.pop();
	phylumstack.pop();
	v_reset_variables_type( variablesstack.top() );
	cl_scope--;
	variablesstack.top()->freelist();
	variablesstack.pop();
}
					];
Consunparseclauses( uc, ucs )		-> [view_check: ucs uc ];
Nilunparseclauses()			-> [view_check: /* EMPTY */ ];
UnparseClause( vn, ui )			-> [view_check: vn:view_check_u ui ];
Consviewnames( vn, vns )		-> [view_check_u:
	vns
{	if (pg_uviewshavebeendefined)
		f_useoccuruviewname( vn );
	else
		v_extendoccur_nowarning( vn, ITUserUView() );
	v_add_to_uviewnames( vn );
}
					];
Nilviewnames()				-> [view_check_u: /* EMPTY */ ];
Consviewnames( vn, vns )		-> [view_check_r:
    vns
{   if (pg_rviewshavebeendefined)
	f_useoccurrviewname( vn );
    else
	v_extendoccur_nowarning( vn, ITUserRView() );
    v_add_to_rviewnames( vn );
}
					];
Nilviewnames()				-> [view_check_r: /* EMPTY */ ];
Consunparseitems( ui, uis )		-> [view_check: uis ui ];
Nilunparseitems()			-> [view_check: /* EMPTY */ ];
UnpStr(*, *, * )			-> [view_check: /* EMPTY */ ];
UnpSubexpr(*, us, * )			-> [view_check: us  ];
UnpCtext(*, ct )			-> [view_check: ct ];
UnpBody(*, ui )				-> [view_check: ui ];
UnpSubTerm( id )			-> [view_check:
{   // MPi TODO These checks are now disabled. They failed if the term to be unparsed
    // was not a pattern variable (and such its type could not be determined). As now
    // everything is just handed to the global unparse functions, the type is not of
    // any interest. The C++ compiler will find unknown identifiers.
    // f_useoccurpatternvariable( id );
    // v_syn_type_attribute_ID( id );
}
					];
UnpDollarvarTerm( i )			-> [view_check:
{   v_check_dollarvar_attribute_in_operators( i, Nilunpattributes(),
	outmostoperators.top() );
}
					];
UnpSubAttr( v_id, unp_a )		-> [view_check:
{   ID p_id;
    if (f_useoccurpatternvariable( v_id ) && (p_id = f_phylumofpatternvariable( v_id)))
	f_check_unpattributes_in_phylum( unp_a, p_id );
    v_syn_type_attribute_ID( v_id );
}
					];
UnpDollarvarAttr( i, unp_a )		-> [view_check:
{   v_check_dollarvar_attribute_in_operators( i, unp_a, outmostoperators.top() ); }
					];
UnpCastedVariable( *, * )		-> [view_check: /* EMPTY */ ];

Consunparsedeclarations( ud, uds )	-> [view_check_viewnames view_checklanguagenames: uds ud ];
Nilunparsedeclarations()		-> [view_check_viewnames view_checklanguagenames: /* EMPTY */ ];
UnparseDeclaration( *, uc )		-> [view_check_viewnames view_checklanguagenames: uc ];
Consunparseclauses( uc, ucs )		-> [view_check_viewnames view_checklanguagenames: ucs uc ];
Nilunparseclauses()			-> [view_check_viewnames view_checklanguagenames: /* EMPTY */ ];
UnparseClause( *, ui )			-> [view_checklanguagenames: ui];
UnparseClause( *, ui )			-> [view_check_viewnames:
	{ The_current_unparseitems=ui; }
	ui
	{ The_current_unparseitems=NULL; }
];

Consunparseitems( ui, uis )
					-> [view_check_viewnames view_checklanguagenames: uis ui ];
Nilunparseitems()			-> [view_check_viewnames view_checklanguagenames: /* EMPTY */ ];
UnpStr(*, *, vno )			-> [view_check_viewnames: vno ];
UnpSubexpr(*, *, vno )			-> [view_check_viewnames: vno ];
UViewVarDecl(vno, *, * )		-> [view_check_viewnames: vno ];
NoViewname()				-> [view_check_viewnames: /* EMPTY */ ];
YesViewname( vn )			-> [view_check_viewnames:
	{ if(!is_uview_var(vn)) f_useoccuruviewname( vn ); }
					];

UnpStr(NoLanguagename(), *, * )		-> [view_checklanguagenames: /* EMPTY */ ];
UnpStr(LanguageList(qual), *, * )	-> [view_checklanguagenames:
	{ f_useoccurlanguagename(qual); }
					];
UnpSubexpr(NoLanguagename(), *, * )	-> [view_checklanguagenames: /* EMPTY */ ];
UnpSubexpr(LanguageList(qual), *, * )	-> [view_checklanguagenames:
	{ f_useoccurlanguagename(qual); }
					];
UnpCtext(NoLanguagename(), *)		-> [view_checklanguagenames: /* EMPTY */ ];
UnpCtext(LanguageList(qual), *)		-> [view_checklanguagenames:
	{ f_useoccurlanguagename(qual); }
					];
UnpBody( NoLanguagename(), items )	-> [view_checklanguagenames: items ];
UnpBody( LanguageList(qual), items )	-> [view_checklanguagenames:
	{ f_useoccurlanguagename(qual); }
	items
					];

%{ KC_UNPARSE
#include <stack>
static std::stack<operators> outmostoperators;

static std::stack<dollarvarstatus> dollarvarsallowed;

static std::stack<int> inforeachcontext;

static std::stack<arguments> argumentsstack;

static std::stack<ID> phylumstack;

static std::stack<phylumnames> phylumnamesstack;

static std::stack<withexpressions> withexpressionsstack;

static std::stack<ID> operatorstack;

static std::stack<variables> variablesstack;
%}

bool
f_DvIsDisallowed(dollarvarstatus $dvs)
{
    DVAllowed(): { return false; }
    DVDisallowed(): { return true; }
}

ID
f_listelementphylum(ID $id)
{
    Id( uid ): {
	with( uid->type ) {
	    ITUserPhylum( pd ): {
		with( pd ) {
		    PhylumDeclaration( *, *, ListAlternatives( *, i ), * ): {
			return i;
		    }
		    default: { return f_emptyId(); }
		}	}
	    default: { return f_emptyId(); }
}   }	}

ID
f_listelementconsoperator(ID $id)
{
    Id( uid ): {
	with( uid->type ) {
	    ITUserPhylum( pd ): {
		with( pd ) {
		    PhylumDeclaration( *, *, ListAlternatives(
				Consalternatives(Alternative( Cons_id, * ), * ), * ), * ): {
			return Cons_id;
		    }
		    default: { return f_emptyId(); }
		}   }
	    default: { return f_emptyId(); }
}   }	}

%{ KC_TYPES_HEADER
namespace kc { ID f_emptyId(); }
%}
ID
f_emptyId()
{
    static ID emptyID = 0;
    if (! emptyID) {
	emptyID = Id (Str( mkcasestring( "" )));
    }
    return emptyID;
}

bool
f_operatorinphylum(ID $oid, ID pid)
{
    Id( uid ): {
	with( uid->type ) {
	    ITUserOperator( *, id ): { return pid->eq( id ); }
	    default: { return false; }
}   }	}

bool
f_isphylum(ID $id)
{
    Id( uid ): {
	with( uid->type ) {
	    ITPredefinedPhylum( * ),
	    ITUserPhylum( * ): { return true; }
	    default: { return false; }
}   }	}

phylumdeclaration
f_phylumdeclofid(ID $id)
{
    Id( uid ): {
	with( uid->type ) {
	    ITPredefinedPhylum( dcl ),
	    ITUserPhylum( dcl ): { return dcl; }
	    default: { return NULL; }
}   }	}

bool
f_ispredefinedphylum(ID $id)
{
    Id( uid ): {
	with( uid->type ) {
	    ITPredefinedPhylum( * ): { return true; }
	    default: { return false; }
}   }  }

alternative
f_alternativeofoperator(ID $oid)
{
    Id( uid ): {
	with( uid->type ) {
	    ITUserOperator( a, * ): { return a; }
	    default: { return 0; }
}   }	}

arguments
f_argumentsofoperator(ID $oid)
{
    Id( uid ): {
	with( uid->type ) {
	    ITUserOperator( Alternative( *, args ), * ): { return args; }
	    default: { return Nilarguments(); }
}   }	}

ID
f_phylumofoperator(ID $oid)
{
    Id( uid ): {
	with( uid->type ) {
	    ITPredefinedOperator( *, id ),
	    ITUserOperator( *, id ): { return id; }
	    default: { return f_emptyId(); }
}   }	}

ID
f_phylumofpatternID(ID vid)
{
    with( vid->type ) {
	ITPatternVariable( id, * ): { return id; }
	default: { return f_emptyId(); }
}   }

ID
f_phylumofpatternvariable(ID $vid)
{
    Id( uid ): {
	with( uid->type ) {
	    ITPatternVariable( id, * ): { return id; }
	    default: { return f_emptyId(); }
}	}	}

void
v_syn_type_attribute_ID(ID $id)
{
    Id( uid ): {
	with( uid->type ) {
	    ITPatternVariable( *, * ): { id->type = uid->type; }
	    default: {/* EMPTY */}
}   }	}

bool
f_Nilarguments(arguments $a)
{
    Nilarguments(): { return true; }
    Consarguments( *, * ): { return false; }
}

ID
f_hd_arguments(arguments $a)
{
    Nilarguments(): {
	assertionFailed("Head of empty argument list requested");
	/* shouldn't happen */ return 0;
    }
    Consarguments( hd, * ): { return hd; }
}

arguments
f_tl_arguments(arguments $a)
{
    Nilarguments(): {
	assertionFailed("Tail of empty argument list requested");
	/* shouldn't happen */ return 0;
    }
    Consarguments( *, tl ): { return tl; }
}

void
v_check_dollarvar_attribute_in_operators(INT i, unpattributes a, operators $o)
{
    Niloperators(): { /* EMPTY */ }
    Consoperators( o_o, o_os ): {
	ID phy = f_subphylumofoperator( o_o, i );
	if (phy->eq(f_emptyId())) {
	    v_report(NonFatal( FileLine( i->file, i->line ),
			Problem1S1INT1S1ID( "illegal dollar variable", i,
			    "not that many subterms in operator", o_o )));
	} else {
	    f_check_unpattributes_in_phylum( a, phy );
	    v_do_check_dollarvar_in_operators( i, o_os, phy );
}   }	}

ID
f_check_unpattributes_in_phylum(unpattributes a, ID p)
{
    ID tmp;
    unpattributes t = a->reverse();
    tmp = f_do_check_unpattributes_in_phylum( t, p );
    t->freelist();
    return tmp;
}

/*
 * WARNING: the routine below expects the  unpattributes list to be in
 * 'normal' order: the tail contains attributes of the head
 * So: take care that the unpattributes as parsed are reversed..
 * as v_check_unpattributes_in_phylum does for example
 * It returns the type of the attribute
 */
static ID
f_do_check_unpattributes_in_phylum(unpattributes $a, ID p)
{
    Nilunpattributes(): { return p; }
    Consunpattributes( a_id, r_a ): {
	ID type = f_typeof_attribute_in_phylym( a_id, p );
	if ( type->eq(f_emptyId() )) {
	    v_report(NonFatal( FileLine( a_id->file, a_id->line ),
			Problem1S1ID1S1ID( "attribute", a_id, "not defined in phylum", p )));
	    return f_emptyId();
	} else {
	    return f_do_check_unpattributes_in_phylum( r_a, type );
}   }   }

static void
v_do_check_dollarvar_in_operators(INT i, operators $o, ID p)
{
	Niloperators(): {/* EMPTY */}
	Consoperators( o_o, o_os ): {
		ID phy = f_subphylumofoperator( o_o, i );
		if (phy->eq(f_emptyId())) {
			v_report(NonFatal( FileLine( i->file, i->line ),
				Problem1S1INT1S1ID( "illegal dollar variable", i,
					"not that many subterms in operator", o_o )));
		} else if (! p->eq( phy )) {
				v_report(NonFatal( FileLine( i->file, i->line ),
					Problem1S1INT1S1ID1S1ID( " type mismatch for dollar varariable:", i,
						"; old type", p, "; new type", phy )));
		}
		v_do_check_dollarvar_in_operators( i, o_os, p );
}   }

%{
#include "parse.h"	/* for f_lookupdecl */
%}
bool
f_attribute_in_phylym(ID a, ID p)
{
    return f_typeof_attribute_in_phylym(a, p)->eq(f_emptyId()) ?  false : true;
}

ID
f_typeof_attribute_in_phylym(ID a, ID p)
{
    phylumdeclaration tmp = f_lookupdecl( p );
    if ( tmp == 0 ) {
	v_report(NonFatal( FileLine( p->file, p->line ),
		    Problem1S1ID( "internal error: could not find declaration of phylum:",
			p )));
	return f_emptyId();
    }
    with( tmp ) {
	PhylumDeclaration( *, *,  *, CcodeOption( attrs, * ) ): {
	    foreach( Attribute( a_type, a_id, * ); attributes attrs ) {
		if (a->eq(a_id))
		    return a_type;
	    }
	    foreach( AcMemberDeclaration(Consac_declaration_specifiers(
			    AcDeclSpecTypeSpec(AcTypeSpec(a_type)), *), AcDeclarator(*, *, AcMemberDecl(*, a_id, *)), *, *);
		    fndeclarations $0->additional_members) {
		if (a->eq(a_id))
		    return a_type;
	    }
	    return f_emptyId();
}   }   }

ID
f_subphylumofoperator(ID o, INT $i)
{
    Int( ii ): {
	if (ii->value == 0) {
	    return f_phylumofoperator( o );
	} else {
	    return f_subphylum( f_argumentsofoperator( o ), i );
}   }	}

/* we want to have the i-th element from the *end* of the list */
ID
f_subphylum(arguments a, INT i)
{
	return f_do_subphylum( a, i, a->length() );
}

static
ID f_do_subphylum(arguments $a, INT i, int a_i)
{
    Nilarguments(): { /* internal error*/ return f_emptyId(); }
    Consarguments( a_a, a_as ): {
	with( i ) {
	    Int( ii ): {
		if (ii->value == a_i) {
		    return a_a;
		} else {
		    return f_do_subphylum( a_as, i, a_i - 1 );
}   }	}   }	}

argument
f_argumentofoperator(ID o, INT $i)
{
    Int( ii ): {
	if (ii->value == 0) {
	    return Argument( f_phylumofoperator( o ), mkinteger(0));
	} else {
	    return f_argument( f_argumentsofoperator( o ), i );
}   }	}

/* we want to have the i-th element from the *end* of the list */
argument
f_argument(arguments a, INT i)
{
    return f_do_argument( a, i, a->length() );
}

static argument
f_do_argument(arguments $a, INT i, int a_i)
{
    Nilarguments(): { /* internal error*/ return Argument(f_emptyId(), mkinteger(0)); }
    Consarguments( a_a, a_as ): {
	with( i ) {
	    Int( ii ): {
		if (ii->value == a_i) {
		    return Argument( a_a, mkinteger(a->seqnr) );
		} else {
		    return f_do_argument( a_as, i, a_i - 1 );
}   }	}   }	}

ID
f_phylumofoutmostpattern(outmostpattern $p)
{
    OPOperatorWildcard( o, * ): { return f_phylumofoperator( o ); }
    OPOperator( o, *, * ): { return f_phylumofoperator( o ); }
    OPNonLeafVariable( *, r_p ): { return f_phylumofoutmostpattern( r_p ); }
    OPDefault(*),
    OPWildcard(*): { return f_emptyId(); }
}

ID
f_operatorofphylum(ID p, int i)
{
    phylumdeclaration tmp = f_lookupdecl( p );
    if ( tmp == 0 ) {
	v_report(NonFatal( FileLine( p->file, p->line ),
		    Problem1S1ID( "internal error: could not find declaration of phylum:",
			p )));
	return f_emptyId();
    }
    with( tmp ) {
	PhylumDeclaration( *, *,  pb, * ): {
	    with( pb ) {
		Emptyproductionblock(): { return f_emptyId(); }
		ListAlternatives( a, * ),
		NonlistAlternatives( a ),
		PredefinedAlternatives( a ): {
		    alternative tmp_a = f_alternative( a, i );
		    if ( tmp_a == 0 ) {
			v_report(NonFatal( FileLine( p->file, p->line ),
				    Problem1S1ID(
					"internal error: could not find operators of phylum:",
					p )));
			return f_emptyId();
		    }
		    with( tmp_a ) {
			Alternative( id, * ): { return id; }
}   }	}   }	}   }

/* we want to have the i-th element from the *end* of the list */
alternative
f_alternative(alternatives a, int i)
{
    return f_do_alternative( a, i, a->length() );
}

static
alternative f_do_alternative(alternatives $a, int i, int a_i)
{
    Nilalternatives(): { /* internal error*/ return 0; }
    Consalternatives( a_a, a_as ): {
		if (i == a_i) {
		    return a_a;
		} else {
		    return f_do_alternative( a_as, i, a_i - 1 );
}   }	}

/***************************************************************************/


%{ KC_UNPARSE
#include "parse.h"
static ID cl_uniqueID = 0;
static ID cl_storageID = 0;
%}
Consphylumdeclarations( d, rpds )		-> [view_check_uniq: rpds d ];
Nilphylumdeclarations()				-> [view_check_uniq: /* EMPTY */ ];
PhylumDeclaration( *, NoStorageOption(), pb, * )
						-> [view_check_uniq: pb ];
PhylumDeclaration( *, NegativeStorageOption( * ), *, * )
						-> [view_check_uniq: /* EMPTY */ ];
PhylumDeclaration( id, PositiveStorageOption( s_id ), pb, * )
						-> [view_check_uniq:
{	$0->marked = 1;
	cl_uniqueID = id;
	cl_storageID = s_id;
}
	pb:view_check_uniq1
{	v_reset_phylumdeclaration_marks();
	cl_uniqueID = 0;
	cl_storageID = 0;
}
						];
PhylumDeclaration( *, *, pb, * )		-> [view_check_uniq1: pb ];
Emptyproductionblock()				-> [view_check_uniq1: /* EMPTY */ ];
ListAlternatives( alt, * ),
NonlistAlternatives( alt ),
PredefinedAlternatives( alt )			-> [view_check_uniq1: alt ];
Consalternatives( a, ralts )			-> [view_check_uniq1: ralts a  ];
Nilalternatives()				-> [view_check_uniq1: /* EMPTY */ ];
Alternative( *, args )				-> [view_check_uniq1: args ];
Consarguments( id, rargs )			-> [view_check_uniq1:
	{ phylumdeclaration tmp = f_lookupdecl( id ); }
	rargs
{	if (tmp) } ${
		tmp:view_check_uniq2
	$}
						];
PhylumDeclaration( *, PositiveStorageOption( * ), Emptyproductionblock(), *),
PhylumDeclaration( *, PositiveStorageOption( * ), ListAlternatives(*,*), *),
PhylumDeclaration( *, PositiveStorageOption( * ), NonlistAlternatives(*), *),
PhylumDeclaration( *, PositiveStorageOption( * ), PredefinedAlternatives(*), *),
PhylumDeclaration( *, *, Emptyproductionblock(), * )
						-> [view_check_uniq2: /* EMPTY */ ];
PhylumDeclaration( id, *, ListAlternatives( *, * ), * ),
PhylumDeclaration( id, *, NonlistAlternatives( * ), * )
						-> [view_check_uniq2:
{	if (! $0->marked) } ${
{		v_report(NonFatal( FileLine( cl_storageID->file, cl_storageID->line ),
			Problem1S1ID1S1ID( "'uniq' declared phylum:", cl_uniqueID,
				"has non 'uniq' (transitive) subterm:", id) ));
		($0)->marked = 1;
}
		$0:view_check_uniq1
	$}
						];
PhylumDeclaration( *, *, PredefinedAlternatives( * ), * )
						-> [view_check_uniq2: /* EMPTY */ ];

Nilarguments()					-> [view_check_uniq1: /* EMPTY */ ];

void v_reset_phylumdeclaration_marks()
{
	foreach( p; phylumdeclarations Thephylumdeclarations ) {
		p->marked = 0;
}	}

void v_reset_variables_type(variables v)
{
    foreach( var; variables v ) {
	with( var ) {
	    Id( uid ): {
		with( uid->type ) {
		    ITUnknown(): {/* EMPTY */}
		    ITPredefinedPhylum( * ): {/* EMPTY */}
		    ITUserPhylum( * ): {/* EMPTY */}
		    ITPredefinedOperator( *, * ): {/* EMPTY */}
		    ITUserOperator( *, * ): {/* EMPTY */}
		    ITPredefinedStorageClass(): {/* EMPTY */}
		    ITStorageClass(): {/* EMPTY */}
		    ITUserFunction( * ): {/* EMPTY */}
		    ITPredefinedUView(): {/* EMPTY */}
		    ITUserUView(): {/* EMPTY */}
		    ITPredefinedRView(): {/* EMPTY */}
		    ITUserRView(): {/* EMPTY */}
		    ITPatternVariable( *, uid_scope ): {
			with( uid->scopeinfo ) {
			    Nilscopetypefilelinestack(): {
				uid->type = ITUnknown();
				uid->file = mkcasestring("");
				uid->line = 0;
			    }
			    Consscopetypefilelinestack( ScopeTypeFileLine( s, t, f, l ), r_scopeinfo ): {
				if (s == uid_scope) {
				    uid->type = t;
				    uid->file = f;
				    uid->line = l->value;
				    uid->scopeinfo = r_scopeinfo;
		    } } } }
} } } } }


/* code to test the pattern making routines */

%{ KC_UNPARSE
#include "pat.h"	/* for syn_outmostpatterns and v_resetbindingidmarks */
%}

RwDeclaration( op, rc )			-> [view_make_patternreps:
{	v_resetbindingidmarks();
	// Generate PatternRepresentation from Pattern
	v_add_rewriterulesinfo_to_operator(
		add_predicates_to_patternrepresentations( syn_outmostpatterns( op ) ), rc );
}
					];
Nilfndeclarations()			-> [view_make_patternreps: /* EMPTY */ ];
Consfndeclarations( a_fnd, r_fnd)	-> [view_make_patternreps:
	r_fnd a_fnd
					];
FnAcDeclaration( *, *, *, *, ct, *, * ) -> [view_make_patternreps:
	ct
					];
AcMemberDeclaration( *, *, *, * )	-> [view_make_patternreps: /* EMPTY */ ];
CTextCbody( ct )			-> [view_make_patternreps:
	ct
					];
CTextForeachexpression( *, *, *, ct, fa ) -> [view_make_patternreps:
	ct
	fa
					];
NoForeachAfter()			-> [view_make_patternreps: /* EMPTY */ ];
ForeachAfter( *, *, *, ct )		-> [view_make_patternreps:
	ct
					];
CTextWithexpression( *, wc, * )		-> [view_make_patternreps:
	wc
{	check_with_patterns(wc->wcinfo); }
					];
Nilwithcases()				-> [view_make_patternreps:
	{ $0->wcinfo = Nilwithcasesinfo(); }
					];
Conswithcases( wc, r_wcs )		-> [view_make_patternreps:
	wc
	r_wcs
 /* the following can be done much more efficient,
  * because both wc->wcinfo and r_wcs->wcinfo are already sorted
  */
{	$0->wcinfo = r_wcs->wcinfo;
	foreach( wci; withcasesinfo wc->wcinfo ) {
		$0->wcinfo = insertin_withcasesinfo( wci, $0->wcinfo );
	}
}
					];
Withcase( mp, ct )			-> [view_make_patternreps:
	ct
{	v_resetbindingidmarks();
	// Generate PatternRepresentation from Pattern
	$0->wcinfo = f_withcasesinfo( add_predicates_to_patternrepresentations(
								syn_patternchains( mp ) ), ct );
}
					];
UnparseDeclaration( op, uc )		-> [view_make_patternreps:
	uc
{	v_resetbindingidmarks();
	// Generate PatternRepresentation from Pattern
	$0->patternreps = syn_outmostpatterns( op );
	$0->patternreps = add_predicates_to_patternrepresentations($0->patternreps);
	v_add_unparsedeclsinfo_to_operator( $0->patternreps, uc );
 }
					];
Nilunparseclauses()			-> [view_make_patternreps: /* EMPTY */ ];
Consunparseclauses( a_uc, r_uc )	-> [view_make_patternreps:
 r_uc a_uc
					];
UnparseClause( *, u_i )			-> [view_make_patternreps:
 u_i
					];
Nilunparseitems()			-> [view_make_patternreps: /* EMPTY */ ];
Consunparseitems( a_ui, r_ui )		-> [view_make_patternreps:
 r_ui a_ui
					];
UnpCtext(*, ct )			-> [view_make_patternreps:
 ct
					];
UnpBody(*, ui )				-> [view_make_patternreps:
 ui
					];

void
v_add_to_uviewnames(ID v)
{
    foreach( vn; viewnames Theuviewnames ) {
	if ( vn->eq( v )) return;
    }
    Theuviewnames = Consviewnames( v, Theuviewnames );
}

void
v_add_to_uviewnames_ext(ID v)
{
    viewnames uviewnames=Theuviewnames;
    while(uviewnames) {
	with(uviewnames) {
	    node=Consviewnames(vn,tail): {
		if(vn->eq(v)) {
		    if(!node->is_extern)
			node->is_extern=true;
		    return;
		}
		uviewnames=tail;
	    }
	    Nilviewnames(): { uviewnames=0; }
	}
    }
    Theuviewnames = Consviewnames( v, Theuviewnames );
    Theuviewnames->is_extern=true;
}

void
v_add_to_rviewnames(ID v)
{
    foreach( vn; viewnames Therviewnames ) {
	if ( vn->eq( v )) return;
    }
    Therviewnames = Consviewnames( v, Therviewnames );
}

void
v_add_to_rviewnames_ext(ID v)
{
    viewnames rviewnames=Therviewnames;
    while(rviewnames) {
	with(rviewnames) {
	    node=Consviewnames(vn,tail): {
		if(vn->eq(v)) {
		    if(!node->is_extern)
			node->is_extern=true;
		    return;
		}
		rviewnames=tail;
	    }
	    Nilviewnames(): { rviewnames=0; }
	}
    }
    Therviewnames = Consviewnames( v, Therviewnames );
    Therviewnames->is_extern=true;
}

void
v_add_to_storageclasses(ID v, ID p)
{
    Thestorageclasses =
	do_add_to_storageclasses( v, p, Thestorageclasses, Thestorageclasses );
}

static storageclasses
do_add_to_storageclasses(ID v, ID p, storageclasses $s, storageclasses all)
{
    Nilstorageclasses() : {
	storageclasses tmp = Consstorageclasses( v, all );
	tmp->phyla = Nilphylumnames();
	if (! p->eq(f_emptyId())) {
	    tmp->phyla = Consphylumnames( p, tmp->phyla );
	}
	return tmp;
    }
    Consstorageclasses( sc, r_sc ): {
	if ( sc->eq( v )) {
	    if (! p->eq(f_emptyId())) {
		s->phyla = Consphylumnames( p, s->phyla );
	    }
	    return all;
	} else {
	    return do_add_to_storageclasses( v, p, r_sc, all );
	}       }       }

UnpStr(*, *, *) ->
[ view_collect_strings:
	{ add_string_to_collection($0); }
];

%{
static unparseitems** string_collection;
static unparseitems The_Nilunparseitems;
unparseitems The_current_unparseitems;
%}

%{ KC_UNPARSE
extern unparseitems The_current_unparseitems;
%}

%{ KC_TYPES_HEADER
namespace kc { void collect_strings(void); }
%}

void
collect_strings() {
	long i;
	long ssize=last_text_nr()+1;
	int lsize=Thelanguages->length();
	The_Nilunparseitems=Nilunparseitems();
	string_collection=new unparseitems*[ssize];
	for( i=0; i<ssize;i++) {
		int j=0;
		string_collection[i]=new unparseitems[lsize];
		for(;j<lsize;j++)
			string_collection[i][j]=The_Nilunparseitems;
	}
	Theunparsedeclarations->unparse(v_null_printer, view_collect_strings);
}

void
add_string_to_collection(unparseitem $s)
{
    UnpStr(NoLanguagename(),*,*): {
	int lsize=Thelanguages->length();
	long nr=s->text_nr;
	int i;
	for(i=0;i<lsize;i++) {
	    unparseitems entry=string_collection[nr][i];
	    string_collection[nr][i]= Consunparseitems(s,entry);
	}
    }
    UnpStr(LanguageList(langs), *,*): {
	long nr=s->text_nr;
	foreach( Id( u_id ); languagenames langs) {
	    with((IDtype)u_id->type) {
		ITLanguageName( l ): {
		    unparseitems entry=string_collection[nr][l->value];
		    with(entry) {
			Nilunparseitems(),
			Consunparseitems(UnpStr(NoLanguagename(),*,*), Nilunparseitems()): {
			    string_collection[nr][l->value]=Consunparseitems(s,The_Nilunparseitems);
			}
			default: {
				     string_collection[nr][l->value]= Consunparseitems(s,entry);
			}
		    }
		}
		default: { /* EMPTY */ }
	    }
	}
    }
}

%{ KC_TYPES_HEADER
namespace kc { void unparse_string_collection(void); }
%}

void
unparse_string_collection()
{
    int l=Thelanguages->length();
    long ssize=last_text_nr()+1;
    foreach( language; languagenames Thelanguages) {
	long nr;
	l--;
	language->unparse(v_ccfile_printer,view_output_collection);
	for(nr=0;nr<ssize;nr++) {
	    static char buf[30];
	    unparseitems entry=string_collection[nr][l];
	    sprintf(buf,"/*%ld*/",nr);
	    v_ccfile_printer(buf,base_uview);
	    entry->unparse(v_ccfile_printer,view_output_collection);
	    v_ccfile_printer(",\n",base_uview);
	}
	v_ccfile_printer("};\n\n",base_uview);
    }
    v_ccfile_printer("char **kc_language=kc_language_",base_uview);
    with((languagenames)Thelanguages) {
	Conslanguagenames( l,*): {
	    l->unparse(v_ccfile_printer,base_uview);
	}
    }
    v_ccfile_printer(";\n\n",base_uview);
}

/***************************************************************************/

/* generate a list of types of the foreach variables generated for
 * the with-expression in a foreach context.
 */
phylumnames
f_phylumnames_foreachwith_vars( idCexpressions a_idCexpressions )
{
    return t_f_phylumnames_foreachwith_vars(a_idCexpressions);
}

phylumnames
t_f_phylumnames_foreachwith_vars( idCexpressions $a_idCexpressions )
{
    ConsidCexpressions( IdCexpression( id, * ), t ): {
	return Consphylumnames(
		f_listelementphylum(id),
		t_f_phylumnames_foreachwith_vars( t ));
    }
    NilidCexpressions(): { return Nilphylumnames(); }
}

phylumnames
f_phylumnames_foreachwith_listvars( idCexpressions a_idCexpressions )
{
    return t_f_phylumnames_foreachwith_listvars(a_idCexpressions);
}

phylumnames
t_f_phylumnames_foreachwith_listvars( idCexpressions $a_idCexpressions )
{
    ConsidCexpressions( IdCexpression( id, * ), t ): {
	return Consphylumnames(
		id,
		t_f_phylumnames_foreachwith_listvars( t ));
    }
    NilidCexpressions(): { return Nilphylumnames(); }
}

void
f_collect_members(fndeclarations fns)
{
    foreach($fn; fndeclarations fns) {
	FnAcDeclaration( *,
		AcDeclarator(*,*,
		    AcQualifiedDeclProto(
			Consac_class_qualifier_list(
			    id,
			    Nilac_class_qualifier_list()
						   ),
			*,*,*
					)
			    ),
		*,*,*,*, MemberFn()
		       ),
	FnAcDeclaration( *,
		AcDeclarator(*,*,
		    AcQualifiedDeclProto(
			*,
			AcConvOperatorDecl( id, * ),
			*,*
					)
			    ),
		*,*,*,*, ConvOperatorFn()
		       ),
	FnAcDeclaration( *,
		AcDeclarator(*,*,
		    AcQualifiedDeclProto(
			*,
			AcDirectDeclId( id ),
			*,*
					)
			    ),
		*,*,*,*, ConstructorFn()
		       ),
	FnAcDeclaration( *,
		AcDeclarator(*,*,
		    AcQualifiedDeclProto(
			*,
			AcDirectDeclId( id ),
			*,*
					)
			    ),
		*,*,*,*, DestructorFn()
		       ),
	AcMemberDeclaration( *,
		AcDeclarator(*,*, AcMemberDecl(id, *, * )),
		*,*
			   ): {
	    phylumdeclaration ph_decl=f_phylumdeclofid(id);
	    alternative op=f_alternativeofoperator(id);
	    if(ph_decl)
		ph_decl->additional_members=Consfndeclarations(fn, ph_decl->additional_members);
	    else if(op)
		op->additional_members=Consfndeclarations(fn, op->additional_members);
	}
	default: {}
    }
}

ID
f_id_of_ctor_dtor_decl(ac_declarator $decl)
{
    AcDeclarator(*,*,
	    AcQualifiedDeclProto(
		*,
		AcDirectDeclId( id ),
		*,*
				)
		): { return id; }
    default: { return NULL; }
}

void
prepare_base_classes(baseclass_declarations decls)
{
    foreach(BaseClassDecl(id,bases);baseclass_declarations decls) {
	phylumdeclaration ph_decl=f_phylumdeclofid(id);
	alternative op=f_alternativeofoperator(id);
	if(ph_decl)
	    ph_decl->base_classes=concat(bases, ph_decl->base_classes);
	else if(op)
	    op->base_classes=concat(bases,op->base_classes);
    }
}

// vim:sts=4:ts=8:cino=g0,t0,\:0
