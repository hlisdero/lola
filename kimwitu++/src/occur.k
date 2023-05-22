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
// occur.k
//
%{
  static char occur_kAccesSid[] = "@(#)$Id: occur.k,v 1.9 2007-01-30 14:10:30 piefel Exp $";
%}

%{ KC_TYPES_HEADER
#include "occur.h"
%}

%{
inline static void
NF(ID id, problem prob)
{
    v_report(NonFatal( FileLine( id->file, id->line ), prob));
}
%}

/////////////////////////////////////////////////////////////////////
// The following function used to be in defocc.k
//

void
v_defoccur(ID id, IDtype it)
{
    uniqID uid;
    with( id ) { Id( _uid ): { uid = _uid; } }
    id->type = it;

    with( id->type, uid->type ) {
	ITUnknown & *: { return; }
	* & ITUnknown: { uid->type = it; uid->line = id->line; uid->file = id->file; return; }
	default : { /* an error, PASS */ }
    }

    with( id->type, uid->type ) {
	ITPredefinedPhylum & ITPredefinedPhylum: {
	    NF(id, Problem1S1ID( "illegal predefinition of predefined phylum:", id )); }
	ITPredefinedPhylum & ITUserPhylum: {
	    NF(id, Problem1S1ID( "illegal predefinition of phylum:", id )); }
	ITPredefinedPhylum & *: {
	    NF(id, Problem1S1t1S1ID( "illegal predefinition of ", uid->type, "as phylum:", id )); }

	ITUserPhylum & ITPredefinedPhylum: {
	    NF(id, Problem1S1ID( "illegal redefinition of predefined phylum:", id )); }
	ITUserPhylum & ITUserPhylum: {
	    NF(id, Problem1S1ID( "illegal redefinition of phylum:", id )); }
	ITUserPhylum & *: {
	    NF(id, Problem1S1t1S1ID( "illegal redefinition of ", uid->type, "as phylum:", id )); }

	ITPredefinedOperator & ITPredefinedOperator: {
	    NF(id, Problem1S1ID( "illegal predefinition of predefined operator:", id )); }
	ITPredefinedOperator & ITUserOperator: {
	    NF(id, Problem1S1ID( "illegal predefinition of operator:", id )); }
	ITPredefinedOperator & *: {
	    NF(id, Problem1S1t1S1ID( "illegal predefinition of ", uid->type, "as operator:", id )); }

	ITUserOperator & ITPredefinedOperator: {
	    NF(id, Problem1S1ID( "illegal redefinition of predefined operator:", id )); }
	ITUserOperator & ITUserOperator: {
	    NF(id, Problem1S1ID( "illegal redefinition of operator:", id )); }
	ITUserOperator & *: {
	    NF(id, Problem1S1t1S1ID( "illegal redefinition of ", uid->type, "as operator:", id )); }

	ITPredefinedStorageClass & ITPredefinedStorageClass: {
	    NF(id, Problem1S1ID( "illegal predefinition of predefined storage class:", id )); }
	ITPredefinedStorageClass & ITStorageClass(): {
	    NF(id, Problem1S1ID( "illegal predefinition of storage class:", id )); }
	ITPredefinedStorageClass & *: {
	    NF(id, Problem1S1t1S1ID( "illegal predefinition of ", uid->type, "as storage class:", id )); }

	ITStorageClass & ITPredefinedStorageClass: {
	    NF(id, Problem1S1ID( "illegal redefinition of predefined storage class:", id )); }
	ITStorageClass & ITStorageClass: {
	    NF(id, Problem1S1ID( "illegal redefinition of storage class:", id )); }
	ITStorageClass & *: {
	    NF(id, Problem1S1t1S1ID( "illegal redefinition of ", uid->type, "as storage class", id )); }

	ITUserFunction( it_fnc ) & ITUserFunction( GlobalFn() ): {
	    /* TODO
	     NF(id, Problem1S1ID( "illegal redefinition of global function:", id ));
	     */
	}
	ITUserFunction( it_fnc ) & ITUserFunction(StaticFn( * ) ): {
	    with( it_fnc ) {
		GlobalFn(): { NF(id, Problem1S1ID( "illegal redefinition of local function:", id )); }
		StaticFn( * ): {
		    if (uid->file->eq(id->file ))
			 NF(id, Problem1S1ID( "illegal redefinition of local function:", id ));
	}   }   }
	ITUserFunction & ITUserFunction(MemberFn()): { /* TODO class check */}
	ITUserFunction & ITUserFunction(ConstructorFn()): { /* MPi: EMPTY? */ }
	ITUserFunction & ITUserFunction(DestructorFn()): { /* MPi: EMPTY? */ }
	ITUserFunction & *: {
	    NF(id, Problem1S1t1S1ID( "illegal redefinition of ", uid->type, "as function", id )); }

	ITPredefinedUView & ITPredefinedUView(): {
	    NF(id, Problem1S1ID( "illegal predefinition of predefined unparse view:", id )); }
	ITPredefinedUView & ITUserUView(): {
	    NF(id, Problem1S1ID( "illegal predefinition of unparse view:", id )); }
	ITPredefinedUView & *: {
	    NF(id, Problem1S1t1S1ID( "illegal predefinition of ", uid->type, "as unparse view", id )); }

	ITUserUView & ITPredefinedUView: {
	    NF(id, Problem1S1ID( "illegal redefinition of predefined unparse view:", id )); }
	ITUserUView & ITUserUView: {
	    NF(id, Problem1S1ID( "illegal redefinition of unparse view:", id )); }
	ITUserUView & *: {
	    NF(id, Problem1S1t1S1ID( "illegal redefinition of ", uid->type, "as unparse view", id )); }

	ITPredefinedRView & ITPredefinedRView(): {
	    NF(id, Problem1S1ID( "illegal predefinition of predefined rewrite view:", id )); }
	ITPredefinedRView & ITUserRView: {
	    NF(id, Problem1S1ID( "illegal predefinition of rewrite view:", id )); }
	ITPredefinedRView & *: {
	    NF(id, Problem1S1t1S1ID( "illegal predefinition of ", uid->type, "as rewrite view", id )); }

	ITUserRView & ITPredefinedRView: {
	    NF(id, Problem1S1ID( "illegal redefinition of predefined rewrite view:", id )); }
	ITUserRView & ITUserRView: {
	    NF(id, Problem1S1ID( "illegal redefinition of rewrite view:", id )); }
	ITUserRView & *: {
	    NF(id, Problem1S1t1S1ID( "illegal redefinition of ", uid->type, "as rewrite view", id )); }

	ITPatternVariable( *, i_s ) & ITPatternVariable( *, id_s ): {
	    if (i_s == id_s)
		NF(id, Problem1S1ID( "illegal redefinition of pattern variable:", id )); }
	ITPatternVariable( *, i_s ) & *: {
	    NF(id, Problem1S1t1S1ID( "illegal redefinition of ", uid->type, "as pattern variable", id )); }
    }
}


/////////////////////////////////////////////////////////////////////
// The following functions used to be in extocc.k
//

void
v_extendoccur(ID id, IDtype it) { do_v_extendoccur( id, it, true); }

void
v_extendoccur_nowarning(ID id, IDtype it) { do_v_extendoccur( id, it, false); }

static void
do_v_extendoccur(ID id, IDtype it, bool warn)
{
    uniqID uid;
    with( id ) { Id( _uid ): { uid = _uid; } }
    id->type = it;

    with( id->type, uid->type ) {
	ITUnknown & *: { return; }
	* & ITUnknown: { uid->type = it; uid->line = id->line; uid->file = id->file; return; }
	default : { /* possibly an error, PASS */ }
    }

    with( id->type, uid->type ) {
	ITPredefinedPhylum & ITPredefinedPhylum: { /* EMPTY */ }
	ITPredefinedPhylum & ITUserPhylum: {
	    NF(id, Problem1S1ID( "illegal extension of phylum:", id )); }
	ITPredefinedPhylum & *: {
	    NF(id, Problem1S1t1S1ID( "illegal extension of ", uid->type, "as phylum", id )); }

	ITUserPhylum & ITPredefinedPhylum: {
	    NF(id, Problem1S1ID( "illegal extension of predefined phylum:", id )); }
	ITUserPhylum & ITUserPhylum: { /* EMPTY */ }
	ITUserPhylum & *: {
	    NF(id, Problem1S1t1S1ID( "illegal extension of ", uid->type, "as phylum:", id )); }

	ITPredefinedOperator & ITPredefinedOperator: {
	    NF(id, Problem1S1ID( "illegal extension of predefined operator:", id )); }
	ITPredefinedOperator & ITUserOperator: {
	    NF(id, Problem1S1ID( "illegal extension of operator:", id )); }
	ITPredefinedOperator & *: {
	    NF(id, Problem1S1t1S1ID( "illegal extension of ", uid->type, "as operator:", id )); }

	ITUserOperator & ITPredefinedOperator: {
	    NF(id, Problem1S1ID( "illegal extension of predefined operator:", id )); }
	ITUserOperator & ITUserOperator: {
	    NF(id, Problem1S1ID( "illegal redefinition of operator:", id )); }
	ITUserOperator & *: {
	    NF(id, Problem1S1t1S1ID( "illegal extension of ", uid->type, "as operator:", id )); }

	ITPredefinedStorageClass & ITPredefinedStorageClass: {
	    NF(id, Problem1S1ID( "illegal extension of predefined storage class:", id )); }
	ITPredefinedStorageClass & ITStorageClass(): {
	    NF(id, Problem1S1ID( "illegal extension of storage class:", id )); }
	ITPredefinedStorageClass & *: {
	    NF(id, Problem1S1t1S1ID( "illegal extension of ", uid->type, "as storage class:", id )); }

	ITStorageClass & (ITPredefinedStorageClass, ITStorageClass): { /* EMPTY */ }
	ITStorageClass & *: {
	    NF(id, Problem1S1t1S1ID( "illegal extension of ", uid->type, "as storage class:", id )); }

	ITUserFunction & ITUserFunction: {
	    NF(id, Problem1S1ID( "illegal extension of function:", id )); }
	ITUserFunction & *: {
	    NF(id, Problem1S1t1S1ID( "illegal extension of", uid->type, "as function:", id )); }

	ITPredefinedUView & ITPredefinedUView(): {
	    NF(id, Problem1S1ID( "illegal extension of predefined unparse view:", id )); }
	ITPredefinedUView & ITUserUView(): {
	    NF(id, Problem1S1ID( "illegal extension of unparse view:", id )); }
	ITPredefinedUView & *: {
	    NF(id, Problem1S1t1S1ID( "illegal extension of ", uid->type, "as unparse view", id )); }

	ITUserUView & ITPredefinedUView: {
	    if (warn) NF(id, Problem1S1ID( "superfluous redeclaration of predefined unparse view:", id )); }
	ITUserUView & ITUserUView: {
	    if (warn) NF(id, Problem1S1ID( "superfluous redeclaration of unparse view:", id )); }
	ITUserUView & *: {
	    NF(id, Problem1S1t1S1ID( "illegal extension of ", uid->type, "as unparse view", id )); }

	ITPredefinedRView & ITPredefinedRView(): {
	    NF(id, Problem1S1ID( "illegal extension of predefined rewrite view:", id )); }
	ITPredefinedRView & ITUserRView(): {
	    NF(id, Problem1S1ID( "illegal extension of rewrite view:", id )); }
	ITPredefinedRView & *: {
	    NF(id, Problem1S1t1S1ID( "illegal extension of ", uid->type, "as rewrite view", id )); }

	ITUserRView & ITPredefinedRView: {
	    if (warn) NF(id, Problem1S1ID( "superfluous redeclaration of predefined rewrite view:", id )); }
	ITUserRView & ITUserRView: {
	    if (warn) NF(id, Problem1S1ID( "superfluous redeclaration of rewrite view:", id )); }
	ITUserRView & *: {
	    NF(id, Problem1S1t1S1ID( "illegal extension of ", uid->type, "as rewrite view", id )); }

	ITPatternVariable( id_id, id_scope ) & ITPatternVariable( uid_id, uid_scope ): {
	    if (id_scope == uid_scope) {
		if (! id_id->eq( uid_id )) {
		    NF(id, Problem1S1ID1S1ID1S1ID( "type mismatch in redefinition of pattern variable:", id, "old type", uid_id, "new type", id_id ));
		}
	    } else {
		uid->scopeinfo = Consscopetypefilelinestack( ScopeTypeFileLine(id_scope, uid->type, uid->file, mkinteger(uid->line)), uid->scopeinfo );
		uid->type = it;
		uid->line = id->line;
		uid->file = id->file;
	}   }
	ITPatternVariable( t_id, t_scope ) & *: {
	    NF(id, Problem1S1t1S1ID( "illegal extension of", uid->type, "as pattern variable:", id )); }
    }
}


/////////////////////////////////////////////////////////////////////
// The following functions used to be in useocc.k
//

bool
f_useoccuroperator(ID $id)
{
    Id( uid ): { with( uid->type ) {
	ITPredefinedOperator( *, *): {
	    NF(id, Problem1S1ID( "undefined operator (it's predefined, you're not supposed to use those):", id ));
	    return false;}
	ITUserOperator( *, * ): { return true; }
	default: { NF(id, Problem1S1tID( "undefined operator", id )); return false; }
}   }   }


bool
f_warnifnotvariable(ID $id)
{
    Id( uid ): { with( uid->type ) {
	ITPatternVariable( *, * ),
	ITUnknown(): { return false; }
	default: { NF(id, Problem1S1tID( "variable expected:", id )); return true; }
}   }   }


bool
f_useoccurphylum(ID $id)
{
    Id( uid ): { with( uid->type ) {
	ITPredefinedPhylum( * ): { return true;}
	ITUserPhylum( * ): { return true;}
	default: { NF(id, Problem1S1tID( "undefined phylum", id )); return false; }
}   }   }


bool
f_useoccurlistphylum(ID $id)
{
    Id( uid ): { with( uid->type ) {
	ITUserPhylum( pd ): { with( pd ) {
	    PhylumDeclaration( *, *, Emptyproductionblock(), * ): {
		NF(id, Problem1S1ID( "undefined list phylum (the productionblock is empty):", id ));
		return false; }
	    PhylumDeclaration( *, *, ListAlternatives( *, * ), * ): { return true; }
	    PhylumDeclaration( *, *, NonlistAlternatives( * ), * ): {
		NF(id, Problem1S1ID( "undefined list phylum (it's a non-list phylum):", id ));
		return false; }
	    PhylumDeclaration( *, *, PredefinedAlternatives( * ), * ): {
		NF(id, Problem1S1ID( "undefined list phylum (it's a predefined phylum):", id ));
		return false; }
	}   }
	default: { NF(id, Problem1S1tID( "undefined list phylum", id )); return false; }
}   }   }


bool
f_useoccuruviewname(ID $id)
{
    Id( uid ): { with( uid->type ) {
	ITPredefinedUView(): { return true; }
	ITUserUView(): { return true; }
	default: { NF(id, Problem1S1tID( "undefined unparse view:", id )); return false; }
}   }   }


bool
f_useoccurrviewname(ID $id)
{
    Id( uid ): { with( uid->type ) {
	ITPredefinedRView(): { return true; }
	ITUserRView(): { return true; }
	default: { NF(id, Problem1S1tID( "undefined rewrite view:", id )); return false; }
}   }   }


bool
f_useoccurstorageclass(ID $id)
{
    Id( uid ): { with( uid->type ) {
	ITPredefinedStorageClass(): { return true; }
	ITStorageClass(): { return true; }
	default: { NF(id, Problem1S1tID( "undefined storage class:", id )); return false; }
}   }   }


static bool
occurlanguagename(ID id)
{
    foreach( l_id ; languagenames Thelanguages) {
	if(id->eq(l_id)) {
	    return true;
	}
    }
    v_report(Fatal( FileLine( id->file, id->line ),
		Problem1S1tID( "undefined language name:", id )));
    return false;
}

bool
f_useoccurlanguagename(languagenames $names)
{
    Conslanguagenames( id, tail): {
	bool res=f_useoccurlanguagename( tail );
	return occurlanguagename( id ) && res;
    }
    Nillanguagenames: { return true; }
}


bool
f_useoccurpatternvariable(ID $id)
{
    Id( uid ): { with( uid->type ) {
	ITPatternVariable( *, * ): { return true; }
	default: { NF(id, Problem1S1tID( "undefined pattern variable:", id )); return false; }
}   }   }

// vim:sts=4:ts=8:cino=g0,t0,\:0
