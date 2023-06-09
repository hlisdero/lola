/* translation of file "gen.k" */
/* generated by:
 *  @(#)$Author: Kimwitu++ version 2.3.11 (C) 1998-2007 Humboldt-University of Berlin $
 */
#define KC_FUNCTIONS_gen

#include <stdlib.h>
#include "k.h"
#include "gen.h"
namespace kc { }
using namespace kc;
/* included stuff */
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

static char gen_kAccesSid[] = "@(#)$Id: gen.k,v 1.151 2007-01-30 14:10:29 piefel Exp $";

/* end included stuff */


namespace kc {

#ifndef KC_TRACE_PROVIDED
#define KC_TRACE_PROVIDED(COND,FILE,LINE,NODE) COND
#endif

enum_operators f_selofoperator(ID oid)
{
    int kc_i, kc_end = one_before_first_operator;
    kc_i=kc_end;
    {
	phylumdeclarations kc_fe_selvar_1 =  Thephylumdeclarations ;

	while(
		kc_fe_selvar_1->prod_sel() == sel_Consphylumdeclarations
	    ) {
	    phylumdeclaration kc_selvar_0_1 = kc_fe_selvar_1->phylumdeclaration_1;
	    {
		{
		    {
			const phylumdeclaration p = kc_selvar_0_1;
			{
			    phylumdeclaration kc_selvar_1_1 = phylum_cast<phylumdeclaration>(p);
			    if ((kc_selvar_1_1->prod_sel() == sel_PhylumDeclaration) && (phylum_cast<const impl_phylumdeclaration_PhylumDeclaration*>(kc_selvar_1_1)->productionblock_1->prod_sel() == sel_ListAlternatives)) {
				const alternatives alts = phylum_cast<const impl_productionblock_ListAlternatives*>(phylum_cast<const impl_phylumdeclaration_PhylumDeclaration*>(kc_selvar_1_1)->productionblock_1)->alternatives_1;

				{
				    alternatives kc_fe_selvar_1 =  alts ;

				    while(
					    kc_fe_selvar_1->prod_sel() == sel_Consalternatives
					) {
					alternative kc_selvar_2_1 = kc_fe_selvar_1->alternative_1;
					{
					    {
						if ((kc_selvar_2_1->prod_sel() == sel_Alternative)) {
						    const ID id = phylum_cast<const impl_alternative_Alternative*>(kc_selvar_2_1)->ID_1;

						    kc_end++;
						    if (oid->eq(id)) kc_i=kc_end;

						} else
						{/* EMPTY */ /*skip: no matching pattern in foreach patterns*/}
					    }

					}
					kc_fe_selvar_1 = kc_fe_selvar_1->alternatives_1;

				    }
				}

			    } else
				if ((kc_selvar_1_1->prod_sel() == sel_PhylumDeclaration) && (phylum_cast<const impl_phylumdeclaration_PhylumDeclaration*>(kc_selvar_1_1)->productionblock_1->prod_sel() == sel_NonlistAlternatives)) {
				const alternatives alts = phylum_cast<const impl_productionblock_NonlistAlternatives*>(phylum_cast<const impl_phylumdeclaration_PhylumDeclaration*>(kc_selvar_1_1)->productionblock_1)->alternatives_1;

				{
				    alternatives kc_fe_selvar_1 =  alts ;

				    while(
					    kc_fe_selvar_1->prod_sel() == sel_Consalternatives
					) {
					alternative kc_selvar_2_1 = kc_fe_selvar_1->alternative_1;
					{
					    {
						if ((kc_selvar_2_1->prod_sel() == sel_Alternative)) {
						    const ID id = phylum_cast<const impl_alternative_Alternative*>(kc_selvar_2_1)->ID_1;

						    kc_end++;
						    if (oid->eq(id)) kc_i=kc_end;

						} else
						{/* EMPTY */ /*skip: no matching pattern in foreach patterns*/}
					    }

					}
					kc_fe_selvar_1 = kc_fe_selvar_1->alternatives_1;

				    }
				}

			    } else
				if ((kc_selvar_1_1->prod_sel() == sel_PhylumDeclaration) && (phylum_cast<const impl_phylumdeclaration_PhylumDeclaration*>(kc_selvar_1_1)->productionblock_1->prod_sel() == sel_PredefinedAlternatives)) {
				const alternatives alts = phylum_cast<const impl_productionblock_PredefinedAlternatives*>(phylum_cast<const impl_phylumdeclaration_PhylumDeclaration*>(kc_selvar_1_1)->productionblock_1)->alternatives_1;

				{
				    alternatives kc_fe_selvar_1 =  alts ;

				    while(
					    kc_fe_selvar_1->prod_sel() == sel_Consalternatives
					) {
					alternative kc_selvar_2_1 = kc_fe_selvar_1->alternative_1;
					{
					    {
						if ((kc_selvar_2_1->prod_sel() == sel_Alternative)) {
						    const ID id = phylum_cast<const impl_alternative_Alternative*>(kc_selvar_2_1)->ID_1;

						    kc_end++;
						    if (oid->eq(id)) kc_i=kc_end;

						} else
						{/* EMPTY */ /*skip: no matching pattern in foreach patterns*/}
					    }

					}
					kc_fe_selvar_1 = kc_fe_selvar_1->alternatives_1;

				    }
				}

			    } else
			    { kc_no_default_in_with( "f_selofoperator", __LINE__, __FILE__ );
				return static_cast<enum_operators>(0); }
			}

		    }
		}

	    }
	    kc_fe_selvar_1 = kc_fe_selvar_1->phylumdeclarations_1;

	}
    }
    return static_cast<enum_operators>(kc_end-kc_i+1);

}

void freespineandelements(unparseviewsinfo a_unparseviewsinfo)
{
    abstract_phylum kc_p = a_unparseviewsinfo;
    while(kc_p) {
	if (kc_p->subphylum(0)) kc_p->subphylum(0)->free(false);
	kc_p = kc_p->subphylum(1);
    };
    a_unparseviewsinfo->freelist();

}

void freespineandelements(rewriteviewsinfo a_rewriteviewsinfo)
{
    abstract_phylum kc_p = a_rewriteviewsinfo;
    while(kc_p) {
	if (kc_p->subphylum(0)) kc_p->subphylum(0)->free(false);
	kc_p = kc_p->subphylum(1);
    };
    a_rewriteviewsinfo->freelist();

}


} // namespace kc
