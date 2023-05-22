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
// pat.k
//
%{
static char pat_kAccesSid[] = "@(#)$Id: pat.k,v 1.34 2007-01-30 14:10:30 piefel Exp $";
%}

/***************************************************************************/
/*
 * This file contains the code to build the pattern match structures
 * and generate the appropriate C code from the patterns
 */

%{
#include "util.h"
#include "gutil.h" /* for f_operatorofpatternrepresentation() */
%}

/*
 * NOTE: currently we use functions to construct the pattern internal
 *       structure. We don't use attributes because we only once need to
 *       compute this info (as a synthesized attribute of the outmostpattern)
 *       In the future we may want to use an extended form of unparse rules
 *       (that can handle synthesized attributes, maybe in a yacc-like syntax)
 *       to implement this piece of code.
 */


/*
 * we collect two sorts of things:
 *  - bindings of variables to positions in the pattern,
 *  - predicates that tell the structure of the pattern, for matching.
 */

/*
 * representation of the patterns:
 * we represent each branch in the pattern with a list of numbers,
 * the numbers of the subtrees: 1 = first subtree, 2 = second subtree etc.
 * 0 = the node itself, used when the node must have a certain operator.
 * this list is build in reverse order, because it's easier to append in that
 * way.
 * attached to these numbers are the operator IDs (in attributes), for unparsing purposes.
 * In Path(i, rest) is i the i-th argument of rest->op.
 * We must make sure not to destroy this information (accidently) during copying
 * of paths (path::reverse most surely destroys this info, because the attributes
 * are not copied!)
 */




patternrepresentations
syn_patternchains(patternchains $a_patternchains)
{
    Nilpatternchains(): {
	return Nilpatternrepresentations();
    }
    Conspatternchains( a_patternchain, r_patternchains ): {
	return Conspatternrepresentations(
		syn_patternchain( a_patternchain, Nilpath() ),
		syn_patternchains(  r_patternchains )
		);
    }
}

patternrepresentation
syn_patternchain(patternchain $a_patternchain, path a_path)
{
    Nilpatternchain(): {
	return Nilpatternrepresentation();
    }
    Conspatternchain( *, * ): {
	return t_syn_patternchain( a_patternchain, a_path, a_patternchain->length());
    }
}

static patternrepresentation
t_syn_patternchain(patternchain $a_patternchain, path a_path, int branch)
{
    Nilpatternchain(): {
	return Nilpatternrepresentation();
    }
    Conspatternchain( a_patternchainitem, r_patternchain ): {
	return concat( t_syn_patternchain(  r_patternchain, a_path , branch-1 ), syn_patternchainitem( a_patternchainitem, Conspath( mkinteger(branch), a_path ) ) );
    }
}


patternrepresentation
syn_patternchainitem(patternchainitem $a_patternchainitem, path a_path)
{
    PatternchainitemOutmost( a_outmostpattern ): {
	return syn_outmostpattern( a_outmostpattern, a_path );
    }
    PatternchainitemGroup( * ): {
	v_report( NonFatal(  FileLine( a_patternchainitem->file, a_patternchainitem->line ),
		   Problem1S( "Internal Error: PatternchainitemGroup was not handled correctly" )));
	return Nilpatternrepresentation();
    }
    PatternchainitemDollarid( id ): {
	elem_patternrepresentation tmp = PRBinding( a_path, id );
	tmp->type = a_patternchainitem->type;
	return Conspatternrepresentation(
		    tmp,
		    Nilpatternrepresentation()
					 );
    }
}

/*
 * build list of patternrepresentations in reverse order to get the references in the
 * same order as the subterms (with 0 for the operator, 1 for first subterm, 2 for second etc)
 * note that the path is in reverse order.
 */
patternrepresentations
syn_outmostpatterns(outmostpatterns $a_outmostpatterns)
{
    Niloutmostpatterns(): {
	return Nilpatternrepresentations();
    }
    Consoutmostpatterns( a_outmostpattern, r_outmostpatterns ): {
	return Conspatternrepresentations(
		syn_outmostpattern( a_outmostpattern, Nilpath() ),
		syn_outmostpatterns(  r_outmostpatterns )
		);
    }
}

void
clone_TypeFileLine(elem_patternrepresentation tmp1, outmostpattern a_outmostpattern)
{
    tmp1->type = a_outmostpattern->type;
    tmp1->file = a_outmostpattern->file;
    tmp1->line = a_outmostpattern->line;
}

static patternrepresentation
syn_outmostpattern(outmostpattern a_outmostpattern, path a_path)
{
    patternrepresentation result;
    Cexpression condition;
    with(a_outmostpattern) {
	OPOperatorWildcard( id, cond ): {
	    condition = cond;
	    /* added this case to be able to handle variables in foreach statements */
	    with( id ) {
		Id( uid ): {
		    with( uid->type ) {
			ITPatternVariable( *, * ),
			ITUnknown(): { // generate a binding
			    elem_patternrepresentation tmp1 = PRBinding( a_path, id );
			    clone_TypeFileLine(tmp1, a_outmostpattern);
			    result = Conspatternrepresentation(
				    tmp1,
				    Nilpatternrepresentation()
				    );
			}
			default: { // generate a matching
			    elem_patternrepresentation tmp1 = PROperPredicate( Conspath( mkinteger(0), a_path ), id );
			    clone_TypeFileLine(tmp1, a_outmostpattern);
			    a_path->op = id;
			    result = Conspatternrepresentation(
				    tmp1,
				    Nilpatternrepresentation()
				    );
			}
		    }   }   }   }
	OPOperator( id, r_patterns, cond ): {
	    condition = cond;
	    elem_patternrepresentation tmp1 = PROperPredicate( Conspath( mkinteger(0), a_path ), id );
	    clone_TypeFileLine(tmp1, a_outmostpattern);
	    a_path->op = id;
	    result = Conspatternrepresentation(
		    tmp1,
		    syn_patterns( r_patterns, a_path )
		    );
	}
	OPNonLeafVariable( id, r_pattern ): {
	    condition = NilCexpression();
	    /* NEED to set a_path-> op to something useful */
	    /* or, better alternative, 'patch' it later when we have done all? */
	    elem_patternrepresentation tmp1 = PRNonLeafBinding( a_path, id, syn_outmostpattern( r_pattern, Nilpath()) );
	    a_path->id = f_phylumofpatternID(id);
	    clone_TypeFileLine(tmp1, a_outmostpattern);
	    result = Conspatternrepresentation(
		    tmp1,
		    syn_outmostpattern( r_pattern, a_path )
		    );
	}
	OPDefault( cond ): {
	    condition = cond;
	    elem_patternrepresentation tmp1 = PRDefault();
	    clone_TypeFileLine(tmp1, a_outmostpattern);
	    result = Conspatternrepresentation(
		    tmp1,
		    Nilpatternrepresentation()
		    );
	}
	OPWildcard( cond ): {
	    condition = cond;
	    elem_patternrepresentation tmp1 = PRWildcard( a_path );
	    clone_TypeFileLine(tmp1, a_outmostpattern);
	    result = Conspatternrepresentation(
		    tmp1,
		    Nilpatternrepresentation()
		    );
	}
    }
    if (!condition->is_nil())
        result->append(PRUserPredicate(condition));
    return result;
}

static patternrepresentation
syn_pattern(pattern $a_pattern, path a_path)
{
    PVariable( id ): {
	return Conspatternrepresentation(
		PRBinding( a_path, id ),
		Nilpatternrepresentation()
		);
    }
    POperator( id, r_patterns ): {
	a_path->op = id;
	return Conspatternrepresentation(
		PROperPredicate( Conspath( mkinteger(0), a_path ), id ),
		syn_patterns( r_patterns, a_path )
		);
    }
    PNonLeafVariable( id, r_pattern ): {
	return Conspatternrepresentation(
		PRNonLeafBinding( a_path, id, syn_pattern( r_pattern, Nilpath()) ),
		syn_pattern( r_pattern, a_path )
		);
    }
    PWildcard(): { /* we don't add this to the patternreps; as a result, every
		    * PRWildcard comes from an outermost default
		    */
	return Nilpatternrepresentation();
    }
    PStringLiteral( cexprdq ): {
	return Conspatternrepresentation(
		PRStringLiteral( a_path, cexprdq ),
		Nilpatternrepresentation()
		);
    }
    PIntLiteral( i ): {
	return Conspatternrepresentation(
		PRIntLiteral( a_path, i ),
		Nilpatternrepresentation()
		);
    }
}

static patternrepresentation
syn_patterns(patterns $a_patterns, path a_path)
{
    Nilpatterns(): {
	return Nilpatternrepresentation();
    }
    Conspatterns( *, * ): {
	return t_syn_patterns(  a_patterns, a_path , a_patterns->length( ) );
    }
}

static patternrepresentation
t_syn_patterns(patterns $a_patterns, path a_path, int branch)
{
    Nilpatterns(): {
	return Nilpatternrepresentation();
    }
    Conspatterns( a_pattern, r_patterns ): {
	return concat( t_syn_patterns(  r_patterns, a_path , branch-1 ), syn_pattern( a_pattern, Conspath( mkinteger(branch), a_path ) ) );
    }
}


/*
 * the above code should build the list of bindings and predicates...
 * To this list additional predicates should be added for the
 * variables that occur in it more than once.
 * Then the list should be ordered, taking care of expanding thingsd like
 *
 *                          a
 *                         / \
 *                        b   O1
 *                            |
 *                            O2
 *                            |
 *                            b=O3
 *                              |
 *                              c
 *
 *
 * This should be changed into
 *
 *                          a
 *                         / \
 *                     O3=b   O1
 *                     |      |
 *                     c      O2
 *                            |
 *                            b=O3
 *                              |
 *                              c
 *
 * to be sure that we get the right order of matching...
 */

/* HOWEVER, WE DO NOT YET BOTHER ABOUT THIS PROBLEM
   RIGHT Now we only collect/create the binding_predicates for multiple occurrences of
  the same idenfier in a pattern */

/*
 * administration of binding marks
 */

%{
bindingidmarks Thebindingidmarks = 0;
%}
%{ KC_TYPES_HEADER
extern bindingidmarks Thebindingidmarks;
%}

bindingidmarks {uniq}:
    list bindingidmark
;

bindingidmark {uniq}:
    BindingIdMark( uniqID )
{
    bool marked = false;
    {
	if (! Thebindingidmarks)
	    Thebindingidmarks = Consbindingidmarks( $0, Nilbindingidmarks() );
	else
	    Thebindingidmarks = Consbindingidmarks( $0, Thebindingidmarks );
}   }
;

bool
f_bindingidmarked(ID $id)
{
    Id( uid ): {
	return BindingIdMark( uid )->marked;
    }
}

void
v_markbindingid(ID $id)
{
    Id( uid ): {
	BindingIdMark( uid )->marked = true;
    }
}

void
v_resetbindingidmarks()
{
    if (Thebindingidmarks) {
      foreach( m; bindingidmarks Thebindingidmarks ) {
	m->marked = false;
    } }
}

/* code to create the predicates for multiple bindings of the same identifier */

/*
 * add_predicates and add_predicate
 * walks through the list of pattern_representations.
 * for each pattern representation:
 * if it is a Binding (leaf or non-leaf):
 *  - if it is marked,
 *  - if it isn't marked, mark it, start make_predicates for this variable and the rest of the list
 * go to next pattern_representation in the list
 */
patternrepresentations
add_predicates_to_patternrepresentations(patternrepresentations $a_patternreps)
{
    Nilpatternrepresentations(): {
	return Nilpatternrepresentations();
    }
    Conspatternrepresentations( a_patternrep, r_patternreps ): {
	patternrepresentation tmp;
	v_resetbindingidmarks(); /* necessary! - or we generate wrong code */
	tmp = add_predicates( a_patternrep );
	return Conspatternrepresentations(
		concat( a_patternrep, tmp ),
		add_predicates_to_patternrepresentations( r_patternreps )
		);
    }
}

static patternrepresentation
add_predicates(patternrepresentation $a_patternrep)
{
    Nilpatternrepresentation(): {
	return Nilpatternrepresentation();
    }
    Conspatternrepresentation( a_pattern_rep_elem, r_patternrep ): {
	patternrepresentation tmp_for_elem, tmp_for_rest;
	/* WARNING: the order of the next two statements is _very_ important!
	 * (because of the side-effect: marking of identifiers.
	 *  If they are reversed,
	 *  the identifiers would get marked 'from the end of the list',
	 *  (i.e. in add_predicates) and then the add_predicate call
	 *  would not generate any predicate...
	 * )
	 */
	tmp_for_elem = add_predicate( a_pattern_rep_elem, r_patternrep );
	tmp_for_rest = add_predicates( r_patternrep );
	return concat( tmp_for_elem, tmp_for_rest );

    }
}

static patternrepresentation
add_predicate(elem_patternrepresentation $a_patternrep_elem, patternrepresentation a_patternrep)
{
    PRBinding( *, id ),
    PRNonLeafBinding( *, id, * ): {
	if (! f_bindingidmarked( id )) {
	    v_markbindingid( id );
	    return make_predicates( a_patternrep_elem, a_patternrep );
	} else {
	    return Nilpatternrepresentation();
	}
    }
    default: {
	 return Nilpatternrepresentation();
    }
}

/*
 * t_make_predicates and make_predicates
 * create a PRVarPredicate for the variable (identifier) and the list of pattern_representations,
 * but only if the variable occurs more than once (ie. the pattern is not left_linear)
 * the left_linear parameter in t_make_predicates keeps track of this
 */
static patternrepresentation
t_make_predicates(ID a_id, paths a_paths, patternrepresentation a_subpattern, patternrepresentation $a_patternrep, bool left_linear)
{
    Nilpatternrepresentation(): {
	if (left_linear) {
	    return Nilpatternrepresentation();
	} else {
	    elem_patternrepresentation pred = PRVarPredicate(a_paths, a_id, a_subpattern);
	    pred->file = a_id->file, pred->line = a_id->line;
	    return Conspatternrepresentation( pred, Nilpatternrepresentation() );
	}
    }
    Conspatternrepresentation( aps_patternrep_elem, r_apatternrep ): {
	with( aps_patternrep_elem ) {
	    PRBinding( aps_path, aps_id ): {
		if ( a_id->eq( aps_id )) {
		    return t_make_predicates( a_id, Conspaths( aps_path, a_paths ), a_subpattern, r_apatternrep, false );
		} else {
		    return t_make_predicates( a_id, a_paths, a_subpattern, r_apatternrep, left_linear );
		}
	    }
	    PRNonLeafBinding( aps_path, aps_id, aps_subpattern ): {
		if ( a_id->eq( aps_id )) {
		    if ( test_matching_subpatterns( aps_subpattern, a_subpattern ) ) {
			return t_make_predicates( a_id, Conspaths( aps_path, a_paths ), concat( aps_subpattern, a_subpattern ), r_apatternrep, false );
		    } else {
			return t_make_predicates( a_id, a_paths, a_subpattern, r_apatternrep, false );
		    }
		} else {
		    return t_make_predicates( a_id, a_paths, a_subpattern, r_apatternrep, left_linear );
		}
	    }
	    /* other cases shouldn't happen */
	    default: {
		return t_make_predicates( a_id, a_paths, a_subpattern, r_apatternrep, left_linear );
	    }
	}
    }
}

static patternrepresentation
make_predicates(elem_patternrepresentation $a_patternrep_elem, patternrepresentation a_patternrep)
{
    PRBinding( a_path, a_id ): {
	return t_make_predicates( a_id, Conspaths( a_path, Nilpaths()), Nilpatternrepresentation(), a_patternrep, true );
    }
    PRNonLeafBinding( a_path, a_id, a_subpattern ): {
	return t_make_predicates( a_id, Conspaths( a_path, Nilpaths()), a_subpattern, a_patternrep, true );
    }
    /* other cases shouldn't happen */
}

/*
 * routine that can be used to test for certain properties, eg. to
 * test if patterns that follow (are below) non-leaf variables are
 * 'identical'
 * We can use this later on. For now we don't use it... always return true
 */
static bool
test_matching_subpatterns(patternrepresentation newp, patternrepresentation oldp)
{
    return true;
}


void
v_add_rewriterulesinfo_to_operator(patternrepresentations a_patternreps, rewriteclauses rc)
{
    foreach( a_patternrep; patternrepresentations a_patternreps ) {
	ID op = f_operatorofpatternrepresentation( a_patternrep );
	if (! op->eq( f_emptyId() )) {
	    alternative a = f_alternativeofoperator(op);
	    if (a) {
		foreach( r; rewriteclauses rc ) {
		    /* maybe we want to use an insert function to keep the rewriterulesinfo sorted */
		    a->rewriteinfo = insertin_rewriterulesinfo( Rewriteruleinfo( f_get_predicates( a_patternrep ), f_get_bindings( a_patternrep ), r ), a->rewriteinfo );
}   }   }   }   }


withcasesinfo
f_withcasesinfo(patternrepresentations a_patternreps, Ctext ct)
{
    withcasesinfo tmp = Nilwithcasesinfo();
    foreach( a_patternrep; patternrepresentations a_patternreps ) {
	with( a_patternrep ) {
	    Nilpatternrepresentation(): {/*EMPTY*/}
	    Conspatternrepresentation( /*a_patternrep_elem*/ *, /*r_patternrep*/ * ): {
		tmp = insertin_withcasesinfo( Withcaseinfo( f_get_predicates( a_patternrep ), f_get_bindings( a_patternrep ), ct ), tmp );
    }   }   }
    return tmp;
}

void
v_add_unparsedeclsinfo_to_operator(patternrepresentations a_patternreps, unparseclauses uc)
{
    foreach( a_patternrep; patternrepresentations a_patternreps ) {
	ID op = f_operatorofpatternrepresentation( a_patternrep );
	if (! op->eq( f_emptyId() )) {
	    alternative a = f_alternativeofoperator(op);
	    if (a) {
		foreach( u; unparseclauses uc ) {
		    /* maybe we want to use an insert function to keep the unparserulesinfo sorted */
		    a->unparseinfo = insertin_unparsedeclsinfo( Unparsedeclinfo( f_get_predicates( a_patternrep ), f_get_bindings( a_patternrep ), u ), a->unparseinfo );
}   }   }   }   }

/*
 * these functions can be rewritten in a split_function that returns a tuple of predicates and
 * bindings so that we only once walk through the list
 */
static patternrepresentation
f_get_predicates(patternrepresentation $a_patternrep)
{
    Nilpatternrepresentation(): {
	return Nilpatternrepresentation();
    }
    Conspatternrepresentation( a_patternrep_elem, r_patternrep ): {
	with( a_patternrep_elem ) {
	    PRBinding( *, * ),
	    PRNonLeafBinding( *, *, * ): {
		return f_get_predicates( r_patternrep );
	    }
	    default: {
		return Conspatternrepresentation( a_patternrep_elem, f_get_predicates( r_patternrep ) );
	    }
}   }   }

static patternrepresentation
f_get_bindings(patternrepresentation a_patternrep)
{
    patternrepresentation p;
    v_resetbindingidmarks();
    p = f_do_get_bindings( a_patternrep );
    v_resetbindingidmarks();
    return p;
}

static patternrepresentation
f_do_get_bindings(patternrepresentation $a_patternrep)
{
    Nilpatternrepresentation(): {
	return Nilpatternrepresentation();
    }
    Conspatternrepresentation( a_patternrep_elem, r_patternrep ): {
	with( a_patternrep_elem ) {
	    PRBinding( *, id ),
	    PRNonLeafBinding( *, id, * ): {
		if (! f_bindingidmarked( id )) {
		    v_markbindingid( id );
		    return Conspatternrepresentation( a_patternrep_elem, f_do_get_bindings( r_patternrep ) );
		} else {
		    return f_do_get_bindings( r_patternrep );
	    }   }
	    default: {
		return f_do_get_bindings( r_patternrep );
	    }
}   }   }


//
// Insert new rewrite rule into list of existing rules
//
static rewriterulesinfo
insertin_rewriterulesinfo(rewriteruleinfo new_rule, rewriterulesinfo $old_rules)
{
    Nilrewriterulesinfo(): {
	return Consrewriterulesinfo( new_rule, old_rules );
    }
    Consrewriterulesinfo( head_rule, rest_rules ): {
	if (lt_rewriteruleinfo( head_rule, new_rule )) {
	    return Consrewriterulesinfo( head_rule, insertin_rewriterulesinfo( new_rule, rest_rules ));
	} else {
	    return Consrewriterulesinfo( new_rule, old_rules );
}   }   }

static bool
lt_rewriteruleinfo(rewriteruleinfo $a_rwruleinfo1, rewriteruleinfo $a_rwruleinfo2)
{
    Rewriteruleinfo( a_patternrep1, *, * ) & Rewriteruleinfo( a_patternrep2, *, * ): {
	return lt_patternrepresentation( a_patternrep1, a_patternrep2 );
}   }

//
// Insert new with case into list of existing cases
//
withcasesinfo
insertin_withcasesinfo(withcaseinfo new_case, withcasesinfo $old_cases)
{
    Nilwithcasesinfo(): {
	return Conswithcasesinfo( new_case, old_cases );
    }
    Conswithcasesinfo( head_case, rest_cases ): {
	if (lt_withcaseinfo( head_case, new_case )) {
	    return Conswithcasesinfo( head_case, insertin_withcasesinfo( new_case, rest_cases ));
	} else {
	    return Conswithcasesinfo( new_case, old_cases );
}   }   }

bool
lt_withcaseinfo(withcaseinfo $a_withcaseinfo1, withcaseinfo $a_withcaseinfo2)
{
    Withcaseinfo( a_patternrep1, *, * ) & Withcaseinfo( a_patternrep2, *, * ): {
	    return lt_patternrepresentation( a_patternrep1, a_patternrep2 );
}   }

//
// Insert new unparse declaration into list of existing declarations
//
static unparsedeclsinfo
insertin_unparsedeclsinfo(unparsedeclinfo new_decl, unparsedeclsinfo $old_decls)
{
    Nilunparsedeclsinfo(): {
	return Consunparsedeclsinfo( new_decl, old_decls );
    }
    Consunparsedeclsinfo( head_decl, rest_decls ): {
	if (lt_unparsedeclinfo( head_decl, new_decl )) {
	    return Consunparsedeclsinfo( head_decl, insertin_unparsedeclsinfo( new_decl, rest_decls ));
	} else {
	    return Consunparsedeclsinfo( new_decl, old_decls );
}   }   }

static bool
lt_unparsedeclinfo(unparsedeclinfo $a_unparsedeclinfo1, unparsedeclinfo $a_unparsedeclinfo2)
{
    Unparsedeclinfo( a_patternrep1, *, * ) & Unparsedeclinfo( a_patternrep2, *, * ): {
	return lt_patternrepresentation( a_patternrep1, a_patternrep2 );
    }
}

//
// The bodies of some patterns are simply dropped when they cannot match.
// ATM this happens only for some patterns without real conditions, and
// all these are also diagnosed with the new pattern overlap code.

void
warn_drop_identical_pattern(rewriteruleinfo $rri)
{
    Rewriteruleinfo(pr, *, *): { warn_drop_identical_pattern(pr); }
}

void
warn_drop_identical_pattern(withcaseinfo $wci)
{
    Withcaseinfo(pr, *, *): { warn_drop_identical_pattern(pr); }
}

void
warn_drop_identical_pattern(unparsedeclinfo $udi)
{
    Unparsedeclinfo(pr, *, *): { warn_drop_identical_pattern(pr); }
}

void
warn_drop_identical_pattern(patternrepresentation $pr)
{
    Conspatternrepresentation(epr, *): {
        v_report(Warning(FileLine( epr->file, epr->line ),
                    Problem1S("Warning: dropped pattern")));
    }
    default: {
        assertionFailed("Dropping empty pattern");
    }
}

//
// Compare two patterns
// using their flattened patternrepresentation
//
static bool
lt_patternrepresentation(patternrepresentation pr1, patternrepresentation pr2)
{
    foreach(p1 & p2; patternrepresentation pr1, patternrepresentation pr2) {
	with( equal_elem_patternrepresentation(p1, p2) ) {
	    Smaller(): { return true; }
	    Bigger():  { return false; }
	    default:   { /* continue */ }
	}
    }
    afterforeach ($re1 & $re2) {
	// Both patterns are of the same specificity; not lt in this weak order
	Nilpatternrepresentation & Nilpatternrepresentation,
	Nilpatternrepresentation & *:   { return false; }
	* & Nilpatternrepresentation(): { return true; }
    }
}

// Compare two elements of a pattern; Smaller means 'more specific'
//
// PRStringLiteral=PRIntLiteral=PROperPredicate < PRVarPredicate < all others
static tribool
equal_elem_patternrepresentation(elem_patternrepresentation $a_patternrep_elem1, elem_patternrepresentation $a_patternrep_elem2)
{
    PRDefault() & PRDefault(),
    PRUserPredicate( * ) & PRUserPredicate( * ): {
	return Equal();
    }
    PRVarPredicate( a_paths1, *, * ) & PRVarPredicate( a_paths2, *, * ): {
	return equal_paths( a_paths1, a_paths2 );
    }
    PROperPredicate( a_path1, * ) & PROperPredicate( a_path2, * ),
    PRWildcard( a_path1 ) & PRWildcard( a_path2 ),
    PRBinding( a_path1, * ) & PRBinding( a_path2, * ),
    PRNonLeafBinding( a_path1, *, * ) & PRNonLeafBinding( a_path2, *, * ),
    PRStringLiteral( a_path1, * ) & PRStringLiteral( a_path2, * ),
    PRIntLiteral( a_path1, * ) & PRIntLiteral( a_path2, * ),

    PRStringLiteral( a_path1, * ) & PROperPredicate( a_path2, * ),
    PROperPredicate( a_path1, * ) & PRStringLiteral( a_path2, * ),

    PRIntLiteral( a_path1, * ) & PROperPredicate( a_path2, * ),
    PROperPredicate( a_path1, * ) & PRIntLiteral( a_path2, * ),

    PRStringLiteral( a_path1, * ) & PRIntLiteral( a_path2, * ),
    PRIntLiteral( a_path1, * ) & PRStringLiteral( a_path2, * ): {
	return equal_path( a_path1, a_path2 );
    }

    PRStringLiteral( *, * ) & PRVarPredicate( *, *, * ):    { return Smaller(); }
    PRVarPredicate( *, *, * ) & PRStringLiteral( *, * ):    { return Bigger(); }

    PRIntLiteral( *, * ) & PRVarPredicate( *, *, * ):	    { return Smaller(); }
    PRVarPredicate( *, *, * ) & PRIntLiteral( *, * ):	    { return Bigger(); }

    PROperPredicate( *, * ) & PRVarPredicate( *, *, * ):    { return Smaller(); }
    PRVarPredicate( *, *, * ) & PROperPredicate( *, * ):    { return Bigger(); }

    PRWildcard( * ) & PRDefault():			    { return Smaller(); }
    PRDefault() & PRWildcard( * ):			    { return Bigger(); }

    * & PRDefault():					    { return Smaller(); }
    PRDefault() & *:					    { return Bigger(); }

    * & PRWildcard( * ):				    { return Smaller(); }
    PRWildcard( * ) & *:				    { return Bigger(); }

    * & PRBinding( *, * ):				    { return Smaller(); }
    PRBinding( *, * ) & *:				    { return Bigger(); }

    * & PRNonLeafBinding( *, *, * ):			    { return Smaller(); }
    PRNonLeafBinding( *, *, * ) & *:			    { return Bigger(); }

    * & PRUserPredicate( * ):				    { return Smaller(); }
    PRUserPredicate( * ) & *:				    { return Bigger(); }

}

static tribool
equal_path(path a_path1, path a_path2)
{
    path r_a_path1=a_path1->reverse(), r_a_path2=a_path2->reverse();
    tribool ret;
    bool breakforeach = false;
    foreach(i1 & i2; path r_a_path1, path r_a_path2) {
	if (!breakforeach)
	if ( i1->value < i2->value )
	    ret = Smaller(), breakforeach = true;
	else if (i1->value > i2->value )
	    ret = Bigger(), breakforeach = true;
    }
    afterforeach ($re1 & $re2) {
	Nilpath & Nilpath:  { ret = breakforeach ? ret : Equal(); }
	Conspath & Nilpath: { ret = breakforeach ? ret : Smaller(); }
	Nilpath & Conspath: { ret = breakforeach ? ret : Bigger(); }
    }
    r_a_path1->freelist(); r_a_path2->freelist();
    return ret;
}

static tribool
equal_paths(paths a_paths1, paths a_paths2)
{
    foreach(path1 & path2; paths a_paths1, paths a_paths2) {
	with( equal_path( path1, path2 ) ) {
	    Smaller: { return Smaller(); }
	    Bigger:  { return Bigger(); }
	    default: { /* continue */ }
	}
    }
    afterforeach ($re1 & $re2) {
	Nilpaths & Nilpaths:  { return Equal(); }
	Conspaths & Nilpaths: { return Smaller(); }
	Nilpaths & Conspaths: { return Bigger(); }
    }
}

void
check_rewrite_patterns(rewriterulesinfo rri)
{
    elem_patternrepresentation outmost_nl = f_outmost_nl_preds_in_rewriterulesinfo(rri);
    if (outmost_nl)
	v_report(Warning(FileLine( outmost_nl->file, outmost_nl->line ),
		    Problem1S("Cannot handle outmost non-leaf predicates")));

    patternrepresentations prs = Nilpatternrepresentations();
    // Extract patterns from info; also turns list, but that doesn't matter
    foreach(Rewriteruleinfo(pr, *, *); rewriterulesinfo rri) {
	prs = Conspatternrepresentations(pr, prs);
    }
    check_patterns(prs);
    prs->freelist();
}

void
check_with_patterns(withcasesinfo wcs)
{
    patternrepresentations prs = Nilpatternrepresentations(), prs_rev;
    // Extract patterns from info; also turns list, so we turn it back
    foreach(Withcaseinfo(pr, *, *); withcasesinfo wcs) {
	prs = Conspatternrepresentations(pr, prs);
    }
    prs_rev=prs->reverse();
    check_patterns(prs_rev);
    prs->freelist();
    prs_rev->freelist();
}

void
check_unparse_patterns(unparsedeclsinfo udi)
{
    elem_patternrepresentation outmost_nl = f_outmost_nl_preds_in_unparsedeclsinfo(udi);
    if (outmost_nl)
	v_report(Warning(FileLine( outmost_nl->file, outmost_nl->line ),
		    Problem1S("Cannot handle outmost non-leaf predicates")));

    patternrepresentations prs = Nilpatternrepresentations();
    // Extract patterns from info; also turns list, but that doesn't matter
    foreach(Unparsedeclinfo(pr, *, *); unparsedeclsinfo udi) {
	prs = Conspatternrepresentations(pr, prs);
    }
    check_patterns(prs);
    prs->freelist();
}

// TODO This function could well use list iterators
void
check_patterns(patternrepresentations prs)
{
    // No need to check if no or only one pattern
    if (prs->is_nil() || prs->patternrepresentations_1->is_nil()) return;

    patternrepresentations iterate = prs;
    // As long as at least two patterns remain in the list
    while (!prs->patternrepresentations_1->is_nil()) {
	foreach(pr2; patternrepresentations prs->patternrepresentations_1) {
	    compare_patterns(prs->patternrepresentation_1, pr2, prs);
	}
	prs=prs->patternrepresentations_1;
    }
    // Sadly this line would test the whole matrix instead of only half it it
    // foreach(pr1; patternrepresentations prs) foreach(pr2; patternrepresentations prs)
}

// TODO This function could well use list iterators
patternrepresentation next(patternrepresentation p) { return p->patternrepresentation_1; }
elem_patternrepresentation elem(patternrepresentation p) { return p->elem_patternrepresentation_1; }

// There are five states:
//  - two patterns do not intersect (good)
//  - one is more specific than the other (good, that's two states)
//  - two patterns are equivalent (bad)
//  - neither is more specific (bad, but perhaps there is another covering the intersection)
void
compare_patterns(patternrepresentation pr1, patternrepresentation pr2,
	patternrepresentations other_patterns)
{
    bool pr1_isMoreSpecific = false, pr2_isMoreSpecific = false;
    elem_patternrepresentation epr1 = elem(pr1), epr2 = elem(pr2);
    patternrepresentation i1 = pr1, i2 = pr2, intersection = Nilpatternrepresentation();

    while(!(i1->is_nil() || i2->is_nil())) {
	if (elem(i1)->eq(elem(i2))) {
	    intersection->append(elem(i1));
	    i1=next(i1);
	    i2=next(i2);
	}
	else {
	    with (elem(i1), elem(i2)) {
		PROperPredicate( a_path1, * ) & PROperPredicate( a_path2, * ),
		//PRWildcard( a_path1 ) & PRWildcard( a_path2 ),
		//PRBinding( a_path1, * ) & PRBinding( a_path2, * ),
		//PRNonLeafBinding( a_path1, *, * ) & PRNonLeafBinding( a_path2, *, * ),
		PRStringLiteral( a_path1, * ) & PRStringLiteral( a_path2, * ),
		PRIntLiteral( a_path1, * ) & PRIntLiteral( a_path2, * ),

		PRStringLiteral( a_path1, * ) & PROperPredicate( a_path2, * ),
		PROperPredicate( a_path1, * ) & PRStringLiteral( a_path2, * ),

		PRIntLiteral( a_path1, * ) & PROperPredicate( a_path2, * ),
		PROperPredicate( a_path1, * ) & PRIntLiteral( a_path2, * ),

		PRStringLiteral( a_path1, * ) & PRIntLiteral( a_path2, * ),
		PRIntLiteral( a_path1, * ) & PRStringLiteral( a_path2, * ): {
		    with(equal_path( a_path1, a_path2 )) {
			Equal(): { /* Great! Different things in same position,
				      patterns don't intersect. */ return; }
			Smaller(): { // pr1 has something were pr2 hasn't, it's more specific
			    pr1_isMoreSpecific=true;
			    intersection->append(elem(i1));
			    i1=next(i1);
			}
			Bigger(): { // pr2 has something were pr1 hasn't, it's more specific
			    pr2_isMoreSpecific=true;
			    intersection->append(elem(i2));
			    i2=next(i2);
			}
		    }
		}
		* & PRDefault,
		PRDefault & *: { /* The default is very unspecific */ return; }
		* & PRWildcard,
		PRWildcard & *: { /* An outermost wildcard in a with */ return; }
		PRDefault & PRDefault,
		PRWildcard & PRWildcard,
		default: {
		    if(g_options.verbose) {
			printf("Don't know how to compare these yet:\n");
			printf("%s:%d ", epr1->file->name, epr1->line); elem(i1)->print();
			printf("%s:%d ", epr2->file->name, epr2->line); elem(i2)->print();
		    }
		    return;
		}
	    }
	}
    } // while
    // Test whether we used one list up earlier than the other
    if (!(i1->is_nil() && i2->is_nil())) {
	patternrepresentation new_intersect;
	if (i1->is_nil()) {
	    new_intersect = concat(intersection, i2);
	    pr2_isMoreSpecific = true;
	} else {
	    new_intersect = concat(intersection, i1);
	    pr1_isMoreSpecific = true;
	}
	intersection->freelist();
	intersection=new_intersect;
    }

    if (!pr1_isMoreSpecific && !pr2_isMoreSpecific) {
	// Patterns equivalent
	if (g_options.warn_equivalent_patterns) v_report(Warning(FileLine( epr1->file, epr1->line ),
		    Problem3S1int1S("pattern equivalent to",
			epr2->file->name, "line", epr2->line, "(will never match)") ));
    } else if (!pr1_isMoreSpecific || !pr2_isMoreSpecific) {
	// One is more specific than the other, that's OK
	return;
    } else {
	bool I_had_better = false;
	foreach(pr; patternrepresentations other_patterns) {
	    if (pr->eq(intersection))
		I_had_better = true;
	}
        if (!I_had_better && g_options.warn_overlapping_patterns)
            v_report(Warning(FileLine( epr1->file, epr1->line ),
                        Problem3S1int1S("pattern overlaps",
                            epr2->file->name, "line", epr2->line, "(which will match?)") ));
    }
}

// vim:sts=4:ts=8:cino=g0,t0,\:0
