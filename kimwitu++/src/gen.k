%{
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
// gen.k
//
%{
  static char gen_kAccesSid[] = "@(#)$Id: gen.k,v 1.151 2007-01-30 14:10:29 piefel Exp $";
%}
/***************************************************************************/

// first of all: the declarations of the views that we use

%uview
	view_filename,
	view_error,
	view_error_tID,
	view_check,
	view_check_count,
	view_check_count1,
	view_check_outmostopers_in_phylum,
	view_set_type,
	view_check_is_var,
	view_gen_initializephyla_c,
	view_check_u,
	view_check_r,
	view_check_viewnames,
	view_check_uniq,
	view_check_uniq1,
	view_check_uniq2,
	view_make_patternreps,
	view_printer_outputfileline,
	view_printer_reset,
	view_no_of_printed_string_chars_reset,
	view_open_namespace,
	view_close_namespace,
	view_gen_k_h,
	view_gen_end_k_h,
	view_gen_k_c,
	view_gen_alloc_h,
	view_gen_alloc_c,
	view_gen_deprecated,
	view_gen_enumphyla_h,
	view_gen_enumoperators_h,
	view_gen_operatormap_type_h,
	view_gen_phylummap_c,
	view_gen_operatormap_c,
	view_count_args,
	view_count_attrs,
	view_count_nonstaticmembers,
	view_gen_operatormap_subphyla,
	view_gen_operatormap_attributes,
	view_gen_uniqmap_c,
	view_gen_uniqmap_c_1,
	view_gen_uniqmap_c_2,
	view_gen_nodetypedefs_h,
	view_gen_nodetypes_h,
	view_gen_yaccstacktype_h,
	view_gen_noofoperators_h,
	view_gen_assertmacros_h,
	view_gen_assertmacros_c,
	view_gen_operatordecls_h,
	view_gen_operatorcast_h,
	view_gen_operatordefs_c,
	view_gen_operatordefs_c_0,
	view_gen_operatordefs_c_1,
	view_gen_operatordefs_c_2,
	view_gen_initializephyla_whiletest_c,
	view_gen_initializephyla_init_el_c,
	view_gen_initializephyla_update_loop_c,
	view_gen_operatordefs_nonhash_c,
	view_gen_operatordefs_hash_c,
	view_gen_access_functions,
	view_gen_create_function,
	view_gen_attributeOf_function,
	view_gen_argseqnr,
	view_gen_fnarg_asserts,
	view_gen_fnarg_and_decls,
	view_gen_fnarg_and_decls_predef,
	view_gen_assignments,
	view_gen_assignment_inis,
	view_gen_user_assignment_inis,
	view_gen_assignments_predef,
	view_gen_assignments_predef_ini,
	view_gen_test,
	view_gen_error_decls_h,
	view_gen_error_defs_c,
	view_gen_printdotdecls_h,
	view_gen_printdotdefs_c,
	view_gen_printdotedges_c,
	view_gen_listdecls_h,
	view_gen_listdefs_c,
	view_gen_includes,
	view_do_gen_includes,
	view_gen_csgio_start_h,
	view_gen_csgio_end_h,
	view_gen_csgio_h,
	view_gen_csgio_start_c,
	view_gen_csgio_c,
	view_gen_copy_attributes_c,
	view_gen_copydefs_c,
	view_gen_rewritek_h,
	view_gen_end_rewritek_h,
	view_gen_rewritek_c,
	view_gen_rewritedefs_c,
	view_gen_rewritedefs_default_c,
	view_gen_rewritedefs_other_c,
	view_gen_rewritedefs_rewritearg_c,
	view_gen_rewritedefs_nl_arg_c,
	view_gen_rewritedefs_testarg_c,
	view_gen_rewritedefs_dotestarg_c,
	view_gen_rewritedefs_args_c,
	view_gen_rewritedefs_body_c,
	view_gen_withcases_and_default,
	view_rw_predicates,
	view_wc_predicates,
	view_unp_predicates,
	view_wc_bindings,
	view_unp_bindings,
	view_rw_bindings,
	view_gen_fnk_h,
	view_gen_fnkdecls_c,
	view_gen_fnk_c,
	view_gen_fn_pointer_name,
	view_gen_fnkargs,
	view_gen_fnkdecls,
	view_gen_fns_start_h,
	view_gen_fns_end_h,
	view_gen_fns_start_c,
	view_gen_fns_owninclude_c,
	view_gen_unpk_h,
	view_gen_unparsedecls_h,
	view_gen_rewritedecls_h,
	view_uview_def,
	view_gen_end_unpk_h,
	view_gen_unpk_c,
	view_gen_default_types_unpk_c,
	view_gen_unparsedefs_c,
	(view_gen_unparsedefs_default_c),
	view_gen_unparsedefs_other_c,
	view_gen_unpstr_c,
	view_gen_user_predicates,
	view_predicate_bindings,
	view_checklanguagenames,
	view_output_collection,
	view_gen_classdecls1_h,
	view_gen_classdecls2_h,
	view_gen_classdefs_c,
	view_gen_subphylumdefs_c,
	view_gen_cast,
	view_gen_hashtables_h,
	view_gen_hashtables_c,
	view_gen_yxx_union_h,
	view_gen_member_dcl_h,
	view_gen_set_subphylumdefs_c,
	view_gen_viewvars_c,
	view_gen_argseqnr_rec,
	view_gen_opt_const,
	view_uview_class_decl,
	view_uview_class_def,
	view_rview_class_decl,
	view_rview_class_def,
	view_collect_strings,
	view_class_of_op,
	view_class_of_phy,
	view_gen_base_init_expression_list
;

/***************************************************************************/

PhylumDeclarations( * )			-> [view_printer_outputfileline: /* EMPTY */ ];
PhylumDeclarations( * )			-> [view_printer_reset: /* EMPTY */ ];
PhylumDeclarations( * )			-> [view_no_of_printed_string_chars_reset: /* EMPTY */ ];
/***************************************************************************/
Nilfnfiles()				-> [: /* EMPTY */ ];
Consfnfiles( f, r_f )			-> [: r_f "\t\"" f "\"\n" ];

/***************************************************************************/

%{ KC_UNPARSE
#include "defs.h"
%}

PhylumDeclarations( * )			-> [view_gen_k_h:
"/* translation of file(s)\n"
  Thefnfiles
" */
/* generated by:
 *  " kimwitu_copyright "
 */
#ifndef KC_TYPES_HEADER
#define KC_TYPES_HEADER

#define KIMWITUVERSIONMAJOR " METAKIMWITUVERSIONMAJOR "
#define KIMWITUVERSIONMINOR " METAKIMWITUVERSIONMINOR "
#define KIMWITUVERSIONMICRO " METAKIMWITUVERSIONMICRO "

#include <stdio.h>
#include <stddef.h>
#include <string>
#include <vector>

namespace kc {\r

#ifndef INTEGER
# define INTEGER int
#endif
#ifndef REAL
# define REAL double
#endif

#ifdef KC_UNICODE

#define kc_t(TEXT) L ## TEXT
typedef wchar_t kc_char_t;
typedef std::wstring kc_string_t;

#if defined(_WIN32) && ! defined (__GNUC__)
#define kc_strlen wcslen
#define kc_strcmp wcscmp
#define kc_strcasecmp _wcsicmp
#define kc_strcpy wcscpy
#define kc_strncpy wcsncpy
#define kc_tolower towlower
#define kc_print_integer(buf,number) swprintf(buf,kc_t(\"%d\"),number)
#define kc_print_real(buf,number) swprintf(buf,kc_t(\"%g\"),number)

// needed for printdot and csgio only
inline
std::string kc_to_cstring(const std::wstring& s) {
    USES_CONVERSION;
    return W2CA(s.c_str());
}

// needed for csgio only
inline
std::wstring kc_to_wstring(const std::string& s) {
    USES_CONVERSION;
    return A2CW(s.c_str());
}

#else // !defined(_WIN32) || defined(__GNUC__)
// if you want to use UNICODE on other platforms you have to write
// the following functions on your own
int kc_strlen(const kc_char_t*);
int kc_strcmp(const kc_char_t*,const kc_char_t*);
int kc_strcasecmp(const kc_char_t*,const kc_char_t*);
int kc_strcpy(kc_char_t*,const kc_char_t*);
int kc_strncpy(kc_char_t*,const kc_char_t*, int);
kc_char_t kc_tolower(kc_char_t);
int kc_print_integer(kc_char_t* buffer, INTEGER number );
int kc_print_real(kc_char_t* buffer, REAL number);

// needed for printdot and csgio only
std::string kc_to_cstring(const std::wstring& );
// needed for csgio only
std::wstring kc_to_wstring(const std::string& );

#endif

#else // !KC_UNICODE
  
#define kc_t(TEXT) TEXT  
typedef char kc_char_t;
typedef std::string kc_string_t;

#define kc_strlen strlen
#define kc_strcmp strcmp
#if defined(_WIN32) && ! defined (__GNUC__)
#define kc_strcasecmp _stricmp
#else
#define kc_strcasecmp strcasecmp
#endif
#define kc_strcpy strcpy
#define kc_strncpy strncpy
#define kc_tolower tolower  
#define kc_print_integer(buf,number) sprintf(buf,kc_t(\"%d\"),number)
#define kc_print_real(buf,number) sprintf(buf,kc_t(\"%g\"),number)
#endif
"
{ if(!g_options.no_unparse) } ${
  "class uview_class;
typedef uview_class& uview;
typedef const uview_class& c_uview;

typedef class printer_functor_class& printer_functor;
typedef void (*printer_function)(const kc_char_t*, uview);
"
  $}
{ if(!g_options.no_rewrite) } ${
  "
class rview_class;
typedef rview_class& rview;
typedef const rview_class& c_rview;
" $}
"
\v}

// Some compilers know __attribute__. Right now we test for the GNU compiler
// and Intel's icc (for ia32) and ecc (for ia64).
#if !defined __GNUC__ && !defined __ICC && !defined __ECC
# define __attribute__(x)
#endif

// Since all definitions are in namespace kc now, there is no need
// give them a kc_ prefix. Old code may still rely on the prefix, so these
// macros are generated for backwards compatibility
#ifdef KC_DEPRECATED
#define kc_PhylumInfo           phylum_info
#define kc_OperatorInfo         operator_info
#define kc_last_uview           last_uview
#define kc_uviews               uviews
#define kc_rviews               rviews
#define kc_ht_reuse             ht_clear
#define kc_ht_clear             ht_clear
#define kc_ht_assign            ht_assign
#define kc_ht_assigned          ht_assigned
"

$0:view_gen_deprecated

"
#endif // KC_DEPRECATED

// Some compilers are too stupid to detect that a function will always return
// a proper value when it returns one in all branches of an if- or switch-
// statement (with final else or default, of course).
#if !defined __GNUC__
# define NORETURN throw 0;
#else
# define NORETURN
#endif
"
    $0:view_open_namespace
"

"
					];
PhylumDeclarations( * )			-> [view_gen_end_k_h:
    $0:view_close_namespace
"#endif // KC_TYPES_HEADER
"
					];
PhylumDeclarations( * )			-> [view_open_namespace:
"
namespace kc {\r
"
					];
PhylumDeclarations( * )			-> [view_close_namespace:
"
} // namespace kc
"
					];

/***************************************************************************/

PhylumDeclarations( * )			-> [view_gen_k_c:
"/* translation of file(s)\n"
Thefnfiles
" */
/* generated by:
 *  " kimwitu_copyright "
 */
#define KC_TYPES
"
{ if(g_options.stdafx!="") {
	PRINT("#include \"");
	PRINT(g_options.stdafx.c_str());
	PRINT("\"\n");
}	}
"
#include \""  { PRINT(g_options.prefix.c_str()); } "k.h\"
#include <stdio.h>
#include <ctype.h>
#include <string>
#include <sys/types.h>
#include <stdlib.h>

#ifdef _MSC_VER
#pragma warning( disable : 4786 )
#endif
#include <new>
#include <set>
#include <list>
#include <algorithm>

#if !defined(USE_HASHSET) && (defined(__GNUC__) || defined(__ICC) || defined(__ECC)) \\
	&& !defined(DONT_USE_HASHSET)
#  define USE_HASHSET
#endif
#ifdef USE_HASHSET
#  if defined(__GNUC__) && __GNUC__>2
#    include <ext/hash_set>
#  else
#    include <hash_set>
#  endif
#endif

using namespace std;
"
    $0:view_open_namespace
"
inline bool
ht_less(casestring p1, casestring p2){
    return kc_strcmp(p1->name, p2->name)<0;
}

inline bool
ht_less(nocasestring p1, nocasestring p2){
    return kc_strcasecmp(p1->name, p2->name)<0;
}

inline bool
ht_less(real p1, real p2){
    return p1->value < p2->value;
}

inline bool
ht_less(integer p1, integer p2){
    return p1->value < p2->value;
}

inline bool
ht_less(voidptr p1, voidptr p2){
    return p1->pointer < p2->pointer;
}

bool
ht_less(abstract_phylum p1, abstract_phylum p2)
{
    enum_operators prod_sel=p1->prod_sel();
    enum_operators prod_sel2=p2->prod_sel();
    if(prod_sel<prod_sel2)
	return true;
    if(prod_sel>prod_sel2)
	return false;
    switch(prod_sel) {
	case sel_NoCaseStr:
	    \vreturn ht_less(static_cast<nocasestring>(p1),static_cast<nocasestring>(p2));\r
	case sel__Str:
	    \vreturn ht_less(static_cast<casestring>(p1),static_cast<casestring>(p2));\r
	case sel__Real:
	    \vreturn ht_less(static_cast<real>(p1),static_cast<real>(p2));\r
	case sel__Int:
	    \vreturn ht_less(static_cast<integer>(p1),static_cast<integer>(p2));\r
	case sel__VoidPtr:
	    \vreturn ht_less(static_cast<voidptr>(p1),static_cast<voidptr>(p2));\r
	default: {
	    int i=0;
	    bool still_unique = kc_storageclass_still_uniq[phylum_info[p1->phylum()].uniq_stored];
	    abstract_phylum sub1=0;
	    do {
		sub1=p1->subphylum(i);
		abstract_phylum sub2=p2->subphylum(i);
		if(still_unique) {
		    if(sub1<sub2)
			return true;
		    if(sub2<sub1)
			return false;
		}
		else {
		    if(ht_less(sub1, sub2))
			return true;
		    if(ht_less(sub2, sub1))
			return false;
		}
		++i;
	    } while(sub1);
	}
    }
    return false;
}

template<typename T>
class phylum_less : std::binary_function<T, T, bool>
{
public:
    bool operator()(const T& X, const T& Y) const
	\v{ return ht_less(X,Y); }\r
};

inline void deletefun(c_abstract_phylum t){
    delete const_cast<abstract_phylum>(t);
}

"
{ string how_smart = "";
  if(g_options.smart_pointer) how_smart="_ptr"; }
"
#ifdef USE_HASHSET
struct hashitem {
    size_t hashvalue;
    casestring" how_smart " contents;
    hashitem(casestring" how_smart " cs): contents(cs) {
	unsigned long h = 0;
	kc_char_t const *s = cs->name;
	for ( ; *s; ++s)
	    \vh = 5*h + *s;\r
	hashvalue=(size_t)h;
    }
};

inline void deletefunhashitem(hashitem t) {
    delete t.contents;
}

#  ifdef __GNUC__
struct eq_hashitem { bool operator()(hashitem hi1, hashitem hi2) const {
    return kc_strcmp(hi1.contents->name, hi2.contents->name) == 0; } };

struct hash_hashitem { size_t operator()(hashitem hi) const {
    return hi.hashvalue; } };

#  else
struct comp_hashitem {
    enum { bucket_size = 4, min_buckets = 8 };
    // bucket_size and min_buckets are just guesses
    size_t operator()(const hashitem hi) const {
	return hi.hashvalue; }
    bool operator()(const hashitem hi1, const hashitem hi2) const {
	return kc_strcmp(hi1.contents->name, hi2.contents->name) < 0; }
};
#  endif // Whether gcc or icc
#endif // Whether hash or not

struct hashtable_level
{
	hashtable_level(bool cod = true): clean_on_destruction(cod) { }
"
{ if(!g_options.smart_pointer) } ${
"	void clear(bool free_entries=true) {
	    if(free_entries)
		clear_entries();
	    _casestring.clear();
	    _nocasestring.clear();
	    _integer.clear();
	    _real.clear();
	    _voidptr.clear();
	    _abstract_phylum.clear();
	}
	void clear_entries() {
#ifdef USE_HASHSET
		std::for_each(_casestring.begin(),_casestring.end(),deletefunhashitem);
#else
		std::for_each(_casestring.begin(),_casestring.end(),deletefun);
#endif
		std::for_each(_nocasestring.begin(),_nocasestring.end(),deletefun);
		std::for_each(_integer.begin(),_integer.end(),deletefun);
		std::for_each(_real.begin(),_real.end(),deletefun);
		std::for_each(_voidptr.begin(),_voidptr.end(),deletefun);
		std::for_each(_abstract_phylum.begin(),_abstract_phylum.end(),deletefun);
	    }
	~hashtable_level() {
	    clear(clean_on_destruction);
	}
	abstract_phylum check_insert(abstract_phylum t) {
	    return *_abstract_phylum.insert(t).first;
	}
	casestring check_insert(casestring t) {
#ifdef USE_HASHSET
	    return (*_casestring.insert(hashitem(t)).first).contents;
#else
	    return *_casestring.insert(t).first;
#endif
	}
	nocasestring check_insert(nocasestring t) {
	    return *_nocasestring.insert(t).first;
	}
	integer check_insert(integer t) {
	    return *_integer.insert(t).first;
	}
	real check_insert(real t) {
	    return *_real.insert(t).first;
	}
	voidptr check_insert(voidptr t) {
	    return *_voidptr.insert(t).first;
	}
" $} { else } ${
"	void clear() {
	    _casestring.clear();
	    _nocasestring.clear();
	    _integer.clear();
	    _real.clear();
	    _voidptr.clear();
	    _abstract_phylum.clear();
	}
	abstract_phylum check_insert(abstract_phylum t) {
	    return *_abstract_phylum.insert(abstract_phylum_ptr(t)).first;
	}
	casestring check_insert(casestring t) {
	    return *_casestring.insert(casestring_ptr(t)).first;
	}
	nocasestring check_insert(nocasestring t) {
	    return *_nocasestring.insert(nocasestring_ptr(t)).first;
	}
	integer check_insert(integer t) {
	    return *_integer.insert(integer_ptr(t)).first;
	}
	real check_insert(real t) {
	    return *_real.insert(real_ptr(t)).first;
	}
	voidptr check_insert(voidptr t) {
	    return *_voidptr.insert(voidptr_ptr(t)).first;
	}
" $}
"\rprivate:\v
	bool clean_on_destruction;
#ifdef USE_HASHSET
#  ifdef __GNUC__
#    if __GNUC__==2 || (__GNUC__==3 && __GNUC_MINOR__==0)
	std::hash_set<hashitem, hash_hashitem, eq_hashitem> _casestring;
#    else
	__gnu_cxx::hash_set<hashitem, hash_hashitem, eq_hashitem> _casestring;
#    endif
#  else
	std::hash_set<hashitem, comp_hashitem> _casestring;
#  endif
#else
	std::set<casestring" how_smart ", phylum_less<casestring" how_smart "> > _casestring;
#endif
	std::set<nocasestring" how_smart ", phylum_less<nocasestring" how_smart "> > _nocasestring;
	std::set<integer" how_smart ", phylum_less<integer" how_smart "> > _integer;
	std::set<real" how_smart ", phylum_less<real" how_smart "> > _real;
	std::set<voidptr" how_smart ", phylum_less<voidptr" how_smart "> > _voidptr;
	std::set<abstract_phylum" how_smart ", phylum_less<abstract_phylum" how_smart "> > _abstract_phylum;
};

class hashtable_stack: public std::list<hashtable_level> {
\rpublic:\v
    hashtable_stack(): _pos(begin()) { }

    void inc_level() { _pos=insert(_pos, hashtable_level()); }
    void dec_level() { if(valid() && _pos!=end()) ++_pos; }
    void free_level() { if(_pos!=begin()) { erase(begin(),_pos);_pos=begin(); } }

    bool valid() const { return !empty(); }
    hashtable_level& get_level() { return *_pos; }

    template<typename T>
    T check_insert(T t) {
	return dynamic_cast<T>((*_pos).check_insert(t));
    }
\rprivate:\v
    iterator _pos;
};

class hashtable_struct_t {
\rpublic:\v
    // don't clean _static_level on destruction (program ends)
    hashtable_struct_t(): _static_level(false), _to_be_freed(false),  _dynamic(false) { }

    template <typename T>
    T ht_check_insert(T t) {
	if(_dynamic && _dynamic_level.valid())
	    return _dynamic_level.check_insert(t);
	else
	    return dynamic_cast<T>(_static_level.check_insert(t));
    }
    void ht_static() {_dynamic=false; }
    void ht_dynamic() {
	_dynamic=true;
	if(!_dynamic_level.valid())
	    _dynamic_level.inc_level();
    }
    void ht_inc_level() { _dynamic_level.inc_level(); }
    void ht_dec_level() { _dynamic_level.dec_level(); }
    void ht_free_level() { _dynamic_level.free_level(); }
    void ht_clear() { _static_level.clear(); _dynamic_level.clear(); _dynamic=false; }

    bool to_be_freed() { return _to_be_freed; }
    void set_to_be_freed(bool b=true) { _to_be_freed=b; }
\rprivate:\v
    hashtable_level _static_level;
    hashtable_stack _dynamic_level;
    bool _to_be_freed; /* should be true for dynamic, false for statically allocated structures */
    bool _dynamic;
};

impl_nocasestring_NoCaseStr::impl_nocasestring_NoCaseStr(const kc_char_t* _name) : name(_name) { }
void impl_nocasestring_NoCaseStr::make_own(int length) {
    kc_char_t *newname=new kc_char_t[length+1];
    for (int i=0; i < length && name[i]; ++i)
	newname[i] = kc_tolower(name[i]);
    newname[length]=0;
    name=newname;
}

impl_casestring__Str::impl_casestring__Str(const kc_char_t* _name) : name(_name) { }
void impl_casestring__Str::make_own(int length) {
    kc_char_t *newname=kc_strncpy(new kc_char_t[length+1],name,length);
    newname[length]=0;
    name=newname;
}
"
					];

/***************************************************************************/

PhylumDeclarations( pds )		-> [view_gen_enumphyla_h:
{ g_no_of_phyla = PHYLUMNUMBEROFFSET; }
"typedef enum { one_before_first_phylum = " g_no_of_phyla " ,
"
{ g_no_of_phyla++; }
    pds
"    last_phylum = " g_no_of_phyla "
} enum_phyla;

"
					];
Consphylumdeclarations( pd, rpds )	-> [view_gen_enumphyla_h view_gen_deprecated: rpds pd ];
Nilphylumdeclarations()			-> [view_gen_enumphyla_h view_gen_deprecated: /* EMPTY */ ];
PhylumDeclaration( id, *, productions, * )  -> [view_gen_enumphyla_h:
"    phylum_" id " = " g_no_of_phyla ",
"
{ g_no_of_phyla++; }
					]
					[view_gen_deprecated:
"#define kc_phylum_" id " phylum_" id "
"
    {gl_phylum = id;}
    productions
					];

/***************************************************************************/

PhylumDeclarations( pds )		-> [view_gen_enumoperators_h:
{ g_no_of_operators = OPERATORNUMBEROFFSET; }
"typedef enum { one_before_first_operator = " g_no_of_operators " ,
"
{ g_no_of_operators++; }
    pds
"    last_operator = " g_no_of_operators "
} enum_operators;
"
					];

Consphylumdeclarations( pd, rpds )	-> [view_gen_enumoperators_h: rpds pd ];
Nilphylumdeclarations()			-> [view_gen_enumoperators_h: /* EMPTY */ ];
PhylumDeclaration( *, *, Emptyproductionblock(), * )
					-> [view_gen_enumoperators_h: /* EMPTY */ ];
PhylumDeclaration( *, *, ListAlternatives( a, * ), * ),
PhylumDeclaration( *, *, NonlistAlternatives( a ), * ),
PhylumDeclaration( *, *, PredefinedAlternatives( a ), * )
					-> [view_gen_enumoperators_h:
    a
					];
ListAlternatives(a, *),
NonlistAlternatives(a),
PredefinedAlternatives(a)               -> [view_gen_deprecated:
    a
                                        ];

Consalternatives( a, as )		-> [view_gen_enumoperators_h view_gen_deprecated: as a ];
Consalternatives( a, Nilalternatives())	-> [view_gen_enumoperators_h: a ];
Nilalternatives()                       -> [view_gen_deprecated: ];
Alternative( id, * )			-> [view_gen_enumoperators_h:
"    sel_" id " = " g_no_of_operators ",
"
{ g_no_of_operators++; }
					]
                                           [view_gen_deprecated:
"#define kc_tag_" gl_phylum "_" id " impl_" gl_phylum "_" id "
"
                                        ];

/***************************************************************************/

PhylumDeclarations( * )			-> [view_gen_operatormap_type_h:
					];
Nilstorageclasses()			-> [view_gen_operatormap_type_h: /* EMPTY */ ];
Consstorageclasses( sc, Nilstorageclasses())	-> [view_gen_operatormap_type_h: sc ];
Consstorageclasses( sc, r_sc)		-> [view_gen_operatormap_type_h:
    r_sc ",
	" sc
					];


/***************************************************************************/

PhylumDeclarations( d )			-> [view_gen_phylummap_c:
"KC_PHYLUM_INFO phylum_info[] = {
"
${ { int i = PHYLUMNUMBEROFFSET; do } ${ { /*PHYLUMNUMBEROFFSET + 1 times*/ }
"    { \"\", one_before_first_operator, one_before_first_operator, (kc_storageclass_t)0 }, /* dummy element */
"
{ i--; } $} { while (i >= 0); } $}
    d
"    { \"\", one_before_first_operator, one_before_first_operator, (kc_storageclass_t)0 } /* last element */
};

"
					];
Consphylumdeclarations( pd, rpds )	-> [view_gen_phylummap_c: rpds pd ];
Nilphylumdeclarations()			-> [view_gen_phylummap_c: /* EMPTY */ ];
PhylumDeclaration( id, st_opt, pb, cco )
					-> [view_gen_phylummap_c:
{ gl_phylum = id; }
"    { \"" id "\", " pb ", " st_opt " },
"
{ gl_phylum = 0; }
					];
PhylumDeclaration( id, st_opt, pb=ListAlternatives(*,*), cco )
					-> [view_gen_phylummap_c:
{ gl_phylum = id; }
"    { \"" id "\", " pb ", " st_opt " },
"
{ gl_phylum = 0; }
					];
NoStorageOption()			-> [view_gen_phylummap_c: "kc_not_uniq" ];
NegativeStorageOption( * )		-> [view_gen_phylummap_c: "kc_not_uniq" ];
PositiveStorageOption( sc )		-> [view_gen_phylummap_c: sc ];

Emptyproductionblock()			-> [view_gen_phylummap_c: /* EMPTY */ ];
ListAlternatives( Consalternatives( Alternative( oid, * ), Nilalternatives() ), * ),
NonlistAlternatives( Consalternatives( Alternative( oid, * ), Nilalternatives() ) ),
PredefinedAlternatives( Consalternatives( Alternative( oid, * ), Nilalternatives() ) )	/* HACK: should we do something special for predefined phyla? */
					-> [view_gen_phylummap_c:
"sel_" oid ", sel_" oid
					];

ListAlternatives( Consalternatives( Alternative( oid, * ), ra ), * ),
NonlistAlternatives( Consalternatives( Alternative( oid, * ), ra ) ),
PredefinedAlternatives( Consalternatives( Alternative( oid, * ), ra ) )
					-> [view_gen_phylummap_c:
"sel_" ra ", sel_" oid
					];
Nilalternatives()			-> [view_gen_phylummap_c: /* EMPTY */ ];
Consalternatives( Alternative( oid, * ), Nilalternatives() )
					-> [view_gen_phylummap_c:
    oid
					];
Consalternatives( *, ra )		-> [view_gen_phylummap_c:
    ra
					];

/***************************************************************************/

PhylumDeclarations( d )			-> [view_gen_operatormap_c:
    d:view_gen_operatormap_subphyla
    d:view_gen_operatormap_attributes
"

KC_OPERATOR_INFO operator_info[] = {
"
${ { int i = OPERATORNUMBEROFFSET; do } ${ // OPERATORNUMBEROFFSET + 1 times
"    { \"\", 0, 0, one_before_first_phylum, 0, 0, 0, 0 }, /* dummy element */
"
{  i--; } $} { while (i >= 0); } $}
    d
"    { \"\", 0, 0, one_before_first_phylum, 0, 0, 0, 0 } /* last element */
};

"
					];
Consphylumdeclarations( pd, rpds )	-> [view_gen_operatormap_c: rpds pd ];
Nilphylumdeclarations()			-> [view_gen_operatormap_c: /* EMPTY */ ];
PhylumDeclaration( *, *, Emptyproductionblock(), * )
					-> [view_gen_operatormap_c: /* EMPTY */ ];
PhylumDeclaration( id, st_opt, ListAlternatives( a, * ), cco ),
PhylumDeclaration( id, st_opt, NonlistAlternatives( a ), cco )
					-> [view_gen_operatormap_c:
{ gl_phylum = id; gl_storageoption = st_opt; gl_atomicity = false; }
    a
{ gl_phylum = 0; gl_storageoption = 0; }
					];
PhylumDeclaration( id, st_opt, PredefinedAlternatives( a ), cco )
					-> [view_gen_operatormap_c:
{ gl_phylum = id; gl_storageoption = st_opt; gl_atomicity = true; }
    a
{ gl_phylum = 0; gl_storageoption = 0; }
					];

Nilalternatives()			-> [view_gen_operatormap_c: /* EMPTY */ ];
Consalternatives( alt=Alternative( oid, args ), ra ) -> [view_gen_operatormap_c:
    ra
    args:view_count_args
    "    { \"" oid "\", "		// name
    gl_no_of_args ", "			// no_sons
    { if (gl_atomicity) } ${ "true" $} { else } ${ "false" $}	// atomicity
    ", phylum_" gl_phylum ", "	// phylum

    { if (gl_no_of_args>0) } ${
	"kc_subphyla_" oid ", "		// subphylum
    $} { else } ${
	"0, "
    $}

    {   The_abstract_phylum_decl->additional_members->unparse(kc_printer, view_count_attrs);
	int attrcount = gl_no_of_args;
	f_phylumdeclofid(f_phylumofoperator(oid))->additional_members->unparse(kc_printer, view_count_attrs);
	attrcount += gl_no_of_args;
	alt->additional_members->unparse(kc_printer, view_count_attrs);
	gl_no_of_args += attrcount; }	// gl_no_of_args now is the number of attrs in operator
    gl_no_of_args ", "			// no_attrs
    {	if (gl_no_of_args>0) } ${
	"kc_attrs_" oid			// attribute
    $} { else } ${
	"0"
    $}
    ", sizeof(" oid:view_class_of_op ") },\n"
					];
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


Nilarguments()				-> [view_count_args:
{ gl_no_of_args = 0; }
					];
Consarguments( *, ra )			-> [view_count_args:
    ra
{ gl_no_of_args++; }
					];

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
Consphylumdeclarations( pd, rpds )	-> [view_gen_operatormap_subphyla: rpds pd ];
Nilphylumdeclarations()			-> [view_gen_operatormap_subphyla: /* EMPTY */ ];
PhylumDeclaration( *, *, Emptyproductionblock(), * )
					-> [view_gen_operatormap_subphyla: /* EMPTY */ ];
PhylumDeclaration( *, *, ListAlternatives( a, * ), * ),
PhylumDeclaration( *, *, NonlistAlternatives( a ), * ),
PhylumDeclaration( *, *, PredefinedAlternatives( a ), * )
					-> [view_gen_operatormap_subphyla: a ];
Nilalternatives()			-> [view_gen_operatormap_subphyla: /* EMPTY */ ];
Consalternatives( Alternative( oid, args ), ra )
					-> [view_gen_operatormap_subphyla:
    ra
    args:view_count_args
    {	if (gl_no_of_args) } ${
	"static enum_phyla kc_subphyla_" oid "[] = { "
	    args
	" };
	"
$}
					];
Nilarguments()				-> [view_gen_operatormap_subphyla: /* EMPTY */ ];
Consarguments( a, ra )			-> [view_gen_operatormap_subphyla:
    ra
", "
"phylum_" a
					];
Consarguments( a, Nilarguments() )	-> [view_gen_operatormap_subphyla:
"phylum_" a
					];

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

Nilfndeclarations()			-> [view_count_attrs view_count_nonstaticmembers:
{ gl_no_of_args = 0; gl_args = Nilarguments(); gl_members=Nilfndeclarations(); gl_idents=Nilac_identifier_list(); }
					];
Consfndeclarations( fd=AcMemberDeclaration(
	    Consac_declaration_specifiers(AcDeclSpecTypeSpec(AcTypeSpec(a_type)), *),
	    AcDeclarator(*, *, AcMemberDecl(*, a_id, *)),
	    *, *), rfd )		-> [view_count_attrs:
    rfd
{ if (fd->is_attr) {
    gl_no_of_args++;
    gl_args=Consarguments(a_type, gl_args);
    gl_members=Consfndeclarations(fd, gl_members);
    gl_idents=Consac_identifier_list(a_id, gl_idents);
		   } }
					];
Consfndeclarations( fd=AcMemberDeclaration(
	    Consac_declaration_specifiers(AcDeclSpecTypeSpec(AcTypeSpec(a_type)), *),
	    AcDeclarator(*, *, AcMemberDecl(*, a_id, *)),
	    *, MemberFn()), rfd )	-> [view_count_nonstaticmembers:
    rfd
{   gl_no_of_args++;
    gl_args=Consarguments(a_type, gl_args);
    gl_members=Consfndeclarations(fd, gl_members);
    gl_idents=Consac_identifier_list(a_id, gl_idents);
		   }
					];

Consfndeclarations(*, rfd)		-> [view_count_attrs view_count_nonstaticmembers: rfd ];

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
Consphylumdeclarations( pd, rpds )	-> [view_gen_operatormap_attributes view_gen_attributeOf_function: rpds pd ];
Nilphylumdeclarations()			-> [view_gen_operatormap_attributes view_gen_attributeOf_function: /* EMPTY */ ];

PhylumDeclaration( *, *, Emptyproductionblock(), * )
					-> [view_gen_operatormap_attributes view_gen_attributeOf_function: /* EMPTY */ ];
PhylumDeclaration( id, *, ListAlternatives( a, * ), * ),
PhylumDeclaration( id, *, NonlistAlternatives( a ), * ),
PhylumDeclaration( id, *, PredefinedAlternatives( a ), * )
					-> [view_gen_operatormap_attributes view_gen_attributeOf_function:
    {   The_abstract_phylum_decl->additional_members->unparse(kc_printer, view_count_attrs);
	int attrcount = gl_no_of_args;
	arguments attrs = gl_args;
	ac_identifier_list idents = gl_idents; }
    additional_members:view_count_attrs
    {	gl_no_of_args += attrcount; // gl_no_of_args now is the number of attrs in phylum
	gl_args = concat(gl_args, attrs); // gl_args contains the types of all attrs and ...
	gl_idents = concat(gl_idents, idents); } // ... gl_idents their names
    a
					];

Nilalternatives()			-> [view_gen_operatormap_attributes view_gen_attributeOf_function: /* EMPTY */ ];
Consalternatives( a=Alternative( oid, * ), ra )
					-> [view_gen_operatormap_attributes:
    ra
    {	int attrcount = gl_no_of_args;
	arguments attrs = gl_args;
	ac_identifier_list idents = gl_idents;
	a->additional_members->unparse(kc_printer, view_count_attrs);
	gl_no_of_args += attrcount; // gl_no_of_args now is the number of attrs in operator
	gl_args = concat(gl_args, attrs); // gl_args contains the types of all attrs and ...
	gl_idents = concat(gl_idents, idents);  // ... gl_idents their names
	if (gl_no_of_args) } ${
	"static enum_phyla kc_attrs_" oid "[] = { "
	    gl_args:view_gen_operatormap_subphyla
	" };
	"
	$}
    {	gl_no_of_args=attrcount;
	gl_args=attrs;
	gl_idents=idents; }
					];

/***************************************************************************/

Nilstorageclasses()			-> [view_gen_uniqmap_c: /* EMPTY */ ];
Consstorageclasses( *, * )		-> [view_gen_uniqmap_c:
    $0:view_gen_uniqmap_c_1
"
KC_UNIQ_INFO kc_UniqInfo[] = {
"
    $0:view_gen_uniqmap_c_2
"
};
"
					];

Nilstorageclasses()			-> [view_gen_uniqmap_c_1: /* EMPTY */ ];
Consstorageclasses( sc, r_sc )		-> [view_gen_uniqmap_c_1:
    r_sc
{ if ($0->phyla->length() > 0) } ${
"static enum_phyla phylumstorageclass_" sc "[] = { one_before_first_phylum, "
    $0->phyla
"last_phylum };
"
$}
					];
Nilphylumnames()			-> [view_gen_uniqmap_c_1: /* EMPTY */ ];
Consphylumnames( pn, r_pn )		-> [view_gen_uniqmap_c_1: r_pn "phylum_" pn ", " ];
Nilstorageclasses()			-> [view_gen_uniqmap_c_2: /* EMPTY */ ];
Consstorageclasses( sc, Nilstorageclasses() )	-> [view_gen_uniqmap_c_2:
{ if ($0->phyla->length() > 0) } ${
"    phylumstorageclass_" sc
$} { else } ${
"    (KC_UNIQ_INFO)0"
$}
					];
Consstorageclasses( sc, r_sc )		-> [view_gen_uniqmap_c_2:
    r_sc
{ if ($0->phyla->length() > 0) } ${
",
    phylumstorageclass_" sc
$} { else } ${
",
    (KC_UNIQ_INFO)0"
$}
					];

/***************************************************************************/

PhylumDeclarations( d )			-> [view_gen_yaccstacktype_h:
"#ifndef YYSTYPE_HEADER
#define YYSTYPE_HEADER
union KC_YYSTYPE {
"
    d
"};
#define YYSTYPE KC_YYSTYPE
#endif // YYSTYPE_HEADER
"
					];
PhylumDeclarations( d )			-> [view_gen_yxx_union_h:
"union {
"
    d
"};
"
					];
Consphylumdeclarations( pd, rpds )	-> [view_gen_yaccstacktype_h view_gen_yxx_union_h: rpds pd ];
Nilphylumdeclarations()			-> [view_gen_yaccstacktype_h view_gen_yxx_union_h: /* EMPTY */ ];
PhylumDeclaration( id, *, *, * )	-> [view_gen_yaccstacktype_h:
"    kc::" id " yt_" id ";
"
					];
PhylumDeclaration( id, *, *, * )	-> [view_gen_yxx_union_h:
"    kc::" id " as_" id ";
"
					];

/***************************************************************************/

PhylumDeclarations( * )			-> [view_gen_noofoperators_h:
"#define KC_NO_OF_OPERATORS " g_no_of_operators "

"
					];

/***************************************************************************/

PhylumDeclarations( d )			-> [view_gen_assertmacros_h:
"
#ifndef KC_NO_DEFAULT_IN_WITH
# define KC_NO_DEFAULT_IN_WITH \"Internal Error: no default action defined in function %s at %s:%d\\n\"
#endif
void kc_no_default_in_with (const char*, int, const char*);
void kc_returnless_function (const char *, int, const char*);

#ifndef NDEBUG
# define assertCond(t) do {if (!(t)) kc_assertionFailed(__FILE__,__LINE__);}while(false)
# define assertReason(t,s) do {if (!(t)) kc_assertionReasonFailed(__FILE__,__LINE__,s);}while(false)
# define assertNonNull(p) do {if (p == 0) kc_assertionNonNullFailed(__FILE__,__LINE__,#p);}while(false)
# define assertPhylum(ptr,phy) do { \\
    assertNonNull(ptr); \\
    if (ptr->phylum()!=phy) \\
	kc_assertionOperatorInPhylumFailed(ptr->prod_sel(),#ptr,\"->prod_sel()\",\"phy\",__FILE__,__LINE__); \\
    } while(false)
#else
# define assertCond(t)
# define assertReason(t,s)
# define assertNonNull(ptr)
# define assertPhylum(op,phy)
#endif
#define assertionFailed(s) kc_assertionReasonFailed(__FILE__,__LINE__,s)
\r
void kc_assertionFailed (const char*, int) __attribute__ ((noreturn));
void kc_assertionReasonFailed (const char*, int, const char*) __attribute__ ((noreturn));
void kc_assertionNonNullFailed (const char*, int, const char*) __attribute__ ((noreturn));
void kc_assertionOperatorInPhylumFailed (int, const char*, const char*, const char*, const char*, int) __attribute__ ((noreturn));
"
					];

PhylumDeclarations( * )			-> [view_gen_assertmacros_c:
"
void
kc_no_default_in_with( const char *kc_func, int kc_line, const char *kc_file )
{
    fflush(stdout);
#ifdef _AFX
	USES_CONVERSION;
	const _TCHAR* format=A2CT(KC_NO_DEFAULT_IN_WITH);
	const _TCHAR* tkc_func=A2CT(kc_func);
	const _TCHAR* tkc_file=A2CT(kc_file);
	TRACE( format, tkc_func, tkc_file, kc_line );
#ifdef _DEBUG
    if (AfxAssertFailedLine(kc_file, kc_line))
#endif
	AfxDebugBreak();
#else
    fprintf( stderr, KC_NO_DEFAULT_IN_WITH, kc_func, kc_file, kc_line );
#ifndef KC_NODEFAULT_NO_ABORT
    abort();
#else
    exit( 1 );
#endif
#endif
}

void
kc_returnless_function( const char *kc_func, int kc_line, const char *kc_file )
{
    fflush(stdout);
#ifdef _AFX
	USES_CONVERSION;
	const _TCHAR* format=_T(\"Internal Error: function %s does not return a value, at %s:%d\");
	const _TCHAR* tkc_func=A2CT(kc_func);
	const _TCHAR* tkc_file=A2CT(kc_file);
	TRACE( format, tkc_func, tkc_file, kc_line );
#ifdef _DEBUG
    if (AfxAssertFailedLine(kc_file, kc_line))
#endif
	AfxDebugBreak();
#else
    fprintf( stderr, \"Internal Error: function %s does not return a value, at %s:%d\", kc_func, kc_file, kc_line );
#ifndef KC_NODEFAULT_NO_ABORT
    abort();
#else
    exit( 1 );
#endif
#endif
}

void
kc_assertionFailed(const char *kc_fn, int kc_l)
{
    fflush(stdout);
#ifdef _AFX
	USES_CONVERSION;
	const _TCHAR* format=_T(\"Internal Error: Assertion failed at %s:%d\\n\");
	const _TCHAR* tkc_func=A2CT(kc_fn);
	TRACE( format, tkc_func, kc_l );
#ifdef _DEBUG
    if (AfxAssertFailedLine(kc_fn, kc_l))
#endif
	AfxDebugBreak();
#else
    fprintf( stderr, \"Internal Error: Assertion failed at %s:%d\\n\", kc_fn, kc_l );
#ifndef KC_ASSERT_NO_ABORT
    abort();
#else
    exit( 1 );
#endif
#endif
}

void
kc_assertionReasonFailed(const char *kc_fn, int kc_l, const char *kc_s)
{
    fflush(stdout);
#ifdef _AFX
	USES_CONVERSION;
	const _TCHAR* format=_T(\"Internal Error: Assertion failed at file %s:%d: %s\\n\");
	const _TCHAR* tkc_func=A2CT(kc_fn);
	const _TCHAR* tkc_s=A2CT(kc_s);
	TRACE( format, tkc_func, kc_l, tkc_s );
#ifdef _DEBUG
    if (AfxAssertFailedLine(kc_fn, kc_l))
#endif
	AfxDebugBreak();
#else
    fprintf( stderr, \"Internal Error: Assertion failed at file %s:%d: %s\\n\", kc_fn, kc_l, kc_s );
#ifndef KC_ASSERT_NO_ABORT
    abort();
#else
    exit( 1 );
#endif
#endif
}

void
kc_assertionNonNullFailed(const char *kc_fn, int kc_l, const char *kc_str)
{
    fflush(stdout);
#ifdef _AFX
	USES_CONVERSION;
	const _TCHAR* format=_T(\"Internal Error: Assertion failed at %s:%d: pointer %s is NULL\\n\");
	const _TCHAR* tkc_func=A2CT(kc_fn);
	const _TCHAR* tkc_s=A2CT(kc_str);
	TRACE( format , tkc_func, kc_l, tkc_s);
#ifdef _DEBUG
    if (AfxAssertFailedLine(kc_fn, kc_l))
#endif
	AfxDebugBreak();
#else
    fprintf( stderr, \"Internal Error: Assertion failed at %s:%d: pointer %s is NULL\\n\", kc_fn, kc_l, kc_str );
#ifndef KC_ASSERT_NO_ABORT
    abort();
#else
    exit( 1 );
#endif
#endif
}

void
kc_assertionOperatorInPhylumFailed(int kc_op, const char *kc_str1, const char *kc_str2, const char *kc_phy, const char *kc_fn, int kc_l)
{
    fflush(stdout);
#ifdef _AFX
    USES_CONVERSION;
    const _TCHAR* format=_T(\"Internal Error: Assertion failed at %s:%d: illegal value for (%s) %s%s: %d not a valid operator\\n\");
    const _TCHAR* tkc_func=A2CT(kc_fn);
    const _TCHAR* tkc_s1=A2CT(kc_str1);
    const _TCHAR* tkc_s2=A2CT(kc_str2);
    const _TCHAR* tname=A2CT(kc_phy);
    if ((kc_op <= one_before_first_operator) || (kc_op >= last_operator)) {
	TRACE (format, tkc_func, kc_l, tname, tkc_s1, tkc_s2, kc_op );
    } else {
	format=_T(\"Internal Error: Assertion failed at %s:%d: illegal value for (%s) %s%s: %s (%d) is a value of %s\\n\");
	const _TCHAR* tname2=A2CT(operator_info[kc_op].name);
	const _TCHAR* tname3=A2CT(phylum_info[operator_info[kc_op].phylum].name);
	TRACE(format,tkc_func, kc_l, tname, tkc_s1, tkc_s2, tname2, kc_op, tname3 );
    }
#ifdef _DEBUG
	if (AfxAssertFailedLine(kc_fn, kc_l))
#endif
		AfxDebugBreak();
#else
    if ((kc_op <= one_before_first_operator) || (kc_op >= last_operator)) {
	fprintf( stderr, \"Internal Error: Assertion failed at %s:%d: illegal value for (%s) %s%s: %d not a valid operator\\n\",
		kc_fn, kc_l, kc_phy, kc_str1, kc_str2, kc_op );
    } else {
	fprintf( stderr, \"Internal Error: Assertion failed at %s:%d: illegal value for (%s) %s%s: %s (%d) is a value of %s\\n\",
		kc_fn, kc_l, kc_phy, kc_str1, kc_str2, operator_info[kc_op].name, kc_op, phylum_info[operator_info[kc_op].phylum].name );
    }
#ifndef KC_ASSERT_NO_ABORT
    abort();
#else
    exit( 1 );
#endif
#endif
}

void kc_invalid_operator( const char *kc_func_prefix, enum_phyla kc_phy, int kc_line, const char *kc_file, enum_operators kc_oper )
{
    fflush(stdout);
#ifdef _AFX
    USES_CONVERSION;
    const _TCHAR* format=_T(\"Internal Error: invalid operator code in %s%s at %s:%d: %s\\n\");
    const _TCHAR* tkc_func=A2CT(kc_func_prefix);
    const _TCHAR* tkc_file=A2CT(kc_file);
    const _TCHAR* ts1=A2CT(phylumname_or_error( kc_phy ));
    const _TCHAR* ts2=A2CT(kc_operatorname_or_error( kc_oper ));
    TRACE( format, tkc_func, ts1, tkc_file, kc_line, ts2);
#ifdef _DEBUG
    if (AfxAssertFailedLine(kc_file, kc_line))
#endif
	AfxDebugBreak();
#else
    fprintf( stderr, \"Internal Error: invalid operator code in %s%s at %s:%d: %s\\n\", kc_func_prefix, phylumname_or_error( kc_phy ), kc_file, kc_line, kc_operatorname_or_error( kc_oper ));
#ifndef KC_INVALID_OPERATOR_NO_ABORT
    abort();
#else
    exit( 1 );
#endif
#endif
}
"
					];

// ***************************************************************************
// Generation of the operator functions prototypes

PhylumDeclarations( d )			-> [view_gen_operatordecls_h:
"
casestring mkcasestring( const kc_char_t *, int length = -1);
nocasestring mknocasestring( const kc_char_t *, int length = -1);
integer mkinteger( const INTEGER );
real mkreal( const REAL );
inline casestring _Str( const kc_char_t * cc) { return mkcasestring(cc); }
inline nocasestring NoCaseStr( const kc_char_t * cc) { return mknocasestring(cc); }
inline integer _Int( const INTEGER cc) { return mkinteger(cc); }
inline real _Real( const REAL cc) { return mkreal(cc); }
"
    d
					];

Consphylumdeclarations( pd, rpds )	-> [view_gen_operatordecls_h: rpds pd ];
Nilphylumdeclarations()			-> [view_gen_operatordecls_h: /* EMPTY */ ];
PhylumDeclaration( *, *, Emptyproductionblock(), * )
					-> [view_gen_operatordecls_h: /* EMPTY */ ];
PhylumDeclaration( id, *, ListAlternatives( *, el ), * )
					-> [view_gen_operatordecls_h:
    id " Nil" id "();
    " id " Cons" id "(" el "," id ");
"
					];

PhylumDeclaration( *, *, NonlistAlternatives( a ), * )
					-> [view_gen_operatordecls_h:  a ];
PhylumDeclaration( *, *, PredefinedAlternatives( * ), * )
					-> [view_gen_operatordecls_h: /* EMPTY */ ];

// This creates the prototypes for all the generating functions
Nilalternatives()			-> [view_gen_operatordecls_h: /* EMPTY */ ];
Consalternatives( alt=Alternative( oid, args ), ra ) -> [view_gen_operatordecls_h:
    ra
    { if(f_constructors_in_operatordecl(alt)) } ${
	{ gl_args=args; }
	args:view_count_args
	alt->additional_members
	{ gl_args=0; }
    $} { else } ${
	"class " oid:view_gen_fn_pointer_name "*\b " oid " (" args ");\n"
    $}
					];

Consarguments( a, Nilarguments() )	-> [view_gen_operatordecls_h:
    a
					];
Consarguments( a, rargs )		-> [view_gen_operatordecls_h:
    rargs ", " a
					];

Nilfndeclarations()			-> [view_gen_operatordecls_h: ];
Consfndeclarations( head, tail )	-> [view_gen_operatordecls_h: tail ];

// This is used for generating functions for operators with additional constructors
Consfndeclarations( decl=FnAcDeclaration(*,
	    AcDeclarator(*,*,
		AcQualifiedDeclProto(*,id,params,*)),
	    *,*,*,*,ConstructorFn()), tail) -> [view_gen_operatordecls_h:
    tail
    "class " id:view_gen_fn_pointer_name "*\b " id " (" gl_args
    { if(gl_no_of_args && !f_no_params(params)) { PRINT(","); } }
    decl->sorted:view_gen_fnk_h
    ");\n"
					];

// ***************************************************************************
// Generation of the operator_cast<>() functions - very similar to above.


PhylumDeclarations( d )			-> [view_gen_operatorcast_h:
"/* translation of file(s)\n"
Thefnfiles
" */
/* generated by:
 *  " kimwitu_copyright "
 */
#ifndef KC_OPERATOR_CAST_HEADER
#define KC_OPERATOR_CAST_HEADER
#include \"" { PRINT(g_options.prefix.c_str()); } "k.h\"         // in case a user forgets
#include <typeinfo>   // for bad_cast

"
    d
"#endif // KC_OPERATOR_CAST_HEADER\n\n"
					];

Consphylumdeclarations( pd, rpds )	-> [view_gen_operatorcast_h: rpds pd ];
Nilphylumdeclarations()			-> [view_gen_operatorcast_h: /* EMPTY */ ];

PhylumDeclaration( *, *, Emptyproductionblock(), * )
					-> [view_gen_operatorcast_h: /* EMPTY */ ];
PhylumDeclaration( id, *, ListAlternatives( *, el ), * )
					-> [view_gen_operatorcast_h:
    "//" id " Nil" id "();
    //" id " Cons" id "(" el "," id ");
"
					];
PhylumDeclaration( *, *, NonlistAlternatives( a ), * )
					-> [view_gen_operatorcast_h:  a ];
PhylumDeclaration( *, *, PredefinedAlternatives( * ), * )
					-> [view_gen_operatorcast_h: /* EMPTY */ ];

Nilalternatives()			-> [view_gen_operatorcast_h: /* EMPTY */ ];
Consalternatives( alt=Alternative( oid, args ), ra ) -> [view_gen_operatorcast_h:
    ra
    { if(f_constructors_in_operatordecl(alt)) } ${
	{ gl_args=args; }
        { v_report(NonFatal( NoFileLine(), Problem1S( "internal error: experimental operator_cast<>() unlikely to work with user-defined constructors" ))); }
	args:view_count_args
	alt->additional_members
	{ gl_args=0; }
    $} { else } ${
	{ ID pid = f_phylumofoperator(oid); }
	"template <class " oid:view_gen_fn_pointer_name "*\b kc_f(" args ")>
	 class " oid:view_gen_fn_pointer_name "*
	 operator_cast(" pid " kc_p)
	 {
	     if (kc_f!=" oid " || kc_p->prod_sel()!=sel_" oid ")
		 throw std::bad_cast();
	     return static_cast<class " oid:view_gen_fn_pointer_name "*>(kc_p);
	 }\n\n"
    $}
					];

Consarguments( a, Nilarguments() )	-> [view_gen_operatorcast_h:
    a
					];
Consarguments( a, rargs )		-> [view_gen_operatorcast_h:
    rargs ", " a
					];

/***************************************************************************/

%{ KC_UNPARSE
#define FMOP 38
#define FMSZ 3
#define FMNCR 8
#define FMNCRD 8
#define FMEXIST 8
#define FMFRNC 8
#define FMFRRC 8
#define FMFREED 8
#define FMREM 8
#define FMTOT 9
%}

PhylumDeclarations( d )			-> [view_gen_alloc_h:
"
extern bool kc_storageclass_still_uniq[];
"
					];

PhylumDeclarations( * )			-> [view_gen_alloc_c:
"
#ifdef KC_STATISTICS
KC_OPERATOR_STATISTICS operator_statistics[KC_NO_OF_OPERATORS];
static int kc_casestring_strlen =0;
static int kc_nocasestring_strlen =0;
#  define KC_COLLECT_STATS0(v) v
#else
#  define KC_COLLECT_STATS0(v)
#endif

#ifndef KC_CREATE_STATS
#  define KC_CREATE_STATS(oper) operator_statistics[oper].created++;
#endif
#ifndef KC_EXISTINGNOTFOUND_STATS
#  define KC_EXISTINGNOTFOUND_STATS(oper) operator_statistics[oper].existing_not_found++;
#endif

#ifndef KC_FREE_CALLED_STATS
#  define KC_FREE_CALLED_STATS(oper,rec) operator_statistics[oper].free_called[(rec?true:false)]++;
#endif

#ifndef KC_FREED_STATS
#  define KC_FREED_STATS(oper,rec) operator_statistics[oper].freed[(rec?true:false)]++;
#endif
"
					];

PhylumDeclarations( * )			-> [view_gen_hashtables_h:
"
typedef struct {
    int created;
    int existing_not_found;
    int free_called[2];
    int freed[2];
} KC_OPERATOR_STATISTICS;

#ifdef KC_STATISTICS
# define print_operator_statistics(kc_f) do_print_operator_statistics(kc_f)
  void	do_print_operator_statistics(FILE*);
#else
# define print_operator_statistics(kc_f)
#endif

typedef class hashtable_struct_t* hashtable_t;
"
{ if(!g_options.no_hashtables) } ${
"void	ht_static (kc_storageclass_t);
void	ht_dynamic (kc_storageclass_t);
void	ht_inc_level (kc_storageclass_t);
void	ht_dec_level (kc_storageclass_t);
void	ht_free_level (kc_storageclass_t);
hashtable_t	ht_create_simple ();
hashtable_t	ht_assign (hashtable_t, kc_storageclass_t, bool still_unique=false);
hashtable_t	ht_assigned (kc_storageclass_t);
void	ht_clear (hashtable_t);
void	ht_delete (hashtable_t);
"
$}
					];

PhylumDeclarations( * )			-> [view_gen_hashtables_c:
"
extern const char* kc_storageclassnames[];

#ifdef KC_STATISTICS
void do_print_operator_statistics(FILE * kc_f)
{
    unsigned int kc_i;
    assertNonNull( kc_f );
    fprintf(kc_f, \"%-*s| %-*s| %-*s| %-*s| %-*s| %-*s| %-*s| %-*s| %-*s| %-*s\\n\", 38 , \"Operator\", 3, \"Sz\", 8, \"#oper\", 8, \"#new\", 8, \"#exist\", 8, \"#frnrec\", 8, \"#frrec\", 8, \"#freed\", 8, \"#rem\", 9, \"total (bytes)\");
    fprintf(kc_f, \"%-*s|%*s |%*d |%*d |%*d |%*d |%*d |%*d |%*d |%*d\\n\", 38, \"case sensitive strings\", 3, \"-\", 8, operator_statistics[sel__Str].created, 8, operator_statistics[sel__Str].existing_not_found, 8, operator_statistics[sel__Str].created-operator_statistics[sel__Str].existing_not_found, 8, 0, 8, 0, 8, 0, 8, 0, 9, kc_casestring_strlen);
    fprintf(kc_f, \"%-*s|%*s |%*d |%*d |%*d |%*d |%*d |%*d |%*d |%*d\\n\", 38, \"case insensitive strings\", 3, \"-\", 8, operator_statistics[sel_NoCaseStr].created, 8, operator_statistics[sel_NoCaseStr].existing_not_found, 8, operator_statistics[sel_NoCaseStr].created-operator_statistics[sel_NoCaseStr].existing_not_found, 8, 0, 8, 0, 8, 0, 8, 0, 9, kc_nocasestring_strlen);
    for (kc_i = one_before_first_operator+1; kc_i < last_operator; kc_i++) {
	fprintf(kc_f, \"%-*s|%*d |%*d |%*d |%*d |%*d |%*d |%*d |%*d |%*d\\n\", 38, operator_info[kc_i].name, 3, operator_info[kc_i].size, 8, operator_statistics[kc_i].created, 8, operator_statistics[kc_i].existing_not_found, 8, operator_statistics[kc_i].created-operator_statistics[kc_i].existing_not_found, 8, operator_statistics[kc_i].free_called[false], 8, operator_statistics[kc_i].free_called[true], 8, operator_statistics[kc_i].freed[false]+operator_statistics[kc_i].freed[true], 8, operator_statistics[kc_i].existing_not_found-(operator_statistics[kc_i].freed[false]+operator_statistics[kc_i].freed[true]), 9, operator_info[kc_i].size*(operator_statistics[kc_i].existing_not_found-(operator_statistics[kc_i].freed[false]+operator_statistics[kc_i].freed[true])));
    }
}
#endif // KC_STATISTICS

"
{ if(!g_options.no_hashtables) } ${
"
void
ht_static(kc_storageclass_t kc_a_storageclass_t)
{
    hashtables[kc_a_storageclass_t]->ht_static();
}

void
ht_dynamic(kc_storageclass_t kc_a_storageclass_t)
{
    hashtables[kc_a_storageclass_t]->ht_dynamic();
}

void
ht_inc_level(kc_storageclass_t kc_a_storageclass_t)
{
    hashtables[kc_a_storageclass_t]->ht_inc_level();
}

void
ht_dec_level(kc_storageclass_t kc_a_storageclass_t)
{
    hashtables[kc_a_storageclass_t]->ht_dec_level();
}

void
ht_free_level(kc_storageclass_t kc_a_storageclass_t)
{
    hashtables[kc_a_storageclass_t]->ht_free_level();
}

hashtable_t
ht_create_simple()
{
    hashtable_t kc_ht=new hashtable_struct_t;
    kc_ht->set_to_be_freed();
    return kc_ht;
}

hashtable_t
ht_assign(hashtable_t kc_a_hashtable_t, kc_storageclass_t kc_a_storageclass_t, bool still_unique)
{
    hashtable_t kc_tmp = hashtables[kc_a_storageclass_t];
    hashtables[kc_a_storageclass_t] = kc_a_hashtable_t;
    kc_storageclass_still_uniq[kc_a_storageclass_t] = still_unique;
    return kc_tmp;
}

hashtable_t
ht_assigned(kc_storageclass_t kc_a_storageclass_t)
{
    return hashtables[kc_a_storageclass_t];
}

void
ht_clear(hashtable_t kc_a_hashtable_t)
{
    kc_a_hashtable_t->ht_clear();
}

void
ht_delete(hashtable_t kc_a_hashtable_t)
{
    if(kc_a_hashtable_t->to_be_freed())
	delete kc_a_hashtable_t;
}
"
$}
					];

PhylumDeclarations( d )			-> [view_gen_operatordefs_c:
Thestorageclasses:view_gen_operatordefs_c_0
"
bool kc_storageclass_still_uniq[] = {
"
Thestorageclasses:view_gen_operatordefs_c_1
" };

hashtable_t hashtables[] = {
"
Thestorageclasses:view_gen_operatordefs_c_2
"};

const char* kc_storageclassnames[] = { " Thestorageclasses " };

namespace { // all local to k.cc
\r
"
    d:view_gen_initializephyla_c

"
} // namespace

enum_phyla
impl_abstract_phylum::phylum() const {
	return operator_info[prod_sel()].phylum;
}

const char*
impl_abstract_phylum::phylum_name() const {
	return phylum_info[phylum()].name;
}

const char*
impl_abstract_phylum::op_name() const {
	return operator_info[prod_sel()].name;
}

casestring
mkcasestring(const kc_char_t *kc_s, int length)
{
    KC_COLLECT_STATS0(KC_CREATE_STATS(sel__Str));

    casestring" { if(g_options.smart_pointer) } ${ "_ptr" $} " kc_x=new impl_casestring__Str(kc_s);
    if(length>=0) 
		kc_x->make_own(length);
	
    casestring unique_kc_x=hashtables[uniq]->ht_check_insert((casestring)kc_x);
    if(unique_kc_x!=kc_x) {
		if(length<0) 
	kc_x->name=0;

"
{ if(!g_options.smart_pointer) } ${
"	delete kc_x;
"
$}
"	kc_x=unique_kc_x;
    } else {
	KC_COLLECT_STATS0(KC_EXISTINGNOTFOUND_STATS(sel__Str));
		if(length<0) 
			kc_x->make_own(static_cast<int>(kc_strlen(kc_s)));

	kc_x->post_create();
    }
    return kc_x;
}

nocasestring
mknocasestring(const kc_char_t *kc_s, int length)
{
    KC_COLLECT_STATS0(KC_CREATE_STATS(sel_NoCaseStr));

    nocasestring" { if(g_options.smart_pointer) } ${ "_ptr" $} " kc_x=new impl_nocasestring_NoCaseStr(kc_s);
	if(length>=0)
		kc_x->make_own(length);
    nocasestring unique_kc_x=hashtables[uniq]->ht_check_insert((nocasestring)kc_x);
    if(unique_kc_x!=kc_x) {
		if(length<0)
	kc_x->name=0;
"
{ if(!g_options.smart_pointer) } ${
"	delete kc_x;
"
$}
"	kc_x=unique_kc_x;
    } else {
	KC_COLLECT_STATS0(KC_EXISTINGNOTFOUND_STATS(sel_NoCaseStr));
		if(length<0)
			kc_x->make_own(static_cast<int>(kc_strlen(kc_s)));
	kc_x->post_create();
    }

    return kc_x;
}

integer
mkinteger(const INTEGER kc_i)
{
    KC_COLLECT_STATS0(KC_CREATE_STATS(sel__Int));

    integer kc_x =new impl_integer__Int(kc_i);
    integer unique_kc_x=hashtables[uniq]->ht_check_insert(kc_x);
    if(unique_kc_x!=kc_x) {
"
{ if(!g_options.smart_pointer) } ${
"	delete kc_x;
"
$}
"	kc_x=unique_kc_x;
    } else {
	KC_COLLECT_STATS0(KC_EXISTINGNOTFOUND_STATS(sel__Int));
	kc_x->post_create();
    }

    return kc_x;
}

real
mkreal(const REAL kc_r)
{
    KC_COLLECT_STATS0(KC_CREATE_STATS(sel__Real));

    real kc_x=new impl_real__Real(kc_r);
    real unique_kc_x=hashtables[uniq]->ht_check_insert(kc_x);
    if(unique_kc_x!=kc_x) {
"
{ if(!g_options.smart_pointer) } ${
"	delete kc_x;
"
$}
"	kc_x=unique_kc_x;
    } else {
	KC_COLLECT_STATS0(KC_EXISTINGNOTFOUND_STATS(sel__Real));
	kc_x->post_create();
    }

    return kc_x;
}

voidptr
mkvoidptr(void *kc_p)
{
    KC_COLLECT_STATS0(KC_CREATE_STATS(sel__VoidPtr));
    voidptr kc_x=new impl_voidptr__VoidPtr(kc_p);
    voidptr unique_kc_x=hashtables[uniq]->ht_check_insert(kc_x);
    if(unique_kc_x!=kc_x) {
"
{ if(!g_options.smart_pointer) } ${
"	delete kc_x;
"
$}
"	kc_x=unique_kc_x;
    } else {
       KC_COLLECT_STATS0(KC_EXISTINGNOTFOUND_STATS(sel__VoidPtr));
	kc_x->post_create();
    }
    return kc_x;
}

"
    // Make all the other functions generating a phylum
    d
    // Make the table driven create function
    $0:view_gen_access_functions
"
abstract_phylum
impl_abstract_phylum::subphylum(int) const
{
  return 0;
}

void
impl_abstract_phylum::set_subphylum(int,abstract_phylum)
{
}

void
impl_abstract_phylum::free(bool kc_rec)
{
    KC_COLLECT_STATS0(KC_FREE_CALLED_STATS(prod_sel(), kc_rec));
"
{ if(g_options.smart_pointer) } ${
"	if(get_ref())
		get_ref()->unlock();
"
$}
"    if (!"
{ if(g_options.smart_pointer) } ${
	"get_ref()"
$} { else } ${
		"phylum_info[phylum()].uniq_stored"
$}
		") {
"
{ if(!g_options.smart_pointer) } ${
"	if (kc_rec) {
            abstract_phylum son;
	    for (int kc_i=0; (son = subphylum(kc_i)); kc_i++)
	    {
		if (son!=0) son->free(kc_rec);
		son=0;
	    }
	}
"
$}
"	KC_COLLECT_STATS0(KC_FREED_STATS(prod_sel(), kc_rec));
	delete this;
	}
}

bool
impl_abstract_phylum::eq(c_abstract_phylum kc_p2) const
{
    if (this == kc_p2)
		return true;
    if (prod_sel() != kc_p2->prod_sel())
		return false;

    int kc_st = phylum_info[phylum()].uniq_stored;
    if (kc_st && kc_storageclass_still_uniq[kc_st])
		return false;

    c_abstract_phylum son1;
    for (int kc_i=0; (son1 = subphylum(kc_i)); kc_i++) {
	if (!son1->eq(kc_p2->subphylum(kc_i)))
	    return false;
    }

    return true;
}

static string kc_indentation = \"\";
static const char *kc_printformat_not_nullary_open = \"%s%s(\\n\";
static const char *kc_printformat_list_open = \"%s%s\\n\";

static const char *kc_printformat_not_nullary_close = \"%s)\\n\";
static const char *kc_printformat_nullary = \"%s%s()\\n\";

void
impl_abstract_phylum::fprint(FILE*kc_f)
{
    int kc_i;

    if (!kc_f) kc_f = stdout;
    abstract_list al = dynamic_cast<abstract_list>(this);
    if (al != 0 && !al->is_nil()) {
	fprintf(kc_f, kc_printformat_list_open, kc_indentation.c_str(), op_name());
	kc_indentation+=\"| \";
	subphylum(0)->fprint(kc_f);
	kc_indentation=kc_indentation.substr(0, kc_indentation.length()-2);
	phylum_cast<abstract_list>(subphylum(1))->fprint_list(kc_f);
	kc_indentation=kc_indentation.substr(0, kc_indentation.length()-2);
    } else // not list
    switch(phylum()) {
	case phylum_voidptr:
	    \vfprintf(kc_f, \"%s%p\\n\", kc_indentation.c_str(), static_cast<voidptr>(this)->pointer);
	    break;\r
	case phylum_casestring:
	case phylum_nocasestring:
	    \vfprintf(kc_f, \"%s%s\\n\", kc_indentation.c_str(), static_cast<casestring>(this)->name);
	    break;\r
	case phylum_integer:
	    \vfprintf(kc_f, \"%s%i\\n\", kc_indentation.c_str(), static_cast<integer>(this)->value);
	    break;\r
	case phylum_real:
	    \vfprintf(kc_f, \"%s%f\\n\", kc_indentation.c_str(), static_cast<real>(this)->value);
	    break;\r
	default:
	    \vif (!subphylum(0)) {
		fprintf(kc_f, kc_printformat_nullary, kc_indentation.c_str(), op_name());
	    } else {
		fprintf(kc_f, kc_printformat_not_nullary_open, kc_indentation.c_str(), op_name());
		kc_indentation+=\"  \";
		abstract_phylum son;
		for (kc_i=0; (son = subphylum(kc_i)); kc_i++) {
		    son->fprint(kc_f);
		}
		kc_indentation=kc_indentation.substr(0, kc_indentation.length()-2);
		fprintf(kc_f, kc_printformat_not_nullary_close, kc_indentation.c_str());
	    }\r
    }
}

void 
impl_abstract_phylum::print()
{
  fprint(stdout);
}

void 
impl_abstract_list::fprint_list(FILE*kc_f)
{
    if (!kc_f)
	kc_f = stdout;
    if (this->is_nil()) {
	kc_indentation+=\"`-\";
	fprintf(kc_f, kc_printformat_nullary, kc_indentation.c_str(), op_name());
    } else {
	kc_indentation+=\"|-\";
	fprintf(kc_f, kc_printformat_list_open, kc_indentation.c_str(), op_name());
	kc_indentation=kc_indentation.substr(0, kc_indentation.length()-2);
	kc_indentation+=\"| \";
	subphylum(0)->fprint(kc_f);
	kc_indentation=kc_indentation.substr(0, kc_indentation.length()-2);
	phylum_cast<abstract_list>(subphylum(1))->fprint_list(kc_f);
    }
}

int
impl_abstract_list::length() const
{
    int kc_length = 0;
    c_abstract_phylum kc_p = this;
    while((kc_p = kc_p->subphylum(1)))
	kc_length++;
    return kc_length;
}
"
{ if(g_options.smart_pointer) } ${
"void impl_abstract_list::freelist() { }\n"
$} { else } ${
"void impl_abstract_list::freelist()
{
    abstract_phylum kc_p = this, kc_tmp_p;
    do {
	kc_tmp_p=kc_p->subphylum(1);
	kc_p->free(false);
	kc_p=kc_tmp_p;
    } while(kc_p);
}
"
$}
"abstract_phylum
impl_abstract_list::do_concat(c_abstract_phylum kc_p2, enum_operators mk) const
{
    abstract_phylum next = subphylum(1);
    if(!next)
	return const_cast<abstract_phylum>(kc_p2);
    return kc_create(mk, subphylum(0), static_cast<abstract_list>(next)->do_concat(kc_p2, mk));
}

abstract_phylum
impl_abstract_list::do_reverse(c_abstract_phylum tail, enum_operators mk) const
{
    for (impl_abstract_list const* iterator_ = this; iterator_->subphylum(1) != 0;
	    iterator_ = static_cast<impl_abstract_list const*>(iterator_->subphylum(1)) )
	tail = kc_create(mk, iterator_->subphylum(0), const_cast<abstract_phylum>(tail));
    return const_cast<abstract_phylum>(tail);
}

abstract_phylum
impl_abstract_list::last() const
{
    c_abstract_phylum kc_p = this, next = subphylum(1), nextnext;
#ifdef _AFX
    ASSERT(next);
    if(!next)
	return NULL;
#else
    if(!next){
	fflush(stdout);
	fprintf(stderr, \"Internal Error: list::last was called with argument Nil%s\\n\", phylum_name());
	exit(1);
    }
#endif
    while ((nextnext = next->subphylum(1))) {
	kc_p = next;
	next = nextnext;
    }
    return const_cast<abstract_phylum>(kc_p->subphylum(0));/* XXX remove cast */
}

abstract_phylum
impl_abstract_list::do_map(abstract_phylum (*kc_fp)(abstract_phylum), enum_operators mk)
{
    abstract_phylum el = subphylum(0);
    if (!el)
	return this;
    abstract_list next = static_cast<abstract_list>(subphylum(1));
    return kc_create(mk, kc_fp(el), next->do_map(kc_fp, mk));
}

abstract_phylum
impl_abstract_list::do_filter(bool (*kc_fp)(abstract_phylum), enum_operators mk)
{
    abstract_phylum el = subphylum(0);
    if (!el)
	return this;
    abstract_list next = static_cast<abstract_list>(subphylum(1));
    if ((*kc_fp)(el)) {
	return kc_create(mk, el, next->do_filter(kc_fp, mk));
    } else {
	return next->do_filter(kc_fp, mk);
    }
}

abstract_list
impl_abstract_list::do_append(abstract_phylum new_last, abstract_list eol)
{
    abstract_list next = this;
    while (!next->is_nil())
	next = phylum_cast<abstract_list>(next->subphylum(1));
    next->set_subphylum(0, new_last);
    next->set_subphylum(1, eol);
    return next;
}

abstract_phylum
impl_abstract_list::do_merge(abstract_list second,abstract_phylum(*kc_fp)(abstract_phylum,abstract_phylum), enum_operators mk)
{
    abstract_phylum el = subphylum(0);
    if (!el)
	return this;
    abstract_phylum el2 = second->subphylum(0);
    if (!el2)
	return el2;
    abstract_list next = static_cast<abstract_list>(subphylum(1));
    abstract_list next2 = static_cast<abstract_list>(second->subphylum(1));
    return kc_create(mk, kc_fp(el,el2), next->do_merge(next2, kc_fp, mk));
}

abstract_phylum
impl_abstract_list::do_reduce(abstract_phylum neutral, abstract_phylum(*kc_fp)(abstract_phylum,abstract_phylum)) {
    abstract_phylum el = subphylum(0);
    if (!el)
	return neutral;
    abstract_list next = static_cast<abstract_list>(subphylum(1));
    return kc_fp(el,next->do_reduce(neutral,kc_fp));
}

"
					];
Nilstorageclasses()			-> [view_gen_operatordefs_c: /* EMPTY */ ];
Consstorageclasses( sc, Nilstorageclasses()) -> [view_gen_operatordefs_c: "\"" sc "\"" ];
Consstorageclasses( sc, r_sc)		-> [view_gen_operatordefs_c:
    r_sc ", \"" sc "\""
					];
Nilstorageclasses()			-> [view_gen_operatordefs_c_0: /* EMPTY */ ];
Consstorageclasses( sc, r_sc)		-> [view_gen_operatordefs_c_0:
    r_sc
"static hashtable_struct_t " sc "_static_hashtable;
"
					];

Nilstorageclasses()			-> [view_gen_operatordefs_c_1: /* EMPTY */ ];
Consstorageclasses( *, Nilstorageclasses()) -> [view_gen_operatordefs_c_1:
    "true"
					];
Consstorageclasses( *, r_sc)		-> [view_gen_operatordefs_c_1:
    r_sc
    ", true"
					];
Nilstorageclasses()			-> [view_gen_operatordefs_c_2: /* EMPTY */ ];
Consstorageclasses( sc, r_sc)		-> [view_gen_operatordefs_c_2:
    r_sc
	"&" sc "_static_hashtable,
"
					];

Consphylumdeclarations( pd, rpds )	-> [view_gen_initializephyla_c: rpds pd ];
Nilphylumdeclarations()			-> [view_gen_initializephyla_c:
    {   fndeclarations apfd=The_abstract_phylum_decl->additional_members,
		       alfd=The_abstract_list_decl->additional_members; }
	apfd:view_count_attrs
    {	if (gl_no_of_args) } ${
	    "void kc_initialize_abstract_phylum(abstract_phylum kc_x)
	    {\n"
	    "}\n"
	$}
	alfd:view_count_attrs
    {	if (gl_no_of_args) } ${
	    "void kc_initialize_abstract_list(abstract_list kc_x)
	    {\n"
	    "}\n"
	$}
					];
PhylumDeclaration( *, *, Emptyproductionblock(), * ),
PhylumDeclaration( *, *, PredefinedAlternatives( * ), * )
					-> [view_gen_initializephyla_c: /* EMPTY */ ];
PhylumDeclaration( id, *, a=ListAlternatives( *, * ), cco ),
PhylumDeclaration( id, *, a=NonlistAlternatives( * ), cco )
					-> [view_gen_initializephyla_c:
{ if (f_something_to_initialize( cco )) } ${
id " kc_initialize_" id "(" id " kc_x)
{
"
    cco
    g_emptystring:view_printer_outputfileline
"    return kc_x;
}

"
$}
    a
					];
ListAlternatives(a, *),
NonlistAlternatives(a)			-> [view_gen_initializephyla_c: a ];
Alternative(id, *)			-> [view_gen_initializephyla_c:
	additional_members:view_count_attrs
    {	if (gl_no_of_args) } ${
	    "void kc_initialize_" id "()
	    {\n"
	    "}\n"
	$}
					];
CcodeOption( attr,  init )		-> [view_gen_initializephyla_c:
    attr
    init
					];
Consattributes( Attribute( *, aid, Yesattribute_initialisation( cexpr )), ra)
					-> [view_gen_initializephyla_c:
{     ID selvar; }
ra
{     selvar = Id(Str(mkcasestring("kc_x")));
      selvar->line = aid->line; /* give selvar the line/file info of attribute name */
      selvar->file = aid->file;
      /*cf_pushselvar( selvar );*/
      dollarvarstack.push( selvar );
      dollarvarextstack.push( f_emptyId() );
      operatorstack.push( f_emptyId() );
}
{ if(g_options.linedirec) } ${ pg_line aid->line " \"" { PRINT(g_options.dir_line.c_str()); } aid->file:view_filename "\"\n" $}
"    kc_x->" aid " = " cexpr ";
"
{     /*cf_popselvar();*/
      dollarvarstack.pop();
      dollarvarextstack.pop();
      operatorstack.pop();
}
					];
Consattributes( Attribute( *, *, Noattribute_initialisation()), ra )
					-> [view_gen_initializephyla_c: ra ];
Nilattributes()				-> [view_gen_initializephyla_c: /* EMPTY */ ];

ConsCtexts( ct, cts )			-> [view_gen_initializephyla_c:
{     ID selvar; }
    cts
{     selvar = Id(Str(mkcasestring("kc_x")));
      selvar->line = ct->line; /* give selvar the line/file info of the ctext */
      selvar->file = ct->file;
      /*cf_pushselvar( selvar );*/
      dollarvarstack.push( selvar );
      dollarvarextstack.push( f_emptyId() );
      operatorstack.push( f_emptyId() );
}
{ if(g_options.linedirec) } ${ pg_line ct->line " \"" { PRINT(g_options.dir_line.c_str()); } ct->file:view_filename  "\"\n" $}
    ct
      g_emptystring:view_printer_outputfileline
{      /*cf_popselvar();*/
      dollarvarstack.pop();
      dollarvarextstack.pop();
      operatorstack.pop();
}
					];
ConsCexpression( ce, ces )		-> [view_gen_initializephyla_c view_gen_user_predicates:
	ces ce				];
NilCexpression()			-> [view_gen_initializephyla_c view_gen_user_predicates:
	/* EMPTY */			];
CExpressionPart( cs )			-> [view_gen_initializephyla_c: cs ];
// Bindings have not yet happened in user predicates ('provided'). Instead we use a map
// with binding names and their paths. We search the CExpressionPart for all identifiers
// and unparse their path if necessary. (CExpressionPart can look like "->n" and such.)
CExpressionPart( cs )			-> [view_gen_user_predicates:
   {  std::map<string, path>::iterator p; char const *c=cs->name; std::string s;
#ifdef KIMWITUVERSIONMAJOR
#define kc_uviews uviews
#endif
      while (*c) ${
	  s=f_getidentfromstring(&c);
	  p=gl_bindings.find(s);
	  if (p!=gl_bindings.end()) ${
	      path path_temp=p->second;
	      with (path_temp) {
		  Nilpath(): { path_temp->unparse(kc_printer, *kc_uviews[gl_outer_view].view); }
		  Conspath(*, r_p): {
		      r_p->unparse(kc_printer, view_gen_cast);
		      path_temp->unparse(kc_printer, *kc_uviews[gl_outer_view].view); }
	      }
	  $}
	  else ${
	      PRINT(s.c_str());
	  $}
      $} }
					];
UnpDollarvarTerm( i ),
UnpDollarvarAttr( i, * ),
CTextDollarVar( i ),
CExpressionDollarvar( i )		-> [view_gen_initializephyla_c:
{   ID oid = f_emptyId(), dollarvar = dollarvarstack.top(), dollarvarext = dollarvarextstack.top();
    argument arg;
    bool nulvar = true;
    with( i ) {
    Int( ii ): {
	if (ii->value != 0) {
	nulvar = false;
	oid = operatorstack.top();
	arg = f_argumentofoperator( oid, i );
}   }   }   }
/* below we use the fact that the dollar var is only allowed if there is
 * only ONE dollar. And we know that in that case it will have number one...
 * so we DEPEND on that...
 */
{ if (nulvar) } ${
dollarvar dollarvarext
$} { else } ${
dollarvar dollarvarext "->"
 arg
{         arg->free( false/* TOBECHECKED*/ );  }
$}
					];
Argument( id, i )			-> [ /*allow all views here */:
    id "_" i
					];
CExpressionNl()				-> [view_gen_initializephyla_c view_gen_user_predicates:
    "\n"
					];
CExpressionDQ( cedq )			-> [view_gen_initializephyla_c view_gen_user_predicates:
    "\"" cedq "\""
					];
CExpressionSQ( cesq )			-> [view_gen_initializephyla_c view_gen_user_predicates:
    "'" cesq "'"
					];
CExpressionPack( cexpr )		-> [view_gen_initializephyla_c view_gen_user_predicates:
    "(" cexpr ")"
					];
CExpressionArray( cexpr )		-> [view_gen_initializephyla_c view_gen_user_predicates:
    "[" cexpr "]"
					];

NilCtexts()				-> [view_gen_initializephyla_c: /* EMPTY */ ];
ConsCtext( *, * )			-> [view_gen_initializephyla_c:
  // MPi: The inversion is absolutely necessary!
  // First the list is reversed, then unparsed iteratively. As this list may
  // become very long, this is the way to save on stack size.
{   gl_print_line_directive = false;
    Ctext inversion_ = $0->reverse();
    for (Ctext iterator_ = inversion_; iterator_->Ctext_1 != 0; iterator_ = iterator_->Ctext_1)
	iterator_->Ctext_elem_1->unparse(kc_printer, kc_current_view);
    inversion_->freelist();
}
					];
NilCtext()				-> [view_gen_initializephyla_c: /* EMPTY */ ];
CTextLine( cs )				-> [view_gen_initializephyla_c:
{ if (gl_print_line_directive) } ${
{ if(g_options.linedirec) } ${ pg_line $0->line " \"" { PRINT(g_options.dir_line.c_str()); } $0->file:view_filename "\"\n" $}
  { gl_print_line_directive = false; }
$}
    cs
					];
CTextNl( i )				-> [view_gen_initializephyla_c:
{ charruns nl_string = Newlines(); }
{ if (gl_print_line_directive) } ${
{ if(g_options.linedirec) } ${ pg_line $0->line " \"" { PRINT(g_options.dir_line.c_str()); } $0->file:view_filename "\"\n" $}
  { gl_print_line_directive = false; }
  { nl_string->set(i->value - 1); }
$} { else } ${
  { nl_string->set(i->value); }
$}
  nl_string
					];
CTextCexpressionDQ( cedq )		-> [view_gen_initializephyla_c:
{ if (gl_print_line_directive) } ${
{ if(g_options.linedirec) } ${ pg_line $0->line " \"" { PRINT(g_options.dir_line.c_str()); } $0->file:view_filename "\"\n" $}
  { gl_print_line_directive = false; }
$}
"\"" cedq "\""
					];
CTextCexpressionSQ( cesq )		-> [view_gen_initializephyla_c:
{ if (gl_print_line_directive) } ${
{ if(g_options.linedirec) } ${ pg_line $0->line " \"" { PRINT(g_options.dir_line.c_str()); } $0->file:view_filename "\"\n" $}
  { gl_print_line_directive = false; }
$}
"'" cesq "'"
					];
CTextCbody( ct )			-> [view_gen_initializephyla_c:
{ if (gl_print_line_directive) } ${
{ if(g_options.linedirec) } ${ pg_line $0->line " \"" { PRINT(g_options.dir_line.c_str()); } $0->file:view_filename "\"\n" $}
  { gl_print_line_directive = false; }
$}
"{"
    ct
"}"
{ if (gl_print_line_directive) } ${
"
"
$}
					];

CTextForeachexpression( *, idcexpr, *, ct, fa )
					-> [view_gen_initializephyla_c:
{
  ID selvar = f_mkselvar("kc_selvar_", g_ctext_level);
  selvar->line = $0->line; /* give selvar the line/file info of the ctext */
  selvar->file = $0->file;
  cf_pushselvar( selvar );
}
"{
"
idcexpr
g_emptystring:view_printer_outputfileline
"while(
"
idcexpr:view_gen_initializephyla_whiletest_c
"    ) {
"
idcexpr:view_gen_initializephyla_init_el_c
"{\n"
{ if(g_options.linedirec) } ${ pg_line ct->line " \"" { PRINT(g_options.dir_line.c_str()); } ct->file:view_filename "\"\n" $}
ct
g_emptystring:view_printer_outputfileline
"}
"
idcexpr:view_gen_initializephyla_update_loop_c
g_emptystring:view_printer_outputfileline
"}
"
{ cf_popselvar();
  selvar = Id(Str(mkcasestring("kc_fe_selvar")));
  selvar->line = fa->line; /* give selvar the line/file info of the ctext */
  selvar->file = fa->file;
  cf_pushselvar( selvar );
}
fa
"}
"
{ cf_popselvar();
  gl_print_line_directive = true;
}
					];

NoForeachAfter()			-> [view_gen_initializephyla_c: /* EMPTY */ ];
ForeachAfter( *, *, *, ct )
					-> [view_gen_initializephyla_c:
"{\n"
{ if(g_options.linedirec) } ${ pg_line ct->line " \"" { PRINT(g_options.dir_line.c_str()); } ct->file:view_filename "\"\n" $}
ct
g_emptystring:view_printer_outputfileline
"}
"
					];


NilidCexpressions()			-> [view_gen_initializephyla_c
					    view_gen_initializephyla_whiletest_c
					    view_gen_initializephyla_init_el_c
					    view_gen_initializephyla_update_loop_c
			:
{   g_fe_selvar_nr = 0; }
					];
ConsidCexpressions( IdCexpression( tid, cexpr ), t )
					-> [view_gen_initializephyla_c:
    t
{   g_fe_selvar_nr++; }
{   if (cexpr->line) } ${
{ if(g_options.linedirec) } ${ pg_line cexpr->line " \"" { PRINT(g_options.dir_line.c_str()); } cexpr->file:view_filename "\"\n" $}
    $}
    tid " kc_fe_selvar_" g_fe_selvar_nr " = " cexpr ";
"

					];
ConsidCexpressions( IdCexpression( tid, * ), t )
					-> [view_gen_initializephyla_whiletest_c:
    t
{   g_fe_selvar_nr++; }
"    && kc_fe_selvar_" g_fe_selvar_nr "->prod_sel() == sel_Cons" tid "
"

					];
ConsidCexpressions( IdCexpression( tid, * ), t = NilidCexpressions() )
					-> [view_gen_initializephyla_whiletest_c:
    t
{   g_fe_selvar_nr++; }
"    kc_fe_selvar_" g_fe_selvar_nr "->prod_sel() == sel_Cons" tid "
"
					];
ConsidCexpressions( IdCexpression( tid, * ), t )
					-> [view_gen_initializephyla_init_el_c:
{ ID element_type = f_listelementphylum( tid );
  ID selvar = cf_topselvar();
}
    t
{   g_fe_selvar_nr++; }
element_type " " selvar "_" g_fe_selvar_nr " = kc_fe_selvar_" g_fe_selvar_nr "->"
element_type "_1;
"
					];
ConsidCexpressions( IdCexpression( tid, cexpr ), t )
					-> [view_gen_initializephyla_update_loop_c:
    t
{   g_fe_selvar_nr++; }
"kc_fe_selvar_" g_fe_selvar_nr " = kc_fe_selvar_" g_fe_selvar_nr "->"
tid "_1;\n"
{ if(g_options.linedirec) } ${ pg_line cexpr->line " \"" { PRINT(g_options.dir_line.c_str()); } cexpr->file:view_filename "\"\n" $}
					];

ctw = CTextWithexpression( wexpr,  wcs, in_foreach_context )
					-> [view_gen_initializephyla_c:
{ if (wcs->wcinfo) } ${
{ /* ID selvar_type = f_phylumofwithcasesinfo( wcs->wcinfo );*/
    ID selvar;
    int p;
    patternchain fe_pc = 0;
    withcasesinfo rewr_wcinfo = rewrite_withcasesinfo(wcs->wcinfo);
    with(in_foreach_context) {
	InForeachContext(mp): {
	    selvar = cf_topselvar(); /* already pushed in Foreach context */
	    inforeachcontext.push(1);
	    fe_pc = mp;
	}
	NotInForeachContext(): {
	    selvar = f_mkselvar("kc_selvar_", g_ctext_level);
	    selvar->line = ctw->line; /* give selvar the line/file info of the ctext */
	    selvar->file = ctw->file;
	    cf_pushselvar( selvar );
	    inforeachcontext.push(0);
	}
    }
}
"{
"
{   if (! inforeachcontext.top()) } ${
wexpr
    $}
//g_emptystring:view_printer_outputfileline
{   if (! inforeachcontext.top()) {
	    dollarvarstack.push( selvar );
	    dollarvarextstack.push( Id(Str(mkcasestring("_1"))) );
    } else if ((p = pos_of_sole_dollar_or_pattern_in_patternchain(fe_pc)) >= 0) {
	    dollarvarstack.push( selvar );
	    dollarvarextstack.push( f_mkselvar("_", p) );
    }
}
rewr_wcinfo:view_gen_withcases_and_default
{   if (! inforeachcontext.top()) {
	    cf_popselvar();
	    dollarvarstack.pop();
	    dollarvarextstack.pop();
    } else if (p >= 0) {
	    dollarvarstack.pop();
	    dollarvarextstack.pop();
    }
  inforeachcontext.pop();
}
"}
"
{ gl_print_line_directive = true; }
$} { else { v_report(NonFatal( FileLine( $0->file, $0->line ), Problem1S( "internal error: no info for withcases of CTextWithexpression" )));
 } }
					];

Nilwithexpressions()			-> [view_gen_initializephyla_c:
{   g_withexpr_nr = 0; }
					];
Conswithexpressions( h, t )		-> [view_gen_initializephyla_c:
{   ID selvar = cf_topselvar(); }
    t
{   g_withexpr_nr++;
}
{   if (h->line) } ${
    { if(g_options.linedirec) } ${ pg_line h->line " \"" { PRINT(g_options.dir_line.c_str()); } h->file:view_filename "\"\n" $}
    $}
{   assertCond( ! (h->type->eq( f_emptyId())) ); }
    h->type " " selvar "_" g_withexpr_nr " = phylum_cast<" h->type ">(" h ");
"
					];
WEVariable( id )			-> [view_gen_initializephyla_c: id ];
WECexpression( cexpr )			-> [view_gen_initializephyla_c: cexpr ];


ConsCexpressionDQ( cedqe, cedq )	-> [view_gen_initializephyla_c: cedq cedqe ];
NilCexpressionDQ()			-> [view_gen_initializephyla_c: /* EMPTY */ ];
CExpressionDQPart( cs )			-> [view_gen_initializephyla_c: cs ];
CExpressionDQNl()			-> [view_gen_initializephyla_c: "\n" ];
ConsCexpressionSQ( cesqe, cesq )	-> [view_gen_initializephyla_c: cesq cesqe ];
NilCexpressionSQ()			-> [view_gen_initializephyla_c: /* EMPTY */ ];
CExpressionSQPart( cs )			-> [view_gen_initializephyla_c: cs ];
CExpressionSQNl()			-> [view_gen_initializephyla_c: "\n" ];

Consphylumdeclarations( pd, rpds )	-> [view_gen_operatordefs_c: rpds pd ];
Nilphylumdeclarations()			-> [view_gen_operatordefs_c: /* EMPTY */ ];

PhylumDeclaration( *, *, Emptyproductionblock(), * )
					-> [view_gen_operatordefs_c: /* EMPTY */ ];

PhylumDeclaration( id, NoStorageOption(), ListAlternatives( alts, * ), cco ),
PhylumDeclaration( id, NegativeStorageOption( * ), ListAlternatives( alts, * ), cco ),
PhylumDeclaration( id, NoStorageOption(), NonlistAlternatives( alts ), cco ),
PhylumDeclaration( id, NegativeStorageOption( * ), NonlistAlternatives( alts ), cco )
					-> [view_gen_operatordefs_c:
	{ gl_phylum = id; gl_cco = cco; }
    alts:view_gen_operatordefs_nonhash_c
	{ gl_phylum = 0; gl_cco = (Ccode_option)0; }
					];

PhylumDeclaration( id, PositiveStorageOption( sto ), ListAlternatives( alts, * ), cco ),
PhylumDeclaration( id, PositiveStorageOption( sto ), NonlistAlternatives( alts ), cco )
					-> [view_gen_operatordefs_c:
	{ gl_phylum = id; gl_cco = cco; gl_sto = sto; }
    alts:view_gen_operatordefs_hash_c
	{ gl_phylum = 0; gl_cco = (Ccode_option)0; gl_sto = 0; }
					];

PhylumDeclaration( *, *, PredefinedAlternatives( * ), * )
					-> [view_gen_operatordefs_c: /* EMPTY */ ];

// Here is the generation of the operator generating functions, for each operator <operator>
// there is a function called <operator>.
// The hash-version is for unique phyla, ie. all phyla with a storage class.
// See also view_gen_operatordecls_h for the prototypes
Consalternatives( alt=Alternative( oid, args ), ra )
					-> [view_gen_operatordefs_nonhash_c view_gen_operatordefs_hash_c:
    ra
    { gl_isnotlist = f_listelementphylum(gl_phylum)->eq(f_emptyId());
      gl_operator = oid;
      gl_args=args; }
    args:view_count_args
    { if(f_constructors_in_operatordecl(alt)) } ${
	alt->additional_members
    $} { else ${
	// Create an 'extended' function with no additional parameters
	fndeclarations _fd = Consfndeclarations(FnAcDeclaration(Nilac_declaration_specifiers(),
		    AcDeclarator(Nopointer(), AcNoRef(), AcQualifiedDeclProto(Nilac_class_qualifier_list(),
			    AcDirectDeclId(oid),
			    AcParList(Nilac_parameter_list()),
			    AcNoQualifier())),
		    Nilac_declaration_list(), AcNoBaseInit(), NilCtext(), Id(Str(mkcasestring(""))),
		    ConstructorFn()), Nilfndeclarations());
	UNPARSE(_fd);
	_fd->free(false);
    $} }
    { gl_args=0;
      gl_operator = 0;
      gl_isnotlist = true;
    }
					];

Nilfndeclarations()			-> [view_gen_operatordefs_nonhash_c view_gen_operatordefs_hash_c: ];
Consfndeclarations( head, tail )	-> [view_gen_operatordefs_nonhash_c view_gen_operatordefs_hash_c: tail
					];

// This is virtually the same as immediately above; it's used for the generating functions
// which potentially take more arguments. That is, for every operator which is given an
// additional constructor (using %ctor), or rather for every such constructor, there is one
// corresponding function <operator> taking said arguments.
Consfndeclarations(
	decl=FnAcDeclaration(*,
		AcDeclarator(*,*,
			AcQualifiedDeclProto(*,AcDirectDeclId(oid),params,*)),*,*,*,*,ConstructorFn()),
	tail)				-> [view_gen_operatordefs_nonhash_c:
    tail
    "impl_" gl_phylum {if(gl_isnotlist)} ${ "_" oid $} "*\n"
    oid "(" gl_args:view_gen_fnarg_and_decls
	{ if(gl_no_of_args>0 && !f_no_params(params)) { PRINT(","); } }
	decl->sorted:view_gen_fnk_c
    ") {
    "
        gl_args:view_gen_fnarg_asserts
	gl_phylum " kc_x = new impl_" gl_phylum {if(gl_isnotlist)} ${ "_" oid $} "("
	    gl_args:view_gen_argseqnr_rec
	    { if(gl_no_of_args && !f_no_params(params)) { PRINT(","); } }
	    decl->sorted:view_gen_fnkargs
	");
	KC_COLLECT_STATS0(KC_CREATE_STATS(sel_" oid "));
	KC_COLLECT_STATS0(KC_EXISTINGNOTFOUND_STATS(sel_"  oid "));
	kc_x->post_create();
    "
    { if (f_something_to_initialize( gl_cco )) } ${
    "    kc_x = kc_initialize_" gl_phylum "(kc_x);
    "
    $}
    "    return static_cast<impl_" gl_phylum {if(gl_isnotlist)} ${ "_" oid $} "*>(kc_x);
    "
    "}

    "
					]
					[view_gen_operatordefs_hash_c:
    tail
    "impl_" gl_phylum {if(gl_isnotlist)} ${ "_" oid $} "*\n"
    oid "(" gl_args:view_gen_fnarg_and_decls
	{ if(gl_no_of_args && !f_no_params(params)) { PRINT(","); } }
	decl->sorted:view_gen_fnk_c
    ") {
    "
        gl_args:view_gen_fnarg_asserts
        gl_phylum " kc_x=new impl_" gl_phylum {if(gl_isnotlist)} ${ "_" oid $} "("
	    gl_args:view_gen_argseqnr_rec
	    { if(gl_no_of_args && !f_no_params(params)) { PRINT(","); } }
	    decl->sorted:view_gen_fnkargs
	");
	KC_COLLECT_STATS0(KC_CREATE_STATS(sel_" oid "));
    "	gl_phylum " unique_kc_x= hashtables[" gl_sto "]->ht_check_insert(kc_x);
    if(unique_kc_x!=kc_x) {
    "
{ if(!g_options.smart_pointer) } ${
    "	delete kc_x;\n"
$} { else } ${
    "	// kc_x already deleted in ht_check_insert\n"
$}
    "	kc_x=unique_kc_x;
    } else {
	KC_COLLECT_STATS0(KC_EXISTINGNOTFOUND_STATS(sel_" oid "));
	kc_x->post_create();
"
	{ if (f_something_to_initialize( gl_cco )) } ${
"		kc_x = kc_initialize_" gl_phylum "(kc_x);
"
	$}
"   }
    return static_cast<impl_" gl_phylum {if(gl_isnotlist)} ${ "_" oid $} "*>(kc_x);
}

"
					];

// This is the body of the lengthy create function which can create every operator.
PhylumDeclarations(d)			-> [view_gen_access_functions:
"
abstract_phylum
kc_create(enum_operators createOp"
{ int j=Theargsnumbers->last()->value;
  if (j<2) j=2; /* lists (even abstract) need two subphyla */
  for (int i = 1; i<=j; ++i) } ${
    ", abstract_phylum"
    " kc_p" i
$} ")
{
    switch(createOp) {\r
    case sel__VoidPtr:
    case sel__Int:
    case sel__Real:
    case sel__Str:
    case sel_NoCaseStr:\v
	assertionFailed(\"Cannot create this kind of phylum - predefined phyla must be handled seperately\");break;
"
    // Generate cases calling all the other functions generating a phylum
    d:view_gen_create_function
"   \rdefault:\v
	assertionFailed(\"Cannot create this kind of phylum - unkown operator id\");
    }
    NORETURN
}

abstract_phylum
kc_create(enum_operators createOp, const std::vector<abstract_phylum>& kc_ps)
{
    if (kc_ps.size() < " j ") {
        assertionFailed(\"Need vector of size of maximum subphylum count (which is " j ")!\");
    }
    return kc_create(createOp" 
{ for (int i = 0; i < j; ++i) } ${ 
    ", kc_ps[" i "]" 
  $} ");
}

abstract_phylum&
attributeOf(abstract_phylum kc_p, int no)
{
" {
    // Find out whether there are any attributes in any phylum.
    // If not, attributeOf will unconditionally report an error.
    count_printer counter;
    d->unparse(counter, view_gen_attributeOf_function);
    if (counter()==0) } ${
	"assertionFailed(\"Cannot select attribute for this kind of phylum - has no attributes\");
"   $} { else } ${
"   enum_operators kc_op = kc_p->prod_sel();
    switch (kc_op) {\r
"
    d:view_gen_attributeOf_function
"   default:\v
	assertionFailed(\"Cannot select attribute for this kind of phylum - unkown operator id or no attributes\");
    }
    assertionFailed(\"Cannot select attribute for this kind of phylum - attribute number out of range\");
"   $}
"    NORETURN
}
"
					];

PhylumDeclaration( *, *, ListAlternatives( alts, * ), * ),
PhylumDeclaration( *, *, NonlistAlternatives( alts ), * )
					-> [view_gen_create_function: alts ];
PhylumDeclaration( *, *, PredefinedAlternatives( * ), * )
					-> [view_gen_create_function: /* EMPTY */ ];

Consalternatives( alt=Alternative( oid, args ), ra )
					-> [view_gen_create_function:
"   \rcase sel_" oid ":\v
	return "
	    oid "(" args ");
"
    ra
					];

Consarguments( a, ra )			-> [view_gen_create_function:
    ra ", "
    "phylum_cast<" a ">(kc_p" gl_generic_counter ")"
    { ++gl_generic_counter; }
					];

Consarguments( a, Nilarguments() )	-> [view_gen_create_function:
    "phylum_cast<" a ">(kc_p1)"
    { gl_generic_counter=2; }
					];
Consalternatives( a=Alternative( oid, * ), ra )
					-> [view_gen_attributeOf_function:
    ra
    {	int attrcount = gl_no_of_args;
	arguments attrs = gl_args;
	ac_identifier_list idents = gl_idents;
	a->additional_members->unparse(kc_printer, view_count_attrs);
	gl_no_of_args += attrcount; // gl_no_of_args now is the number of attrs in operator
	gl_args = concat(gl_args, attrs); // gl_args contains the types of all attrs and ...
	gl_idents = concat(gl_idents, idents); // ... gl_idents their names
	gl_operator=oid;
	if (gl_no_of_args) } ${
	"case sel_" oid ": switch(no) {\n"
	    gl_args
	"}
	"
	$}
    {	gl_no_of_args=attrcount;
	gl_args=attrs;
	gl_idents=idents; }
					];

Nilarguments()				-> [view_gen_attributeOf_function: { gl_no_of_args=0;} ];
Consarguments(a, ra)			-> [view_gen_attributeOf_function:
    ra
    {	ID ident;
	ac_identifier_list idents = gl_idents;
	for (int i=gl_idents->length(); i>gl_no_of_args; --i) {
	    with (idents) {
		Consac_identifier_list(i, ri): { ident=i; idents=ri; }
	    }
	}
    }
    "case " gl_no_of_args ": return reinterpret_cast<abstract_phylum&>(phylum_cast<" gl_operator:view_class_of_op "*>(kc_p)->"
	ident
    ");\n"
    {	++gl_no_of_args; }
					];



Consarguments( a, * )			-> [view_gen_argseqnr:
	a "_" $0->seqnr
					];
Consarguments( a, Nilarguments() )	-> [view_gen_argseqnr_rec:
	"_" a "_" $0->seqnr
					];
Consarguments( a, ra )			-> [view_gen_argseqnr_rec:
	ra ", _" a "_" $0->seqnr
					];

%{ KC_UNPARSE
const char* preDefTypeAndName[][2] = { {"", ""}, {"kc_char_t const*", "name"}, {"kc_char_t const*", "name"},
    {"REAL", "value"}, {"INTEGER", "value"}, {"void*", "pointer"}};

#include "gen.h"
%}

enum_operators
f_selofoperator(ID oid)
{
    int kc_i, kc_end = one_before_first_operator;
    kc_i=kc_end;
    foreach( $p; phylumdeclarations Thephylumdeclarations ) {
	PhylumDeclaration(*,*,PredefinedAlternatives(alts),*),
	PhylumDeclaration(*,*,NonlistAlternatives(alts),*),
	PhylumDeclaration(*,*,ListAlternatives(alts, *),*): {
	    foreach( Alternative(id, *); alternatives alts ) {
			kc_end++;
			if (oid->eq(id)) kc_i=kc_end;
	    }
	}
    }
    return static_cast<enum_operators>(kc_end-kc_i+1);
}

Nilarguments()				-> [view_gen_fnarg_and_decls_predef:
{ enum_operators kc_i = f_selofoperator(gl_operator); }
  { PRINT(preDefTypeAndName[kc_i][0]); }
  " _" { PRINT(preDefTypeAndName[kc_i][1]); }
					];
Nilarguments()				-> [view_gen_fnarg_and_decls view_gen_fnarg_asserts:
						/* EMPTY */ ];
Consarguments( a, Nilarguments() )	-> [view_gen_fnarg_and_decls:
 a " _" $0:view_gen_argseqnr
					];
Consarguments( a, rargs )		-> [view_gen_fnarg_and_decls:
    rargs ", " a " _" $0:view_gen_argseqnr
					];

Consarguments( a, rargs )		-> [view_gen_fnarg_asserts:
    rargs
    "assertPhylum(_" $0:view_gen_argseqnr ", phylum_" a ");\n"
					];
Nilarguments()				-> [view_gen_assignments_predef:
{ enum_operators kc_i = f_selofoperator(gl_operator);
    PRINT(preDefTypeAndName[kc_i][1]); }
    " = _"
    { PRINT(preDefTypeAndName[kc_i][1]); }
    ";\n"
					];
Nilarguments()				-> [view_gen_assignments_predef_ini:
{ enum_operators kc_i = f_selofoperator(gl_operator);
    PRINT(preDefTypeAndName[kc_i][1]); }
    "(_"
    { PRINT(preDefTypeAndName[kc_i][1]); }
    ")"
					];
Nilarguments()				-> [view_gen_assignments: /* EMPTY */ ];
Consarguments( *, rargs )		-> [view_gen_assignments:
    rargs
$0:view_gen_argseqnr " = _" $0:view_gen_argseqnr ";
"
					];
Consarguments( a, Nilarguments() )	-> [view_gen_assignment_inis:
$0:view_gen_argseqnr "(_" $0:view_gen_argseqnr ")"
{ if (a->named_subphylum) } ${
    ", " a->named_subphylum "(" $0:view_gen_argseqnr ")"
$}
					];
Consarguments( a, rargs )		-> [view_gen_assignment_inis:
    rargs ", "
$0:view_gen_argseqnr "(_" $0:view_gen_argseqnr ")"
{ if (a->named_subphylum) } ${
    ", " a->named_subphylum "(" $0:view_gen_argseqnr ")"
$}
					];
Consfndeclarations( AcMemberDeclaration(*, AcDeclarator(*, *, AcMemberDecl(*, a_id, *)), a_cexpr, *), Nilfndeclarations() )
					-> [view_gen_user_assignment_inis:
a_id "(" a_cexpr ")"
					];
Consfndeclarations( AcMemberDeclaration(*, AcDeclarator(*, *, AcMemberDecl(*, a_id, *)), a_cexpr, *), rargs )
					-> [view_gen_user_assignment_inis:
a_id "(" a_cexpr ")"
    ", " rargs
					];
Nilarguments()				-> [view_gen_test: /* EMPTY */ ];
Consarguments( *, rargs )		-> [view_gen_test:
  { bool isnotlist=f_listelementphylum(gl_phylum)->eq(f_emptyId()); }
  rargs
  {if(isnotlist)} ${
  " && (dynamic_cast<impl_" gl_phylum "_" gl_operator "*>(kc_x)->"
  $} {else} ${
  " && (kc_x->"
  $}
	$0:view_gen_argseqnr " == _" $0:view_gen_argseqnr ")"
					];

/***************************************************************************/

PhylumDeclarations( * )			-> [view_gen_error_decls_h:
"const char *phylumname_or_error ( enum_phyla );
const char *kc_operatorname_or_error ( enum_operators );

"
					];
PhylumDeclarations( * )			-> [view_gen_error_defs_c:
{ const char *strof_phylum_error="Internal Error: unknown phylum number: ";
  int strlen_strof_phylum_error = static_cast<int>(strlen(strof_phylum_error)+30);
  casestring cstrof_phylum_error = mkcasestring(strof_phylum_error);
  const char *strof_operator_error="Internal Error: unknown operator number: ";
  int strlen_strof_operator_error = static_cast<int>(strlen(strof_operator_error)+30);
  casestring cstrof_operator_error = mkcasestring(strof_operator_error);
}
"const char*
phylumname_or_error(enum_phyla kc_phy)
{
    if ((kc_phy <= one_before_first_phylum) || (kc_phy >= last_phylum)) {
	char *kc_strof_error;
	sprintf((kc_strof_error=new char[" strlen_strof_phylum_error "]), \"" cstrof_phylum_error "%d\", kc_phy);
	return kc_strof_error;
    } else {
	return phylum_info[kc_phy].name;
}   }


const char*
kc_operatorname_or_error(enum_operators kc_operator)
{
    if ((kc_operator <= one_before_first_operator) || (kc_operator >= last_operator)) {
	char *kc_strof_error;
	sprintf((kc_strof_error=new char[" strlen_strof_operator_error "]), \"" cstrof_operator_error "%d\", kc_operator);
	return kc_strof_error;
    } else {
	return operator_info[kc_operator].name;
}   }

"
					];

// **************************************************************************
// phylum class definitions

PhylumDeclarations( * )			-> [view_rview_class_decl:
"
typedef enum {
" Therviewnames:view_gen_rewritek_h "last_rview
} rview_enum;

struct impl_rviews {
    const char *name;
    rview_class *view;
};
extern struct impl_rviews rviews[];
class "
{ if(g_options.dllexports!="") {
	PRINT(g_options.dllexports.c_str());
	PRINT(" ");
} }
"rview_class {
\rprotected:\v
    // only used in derivations
    rview_class(rview_enum v): m_view(v) { }
    rview_class(const rview_class&): m_view(base_rview_enum)
	\v{ /* do not copy m_view */ }\r
\rpublic:\v
    const char* name() const
	\v{ return rviews[m_view].name; }\r
    operator rview_enum() const
	\v{ return m_view; }\r
    bool operator==(const rview_class& other) const
	\v{ return m_view == other.m_view; }\r
"
    { if(g_options.rw_loop) } ${
"    // Called when the rewrite_loop enters a node (just before the call
    //   to do_rewrite and before entering its sons).
    // The result of this function is used instead of current in the rewrite process.
    // If skip_current is set to true (default is false), the result is not rewritten
    //   any further (neither do_rewrite() nor post_rewrite() are called).
    virtual abstract_phylum pre_rewrite(abstract_phylum current, bool& /* skip_current */)
	\v{ return current; }\r
    // Called when the rewrite_loop leaves current node (after the call to do_rewrite).
    // Current is the finally rewritten node.
    // The result is used instead of the argument to build the final tree.
    // If again is set to true (default is false) the result node is rewritten again.
    virtual abstract_phylum post_rewrite(abstract_phylum current, bool& /* again */)
	\v{ return current; }\r
"
    $}
"\rprivate:\v
    rview_enum m_view;
};
"
					];

PhylumDeclarations( * )			-> [view_uview_class_decl:
"
typedef enum {
" Theuviewnames:view_uview_def " last_uview
} uview_enum;

struct impl_uviews {
    const char *name;
    uview_class *view;
};
extern impl_uviews uviews[];
class "
{ if(g_options.dllexports!="") {
	PRINT(g_options.dllexports.c_str());
	PRINT(" ");
} }
"uview_class {
\rprotected:\v
    // only used in derivations
    uview_class(uview_enum v): m_view(v) { }
    uview_class(c_uview): m_view(base_uview_enum)
	\v{ /* do not copy m_view */ }\r
\rpublic:\v
    const char* name() const
	\v{ return uviews[m_view].name; }\r
    operator uview_enum() const
	\v{ return m_view; }\r
    bool operator==(const uview_class& other) const
	\v{ return m_view == other.m_view; }\r
\rprivate:\v
    uview_enum m_view;
};

class "
{ if(g_options.dllexports!="") {
	PRINT(g_options.dllexports.c_str());
	PRINT(" ");
} }
"printer_functor_class {
\rpublic:\v
    virtual void operator()(const kc_char_t*, uview) { }
    virtual ~printer_functor_class() { }
};

class "
{ if(g_options.dllexports!="") {
	PRINT(g_options.dllexports.c_str());
	PRINT(" ");
} }
"printer_functor_function_wrapper : public printer_functor_class {
\rpublic:\v
    printer_functor_function_wrapper(const printer_function opf =0): m_old_printer(opf) { }
    virtual ~printer_functor_function_wrapper() { }
    virtual void operator()(const kc_char_t* s, uview v)
	\v{ if(m_old_printer) m_old_printer(s, v); }\r
\rprivate:\v
    printer_function m_old_printer;
};
"
					];

PhylumDeclarations( pds )		-> [view_gen_classdecls1_h:
"
class impl_abstract_phylum;
typedef impl_abstract_phylum * abstract_phylum;
typedef const impl_abstract_phylum * c_abstract_phylum;
class impl_abstract_list;
typedef impl_abstract_list * abstract_list;
typedef const impl_abstract_list * c_abstract_list;
"

//////////////////////////////////////////////////////////////////
// The implementation for the smart pointer classes
{ if(g_options.smart_pointer) } ${
"
// Reference to a phylum (abstract base class)
class abstract_phylum_ref {
\rprotected:\v
    abstract_phylum_ref() {
	_locked=false;
	_ref_count=0;
"
{ if(g_options.weak_pointer) } ${
"	_weak_ref_count=0;
"
$}
"   }

\rpublic:\v
    void lock() {
	_locked=true;
    }
    void unlock() {
	if(_locked) {
	    _locked=false;
	    if(_ref_count==0 " { if(g_options.weak_pointer) } ${ "&& _weak_ref_count==0" $} ") {
		reset_ref();
		reset_phylum();
		delete this;
	    }
	}
    }
    int get_ref_count() const {
	return _ref_count;
    }
    void ref() {
	_locked=false;
	++_ref_count;
    }
    void unref() {
	if(_ref_count)
	    --_ref_count;
	if(_ref_count==0 && !_locked) {
	    clear();
"
{ if(g_options.weak_pointer) } ${
"	     if(_weak_ref_count==0)
"
$}
"		delete this;
	}
    }
"
{ if(g_options.weak_pointer) } ${
"   int get_weak_ref_count() const {
	return _weak_ref_count;
    }
    void weak_ref()  {
	_locked=false;
	++_weak_ref_count;
    }
    void weak_unref() {
	if(_weak_ref_count)
	    --_weak_ref_count;
	if(_weak_ref_count==0 && _ref_count==0 && !_locked) {
	    reset_ref();
	    delete this;
	}
    }
"
$} // if(g_options.weak_pointer)
"
    virtual impl_abstract_phylum* get_abstract_phylum() const=0;
    virtual void reset_phylum()=0;
"
    { The_abstract_phylum_ref_decl->additional_members->unparse(
	kc_printer,view_gen_member_dcl_h); }
"\rprotected:\v
    virtual void clear()=0;
    virtual void reset_ref()=0;
\rprivate:\v
    int _ref_count;
"
{ if(g_options.weak_pointer) } ${
"   int _weak_ref_count;
"
$}
"   bool _locked;
};\n"

// Now the references to the normal phylum types
"// Template reference for each phylum
template <typename T>
class phylum_ref: public abstract_phylum_ref {
\rpublic:\v
    phylum_ref(T* t) { _phylum=t; }

    T* get_phylum() const { return _phylum; }
    impl_abstract_phylum* get_abstract_phylum() const { return _phylum; }

    phylum_ref<T>& operator=(const T& t) {
	abstract_phylum_ref* ref=t.get_ref();
	if(ref)
	    set_phylum(static_cast<T*>(t.copy(true)));
	else
	    set_phylum(const_cast<T*>(&t));
	return *this;
    }
    phylum_ref<T>& operator=(const phylum_ref<T>& r) {
	T* t=r.get_phylum();
	if(t) return operator=(*t);
	set_phylum(0);
	return *this;
    }

    void reset_phylum() { _phylum=0; }
    void set_phylum(T* t) {
	if(_phylum!=t) {
	    _phylum->set_ref(0);
	    _phylum->free();
	    _phylum=t;
	    if(_phylum)
		_phylum->set_ref(this);
	}
    }
\rprotected:\v
    void clear() { if(_phylum) { reset_ref(); _phylum->free(); _phylum=0; } }
    void reset_ref() { if(_phylum) _phylum->set_ref(0); }
\rprivate:\v
    T* _phylum;
};\n"

// Finally, the smart pointer itself.

"// Smart pointer containing a reference
template <typename T>
class phylum_ptr {
\rpublic:\v
"
{ if(g_options.weak_pointer) } ${
"   phylum_ptr(bool weak=false) { _ref=0; _weak=weak; }
    phylum_ptr(T* t,bool weak=false) {
	_ref=0; _weak=weak;
	if(t) set_ref(static_cast<phylum_ref<T>*>(t->add_ref()));
    }
    phylum_ptr(const phylum_ptr<T>& p, bool weak=false) {
	_ref=0; _weak=weak;
	set_ref(p.get_ref());
    }
"
$} { else } ${
"   phylum_ptr() { _ref=0; }
    phylum_ptr(T* t) {
	_ref=0;
	if(t) set_ref(static_cast<phylum_ref<T>*>(t->add_ref()));
    }
    phylum_ptr(const phylum_ptr<T>& p) {
	_ref=0;
	set_ref(p.get_ref());
    }
"
$} // if(g_options.weak_pointer)
"   ~phylum_ptr() { set_ref(0); }

    phylum_ptr<T>& operator=(T* t) {
	if(t)
	    set_ref(static_cast<phylum_ref<T>*>(t->add_ref()));
	else
	    set_ref(0);
	return *this;
    }

    phylum_ptr<T>& operator=(const phylum_ptr<T>& p) {
	set_ref(p.get_ref());
	return *this;
    }

    T* get_phylum() const { return _ref?_ref->get_phylum():0; }

    operator T*() const { return get_phylum(); }
    T* operator()() const { return get_phylum(); }
    T* operator->() const { return get_phylum(); }
    operator bool() const { return get_phylum()!=0; }
    bool operator!() const { return get_phylum()==0; }

    T* return_ptr() const { if(_ref) _ref->lock(); return get_phylum(); }

    bool operator==(int null) const { return null?false:(get_phylum()==0); }
    bool operator==(const T* t) const { return get_phylum()==t; }
    bool operator==(const phylum_ptr<T>& t) const { return get_phylum()==t.get_phylum(); }
    bool operator!=(int null) const { return null?true:(get_phylum()!=0); }
    bool operator!=(const T* t) const { return get_phylum()!=t; }
    bool operator!=(const phylum_ptr<T>& t) const { return get_phylum()!=t.get_phylum(); }

    phylum_ref<T>& operator*(){ return *add_ref(); }
    const phylum_ref<T>& operator*() const {
	return *const_cast<phylum_ptr<T>*>(this)->add_ref();
    }

    phylum_ref<T>* get_ref() const { return _ref; }

    phylum_ref<T>* add_ref() {
	if(!_ref) set_ref(new phylum_ref<T>(0));
	return _ref;
    }
\rprotected:\v
"
{ if(g_options.weak_pointer) } ${
"   void set_ref(phylum_ref<T>* r) {
	if(_ref!=r) {
	    if(_weak) {
		if(r) r->weak_ref();
		if(_ref) _ref->weak_unref();
	    }
	    else {
		if(r) r->ref();
		if(_ref) _ref->unref();
	    }
	    _ref=r;
	}
    }
"
$} { else } ${
"   void set_ref(phylum_ref<T>* r) {
	if(_ref!=r) {
	    if(r) r->ref();
	    if(_ref) _ref->unref();
	    _ref=r;
	}
    }
"
$} // if(g_options.weak_pointer)
"
\rprivate:\v
    phylum_ref<T>* _ref;
"
{ if(g_options.weak_pointer) } ${
"   bool _weak;
"
$}
"};
typedef phylum_ptr<impl_abstract_phylum> abstract_phylum_ptr;
"
{ if(g_options.weak_pointer) } ${
"
template <typename T>
class weak_phylum_ptr: public phylum_ptr<T> {
\rpublic:\v
    weak_phylum_ptr(): phylum_ptr<T>(true){}
    weak_phylum_ptr(T* t):phylum_ptr<T>(t,true){}
    weak_phylum_ptr(const weak_phylum_ptr<T>& p):phylum_ptr<T>(p,true){}
    weak_phylum_ptr(const phylum_ptr<T>& p):phylum_ptr<T>(p,true){}

    weak_phylum_ptr<T>& operator=(T* t) {
	if(t)
	    set_ref(static_cast<phylum_ref<T>*>(t->add_ref()));
	else
	    set_ref(0);
	return *this;
    }

    weak_phylum_ptr<T>& operator=(const phylum_ptr<T>& p) {
	set_ref(p.get_ref());
	return *this;
    }
};
typedef weak_phylum_ptr<impl_abstract_phylum> weak_abstract_phylum_ptr;
"
$} // if(g_options.weak_pointer)
"
template <typename P, typename T>
P phylum_cast(phylum_ptr<T>& t) {
    return static_cast<P>(t());
}
template <typename P, typename T>
const P phylum_cast(const phylum_ptr<T>& t) {
    return static_cast<const P>(t());
}
"
$} // if(g_options.smart_pointer)
"
template <typename P, typename T>
P phylum_cast(T* t) {
    return static_cast<P>(t);
}
template <typename P, typename T>
const P phylum_cast(const T* t) {
    return static_cast<const P>(t);
}
"
    // This produces the forward declarations of the phylum classes
    pds

"

void kc_invalid_operator( const char *kc_func_prefix, enum_phyla kc_phy, int kc_line,
	const char *kc_file, enum_operators kc_oper ) __attribute__ ((noreturn));

typedef enum_phyla *enum_phyla_list;

/*
 * make sure that the first 'real' storage class _always_ gets a value > 0
 * and kc_not_uniq gets a value == 0
 * (because then we can use it as a C boolean)
 */
enum kc_storageclass_t {
	" Thestorageclasses:view_gen_operatormap_type_h
",
last_storageclass
};

typedef struct {
    const char *name;			// name of the phylum
    enum_operators first_operator;	// index in operator_info[]
    enum_operators last_operator;	// index in operator_info[]
    kc_storageclass_t uniq_stored;	// storage class
} KC_PHYLUM_INFO;

typedef struct {
    const char *name;			// name of the operator
    size_t no_sons;			// number of sons
    bool atomicity;			// atomic type or not
    enum_phyla phylum;			// index in phylum_info[]
    enum_phyla_list subphylum;		// indexes in phylum_info[]
    int no_attrs;			// number of attributes
    enum_phyla_list attribute;		// indexes in phylum_info[]
    size_t size;			// size of operator (for statistics)
} KC_OPERATOR_INFO;

typedef enum_phyla_list KC_UNIQ_INFO;

extern KC_OPERATOR_INFO operator_info[];
extern KC_PHYLUM_INFO phylum_info[];
extern KC_UNIQ_INFO kc_UniqInfo[];

#define KC_OP_NAME(op) (operator_info[op].name)
#define KC_NO_SONS(prod) (operator_info[prod].no_sons)
#define KC_ATOMICITY(prod) (operator_info[prod].atomicity)

"
					];

PhylumDeclarations( pds )		-> [view_gen_classdecls2_h:
"
//namespace Phylum {\r
"
"
class "
{ if(g_options.dllexports!="") {
	PRINT(g_options.dllexports.c_str());
	PRINT(" ");
} }
"impl_abstract_phylum"
{
	with(The_abstract_phylum_decl->base_classes) {
		Consbaseclass_list(*,*): {
			PRINT("\b :\b ");
			UNPARSE(The_abstract_phylum_decl->base_classes);
		}
		default: {}
	}
}
" {
\rpublic:\v
    virtual enum_operators prod_sel() const =0;
    static const enum_phyla phylum_sel_;
    enum_phyla phylum() const;
    const char* phylum_name() const;
    const char* op_name() const;
    virtual abstract_phylum subphylum(int) const;
    virtual void set_subphylum(int, abstract_phylum);
    void free(bool recursive=true);
    bool eq(c_abstract_phylum) const;
    void print();
    void fprint(FILE *);
    abstract_phylum copy(bool kc_copy_attributes) const;\n"
    { if(!g_options.no_unparse) } ${
"	void unparse(printer_functor pf, uview uv)
	    \v{ do_unparse(pf, uv); }\r
        void unparse(printer_function opf, uview uv);\n"
    $}
    { if(!g_options.no_printdot) } ${
"
	void printdot_add_edge (c_abstract_phylum, int, int*, kc_dotedgenode_t*, const char*) const;
	void do_printdot_id (FILE*, bool, c_abstract_phylum, int) const;
	void do_printdot (FILE*, bool, int*, kc_dotedgenode_t*, const char*, bool, bool, c_abstract_phylum, int) const;

	virtual void fprintdot(FILE *,
	const char *root_label_prefix, const char *edge_label_prefix, const char *edge_attributes,
	bool print_node_labels, bool use_context_when_sharing_leaves, bool print_prologue_and_epilogue) const =0;
"
    $}

    { if(!g_options.no_csgio) } ${
"	void CSGIOwrite(FILE *) const;
"
    $}

    { if(!g_options.no_rewrite) } ${
    { if(!g_options.rw_loop) } ${
"	virtual abstract_phylum rewrite(rview v) { return do_rewrite(v); }
"
    $} { else } ${
"	abstract_phylum rewrite(rview v) {
	    return rewrite_loop(v); }
	abstract_phylum rewrite_loop(rview v);
"
    $}
"	virtual abstract_phylum do_rewrite(rview) { return this;}
	// called if a subphylum of an op is rewritten and a new op is created by default rule
	virtual void rewrite_members(abstract_phylum from) {} 
"
    $}
    { if(!f_post_create_in_phylumdecl(The_abstract_phylum_decl)) } ${
"	virtual void post_create(){}
"
    $}
    { fndeclarations tapam = The_abstract_phylum_decl->additional_members; }
    tapam:view_gen_member_dcl_h
    tapam:view_count_nonstaticmembers
{ if(g_options.smart_pointer) } ${
    { if(!f_constructors_in_phylumdecl(The_abstract_phylum_decl)) } ${
"	impl_abstract_phylum()"
	{ if(gl_no_of_args!=0) } ${
	    ": " gl_members:view_gen_user_assignment_inis
	$}
	    "\v
		{ _ref=0; }\r
	    "
    $}
    { if(!f_destructors_in_phylumdecl(The_abstract_phylum_decl)) } ${
"	virtual ~impl_abstract_phylum() {
	    if(_ref)
		_ref->reset_phylum();
	}
"
    $}
"	impl_abstract_phylum(const impl_abstract_phylum&) {
	    _ref=0;
	}
	abstract_phylum_ref* get_ref() const {
	    return _ref;
	}
	abstract_phylum_ref* add_ref() {
	    if(!_ref)
		_ref=new_phylum_ref();
	    return _ref;
	}
	void set_ref(abstract_phylum_ref* r) {
	    _ref=r;
	}
	virtual abstract_phylum_ref* new_phylum_ref()=0;
	abstract_phylum return_ptr() { if(get_ref()) get_ref()->lock(); return this; }
\rprivate:\v
	abstract_phylum_ref*_ref;
"
$} { else } ${ // no smartpointers
    { if (!f_constructors_in_phylumdecl(The_abstract_phylum_decl) && gl_no_of_args!=0) } ${
	"explicit impl_abstract_phylum()\v\n: " gl_members:view_gen_user_assignment_inis " { }\r\n"
    $}
    { if(!f_destructors_in_phylumdecl(The_abstract_phylum_decl)) } ${
"	virtual ~impl_abstract_phylum() { }
"
    $}
$} // end smartpointers
    { if(!g_options.no_unparse) } ${
"\rprivate:\v
	virtual void do_unparse(printer_functor, uview) =0;
\rprotected:\v
	virtual void default_unparse(printer_functor, uview);\n"
    $}
"};\n\n"
// End of impl_abstract_phylum

// A specialisation of the smart pointer class for abstract_phylum
{ if(g_options.smart_pointer) } ${
"template <>
class phylum_ptr<impl_abstract_phylum> {
\rpublic:\v
"
{ if(g_options.weak_pointer) } ${
"   phylum_ptr(bool weak=false) { _ref=0; _weak=weak; }
    phylum_ptr(impl_abstract_phylum* t,bool weak=false) {
	_ref=0; _weak=weak;
	if(t) set_ref(t->add_ref());
    }
    phylum_ptr(const phylum_ptr<impl_abstract_phylum>& p, bool weak=false) {
	_ref=0; _weak=weak;
	set_ref(p.get_ref());
    }
"
$} { else } ${
"   phylum_ptr() { _ref=0; }
    phylum_ptr(impl_abstract_phylum* t) {
	_ref=0;
	if(t) set_ref(t->add_ref());
    }
    phylum_ptr(const phylum_ptr<impl_abstract_phylum>& p) {
	_ref=0;
	set_ref(p.get_ref());
    }
"
$} // if(g_options.weak_pointer)
"
    ~phylum_ptr() { set_ref(0); }

    template <typename T>
    phylum_ptr<impl_abstract_phylum>& operator=(T* t) {
	if(t)
	    set_ref(t->add_ref());
	else
	    set_ref(0);
	return *this;
    }

    template <typename T>
    phylum_ptr<impl_abstract_phylum>& operator=(const phylum_ptr<T>& p) {
	set_ref(p.get_ref());
	return *this;
    }

    impl_abstract_phylum* get_phylum() const {
	return _ref?_ref->get_abstract_phylum():0;
    }

    operator impl_abstract_phylum*() const { return get_phylum(); }
    impl_abstract_phylum* operator()() const { return get_phylum(); }
    impl_abstract_phylum* operator->() const { return get_phylum(); }
    operator bool() const { return get_phylum()!=0; }
    bool operator!() const { return get_phylum()==0; }

    abstract_phylum return_ptr() { if(_ref) _ref->lock(); return get_phylum(); }

    bool operator==(int null) const { return null?false:(get_phylum()==0); }
    template <typename T>
    bool operator==(const T* t) const { return get_phylum()==t; }
    template <typename T>
    bool operator==(const phylum_ptr<T>& t) const { return get_phylum()==t.get_phylum(); }

    bool operator!=(int null) const { return null?true:(get_phylum()!=0); }
    template <typename T>
    bool operator!=(const T* t) const { return get_phylum()!=t; }
    template <typename T>
    bool operator!=(const phylum_ptr<T>& t) const { return get_phylum()!=t.get_phylum(); }

    abstract_phylum_ref* get_ref() const { return _ref; }

\rprotected:\v
"
{ if(g_options.weak_pointer) } ${
"   void set_ref(abstract_phylum_ref* r) {
	if(_ref!=r) {
	    if(_weak) {
		if(r) r->weak_ref();
		if(_ref) _ref->weak_unref();
	    }
	    else {
		if(r) r->ref();
		if(_ref) _ref->unref();
	    }
	    _ref=r;
	}
    }
"
$} { else } ${
"   void set_ref(abstract_phylum_ref* r) {
	if(_ref!=r) {
	    if(r) r->ref();
	    if(_ref) _ref->unref();
	    _ref=r;
	}
    }
"
$} // if(g_options.weak_pointer)
"
\rprivate:\v
    abstract_phylum_ref* _ref;
"
{ if(g_options.weak_pointer) } ${
"   bool _weak;\n"
	$}
"};\n"
$} // if(g_options.smart_pointer)
"
class "
{ if(g_options.dllexports!="") {
	PRINT(g_options.dllexports.c_str());
	PRINT(" ");
} }
"impl_abstract_list: "
{
	with(The_abstract_list_decl->base_classes) {
		Consbaseclass_list(*,*): {
			UNPARSE(The_abstract_list_decl->base_classes);
		}
		default: { PRINT("public impl_abstract_phylum"); }
	}
}
"{
\rprivate:\v
    void fprint_list(FILE *);
    friend class impl_abstract_phylum;
\rprotected:\v
    abstract_phylum do_concat(c_abstract_phylum other, enum_operators) const;
    abstract_phylum do_reverse(c_abstract_phylum tail, enum_operators) const;
    abstract_phylum do_map(abstract_phylum (*kc_fp)(abstract_phylum), enum_operators);
    abstract_phylum do_filter(bool (*kc_fp)(abstract_phylum), enum_operators);
    abstract_list   do_append(abstract_phylum, abstract_list);
    abstract_phylum do_merge(abstract_list,abstract_phylum (*kc_fp)(abstract_phylum,abstract_phylum), enum_operators);
    abstract_phylum do_reduce(abstract_phylum neutral, abstract_phylum (*kc_fp)(abstract_phylum,abstract_phylum));
\rpublic:\v\n"
    { tapam = The_abstract_list_decl->additional_members; }
    tapam:view_count_nonstaticmembers
    { if (!f_constructors_in_phylumdecl(The_abstract_list_decl) && gl_no_of_args!=0) } ${
	"explicit impl_abstract_list()\v\n: " gl_members:view_gen_user_assignment_inis " { }\r\n"
    $}
"    virtual bool is_nil() const =0;
    virtual abstract_list reverse() const =0;
    int length() const;
    abstract_phylum last() const;
    // Non-virtual, non-existing... Type must be known exactly anyway because
    // of the function given as a parameter
    //virtual abstract_list map( abstract_phylum (*)( abstract_phylum )) =0;
    //virtual abstract_list filter(bool (*)(abstract_phylum)) =0;
    void freelist();
"
{ if(g_options.smart_pointer) } ${
"   impl_abstract_list* return_ptr() { if(get_ref()) get_ref()->lock(); return this; }\n"
$}
    { The_abstract_list_decl->additional_members->unparse(
	    kc_printer,view_gen_member_dcl_h); }
"};
"
    pds "
//} // namespace Phylum

"
					];
Consphylumdeclarations( pd, rpds )	-> [view_gen_classdecls1_h view_gen_classdecls2_h view_gen_classdefs_c: rpds pd ];
Nilphylumdeclarations()			-> [view_gen_classdecls1_h view_gen_classdefs_c: /* EMPTY */ ];
Nilphylumdeclarations()			-> [view_gen_classdecls2_h: "
abstract_phylum kc_create(enum_operators createOp"
{ int j=Theargsnumbers->last()->value;
  if (j<2) j=2; /* lists (even abstract) need two subphyla */
  for (int i = 1; i<=j; ++i) } ${
    ", abstract_phylum=0"
$} ");
abstract_phylum kc_create(enum_operators createOp, const std::vector<abstract_phylum>& kc_ps);
abstract_phylum& attributeOf(abstract_phylum kc_p, int no);
\n"					];
PhylumDeclaration( *, *, Emptyproductionblock(), * )
					-> [view_gen_classdecls1_h view_gen_classdecls2_h view_gen_classdefs_c: /* EMPTY */ ];


PhylumDeclaration( id, *, PredefinedAlternatives(Consalternatives(Alternative(oid, *), *)), *)
					-> [view_gen_classdecls1_h:
"class impl_" id "_" oid ";
"
{ if(g_options.smart_pointer) } ${
"typedef phylum_ptr<impl_" id "_" oid "> " id "_ptr;
"
$}
{ if(g_options.weak_pointer) } ${
"typedef weak_phylum_ptr<impl_" id "_" oid "> weak_" id "_ptr;
"
$}
					];
PhylumDeclaration( id, *, *, * )	-> [view_gen_classdecls1_h:
"class impl_" id ";
"
{ if(g_options.smart_pointer) } ${
"typedef phylum_ptr<impl_" id "> " id "_ptr;
"
$}
{ if(g_options.weak_pointer) } ${
"typedef weak_phylum_ptr<impl_" id "> weak_" id "_ptr;
"
$}
					];
PhylumDeclaration( id, *, PredefinedAlternatives(alts=
	    Consalternatives(Alternative(oid,*), *)), cco )
					-> [view_gen_classdecls2_h:
"class impl_" id "_" oid ";
typedef impl_" id "_" oid " impl_" id ";
"
    alts
					];
ph_decl=
PhylumDeclaration( id, *, alt, cco )	-> [view_gen_classdecls2_h:
"class "
{ if(g_options.dllexports!="") {
	PRINT(g_options.dllexports.c_str());
	PRINT(" ");
} }
"impl_" id
{
    with(ph_decl->base_classes) {
	Consbaseclass_list(*,*): {
	    PRINT("\b :\b ");
	    UNPARSE(ph_decl->base_classes);
	}
	default: {
	    with (alt) {
		ListAlternatives( *, * ) : {
		    PRINT(": public impl_abstract_list"); }
		default: { PRINT(": public impl_abstract_phylum"); }
	    }
	}
    }
}
"{
\rpublic:\v\n"
    additional_members:view_count_nonstaticmembers
    { if (f_listelementphylum(id)->eq(f_emptyId()) &&
	    !f_constructors_in_phylumdecl($0) && gl_no_of_args!=0) } ${
	"explicit impl_" id "()\v\n: " gl_members:view_gen_user_assignment_inis " { }\r\n"
    $}
"   static const enum_phyla phylum_sel_;\n"
    { if(!g_options.no_printdot) } ${
"    void fprintdot( FILE*, const char*, const char*, const char*, bool, bool, bool ) const;
"
    $}

    { if(!g_options.no_rewrite && g_options.rw_loop) } ${
"	" id " rewrite(rview v) { return phylum_cast<" id ">(impl_abstract_phylum::rewrite(v)); }
"
    $}
    { if(g_options.smart_pointer) } ${
"   abstract_phylum_ref* new_phylum_ref() {
	return new phylum_ref<impl_" id ">(this);
    }
    impl_" id "& operator=(const impl_" id"& p) {
	phylum_ref<impl_" id ">* my_ref=static_cast<phylum_ref<impl_" id ">*>(get_ref());
	" id " self=this;
	if(my_ref) {
	    abstract_phylum_ref* ref=p.get_ref();
	    self=const_cast<"id">(&p);
	    if(ref)
		self=phylum_cast<"id">(self->copy(true));
	    my_ref->set_phylum(self);
	}
	return *self;
    }
    impl_" id "& operator=(const phylum_ref<impl_" id ">& r) {
	phylum_ref<impl_" id ">* my_ref=static_cast<phylum_ref<impl_" id ">*>(get_ref());
	" id " self=this;
	if(my_ref) {
	    self=phylum_cast<" id">(r.get_phylum()?r.get_phylum()->copy(true):0);
	    my_ref->set_phylum(self);
	}
	return *self;
    }

    impl_"id"* return_ptr() { if(get_ref()) get_ref()->lock(); return this; }
"
    $}
    cco:view_gen_nodetypes_h
    additional_members:view_gen_member_dcl_h
    $0:view_gen_listdecls_h
"};
"
    alt
					];

NonlistAlternatives(alts)		-> [view_gen_classdecls2_h view_gen_classdefs_c:
    alts
					];
ListAlternatives(*, *),
Nilalternatives()			-> [view_gen_classdecls2_h view_gen_classdefs_c: /* EMPTY */ ];
Consalternatives(alt, ra)		-> [view_gen_classdefs_c: alt ra ];
Consalternatives(alt=Alternative(oid, *), ra)
					-> [view_gen_classdecls2_h:
    alt
    alt:view_gen_nodetypes_h
{   ID pid = f_phylumofoperator(oid);
    if (f_ispredefinedphylum(pid)) ${
	f_phylumdeclofid(pid)->additional_members->unparse(kc_printer, view_gen_member_dcl_h);
    $} }
    alt->additional_members:view_gen_member_dcl_h
{   gl_operator = 0; }
    { if(!g_options.no_unparse) } ${
"\rprivate:\v
	void do_unparse(printer_functor, uview);\n"
    $}
"};
"
    ra
					];
alt=Alternative(oid, args)		-> [view_gen_classdecls2_h:
{   ID id = f_phylumofoperator(oid);
    gl_operator = oid; }
	"class "
	{ if(g_options.dllexports!="") {
		PRINT(g_options.dllexports.c_str());
		PRINT(" ");
	} }
	"impl_" id "_" oid ":"
{
    with(alt->base_classes) {
	Consbaseclass_list(*,*): {
	    UNPARSE(alt->base_classes);
	}
	default: {
	     if (f_ispredefinedphylum(id)) {
		 PRINT("public impl_abstract_phylum");
	     } else {
		 PRINT("public impl_"); UNPARSE(id);
	     }
	}
    }
}
"{
\rpublic:\v
    enum_operators prod_sel() const
    \v{ return sel_" oid "; }\r
"
    { if (f_ispredefinedphylum(id)) } ${
"   static const enum_phyla phylum_sel_;\n"
    $}
    { enum_operators kc_i = f_selofoperator(gl_operator);
      if(kc_i!=sel_NoCaseStr && kc_i!=sel__Str) } ${
	{ if(!f_constructors_in_operatordecl(alt)) } ${
	    "explicit impl_" id "_" oid "("
	    { if (f_ispredefinedphylum(id)) } ${
		args:view_gen_fnarg_and_decls_predef
	    $} { else } ${
		args:view_gen_operatordecls_h
	    $}
		    ");
	"
	$}
    $} { else } ${
"\rprivate:\v
	explicit impl_" id "_" oid "(const kc_char_t*);
	void make_own(int length);
	friend " id " mk" id "(const kc_char_t*, int);
\rpublic:\v
	~impl_" id "_" oid "() {
	#if defined (_MSC_VER) && _MSC_VER<1300
	    delete [] (kc_char_t*)name;
	#else
	    delete [] name;
	#endif
	}
"
    $}
    { if(args->length()!=0) } ${
"       abstract_phylum subphylum(int) const;
	void set_subphylum(int, abstract_phylum);
"
    $}

    { if (!g_options.no_printdot && f_ispredefinedphylum(id)) } ${
	"void fprintdot( FILE*, const char*, const char*, const char*, bool, bool, bool ) const;\n"
    $}

    { if (!g_options.no_rewrite) } ${
      { if (!g_options.rw_loop) } ${
	{ if (!f_ispredefinedphylum(id)) {
	    if(!f_rewrite_in_operatordecl(alt)) 
	    covariant_choice(id, " rewrite( rview );", "abstract_phylum rewrite( rview );",
		    kc_printer, kc_current_view);
	    else
		    covariant_choice(id, " do_rewrite( rview );", "abstract_phylum do_rewrite( rview );",
			    kc_printer, kc_current_view);
	    }
	else } ${
            { covariant_choice(id, " rewrite( rview )", "abstract_phylum rewrite( rview )",
		    kc_printer, kc_current_view); }
            "\n\v{ return this; }\r"
    $} $}
     { else } ${
	{ if (!f_ispredefinedphylum(id)) } ${
	"abstract_phylum do_rewrite( rview );"
	    $} $}
    $}
    "\n"
{ if (g_options.smart_pointer) } ${
    { if(f_ispredefinedphylum(id)) } ${
    "abstract_phylum_ref* new_phylum_ref() {
        return new phylum_ref<impl_" id "_" oid ">(this);
    }
    impl_" id "& operator=(const impl_" id"& p) {
	phylum_ref<impl_" id ">* my_ref=static_cast<phylum_ref<impl_" id ">*>(get_ref());
	" id " self=this;
	if(my_ref) {
	    abstract_phylum_ref* ref=p.get_ref();
	    self=const_cast<"id">(&p);
	    if(ref)
		self=phylum_cast<"id">(self->copy(true));
	    my_ref->set_phylum(self);
	}
	return *self;
    }
"   id:view_class_of_phy "& operator=(const phylum_ref<" id:view_class_of_phy ">& r) {
	phylum_ref<" id:view_class_of_phy ">* my_ref=static_cast<phylum_ref<" id:view_class_of_phy ">*>(get_ref());
	" id " self=this;
	if(my_ref) {
	    self=phylum_cast<"id">(r.get_phylum()?r.get_phylum()->copy(true):0);
	    my_ref->set_phylum(self);
	}
	return *self;
    }
    "
    $} { else } ${ // f_ispredefinedphylum
    id:view_class_of_phy "& operator=(const impl_" id"& p) {
	return " id:view_class_of_phy "::operator=(p);
    }
    impl_" id "& operator=(const phylum_ref<impl_" id ">& r) {
	return " id:view_class_of_phy "::operator=(r);
    }
    "
    $} // end f_ispredefinedphylum
    oid:view_class_of_op "* return_ptr() { if(get_ref()) get_ref()->lock(); return this; }\n"
$} // end smartpointers
					];

PhylumDeclaration( id, *, ListAlternatives( *, el ), * )
					-> [view_gen_classdefs_c:
    "const enum_phyla " id:view_class_of_phy "::phylum_sel_ = phylum_" id ";\n"
    id:view_class_of_phy "::" id:view_class_of_phy "(" el " p1 , " id " p2)
	\v: "
	// Initialize all attributes of the phylum
	additional_members:view_count_nonstaticmembers
	{ if (gl_no_of_args) } ${
	    gl_members:view_gen_user_assignment_inis
	    ", "
	$}
	el "_1(p1), " id "_1(p2) { }\r
"
					];

PhylumDeclaration( id, *, alts, *)	-> [ view_gen_classdefs_c:
    "const enum_phyla " id:view_class_of_phy "::phylum_sel_ = phylum_" id ";\n"
    { gl_phylum=id; }
    alts
					];
alt=Alternative(oid, args)		-> [ view_gen_classdefs_c:
    { gl_operator=oid;
      enum_operators kc_i = f_selofoperator(gl_operator);
      bool priorAssignments=false;
      if(kc_i!=sel_NoCaseStr && kc_i!=sel__Str) } ${
	  { if(!f_constructors_in_operatordecl(alt)) } ${
		oid:view_class_of_op "::" oid:view_class_of_op "("
		{ if (f_ispredefinedphylum(gl_phylum)) } ${
		    args:view_gen_fnarg_and_decls_predef
		$} { else } ${
		    args:view_gen_fnarg_and_decls
		$}
	    ")\n\v"
		// Initialize all subphyla
		{ if (f_ispredefinedphylum(gl_phylum)) ${
		    PRINT(priorAssignments ? ", " : ": "); priorAssignments=true; }
		    args:view_gen_assignments_predef_ini
		{ $} else if (args->length()>0) ${
		    PRINT(priorAssignments ? ", " : ": "); priorAssignments=true; }
		    args:view_gen_assignment_inis
		{ $} }
		// Initialize all attributes of the operator
		additional_members:view_count_nonstaticmembers
		{ if (gl_no_of_args) } ${
		    { PRINT(priorAssignments ? ", " : ": "); }
		    gl_members:view_gen_user_assignment_inis
		$}
	    " { }\r\n"
	    $}
      $}
					];

/***************************************************************************/

PhylumDeclaration( id, *, *, * )	-> [view_gen_listdecls_h:
    { if (g_options.covariant!='n') } ${
        { if (g_options.covariant=='p') } ${ "#ifndef NO_COVARIANT_RETURN\n" $}
	    { if(!g_options.no_rewrite && !g_options.rw_loop) } ${
	id " rewrite(rview) =0;\n"
	    $}
        { if (g_options.covariant=='p') } ${ "#endif // NO_COVARIANT_RETURN\n" $}
    $}
					];
PhylumDeclaration( id, *, ListAlternatives( *, el ), * ) -> [view_gen_listdecls_h:
"   enum_operators prod_sel() const{
      return is_nil() ? sel_Nil" id ": sel_Cons" id ";
    }
    explicit impl_" id "(" el " = 0, " id " = 0);
    abstract_phylum subphylum(int) const;
    void set_subphylum(int, abstract_phylum);
    friend " id " concat(c_" id ", c_" id ");\n"
{ if (g_options.covariant=='p') } ${ "#ifndef NO_COVARIANT_RETURN\n" $}
{ if (g_options.covariant!='n') } ${
     id " reverse() const;\n"
    { if(!g_options.no_rewrite && !g_options.rw_loop) } ${
	id " rewrite(rview);
"   $} $}
{ if (g_options.covariant=='p') } ${ "#else\n" $}
{ if (g_options.covariant!='y') } ${
"    abstract_list reverse() const;
"   { if(!g_options.no_rewrite && !g_options.rw_loop) } ${
"	abstract_phylum rewrite(rview);
"   $} $}
{ if (g_options.covariant=='p') } ${ "#endif // NO_COVARIANT_RETURN\n" $}
    { if(!g_options.no_rewrite && g_options.rw_loop) } ${
"	abstract_phylum do_rewrite(rview);
"
    $}
    el " last() const;
    " id " append(" el ");
    " id " map(" el " (*)(" el "));
    " id " filter( bool (*)(" el "));
    " id " merge( " id ", " el " (*)(" el ", " el "));
    " el " reduce( " el ", " el " (*)(" el ", " el "));
    bool is_nil() const;
"
{ if(g_options.smart_pointer) } ${
    el "_ptr " el "_1;
    " id "_ptr " id "_1;
"
$} { else } ${
    el " " el "_1;
    " id " " id "_1;
"
$}
"\rprivate:\v\n"
    { if(!g_options.no_rewrite && !g_options.rw_loop) } ${
	{ if (g_options.covariant=='p') } ${ "#ifndef NO_COVARIANT_RETURN\n" $}
	{ if (g_options.covariant!='n') } ${
"	    impl_" id "* nil_rewrite(rview);
	    impl_"	id "* cons_rewrite(rview);
"	$}
	{ if (g_options.covariant=='p') } ${ "#else\n" $}
	{ if (g_options.covariant!='y') } ${
"	    impl_abstract_phylum* nil_rewrite(rview);
	    impl_abstract_phylum* cons_rewrite(rview);
"	$}
	{ if (g_options.covariant=='p') } ${ "#endif // NO_COVARIANT_RETURN\n" $}
    $}
    { if (!g_options.no_unparse) } ${
"	void nil_do_unparse(printer_functor, uview);
	void do_unparse(printer_functor, uview);
"
    $}
					];
Alternative( oid, * )
					-> [view_gen_listdecls_h:
{   ID id = f_phylumofoperator(oid);
    ID el = f_listelementphylum(id);

    if (!el->eq(f_emptyId())) ${ }
    // TODO: Is this code ever generated?
    "// TODO: Is this code ever generated?\n"
    id " map(" el " (*)(" el "));\n"
    id " filter( bool (*)(" el "));\n"
    id " merge( " id ", " el " (*)(" el ", " el "));\n"
    el " reduce( " id " neutral, " el " (*)(" el ", " el "));\n"
    { $} }
					];


/***************************************************************************/

PhylumDeclarations( d )			-> [view_gen_nodetypedefs_h:
{ if(!g_options.no_printdot) } ${
"typedef class impl_kc_dotedgenode_t *kc_dotedgenode_t;
"
$}
"
"
    d
"
"
					];
Consphylumdeclarations( pd, rpds )	-> [view_gen_nodetypedefs_h: rpds pd ];
Nilphylumdeclarations()			-> [view_gen_nodetypedefs_h: /* EMPTY */ ];
PhylumDeclaration( *, *, Emptyproductionblock(), * )
					-> [view_gen_nodetypedefs_h: /* EMPTY */ ];
PhylumDeclaration( id, *, PredefinedAlternatives(Consalternatives(Alternative(oid, *), *)), *)
					-> [view_gen_nodetypedefs_h:
"typedef impl_" id "_" oid " *" id ";
typedef const impl_" id "_" oid " *c_" id ";
"
					];
PhylumDeclaration( id, *, *, * )
					-> [view_gen_nodetypedefs_h:
"typedef impl_" id " *" id ";
typedef const impl_" id " *c_" id ";
"
					];

/***************************************************************************/

PhylumDeclarations( d )			-> [view_gen_nodetypes_h:
// MPi d not evaluated here, call below made from view_gen_classdecls1_h
					];

Alternative( oid, Nilarguments() )	-> [view_gen_nodetypes_h:
{    if (f_ispredefinedphylum(f_phylumofoperator(oid))) ${
	enum_operators kc_i = f_selofoperator(oid); }
	"    " { PRINT(preDefTypeAndName[kc_i][0]); }
	" " { PRINT(preDefTypeAndName[kc_i][1]); } ";
"
{    $} else } ${ /* EMPTY */ $}
					];
Alternative( oid, args )		-> [view_gen_nodetypes_h:
    args
					];
Consarguments( a, rargs )		-> [view_gen_nodetypes_h:
    rargs
{ if(g_options.smart_pointer) } ${
	a "_ptr "
$} { else } ${
"	    impl_" a "* "
$}
	a "_" $0->seqnr ";\n"

{ if (a->named_subphylum) } ${
    { if(g_options.smart_pointer) } ${
	    a "_ptr& "
    $} { else } ${
    "	    impl_" a "*& "
    $}
	    a->named_subphylum " /* = " a "_" $0->seqnr "*/;\n"
$}
					];
CcodeOption( a, * )			-> [view_gen_nodetypes_h:
    a
					];
Nilattributes()				-> [view_gen_nodetypes_h: /* EMPTY */ ];
Consattributes( Attribute( t, id, * ), ra )
					-> [view_gen_nodetypes_h:
    ra
"    " t " " id ";
"
					];

/***************************************************************************/


PhylumDeclaration( *, *, PredefinedAlternatives(*), * ),
PhylumDeclaration( *, *, Emptyproductionblock(), * )
					-> [view_gen_subphylumdefs_c: /* EMPTY */ ];

PhylumDeclaration( id, *, ListAlternatives( *, el ), * )
					-> [view_gen_subphylumdefs_c:
    "abstract_phylum impl_" id "::subphylum(int no) const
{
  switch(no){
    case 0: return " el "_1;
    case 1: return " id "_1;
  }
  return 0;
}
"
					];

PhylumDeclaration( id, *, NonlistAlternatives( alt=* ), * )
					-> [view_gen_subphylumdefs_c:
    alt
					];

Consalternatives(Alternative( *, Nilarguments()), ra)
					-> [view_gen_subphylumdefs_c: ra ];

Consalternatives(Alternative( oid, args), ra)
					-> [view_gen_subphylumdefs_c:
{ ID id = f_phylumofoperator(oid); }
"abstract_phylum impl_" id "_" oid "::subphylum(int no) const
{
  switch(no){
"
{ gl_no_of_args = 0; }
   args
"  }
  return 0;
}
"
    ra
					];

Consarguments( a, ra )			-> [view_gen_subphylumdefs_c:
    ra
    "case " gl_no_of_args ": return " a "_" $0->seqnr ";\n"
    { gl_no_of_args++; }
					];

/***************************************************************************/


PhylumDeclaration( *, *, PredefinedAlternatives(*), * ),
PhylumDeclaration( *, *, Emptyproductionblock(), * )
					-> [view_gen_set_subphylumdefs_c: /* EMPTY */ ];

PhylumDeclaration( id, *, ListAlternatives( *, el ), * )
					-> [view_gen_set_subphylumdefs_c:
    "void impl_" id "::set_subphylum(int no, abstract_phylum val)
{
    abstract_phylum newval=0;
    switch(no) {
	case 0: newval = " el "_1 = dynamic_cast<" el ">(val);break;
	case 1: newval = " id "_1 = dynamic_cast<" id ">(val);break;
    }
    assertNonNull(newval);
}
"
					];

PhylumDeclaration( id, *, NonlistAlternatives( alt=* ), * )
					-> [view_gen_set_subphylumdefs_c:
    alt
					];

Consalternatives(Alternative( *, Nilarguments()), ra)
					-> [view_gen_set_subphylumdefs_c: ra ];

Consalternatives(Alternative( oid, args), ra)
					-> [view_gen_set_subphylumdefs_c:
{ ID id = f_phylumofoperator(oid); }
"void impl_" id "_" oid "::set_subphylum(int no, abstract_phylum val)
{
    abstract_phylum newval=0;
    switch(no) {
"
{ gl_no_of_args = 0; }
   args
"   }
    assertNonNull(newval);
}
"
    ra
					];

Consarguments( a, ra )
					-> [view_gen_set_subphylumdefs_c:
    ra
    "case " gl_no_of_args ": newval = " a "_" $0->seqnr
	" = dynamic_cast<" a ">(val);break;\n"
    { gl_no_of_args++; }
					];

/***************************************************************************/

PhylumDeclarations( * )			-> [view_gen_printdotdecls_h:
"
void fprintdotprologue ( FILE* );
void fprintdotepilogue ( FILE* );
"
					];
PhylumDeclarations( pds )		-> [view_gen_printdotdefs_c:
"
#ifndef KC_PRINTDOT_LABELSIZE
# define KC_PRINTDOT_LABELSIZE 1023
#endif

class impl_kc_dotedgenode_t
{
public:
    impl_kc_dotedgenode_t(c_abstract_phylum from,c_abstract_phylum to, int _son_nr):
	ptr_from(from), ptr_to(to), son_nr(_son_nr), label(0), lsize(0), next(0) { }
    c_abstract_phylum ptr_from;
    c_abstract_phylum ptr_to;
    int son_nr;
    char *label;
    int lsize;
    kc_dotedgenode_t next;
};

static kc_dotedgenode_t
kc_mkdotedgenode(struct kc_dotedge_ht*, c_abstract_phylum, c_abstract_phylum, int);
static void kc_do_printdot_do_add_edge (c_abstract_phylum, c_abstract_phylum, int, int*, kc_dotedgenode_t*, const char*);
static void kc_do_printdot_subgraph_prologue (FILE*, c_abstract_phylum, const char*, const char*, bool, bool);
static void kc_do_printdot_subgraph_epilogue (FILE*);
static void kc_do_printdot_genfields (FILE*, int, bool);
static void kc_do_printdot_edges (FILE*, kc_dotedgenode_t, const char*, bool);

static bool
kc_dotedge_less(kc_dotedgenode_t p1, kc_dotedgenode_t p2)
{
    if(p2==0)
	return false;
    if(p1==0)
	return true;
    if(p1->ptr_from<p2->ptr_from)
	return true;
    if(p1->ptr_from>p2->ptr_from)
	return false;
    if(p1->ptr_to<p2->ptr_to)
	return true;
    if(p1->ptr_to>p2->ptr_to)
	return false;
    if(p1->son_nr<p2->son_nr)
	return true;
    // OPERATORHASH((unsigned) kc_phy_from);
    // OPERATORHASH((unsigned) kc_phy_to);
    return false;
}

template<typename T>
struct dotedge_less : std::binary_function<T, T, bool> {
    bool operator()(const T& X, const T& Y) const { return kc_dotedge_less(X,Y); }
};

struct kc_dotedge_ht: public std::set<kc_dotedgenode_t, dotedge_less<kc_dotedgenode_t> > {
	~kc_dotedge_ht() {
		for(iterator i=begin();i!=end();++i)
			delete const_cast<kc_dotedgenode_t>(*i);
		clear();
	}
    kc_dotedgenode_t check_insert(kc_dotedgenode_t t) {
        std::pair<iterator,bool> res=insert(t);
        return *res.first;
    }
};

static kc_dotedge_ht* fprintdot_hashtable;
"
    pds
"

kc_dotedgenode_t
kc_mkdotedgenode(kc_dotedge_ht* kc_a_ht, c_abstract_phylum kc_s_from, c_abstract_phylum kc_s_to, int kc_son_nr)
{
    kc_dotedgenode_t kc_x = new impl_kc_dotedgenode_t(kc_s_from,kc_s_to,kc_son_nr);
 	kc_dotedgenode_t unique_kc_x=kc_a_ht->check_insert(kc_x);
	if(unique_kc_x!=kc_x) {
		delete kc_x;
		kc_x=unique_kc_x;
	}
    return kc_x;
}

void kc_do_printdot_subgraph_prologue(FILE *kc_f, c_abstract_phylum kc_p, const char *root_label_prefix, const char *edge_attributes, bool print_node_labels, bool use_context_when_sharing_leaves)
{
    if (!kc_f) kc_f = stdout;
    fprintf(kc_f, \"/*subgraph*/ {\\n\");
    if (root_label_prefix) {
	fprintf(kc_f, \"\\\"%s\\\" [shape=ellipse\", root_label_prefix);
	if (edge_attributes && (strlen(edge_attributes) > 0)) {
	    fprintf(kc_f, \", %s\", edge_attributes);
	}
	if (print_node_labels) {
	    fprintf(kc_f, \", label=\\\"%s\\\\n%s\\\"\", root_label_prefix, phylum_info[kc_p->phylum()].name);
	}
	fprintf(kc_f, \"];\\n\");
	fprintf(kc_f, \"\\\"%s\\\" ->\", root_label_prefix);
	kc_p->do_printdot_id(kc_f, use_context_when_sharing_leaves, 0, 0);
	if (edge_attributes && (strlen(edge_attributes) > 0)) {
	    fprintf(kc_f, \"[%s]\", edge_attributes);
	}
	fprintf(kc_f, \";\\n\");
    }
}

void kc_do_printdot_subgraph_epilogue(FILE *kc_f)
{
    if (!kc_f) kc_f = stdout;
    fprintf(kc_f, \"}\\n\");
}

void fprintdotprologue(FILE *kc_f)
{
    if (!kc_f) kc_f = stdout;
    fprintf(kc_f, \"digraph kc_output{\\n\");
    fprintf(kc_f, \"node [shape=record, height=.1, fontname=Helvetica];\\n\");
}

void fprintdotepilogue(FILE *kc_f)
{
    if (!kc_f) kc_f = stdout;
    fprintf(kc_f, \"}\\n\");
}

void kc_do_printdot_genfields(FILE *kc_f, int kc_prodsel, bool print_node_labels)
{
  int kc_i = 1;
  KC_OPERATOR_INFO *kc_op_info = &operator_info[kc_prodsel];
  if (kc_op_info->no_sons <= 0) return;
  if (!kc_f) kc_f = stdout;
  while(kc_i < kc_op_info->no_sons) {
    fprintf(kc_f, \"<f%d>\", kc_i);
    if (print_node_labels) {
      fprintf(kc_f, \"%s\", phylum_info[kc_op_info->subphylum[kc_i-1]].name);
    }
    fprintf(kc_f, \"|\");
    kc_i++;
  }
  fprintf(kc_f, \"<f%d>\", kc_i);
  if (print_node_labels) {
    fprintf(kc_f, \"%s\", phylum_info[kc_op_info->subphylum[kc_i-1]].name);
  }
}

void impl_abstract_phylum::do_printdot_id(FILE *kc_f, bool use_context_when_sharing_leaves, c_abstract_phylum kc_ctxt, int kc_son_nr) const
{
    // The casts only make unique ids, so reinterpret_cast is alright
    if (!kc_f) kc_f = stdout;
    enum_phyla kc_phy = phylum();
    if (kc_phy == phylum_voidptr) {
	fprintf(kc_f, \"kcidp%x\", reinterpret_cast<int>(this));
	if (use_context_when_sharing_leaves) {
	    fprintf(kc_f, \"_%x_%d\", reinterpret_cast<int>(kc_ctxt), kc_son_nr);
	}
    } else if ((kc_phy == phylum_casestring) || (kc_phy == phylum_nocasestring)) {
	fprintf(kc_f, \"kcids%x\", reinterpret_cast<int>(this));
	if (use_context_when_sharing_leaves) {
	    fprintf(kc_f, \"_%x_%d\", reinterpret_cast<int>(kc_ctxt), kc_son_nr);
	}
    } else if (kc_phy == phylum_integer) {
	fprintf(kc_f, \"kcidi%x\", reinterpret_cast<int>(this));
	if (use_context_when_sharing_leaves) {
	    fprintf(kc_f, \"_%x_%d\", reinterpret_cast<int>(kc_ctxt), kc_son_nr);
	}
    } else if (kc_phy == phylum_real) {
	fprintf(kc_f, \"kcidf%x\", reinterpret_cast<int>(this));
	if (use_context_when_sharing_leaves) {
	    fprintf(kc_f, \"_%x_%d\", reinterpret_cast<int>(kc_ctxt), kc_son_nr);
	}
    } else {
	fprintf(kc_f, \"kcidx%x\", reinterpret_cast<int>(this));
}   }

void kc_do_printdot_do_add_edge(c_abstract_phylum kc_p, c_abstract_phylum kc_sub_p, int kc_son_nr, int *kc_edge_nr, kc_dotedgenode_t *kc_edges, const char *edge_label_prefix)
{
    kc_dotedgenode_t kc_hn;
    char kc_buf[30];
    kc_hn = kc_mkdotedgenode(fprintdot_hashtable, kc_p, kc_sub_p, kc_son_nr);
    if (! kc_hn->label) {
		kc_hn->label = new char[(size_t)(KC_PRINTDOT_LABELSIZE+1)];
	kc_hn->lsize = KC_PRINTDOT_LABELSIZE;
	strcpy(kc_hn->label, \"\");
	kc_hn->next = *kc_edges;
	*kc_edges = kc_hn;
    } else {
	char kc_buf2[30];
	sprintf(kc_buf2, \", \");
	strncat(kc_hn->label, kc_buf2, kc_hn->lsize - strlen(kc_hn->label));
    }
    if (edge_label_prefix) {
	strncat(kc_hn->label, edge_label_prefix, kc_hn->lsize - strlen(kc_hn->label));
    }
    sprintf(kc_buf, \"%d\", *kc_edge_nr);
    strncat(kc_hn->label, kc_buf, kc_hn->lsize - strlen(kc_hn->label));
    (*kc_edge_nr)++;
}

void impl_abstract_phylum::printdot_add_edge(c_abstract_phylum kc_sub_p, int kc_son_nr, int *kc_edge_nr, kc_dotedgenode_t *kc_edges, const char *edge_label_prefix) const
{
  kc_do_printdot_do_add_edge(this, kc_sub_p, kc_son_nr, kc_edge_nr, kc_edges, edge_label_prefix);
}

void kc_do_printdot_edges(FILE *kc_f, kc_dotedgenode_t kc_edges, const char *edge_attributes, bool use_context_when_sharing_leaves)
{
    kc_dotedgenode_t kc_p = kc_edges;
    if (!kc_f) kc_f = stdout;
    while(kc_p) {
	kc_p->ptr_from->do_printdot_id(kc_f, use_context_when_sharing_leaves, 0, 0);
	fprintf(kc_f, \":f%d -> \", kc_p->son_nr);
	kc_p->ptr_to->do_printdot_id(kc_f, use_context_when_sharing_leaves, kc_p->ptr_from, kc_p->son_nr);
	fprintf(kc_f, \" [label=\\\"%s\\\"\", kc_p->label);
	if (edge_attributes && (strlen(edge_attributes) > 0)) {
	    fprintf(kc_f, \", %s\", edge_attributes);
	}
	fprintf(kc_f, \"];\\n\");
	kc_p = kc_p->next;
}   }

void impl_abstract_phylum::do_printdot(FILE *kc_f, bool kc_outmost, int *kc_edge_nr, kc_dotedgenode_t *kc_edges, const char *edge_label_prefix, bool print_node_labels, bool use_context_when_sharing_leaves, c_abstract_phylum kc_ctxt, int kc_son_nr) const
{
    int kc_i;

    if (!kc_f) kc_f = stdout;
    switch(phylum()) {
	case phylum_voidptr:
	    do_printdot_id(kc_f, use_context_when_sharing_leaves, kc_ctxt, kc_son_nr);
	    fprintf(kc_f, \" [label=\\\"%p\\\", shape=ellipse];\\n\", dynamic_cast<c_voidptr>(this)->pointer);
	    break;
	case phylum_casestring:
	case phylum_nocasestring:
	    do_printdot_id(kc_f, use_context_when_sharing_leaves, kc_ctxt, kc_son_nr);
#ifdef KC_UNICODE
	    fprintf(kc_f, \" [label=\\\"%s\\\", shape=ellipse];\\n\", kc_to_cstring(static_cast<c_casestring>(this)->name).c_str());
#else
	    fprintf(kc_f, \" [label=\\\"%s\\\", shape=ellipse];\\n\", static_cast<c_casestring>(this)->name);
#endif
	    break;
	case phylum_integer:
	    do_printdot_id(kc_f, use_context_when_sharing_leaves, kc_ctxt, kc_son_nr);
	    fprintf(kc_f, \" [label=\\\"%i\\\", shape=ellipse];\\n\", ((integer)this)->value);
	    break;
	case phylum_real:
	    do_printdot_id(kc_f, use_context_when_sharing_leaves, kc_ctxt, kc_son_nr);
	    fprintf(kc_f, \" [label=\\\"%f\\\", shape=ellipse];\\n\", ((real)this)->value);
	    break;
	default:
	    if (!subphylum(0)) {
		do_printdot_id(kc_f, use_context_when_sharing_leaves, kc_ctxt, kc_son_nr);
		fprintf(kc_f, \" [label=\\\"<f0>%s\\\"];\\n\", op_name());
	    } else {
		do_printdot_id(kc_f, use_context_when_sharing_leaves, kc_ctxt, kc_son_nr);
		fprintf(kc_f, \" [label=\\\"{<f0>%s|{\", op_name());
			kc_do_printdot_genfields(kc_f, prod_sel(), print_node_labels);
		fprintf(kc_f, \"}}\\\"];\\n\");
                abstract_phylum child;
		for (kc_i=0; (child = subphylum(kc_i)); kc_i++) {
		    printdot_add_edge(child, kc_i+1, kc_edge_nr, kc_edges, edge_label_prefix );
		    child->do_printdot( kc_f, false, kc_edge_nr, kc_edges, edge_label_prefix, print_node_labels, use_context_when_sharing_leaves, this, kc_i+1 );
		}
	    }
    }
}
"
					];
Consphylumdeclarations( pd, rpds )	-> [view_gen_printdotdefs_c:
    rpds
    pd
					];
Nilphylumdeclarations()			-> [view_gen_printdotdefs_c: /* EMPTY */ ];

PhylumDeclaration( *, *, Emptyproductionblock(), * )
					-> [view_gen_printdotdefs_c: /* EMPTY */ ];
PhylumDeclaration( id, *, PredefinedAlternatives( * ), * ),
PhylumDeclaration( id, *, ListAlternatives( *, * ), * ),
PhylumDeclaration( id, *, NonlistAlternatives( * ), * )
					-> [view_gen_printdotdefs_c:
"void impl_" id "::fprintdot(FILE *f, const char *root_label_prefix, const char *edge_label_prefix, const char *edge_attributes, bool print_node_labels, bool use_context_when_sharing_leaves, bool print_prologue_and_epilogue) const
{
    int kc_edge_nr = 1;
    kc_dotedgenode_t kc_edges = 0;
    if (print_prologue_and_epilogue) fprintdotprologue(f);
    /*if (kc_outmost)*/ kc_do_printdot_subgraph_prologue(f, this, root_label_prefix, edge_attributes, print_node_labels, use_context_when_sharing_leaves);
    fprintdot_hashtable = new kc_dotedge_ht;
    do_printdot(f, true, &kc_edge_nr, &kc_edges, edge_label_prefix, print_node_labels, use_context_when_sharing_leaves, 0, 0);
    kc_do_printdot_edges(f, kc_edges, edge_attributes, use_context_when_sharing_leaves);
    delete fprintdot_hashtable;
	fprintdot_hashtable=0;
    /*if (kc_outmost)*/ kc_do_printdot_subgraph_epilogue(f);
    if (print_prologue_and_epilogue) fprintdotepilogue(f);
}
"
					];

/* * * * * * * * * * * */

Nilphyla()				-> [view_gen_printdotdefs_c: /* EMPTY */ ];
Consphyla( a_phy, r_phy )		-> [view_gen_printdotdefs_c:
{ // MPi 20020903
    assertionFailed("Not used anymore"); }
 r_phy
"    assertReason(kc_phy != phylum_" a_phy ", \"kc_do_printdot_phylum called with phylum_" a_phy " argument\");
"
					];

/* * * * * * * * * * * */

Nilphyla()				-> [view_gen_printdotedges_c: /* EMPTY */ ];
Consphyla( a_phy, r_phy )		-> [view_gen_printdotedges_c:
 r_phy
"	case phylum_" a_phy ": {
	    kc_do_printdot_id_of__" a_phy "(kc_f, kc_p->ptr_to.yt_" a_phy ", use_context_when_sharing_leaves, kc_p->ptr_from.yt_voidptr, kc_p->son_nr);
	break; }
"
					];

/***************************************************************************/

PhylumDeclarations( pds )		-> [view_gen_listdefs_c:
    pds
					];
Consphylumdeclarations( pd, rpds )	-> [view_gen_listdefs_c:
    rpds
    pd
					];
Nilphylumdeclarations()			-> [view_gen_listdefs_c: /* EMPTY */ ];
PhylumDeclaration( *, *, *, * )		-> [view_gen_listdefs_c: /* EMPTY */ ];
PhylumDeclaration( id, *, ListAlternatives( *, el ), * )
					-> [view_gen_listdefs_c:
id "
concat(c_" id " kc_p1, c_" id " kc_p2)
{ return dynamic_cast<" id ">(kc_p1->do_concat(kc_p2, sel_Cons" id ")); }
"
{ covariant_choice(id, "\nimpl_", "::reverse() const", "abstract_list\nimpl_", "::reverse() const",
	kc_printer, kc_current_view); }
"\n{ return dynamic_cast<" id ">(do_reverse(Nil" id "(), sel_Cons" id ")); }

"
el "
impl_" id "::last() const
{ return dynamic_cast<" el ">(impl_abstract_list::last()); }

bool
impl_" id "::is_nil() const
{
  return " el "_1==0 && " id "_1==0;
}

"

id "
impl_" id "::map(" el " (*kc_fp)(" el "))
{ return dynamic_cast<" id ">(do_map((abstract_phylum (*)(abstract_phylum))kc_fp, sel_Cons" id ")); }
"

id "
impl_" id "::filter(bool (*kc_fp)(" el "))
{ return dynamic_cast<" id ">(do_filter((bool (*)(abstract_phylum))kc_fp, sel_Cons" id ")); }

" id "
impl_" id "::append(" el " new_last)
{
  return dynamic_cast<" id ">(do_append(new_last, Nil" id "()));
}
"
id "
impl_" id "::merge( " id " second, " el " (*kc_fp)(" el ", " el "))
{
    return dynamic_cast<" id ">(do_merge(second,(abstract_phylum(*)(abstract_phylum,abstract_phylum))kc_fp, sel_Cons" id "));
}
"
el "
impl_" id "::reduce( " el " neutral, " el " (*kc_fp)(" el ", " el "))
{
    return dynamic_cast<" el ">(do_reduce(neutral,(abstract_phylum(*)(abstract_phylum,abstract_phylum))kc_fp));
}

"
					];

/***************************************************************************/
/*
 * Included code
 *
 */
Nilincludedeclarations()		-> [view_gen_includes: /* EMPTY */ ];
Consincludedeclarations( *, * )		-> [view_gen_includes:
"namespace kc { }
using namespace kc;
/* included stuff */
"
    $0:view_do_gen_includes
"/* end included stuff */

"
					];
Nilincludedeclarations()		-> [view_do_gen_includes: /* EMPTY */ ];
Consincludedeclarations( e, l)		-> [view_do_gen_includes: l e ];
IncludeDeclaration( i )			-> [view_do_gen_includes:
{ if(g_options.linedirec) } ${ pg_line $0->line " \"" { PRINT(g_options.dir_line.c_str()); } $0->file:view_filename "\"\n" $}
    i
    g_emptystring:view_printer_outputfileline
					];

/***************************************************************************/
/*
 * CSGIO code
 */


PhylumDeclarations( * )			-> [view_gen_csgio_start_h:
"/* translation of file(s)\n"
Thefnfiles
" */
/* generated by:
 *  " kimwitu_copyright "
 */
#ifndef KC_CSGIO_HEADER
#define KC_CSGIO_HEADER
#include \"" { PRINT(g_options.prefix.c_str()); } "k.h\"    // in case a user forgets

"
					];
PhylumDeclarations( * )			-> [view_gen_csgio_end_h:
" #endif // KC_CSGIO_HEADER

"
					];

/***************************************************************************/

PhylumDeclarations( * )			-> [view_gen_csgio_start_c:
"/* translation of file(s)\n"
Thefnfiles
" */
/* generated by:
 *  " kimwitu_copyright "
 */
#define KC_CSGIO
"
{ if(g_options.stdafx!="") {
	PRINT("#include \"");
	PRINT(g_options.stdafx.c_str());
	PRINT("\"\n");
}	}
"
#include <stdio.h>
#include <setjmp.h>
#include <ctype.h>
#include <stdlib.h>
#include <map>
#include <algorithm>
#include \"" { PRINT(g_options.prefix.c_str()); } "k.h\"
#include \"" { PRINT(g_options.prefix.c_str()); } "csgiok.h\"

"
					];

PhylumDeclarations( pds )		-> [view_gen_csgio_h:
"
extern const char *kc_csgio_err_reason;

typedef enum {
    KC_CSGIOSTATUS_NO_ERR = 0,
    KC_CSGIOSTATUS_SCAN_ERR_1, KC_CSGIOSTATUS_SCAN_ERR_2, KC_CSGIOSTATUS_SCAN_ERR_3,
    KC_CSGIOSTATUS_SCAN_ERR_4, KC_CSGIOSTATUS_SCAN_ERR_5, KC_CSGIOSTATUS_GRAM_INCONSISTENT,
    KC_CSGIOSTATUS_ROK, KC_CSGIOSTATUS_ILLEGAL_OPTION, KC_CSGIOSTATUS_TOO_MANY_OPERATORS,
    KC_CSGIOSTATUS_WOK, KC_CSGIOSTATUS_TXT_FILE_INPUT, KC_CSGIOSTATUS_SYNTAX_ERROR,
    KC_CSGIOSTATUS_ILLEGAL_CONTEXT, KC_CSGIOSTATUS_PREMATURE_EOF,
    KC_CSGIOSTATUS_UNEXP_FATHER_MARK
} KC_IO_STATUS;

// XXX Needs to be extended
struct IO_exception {
    IO_exception(KC_IO_STATUS _io_status, const char* _err_reason=kc_csgio_err_reason, int _line=0)
	: io_status(_io_status), err_reason(_err_reason), line(_line) { }
    KC_IO_STATUS io_status;
    const char *err_reason;
    int line;
};

char* IO_exception2char(IO_exception);

#if defined(__GNUC__) && __GNUC__<3
    extern void CSGIOreadphylum(FILE*, abstract_phylum&, enum_phyla);
#endif

template<typename P> void
CSGIOread(FILE* kc_stream, P &kc_p)
{
    abstract_phylum kc_value;
#if !(defined(__GNUC__) && __GNUC__<3)
    extern void CSGIOreadphylum(FILE*, abstract_phylum&, enum_phyla);
#endif
    CSGIOreadphylum( kc_stream, kc_value, kc_p->phylum_sel_ );
    // Cast _could_ be static, but just to be completely sure
    if (dynamic_cast<P>(kc_value)==0)
	throw IO_exception(KC_CSGIOSTATUS_SCAN_ERR_5, \"Internal problem: Wrong phylum type created.\");
    kc_p = dynamic_cast<P>(kc_value);
}

"
					];
PhylumDeclarations( pds )		-> [view_gen_csgio_c:
"

namespace { // all local to this file
\r
/* macro that does the string concatenation */
#define kc_str_conc2(a,b) strcat(strcpy(new char[strlen(a) + strlen(b) +1], a), b)

/* function that reads the integers */
inline void
kc_do_get_int(int &c, int c_init, int &i, FILE *f)
{
    c = c_init;
    i = 0;
    while (isdigit(c)){
	i = (i*10) + (c-'0');
	c = getc(f);
    }
}

char *kc_malloc_area = 0;
size_t kc_sizeof_malloc_area = 0;
int kc_node_count;
int kc_node_count_base;

char*
kc_grow_malloc_area(size_t kc_s)
{
    delete kc_malloc_area;
    kc_malloc_area = new char[kc_s];
    kc_sizeof_malloc_area = kc_s;
    return kc_malloc_area;
}

inline char*
KC_GETMALLOCAREA(size_t kc_s)
{
    return kc_s > kc_sizeof_malloc_area ?
	kc_grow_malloc_area(kc_s) : kc_malloc_area;
}

/* global variables */
int kc_no_external_ops;
const int KC_NOT_FOUND_OPERATOR = -1;
int kc_file_offset_base;
int kc_file_offset;

/* Magic File descriptor(s) */
/* Magic descriptors of length up to KC_MAGIC_LENGTH-1 are supported.  When changing
 * KC_MAGIC_LENGTH. change constant in MAGIC_READ_FORMAT to be one less than
 * KC_MAGIC_LENGTH. */
/* Every file is assumed to start with the magic file descriptor for asc_csg_v3 */

char kc_ascii_prefix_magic_v3[] = \"A#S#C#S#S#L#V#3\";
char kc_ascii_prefix_magic_hu[] = \"A#S#C#S#S#L#HUB\";
const int KC_MAGIC_LENGTH = 25;
const char *KC_MAGIC_READ_FORMAT = \"%24s\\n\";

/* Operators with names of length upto OP_LENGTH-1 are supported. */
/* When changing OP_LENGTH, change constant in OP_READ_FOMAT to be one less */
const int KC_OP_LENGTH = 256;
const char *KC_OP_READ_FORMAT = \"%255s\\n\";

//**********************
// Error-string Routine
const char*
kc_CSGIOerrorstring(KC_IO_STATUS kc_io_status)
{
    switch( kc_io_status ) {
	case KC_CSGIOSTATUS_NO_ERR: return( \"No errors\" );
	case KC_CSGIOSTATUS_SCAN_ERR_1: return( \"Scan error(1)\" );
	case KC_CSGIOSTATUS_SCAN_ERR_2: return( \"Scan error(2)\" );
	case KC_CSGIOSTATUS_SCAN_ERR_3: return( \"Scan error(3)\" );
	case KC_CSGIOSTATUS_SCAN_ERR_4: return( \"Scan error(4)\" );
	case KC_CSGIOSTATUS_SCAN_ERR_5: return( \"Scan error(5)\" );
	case KC_CSGIOSTATUS_GRAM_INCONSISTENT: return( \"Grammar is inconsistent\" );
	case KC_CSGIOSTATUS_ROK: return( \"Read OK structure file\" );
	case KC_CSGIOSTATUS_ILLEGAL_OPTION: return( \"Illegal option in write command\" );
	case KC_CSGIOSTATUS_TOO_MANY_OPERATORS: return( \"Too many operators for binary format\" );
	case KC_CSGIOSTATUS_WOK: return( \"Written OK\" );
	case KC_CSGIOSTATUS_TXT_FILE_INPUT: return( \"Read OK Text-file\" );
	case KC_CSGIOSTATUS_SYNTAX_ERROR: return( \"Syntax error\" );
	case KC_CSGIOSTATUS_ILLEGAL_CONTEXT: return( \"Illegal context for operator\" );
	case KC_CSGIOSTATUS_PREMATURE_EOF: return( \"Premature eof in file\" );
	case KC_CSGIOSTATUS_UNEXP_FATHER_MARK: return( \"Unexpected FATHER MARKER\" );
	default: return( \"Unknown error code\" );
    }
}

struct csgio_info {
  int number;      // number of node, or -1 if no number
  bool created;    // whether the node is already written
  csgio_info():number(-1),created(false){}
};
typedef std::map<const void*,csgio_info> csgio_map;
csgio_map kc_CSGIOhashtable;

/* Maps */
typedef struct {
    int left;
    int right;
} kc_OpToOpMap_tuple_t;

kc_OpToOpMap_tuple_t kc_OpToOpMap[KC_NO_OF_OPERATORS];
const int KC_NOT_USED = -1;

int
kc_op_search(char *kc_s)
{
    int kc_i;
    for ( kc_i=0; kc_i < KC_NO_OF_OPERATORS; kc_i++ ) {
	if ( strcmp( kc_s, operator_info[kc_i].name ) == 0 ) return( kc_i );
    }
    return( KC_NOT_FOUND_OPERATOR );
}

void
kc_initializeOpToOpMap(int kc_v)
{
    int kc_i;
    for ( kc_i=0; kc_i < KC_NO_OF_OPERATORS; kc_i++ ) {
	kc_OpToOpMap[kc_i].left = kc_i;
	kc_OpToOpMap[kc_i].right = kc_v;
}   }

bool
OpToOpMap_cmp_right(kc_OpToOpMap_tuple_t t1, kc_OpToOpMap_tuple_t t2)
{
    // sort in DECREASING order
    return t1.right > t2.right;
}

bool
OpToOpMap_cmp_left(kc_OpToOpMap_tuple_t t1, kc_OpToOpMap_tuple_t t2)
{
    // sort in INCREASING order
    return t1.left < t2.left;
}

void
kc_renumberOpToOpMap()
{
    int kc_i, kc_j = 0;
    for ( kc_i=0; kc_i < KC_NO_OF_OPERATORS; kc_i++ ) {
	if (kc_OpToOpMap[kc_i].right > 0) {
	    kc_OpToOpMap[kc_i].right = kc_j++;
	} else {
	    kc_OpToOpMap[kc_i].right = KC_NOT_USED;
}   }	}


#define KC_MAKE_NEW_MAPPING(ext_op,int_op) kc_OpToOpMap[ext_op].right = int_op
#define KC_MAKE_NEW_SCAN_MAPPING(ext_op) kc_OpToOpMap[ext_op].right++
#define KC_MAP(op) (kc_OpToOpMap[op].right)
#define KC_IS_MAPPED(op) (kc_OpToOpMap[op].right != KC_NOT_USED)

void
kc_error_operator_not_in_phylum(int kc_op, int kc_phy)
{
    const char *kc_error_message1 = \"operator not defined in phylum \";
    const char *kc_error_message2 = \": \";
    if ((kc_op <= one_before_first_operator) || (kc_op >= last_operator)) {
	char kc_value[30];
	sprintf(kc_value, \"%d\",kc_op);
	kc_csgio_err_reason = kc_str_conc2(\"unknown operator number: \", kc_value);
    } else {
	kc_csgio_err_reason = (char*)strcat(strcat(strcat(strcpy(new char[(size_t)(strlen(kc_error_message1)+strlen(phylum_info[kc_phy].name)+strlen(kc_error_message2)+strlen(operator_info[kc_op].name)+1)], kc_error_message1), phylum_info[kc_phy].name), kc_error_message2), operator_info[kc_op].name);
    }
    throw IO_exception(KC_CSGIOSTATUS_ILLEGAL_CONTEXT); /*NOTREACHED*/
}

} // anonymous namespace

char*
IO_exception2char(IO_exception kc_p)
{
    char *kc_err_ret = 0;
    const char *kc_err_sep = \": \";
    if (kc_p.io_status != KC_CSGIOSTATUS_ROK && kc_p.io_status != KC_CSGIOSTATUS_WOK) {
	const char *kc_io_err = kc_CSGIOerrorstring(kc_p.io_status);
	kc_err_ret = new char[strlen(kc_io_err)+strlen(kc_err_sep)+strlen(kc_p.err_reason)+1];
	strcpy(kc_err_ret, kc_io_err);
	strcat(kc_err_ret, kc_err_sep);
	strcat(kc_err_ret, kc_p.err_reason);
    }
    return kc_err_ret;
}

const char *kc_csgio_err_reason = \"\";

#ifndef KC_NO_CSGIO_READ
namespace { // all local to this file
\r
/* Base 64 numbers are written with the digits:
   : ; < = > ? @ A-Z [ \\ ] ^ _ ` a-y
   Base 10 numbers are written with the ordinary digits 0-9.
   Other characters are used in special circumstances:
    ! Indicates switch between reading attribute and unattributed nodes.
    # Indicates that the father is the next PROD_INSTANCE in the file.
    + Indicates that the following bytes are not a base 64 number
    * Indicates a line containing a (decimal) count of attributes.
*/
const char KC_B64_ZERO_CHAR =	':';
const char KC_ASCII_ZERO =	'0';
const char KC_SWITCH_ATTR =	'!';
const char KC_FATHER_MARKER =	'#';
const char KC_NON_B64_CHAR =	'+';
const char KC_ATTR_COUNT =	'*';
const char KC_NULL_POINTER =    '.';

inline bool
KC_IS_B64(int c)
{
    return c>=KC_B64_ZERO_CHAR && c<KC_B64_ZERO_CHAR+64;
}

/* read and compute the base 64 integer in stream */
unsigned
get_rest_of_b64(FILE *kc_stream, register int kc_read_char, char kc_trailing_char)
{
    int kc_next_char;
    int kc_offset;
    int kc_i = 0;

    if (!KC_IS_B64(kc_read_char))
	throw IO_exception(KC_CSGIOSTATUS_SCAN_ERR_1);
    kc_offset = kc_read_char - KC_B64_ZERO_CHAR;

    kc_next_char = getc(kc_stream);
    while(KC_IS_B64(kc_next_char)) {
	kc_offset += (kc_next_char - KC_B64_ZERO_CHAR) << (6 * (++kc_i));
	kc_next_char = getc(kc_stream);
	}

    if (kc_next_char == '-') {
	kc_offset *= -1;
	kc_next_char = getc(kc_stream);
    }

    if (kc_next_char != kc_trailing_char)
	throw IO_exception(KC_CSGIOSTATUS_SCAN_ERR_1);
    return kc_offset;
}

/* read shared functions */
typedef enum { KC_NOT_READ_YET, KC_READ_EARLIER } KC_READ_STATUS;
/* variable used by the sharing routines during a read */
/* stores pointers to value_ptr fields */
abstract_phylum *kc_offset_to_address_map;
char const* *kc_offset_to_address_map_base;

void
kc_init_read_sharing()
{
  kc_offset_to_address_map = new abstract_phylum[kc_node_count];
  for(int i=0; i<kc_node_count; ++i) kc_offset_to_address_map[i]=0;
  kc_file_offset = 0;
  kc_offset_to_address_map_base = new char const* [kc_node_count_base];
  for(int j=0; j<kc_node_count_base; ++j) kc_offset_to_address_map_base[j]=0;
  kc_file_offset_base = 0;
}

KC_READ_STATUS
kc_read_sharing_find(FILE *kc_stream, abstract_phylum &kc_valptr)
{
    char kc_first_char;
    unsigned kc_offset;

    kc_first_char = getc(kc_stream);
    if (KC_IS_B64(kc_first_char)) {
	kc_offset = get_rest_of_b64(kc_stream, kc_first_char, '\\n');
	int off=kc_file_offset - kc_offset;
	assertReason(off>=0 && off<=kc_node_count, \"base 64 offset out of range\");
	kc_valptr = kc_offset_to_address_map[off];
	return(KC_READ_EARLIER);
    } else {
	ungetc(kc_first_char, kc_stream);
	return(KC_NOT_READ_YET);
    }
}

KC_READ_STATUS
kc_read_sharing_find_base(FILE *kc_stream, char const* &kc_valptr)
{
    char kc_first_char;
    unsigned kc_offset;

    kc_first_char = getc(kc_stream);
    if (KC_IS_B64(kc_first_char)) {
	kc_offset = get_rest_of_b64(kc_stream, kc_first_char, '\\n');
	int off=kc_file_offset_base - kc_offset;
	assertReason(off>=0 && off<=kc_node_count_base, \"base 64 offset out of range\");
	kc_valptr = kc_offset_to_address_map_base[off];
	return(KC_READ_EARLIER);
    } else {
	return(KC_NOT_READ_YET);
    }
}

#define kc_read_sharing_store(kc_ptr, kc_loc) \\
    kc_offset_to_address_map[kc_loc] = kc_ptr
#define kc_read_sharing_store_base(kc_ptr) \\
    kc_offset_to_address_map_base[kc_file_offset_base++] = kc_ptr


void
kc_end_read_sharing()
{
  delete kc_offset_to_address_map;
  delete kc_offset_to_address_map_base;
}

void
kc_CSGIOdo_read_atom_denotation(FILE *kc_stream, char *kc_sbase, int kc_len)
{
    char * kc_sptr = kc_sbase;
    register int kc_ch, kc_ch1;
    register char kc_test;
    register int kc_i;

    for (kc_i=0; kc_i<kc_len; kc_i++, kc_sptr++) {
	kc_ch = getc(kc_stream);
	if (kc_ch == '\\n') {
	    ungetc(kc_ch, kc_stream);
	    break;
	}
	*kc_sptr = (char) kc_ch;
	if ( kc_ch == '\\\\' ) {
	    if ( ( kc_test = getc( kc_stream ) ) != '\\\\' ) { /* Must be escaped hex */
		if (isdigit(kc_test)) kc_ch1 = kc_test - '0'; else kc_ch1 =kc_test + 10 - 'a';
		kc_ch1 = 16 * kc_ch1;
		kc_test = getc(kc_stream);
		if (isdigit(kc_test)) kc_test= kc_test - '0'; else kc_test=kc_test + 10 - 'a';
		kc_ch1 = kc_ch1 + kc_test;
		*kc_sptr = (char)kc_ch1; /* cast is for explicit narrowing from int to char */
	    }
	}
    }

    kc_ch = getc(kc_stream);
    if ( kc_ch == EOF ) throw IO_exception(KC_CSGIOSTATUS_PREMATURE_EOF);
    else if (kc_ch != '\\n') throw IO_exception(KC_CSGIOSTATUS_SCAN_ERR_1);

    *kc_sptr = '\\0';
}

abstract_phylum
CSGIOread2dft(FILE *kc_stream, enum_phyla kc_phy)
{
    char *kc_sbase;
    char const* c_kc_sbase;
    int kc_len;
    int kc_delim;
    abstract_phylum kc_answer;
    int kc_location;
    bool kc_not_read_yet = false;

/* get operator */
    int kc_ext_op;
    int kc_testing;

    /* XXX MPi: misleading comment? scan for optional unparsing version number */
    if (kc_read_sharing_find( kc_stream, kc_answer ) == KC_READ_EARLIER ) {
	// MPi: I believe this is unnecessary or wrong - sharing is only done
	// when phyla are the _same_, so they should remain the same.
        // kc_answer = kc_answer->copy(false);
	return kc_answer;
    }
    kc_do_get_int(kc_testing,getc(kc_stream),kc_ext_op,kc_stream);
    if ( kc_testing == EOF )
	throw IO_exception(KC_CSGIOSTATUS_SCAN_ERR_1);
    if ( kc_testing == KC_NULL_POINTER )
    {
	kc_do_get_int(kc_testing,getc(kc_stream),kc_ext_op,kc_stream);
	if ( kc_testing != '\\n' )
	    throw IO_exception(KC_CSGIOSTATUS_SCAN_ERR_1);
	return 0;
    }
    if ( kc_testing == KC_FATHER_MARKER )
	throw IO_exception(KC_CSGIOSTATUS_UNEXP_FATHER_MARK);
    if ( kc_testing != '\\n' )
	throw IO_exception(KC_CSGIOSTATUS_SCAN_ERR_1);
    enum_operators kc_op(static_cast<enum_operators>(KC_MAP( kc_ext_op )));
/* end get operator */

    if (kc_op<phylum_info[kc_phy].first_operator || kc_op>phylum_info[kc_phy].last_operator)
	    kc_error_operator_not_in_phylum(kc_op,kc_phy);

    kc_location = kc_file_offset++;
    switch( kc_op ) {\r
    case sel__VoidPtr:\v
	// FATAL ERROR
	kc_do_get_int(kc_delim,getc(kc_stream),kc_len,kc_stream);
	if ( kc_delim == EOF )
	    throw IO_exception(KC_CSGIOSTATUS_SCAN_ERR_1);
	kc_sbase = KC_GETMALLOCAREA(kc_len + 1); // +1 for '\\0'
	kc_CSGIOdo_read_atom_denotation(kc_stream, kc_sbase, kc_len);
	kc_answer = 0;
	break;\r
    case sel__Int:\v
	kc_do_get_int(kc_delim,getc(kc_stream),kc_len,kc_stream);
	if ( kc_delim == EOF )
	    throw IO_exception(KC_CSGIOSTATUS_SCAN_ERR_1);
	kc_sbase = KC_GETMALLOCAREA(kc_len + 1); // +1 for '\\0'
	kc_CSGIOdo_read_atom_denotation(kc_stream, kc_sbase, kc_len);
	kc_answer = mkinteger(::atoi(kc_sbase));
	break;\r
    case sel__Real:\v
	kc_do_get_int(kc_delim,getc(kc_stream),kc_len,kc_stream);
	if ( kc_delim == EOF )
	    throw IO_exception(KC_CSGIOSTATUS_SCAN_ERR_1);
	kc_sbase = KC_GETMALLOCAREA(kc_len + 1); // +1 for '\\0'
	kc_CSGIOdo_read_atom_denotation(kc_stream, kc_sbase, kc_len);
	kc_answer = mkreal(::atof(kc_sbase));
	break;\r
    case sel__Str:\v
	if (kc_read_sharing_find_base( kc_stream, c_kc_sbase ) == KC_NOT_READ_YET) {
	    kc_not_read_yet = true;
	    kc_do_get_int(kc_delim,getc(kc_stream),kc_len,kc_stream);
	    if ( kc_delim == EOF )
		throw IO_exception(KC_CSGIOSTATUS_SCAN_ERR_1);
	    kc_sbase = KC_GETMALLOCAREA(kc_len + 1); /* +1 for '\\0' */
	    kc_CSGIOdo_read_atom_denotation(kc_stream, kc_sbase, kc_len);
	    c_kc_sbase=kc_sbase;
	}
	kc_answer = mkcasestring( c_kc_sbase );
	if (kc_not_read_yet) {
	    kc_read_sharing_store_base( phylum_cast<casestring>(kc_answer)->name );
	}
	break;\r
    case sel_NoCaseStr:\v
	if (kc_read_sharing_find_base( kc_stream, c_kc_sbase ) == KC_NOT_READ_YET) {
	    kc_not_read_yet = true;
	    kc_do_get_int(kc_delim,getc(kc_stream),kc_len,kc_stream);
	    if ( kc_delim == EOF )
		throw IO_exception(KC_CSGIOSTATUS_SCAN_ERR_1);
	    kc_sbase = KC_GETMALLOCAREA(kc_len + 1); /* +1 for '\\0' */
	    kc_CSGIOdo_read_atom_denotation(kc_stream, kc_sbase, kc_len);
	    c_kc_sbase=kc_sbase;
	}
	kc_answer = mknocasestring( c_kc_sbase );
	if (kc_not_read_yet) {
	    kc_read_sharing_store_base( phylum_cast<nocasestring>(kc_answer)->name );
	}
	break;
    default:\v
	abstract_phylum kc_subtmp["
    { int i = Theargsnumbers->last()->value; if (i<=0) i = 1; } i
"];
	for (int kc_i = 0; kc_i < operator_info[kc_op].no_sons; ++kc_i) {
	    kc_subtmp[kc_i] = CSGIOread2dft(kc_stream, operator_info[kc_op].subphylum[kc_i] );
	    assertReason(kc_subtmp[kc_i]!=0, \"shared phylum is not contained in file (reference is wrong)\");
	}
"
"	switch(operator_info[kc_op].no_sons) {
"
    Theargsnumbers
"	default:\v
	    assertionFailed(\"unexpected number of sub-phyla\"); break;\r
	}\r
	// Read attributes
	for (int kc_i=0; kc_i<operator_info[kc_op].no_attrs; ++kc_i)\v
	    attributeOf(kc_answer, kc_i)=\v
		CSGIOread2dft(kc_stream, operator_info[kc_op].attribute[kc_i]);\r\r
    }
 
    kc_read_sharing_store( kc_answer, kc_location );
    return kc_answer;
}

} // anonymous namespace

void
CSGIOreadphylum(FILE *kc_stream, abstract_phylum &kc_ptr, enum_phyla kc_phy)
{
    int kc_scan_return_code;
    char kc_magic_no[KC_MAGIC_LENGTH];
    char kc_dollarcode[KC_OP_LENGTH];
    char kc_ext_name[KC_OP_LENGTH];
    int kc_operator;

    kc_csgio_err_reason = \"\";
    kc_scan_return_code = fscanf( kc_stream, KC_MAGIC_READ_FORMAT, kc_magic_no );
    if ( kc_scan_return_code != 1 )
	throw IO_exception(KC_CSGIOSTATUS_GRAM_INCONSISTENT, \"magic string not scanned\") ;
    if ( strcmp( kc_magic_no, kc_ascii_prefix_magic_v3 ) != 0 &&
	    strcmp( kc_magic_no, kc_ascii_prefix_magic_hu ) != 0 )
	throw IO_exception(KC_CSGIOSTATUS_GRAM_INCONSISTENT,\"scanned magic string is not asc_ssl_v3 (or HUB specific) magic string\") ;
    if ( fscanf( kc_stream, \"$%[^ ] \\n\", kc_dollarcode ) != 1 )
	throw IO_exception(KC_CSGIOSTATUS_GRAM_INCONSISTENT,\"problems finding $ before operators\") ;
    while ( strcmp( kc_dollarcode, \"operators\" ) != 0 ) {
	if ( fscanf( kc_stream, \"%*[^$]$%[^ ] \\n\", kc_dollarcode) != 1 )
	    throw IO_exception(KC_CSGIOSTATUS_GRAM_INCONSISTENT,\"problems finding operators keyword\") ;
    }
    /* read all external operator definitions and initialize map */
    kc_no_external_ops = 0;
    kc_initializeOpToOpMap(KC_NOT_FOUND_OPERATOR);
    while (true) {
	int kc_ext_arity, kc_ext_attr_arity, kc_ext_atomicity;

	if ( fscanf( kc_stream, \"%[^ ] \", kc_ext_name ) != 1 )
	    throw IO_exception(KC_CSGIOSTATUS_SCAN_ERR_3, \"no operator name at start of line\") ;
	else if ( kc_ext_name[0] == '$' )
	    break;
	else if ( fscanf( kc_stream, \"%d %d %d\\n\", &kc_ext_arity, &kc_ext_attr_arity, &kc_ext_atomicity ) != 3 )
	    throw IO_exception(KC_CSGIOSTATUS_SCAN_ERR_4, \"no arity, attr_arity or atomicity\") ;
	else {
	    kc_operator = kc_op_search( kc_ext_name );
	    if ( ( kc_operator == KC_NOT_FOUND_OPERATOR ) ||
		 ( KC_NO_SONS( kc_operator ) != kc_ext_arity ) ||
		 ( KC_ATOMICITY( kc_operator) != (kc_ext_atomicity!=0) )
	       )
		throw IO_exception(KC_CSGIOSTATUS_GRAM_INCONSISTENT, kc_str_conc2(\"problems with operator: \",kc_ext_name)) ;
	    else {
		KC_MAKE_NEW_MAPPING( kc_no_external_ops, kc_operator );
		kc_no_external_ops++;
    }	}   }
    /* ascertain that we are at the $object section, or get to that point */
    if ( strcmp( kc_ext_name, \"$object\" ) != 0 ) /* if not at $object */
	while ( strcmp( kc_ext_name, \"object\" ) != 0 ) {
	    if ( fscanf( kc_stream, \"%*[^$]$%[^ ]\", kc_ext_name ) != 1 )
		throw IO_exception(KC_CSGIOSTATUS_GRAM_INCONSISTENT, kc_str_conc2(\"problems finding start of object section\",\"\")) ;
	}

    /* read node_count; set up address map */
    if (fscanf(kc_stream, \"%d %d\\n\", &kc_node_count, &kc_node_count_base) != 2)
	throw IO_exception(KC_CSGIOSTATUS_SCAN_ERR_1);
    kc_init_read_sharing(); /* for shared values */

    /* read the tree (actually a graph) */
    kc_ptr = CSGIOread2dft( kc_stream, kc_phy );
    kc_end_read_sharing(); /* for atomic values */
}
#endif // ! KC_NO_CSGIO_READ

#ifndef KC_NO_CSGIO_WRITE
namespace { // all local to this file
\r

// print a string to a file, escaping backslashes and non-printables
void
kc_print_to_file(FILE *kc_f, char const* kc_value)
{
    unsigned char const* kc_vptr = (unsigned char const*)kc_value;
    int kc_len = strlen(kc_value);
    int kc_i;

    fprintf(kc_f, \"%d \", kc_len);
    for (kc_i=0; kc_i<kc_len; kc_i++, kc_vptr++) {
	if (*kc_vptr == '\\\\') {
	    fprintf(kc_f, \"\\\\\\\\\");
	} else if (isprint(*kc_vptr)) {
	    putc((char)*kc_vptr, kc_f);
	} else {
	    fprintf(kc_f, \"\\\\%.2x\", *kc_vptr);
	}
    }
    putc('\\n', kc_f);
}

void
kc_print_b64_to_file(FILE *kc_f, int kc_value)
{
    unsigned int kc_pos_value;

    if (kc_value == 0) {
	putc(KC_B64_ZERO_CHAR, kc_f);
    } else {
	kc_pos_value = abs(kc_value);
	while (kc_pos_value != 0) {
	    putc((kc_pos_value & ((1 << 6) - 1) ) + KC_B64_ZERO_CHAR, kc_f);
	    kc_pos_value >>= 6;
	}
	if (kc_value < 0) {
	    putc('-', kc_f);
	}
    }
    putc('\\n', kc_f);
}

// realize sharing of strings in ouput file
void
kc_CSGIOscan(c_abstract_phylum kc_p)
{
    if (kc_p==0) return;
    enum_operators kc_op = kc_p->prod_sel();
    if (kc_CSGIOhashtable[kc_p].number == -1) {
	kc_CSGIOhashtable[kc_p].number = kc_node_count++;
	KC_MAKE_NEW_SCAN_MAPPING( kc_op );
	switch(kc_op) {
	case sel__Str:
	case sel_NoCaseStr: {
	    char const* s = static_cast<c_casestring>(kc_p)->name;
	    if (kc_CSGIOhashtable[s].number == -1)\v
		kc_CSGIOhashtable[s].number = kc_node_count_base++;\r
	    break;
	}
        default: {
	    abstract_phylum child;
            for (int i=0; (child = kc_p->subphylum(i)); ++i)\v
		kc_CSGIOscan(child);\r
	}
	}
	for (int i=0; i<operator_info[kc_op].no_attrs; ++i)\v
	    kc_CSGIOscan(attributeOf(const_cast<abstract_phylum>(kc_p), i));\r
    }
}

void
kc_CSGIOwrite2structure(FILE *kc_stream, c_abstract_phylum kc_p)
{
    if (kc_p==0) {
	fprintf( kc_stream, \"%c\\n\", KC_NULL_POINTER );
	return;
    }
    char _kc_value[30];
    char *kc_value = _kc_value;
    enum_operators kc_op = kc_p->prod_sel();
    csgio_info &kc_hn = kc_CSGIOhashtable[kc_p];
    if (kc_hn.created) {
	kc_print_b64_to_file( kc_stream, kc_file_offset - kc_hn.number );
    } else {
	kc_hn.created = true;
	fprintf( kc_stream, \"%d\\n\", KC_MAP( kc_op ) );
	kc_file_offset++;
	switch(kc_op) {\r
	case sel__VoidPtr:\v
	    /* FATAL ERROR */
	    sprintf( kc_value, \"%p\", static_cast<c_voidptr>(kc_p)->pointer);
	    kc_print_to_file( kc_stream, kc_value );
	    kc_file_offset_base++;
	    break;\r
	case sel__Str:
	case sel_NoCaseStr:\v
	    fprintf( kc_stream, \"%c\", KC_NON_B64_CHAR );
	    kc_print_to_file( kc_stream, static_cast<c_casestring>(kc_p)->name);
	    kc_file_offset_base++;
	    break;\r
	case sel__Int:\v
	    sprintf( kc_value, \"%d\", static_cast<c_integer>(kc_p)->value);
	    kc_print_to_file( kc_stream, kc_value );
	    kc_file_offset_base++;
	    break;\r
	case sel__Real:\v
	    sprintf( kc_value, \"%.20f\", static_cast<c_real>(kc_p)->value);
	    kc_print_to_file( kc_stream, kc_value );
	    kc_file_offset_base++;
	    break;\r
	default:
            abstract_phylum child;
            for (int kc_i=0; (child = kc_p->subphylum(kc_i)); ++kc_i)\v
		kc_CSGIOwrite2structure(kc_stream, child);\r
	    // Write attributes
	    for (int kc_i=0; kc_i<operator_info[kc_op].no_attrs; ++kc_i)\v
		kc_CSGIOwrite2structure(kc_stream, attributeOf(const_cast<abstract_phylum>(kc_p), kc_i));\r
	}
    }
}

void
CSGIOwrite(FILE *kc_stream, c_abstract_phylum kc_p)
{
    int kc_i;
    kc_csgio_err_reason = \"\";

    /* write out the magic string and $operators string */
    fprintf( kc_stream, \"%s\\n$operators \\n\", kc_ascii_prefix_magic_hu );

    /* Initialize map from internal operators to external operators, */
    /* initially empty */
    kc_no_external_ops = 0;
    kc_node_count = 0;
    kc_node_count_base = 0;
    kc_initializeOpToOpMap(0); /* initialize to 0, not any other value */

    // realize sharing
    kc_CSGIOscan(kc_p);
    /* sort the optoopmap on decreasing operator usage */
    std::sort(&kc_OpToOpMap[0], &kc_OpToOpMap[KC_NO_OF_OPERATORS], OpToOpMap_cmp_right);
    kc_renumberOpToOpMap();

    /* write out the _sorted_ operator table */
    for(kc_i = 0; kc_i < KC_NO_OF_OPERATORS; kc_i++) {
	if (kc_OpToOpMap[kc_i].right != KC_NOT_USED) {
	    fprintf( kc_stream, \"%s %d %d %d\\n\", KC_OP_NAME( kc_OpToOpMap[kc_i].left), KC_NO_SONS( kc_OpToOpMap[kc_i].left ), 0, KC_ATOMICITY( kc_OpToOpMap[kc_i].left ) );
    }	}

    /* sort the optoopmap increasing on the operator number */
    std::sort(&kc_OpToOpMap[0], &kc_OpToOpMap[KC_NO_OF_OPERATORS], OpToOpMap_cmp_left);

    /* write out the grammar terminator string and the number of nodes */
    fprintf( kc_stream, \"$object \\n%d %d\\n\", kc_node_count, kc_node_count_base );

    /* write out the tree */
    kc_file_offset = 0;
    kc_file_offset_base = 0;
    kc_CSGIOwrite2structure( kc_stream, kc_p);
    kc_CSGIOhashtable.clear();
}

} // anonymous namespace

void
impl_abstract_phylum::CSGIOwrite(FILE *kc_stream) const
{
    kc::CSGIOwrite(kc_stream, this);
}

#endif // ! KC_NO_CSGIO_WRITE

"
					];

Nilargsnumbers()			-> [view_gen_csgio_c: /* EMPTY */ ];
Consargsnumbers( i, r )			-> [view_gen_csgio_c:
"   case " i ": kc_answer = kc_create(kc_op"
    { for (int j=0; j<i->value; ++j) } ${
	", kc_subtmp[" j "]"
					$}
"); break;
"
    r
					];

/***************************************************************************/
/*
 * attribute copy fnsdefs
 *
 */

PhylumDeclarations( pds )		-> [view_gen_copy_attributes_c:
"
void
copy_attributes(enum_phyla copyPhy, c_abstract_phylum kc_p1, abstract_phylum kc_p2)
{
    switch(copyPhy) {\r
"
    pds
"   case one_before_first_phylum: // just to avoid a warning about missing case if empty
    default:
	\vbreak; // it's alright, no attributes to copy\r
    }
    enum_operators copyOp=kc_p1->prod_sel();
    for (int i=operator_info[copyOp].no_attrs-1; i>=0; --i)\v
	attributeOf(kc_p2, i)=attributeOf(const_cast<abstract_phylum>(kc_p1), i);\r
}

"
					];
Consphylumdeclarations( pd, rpds )	-> [view_gen_copy_attributes_c: rpds pd ];
Nilphylumdeclarations()			-> [view_gen_copy_attributes_c: /* EMPTY */ ];

PhylumDeclaration( id, *, *, CcodeOption( Nilattributes(), * ))
					-> [view_gen_copy_attributes_c: /* EMPTY */ ];
PhylumDeclaration( id, *, *, CcodeOption( a, * ))
					-> [view_gen_copy_attributes_c:
"   case phylum_" id ": {
    c_" id " p1 = dynamic_cast<c_" id ">(kc_p1);
"   id " p2 = dynamic_cast<" id ">(kc_p2);
"   a
"	break;
    }\n"
					];
Nilattributes()				-> [view_gen_copy_attributes_c: /* EMPTY */ ];
Consattributes( Attribute( *, aid, * ), ra ) -> [view_gen_copy_attributes_c:
    ra
"    p2->" aid " = p1->" aid ";
"
					];
PhylumDeclaration( id, *, *,		// A shortcut for single attributes
	CcodeOption( Consattributes( Attribute( *, aid, * ), Nilattributes() ), * ))
					-> [view_gen_copy_attributes_c:
"   case phylum_" id ":\v
	dynamic_cast<" id ">(kc_p2)->" aid " = dynamic_cast<c_" id ">(kc_p1)->" aid ";
	break;\r\n"
					];

/***************************************************************************/
/*
 * copy fnsdefs
 *
 */


PhylumDeclarations( pds )		-> [view_gen_copydefs_c:
"abstract_phylum
impl_abstract_phylum::copy(bool kc_copy_attributes) const
{
    enum_phyla kc_phy = phylum(); // XXX - implement special cases in subclasses - MvL
    KC_OPERATOR_INFO *kc_op_info = &operator_info[prod_sel()];
    kc_storageclass_t kc_st = phylum_info[kc_op_info->phylum].uniq_stored;
    if (kc_st && kc_storageclass_still_uniq[kc_st])
	return const_cast<abstract_phylum>(this);
    abstract_phylum kc_answer=0;
    if (kc_phy == phylum_casestring) {
	kc_answer=mkcasestring((dynamic_cast<c_casestring>(this))->name);
    } else if (kc_phy == phylum_nocasestring) {
	kc_answer=mknocasestring((dynamic_cast<c_nocasestring>(this))->name);
    } else if (kc_phy == phylum_voidptr) {
	kc_answer=mkvoidptr((dynamic_cast<c_voidptr>(this))->pointer);
    } else if (kc_phy == phylum_integer) {
	kc_answer=mkinteger((dynamic_cast<c_integer>(this))->value);
    } else if (kc_phy == phylum_real) {
	kc_answer=mkreal((dynamic_cast<c_real>(this))->value);
    } else {
	abstract_phylum kc_subtmp["
	{ int i = Theargsnumbers->last()->value; if (i<=0) i = 1; }
	i "], child;
	for (int kc_i = 0; (child = subphylum(kc_i)); kc_i++) {
	    kc_subtmp[kc_i] = child->copy(kc_copy_attributes);
	}
	switch(kc_op_info->no_sons) {
"
	Theargsnumbers
"	default: assertionFailed(\"unexpected number of sub-phyla\");
	}
    }
    if (kc_copy_attributes)
	copy_attributes(kc_phy, this, kc_answer);
    return kc_answer;
}

"
					];

Nilargsnumbers()			-> [view_gen_copydefs_c: /* EMPTY */ ];
Consargsnumbers( i, r )			-> [view_gen_copydefs_c:
"   case " i ": kc_answer = kc_create(prod_sel()"
    { for (int j=0; j<i->value; ++j) } ${
	", kc_subtmp[" j "]"
    $}
"); break;
"
    r
					];



/***************************************************************************/

PhylumDeclarations( * )			-> [view_gen_rewritek_h:
"/* translation of file(s)\n"
Thefnfiles
" */
/* generated by:
 *  " kimwitu_copyright "
 */
#ifndef KC_REWRITE_HEADER
#define KC_REWRITE_HEADER

"
					];
PhylumDeclarations( pds )		-> [view_gen_rewritedecls_h:
"
/* Use rviews instead
extern char *kc_rview_names[];
*/
"
    Therviewnames:view_rview_class_def
					];

PhylumDeclarations( * )			-> [view_gen_end_rewritek_h:
"#endif // KC_REWRITE_HEADER\n"
					];

node=Consviewnames( vn, r_vn)		-> [view_rview_class_def:
    r_vn
	{ if(!node->is_extern) } ${
"struct "
{ if(g_options.dllexports!="") {
	PRINT(g_options.dllexports.c_str());
	PRINT(" ");
} }
vn "_class: rview_class {
	"vn"_class():rview_class("vn"_enum){}
};
extern "vn"_class "vn";
"
	$} { else } ${
"class "
{ if(g_options.dllexports!="") {
	PRINT(g_options.dllexports.c_str());
	PRINT(" ");
} }
vn "_baseclass: public rview_class {
\rprotected:\v
	"vn"_baseclass():rview_class("vn"_enum){}
};
// class " vn "_class is defined externally
"   $}
					];

/***************************************************************************/

PhylumDeclarations( * )			-> [view_gen_rewritek_c:
"/* translation of file(s)\n"
Thefnfiles
" */
/* generated by:
 *  " kimwitu_copyright "
 */
#define KC_REWRITE
"
{ if(g_options.stdafx!="") {
    PRINT("#include \"");
    PRINT(g_options.stdafx.c_str());
    PRINT("\"\n");
}   }
"
#include <stdio.h>
#include <sys/types.h>
#include <stdlib.h>
#include \"" { PRINT(g_options.prefix.c_str()); } "k.h\"
#include \"" { PRINT(g_options.prefix.c_str()); } "rk.h\"

"
{ if(g_options.rw_loop) } ${
"#include <deque>
#include <stack>
#include <vector>
"
$}
    $0:view_open_namespace
    Therviewnames:view_gen_viewvars_c
"
impl_rviews rviews[] = {
" Therviewnames
"	{0,0}
};
"
{ if(g_options.rw_loop) } ${
{ string how_smart = "";
  if(g_options.smart_pointer) how_smart="_ptr"; }
"

static inline int
kc_sons(abstract_phylum ph) {
    return KC_NO_SONS(ph->prod_sel());
}

static abstract_phylum
kc_create_op(enum_operators kc_op, std::vector<abstract_phylum" how_smart ">& sons, size_t no_of_sons) {
    size_t son_offset = sons.size()-no_of_sons;
    switch(no_of_sons) {\n"
	Theargsnumbers
"   default:\v
	assertionFailed(\"unexpected number of sub-phyla\");\r
    }\r
}

static void
initialize_sons_stack(abstract_phylum" how_smart "& kc_p, bool& skip,
	std::stack<abstract_phylum" how_smart ">& node_stack, std::stack<int>& sons_todo,
	rview kc_current_view_base)
{
    // Initialize stack for depth first rewrite
    assertCond(kc_p);
    size_t no_of_sons=kc_sons(kc_p);
    while(!skip && (no_of_sons>0)) {
	sons_todo.push(no_of_sons);
	abstract_phylum parent = kc_p;
	for(int i = no_of_sons-1; i>=0; --i) {
	    node_stack.push(kc_p);
	    kc_p = parent->subphylum(i);
	}
	kc_p = kc_current_view_base.pre_rewrite(kc_p, skip);
	assertCond(kc_p);
	no_of_sons = kc_sons(kc_p);
    }
    // The deepest first son is now in kc_p.
    // On the node_stack are the siblings and then the parent.
}

static bool
sons_changed(abstract_phylum" how_smart " current_son, const std::vector<abstract_phylum" how_smart ">& sons_done, size_t no_of_sons)
{
    bool changed = false;
    for(int i=no_of_sons-1; i>=0; --i) {
	if(sons_done[sons_done.size()-no_of_sons+i] != current_son->subphylum(i)) {
	    changed=true;
	    break;
	}
    }
    return changed;
}

abstract_phylum impl_abstract_phylum::rewrite_loop(rview kc_current_view_base) {
    std::stack<abstract_phylum" how_smart "> node_stack;
    std::stack<int> sons_todo;
    std::vector<abstract_phylum" how_smart "> sons_done;

    abstract_phylum" how_smart " current_son=this;

    do {
	bool skip=false;
	current_son = kc_current_view_base.pre_rewrite(current_son, skip);
	initialize_sons_stack(current_son, skip, node_stack, sons_todo, kc_current_view_base);
	
	bool changed=true;
	do {
	    assertCond(current_son);

	    abstract_phylum" how_smart " res=current_son;
	    if(!skip)
		res=current_son->do_rewrite(kc_current_view_base);

	    assertCond(res);
	    changed=true;

	    if(res==current_son) { // nothing has been changed, current_son is completely rewritten
		if(!skip) { // call post_rewrite if this node is not skipped
		    bool again=false;
		    current_son=kc_current_view_base.post_rewrite(current_son, again);
		    assertCond(current_son);
		    if(again)
			\vbreak;\r // starts the whole rewrite_loop for the post_rewritten node again
		}
		else
		    skip=false;

		sons_done.push_back(current_son); // move this son to sons_done

		if(!node_stack.empty()) { // else all is done
		    assertCond(!sons_todo.empty());
		    assertCond(sons_todo.top()>0);
		    --sons_todo.top(); // one less to todo

		    if(sons_todo.top()==0) { // all sons done
			sons_todo.pop(); // forget it

			current_son=node_stack.top(); // the parent of the original last done sons
			node_stack.pop();
			// the last (rewritten) son of this parent is
			// on top of sons_done (sons_done[sons_done.size()-1])

			size_t no_of_sons=kc_sons(current_son);
			assertCond(sons_done.size() >= no_of_sons);
			changed = sons_changed(current_son, sons_done, no_of_sons);
			if(changed) {	// some sons are different ->
					\v\v// create a new operator and make it the current
			    \r\rabstract_phylum" how_smart " new_son =
				\vkc_create_op(current_son->prod_sel(), sons_done, no_of_sons);\r
			    new_son->rewrite_members(current_son);
			    current_son = new_son;
			    // the sons do not need to be rewritten again
			    changed=false;
			}
			// The current node must still be rewritten,
			// but not its sons anymore (changed == false).
			// Those sons are in the current node, so no-one needs
			// them anymore and they are popped off the stack.
			sons_done.resize(sons_done.size() - no_of_sons);
		    }
		    else { // make the complete loop with the next son (changed == true)
			current_son = node_stack.top();
			node_stack.pop();
		    }
		}
		else {
		    current_son = 0; // terminates the loop
		}
	    }
	    else // something has been changed -> start rewrite with the changed node again
		current_son=res;
	} while(!changed);
    } while(current_son);

    assertCond(sons_todo.size()==0);
    assertCond(sons_done.size()==1);
    return sons_done[0]" { if(g_options.smart_pointer) } ${ ".return_ptr()" $} "; // done.top()
}
"

$}
					];

Nilargsnumbers()			-> [view_gen_rewritek_c: /* EMPTY */ ];
Consargsnumbers( i, r )			-> [view_gen_rewritek_c:
"   case " i ": return kc_create(kc_op"
    { for (int j=0; j<i->value; ++j) } ${
	", sons[son_offset"  { if (j!=0) } ${ "+" j $}  "]"
    $}
");
"
    r
					];

/***************************************************************************/

PhylumDeclarations( pds )		-> [view_gen_rewritedefs_c:
	"
#ifndef KC_TRACE_PROVIDED
#define KC_TRACE_PROVIDED(COND,FILE,LINE,NODE) COND
#endif
#ifndef KC_TRACE_REWRITE_MATCH
#define KC_TRACE_REWRITE_MATCH(VIEW,FILE,LINE,NODE)
#endif
#ifndef KC_TRACE_REWRITE_RESULT
#define KC_TRACE_REWRITE_RESULT(VIEW,FILE,LINE,NODE)
#endif
	"
    pds
					];
Consphylumdeclarations( pd, rpds )	-> [view_gen_rewritedefs_c:
    rpds
    pd
					];
Nilphylumdeclarations()			-> [view_gen_rewritedefs_c: /* EMPTY */ ];
PhylumDeclaration( *, *, Emptyproductionblock(), * )
					-> [view_gen_rewritedefs_c: /* EMPTY */ ];
PhylumDeclaration( id, *, PredefinedAlternatives( * ), * )  -> [view_gen_rewritedefs_c:
 /* EMPTY */ // default routine: return this;
					];
PhylumDeclaration( id, *, pb, * )	-> [view_gen_rewritedefs_c:
{ gl_phydecl = f_lookupdecl( id );
  gl_phylum = id;
  if ( gl_phydecl == 0 ) {
    v_report(NonFatal( FileLine( gl_phylum->file, gl_phylum->line ), Problem1S1ID( "internal error: could not find declaration of phylum:", gl_phylum )));
  }
}
    pb
{ gl_phydecl = 0;
  gl_phylum = 0;
}
					];

NonlistAlternatives( a )		-> [view_gen_rewritedefs_c:
    a
					];

///////////////////////////////////////////
// Generation of *::rewrite functions
ListAlternatives( Consalternatives(consa=Alternative(oid,*),Consalternatives(nila=*,*)), * )
					->[ view_gen_rewritedefs_c:
    // For the tail, ie the recursion, it is critical not to call another function
    // to keep the stack smaller. This might also enable tail recursion elimination
    // for some very clever compiler.
  { gl_phylum = f_phylumofoperator(oid); }
    { if(!g_options.rw_loop) } ${ 
      { covariant_choice(gl_phylum, "", "abstract_phylum", kc_printer, kc_current_view); }
 $} { else } ${
    "abstract_phylum"
  $}
" impl_" gl_phylum "::"
    { if(f_rewrite_in_operatordecl(consa) || g_options.rw_loop) } ${ "do_" $} 
    "rewrite(rview kc_current_view_base)
{
    if (is_nil()) {
"	nila:view_gen_rewritedefs_body_c
"   } else { // not Nil, Cons
"	consa:view_gen_rewritedefs_body_c
"   }
}
"
  { gl_phylum = 0; }
					];

alt=Alternative(oid, args)			-> [view_gen_rewritedefs_c:
  { gl_phylum = f_phylumofoperator(oid); }
    { if(!g_options.rw_loop) } ${ 
  { covariant_choice(gl_phylum, "", "abstract_phylum", kc_printer, kc_current_view); }
  $} { else } ${
    "abstract_phylum"
  $}
" impl_" gl_phylum "_" oid "::" 
    { if(f_rewrite_in_operatordecl(alt) || g_options.rw_loop) } ${ "do_" $} 
    "rewrite(rview kc_current_view_base)
{
"
  $0:view_gen_rewritedefs_body_c
"
}
"
  { gl_phylum = 0; }

					];

alt=
Alternative(oid, args)			-> [view_gen_rewritedefs_body_c:
{   rewriteviewsinfo a_rewriteviewsinfo = f_rewriteviewsinfo_of_alternative( alt, Therviewnames );

    gl_operator = oid;
    gl_alternative = alt;
    gl_rewrite_goto_used = false;
    args->unparse(kc_printer, view_gen_rewritedefs_rewritearg_c);

    // GK: avoid the generation of a useless switch (there are only (more the one) empty Rewriteviewinfo in the list)
    bool empty=true;
    foreach($rvi; rewriteviewsinfo a_rewriteviewsinfo) {
	Rewriteviewinfo(*, Nilrewriterulesinfo()) : { /* empty*/ }
	default: { empty=false; }
    }
    if(!empty) {
	    PRINT("    switch(kc_current_view_base) {\n");
	    a_rewriteviewsinfo->unparse(kc_printer, view_gen_rewritedefs_c);
	    PRINT("    }\n");
	}
    }
    args:view_gen_rewritedefs_testarg_c
{   freespineandelements(a_rewriteviewsinfo);
    gl_operator = 0;
    gl_alternative = 0; }
					];


Nilrewriteviewsinfo()			-> [view_gen_rewritedefs_c: /* EMPTY */ ];
/*
 * IMPORTANT we unparse the viewsinfo in reverse order, to make sure that
 * the kc_unparsing_label is used before defined, ie.
 * the default view is the last in the switch
 * so that we can set a variable when we generate a goto,
 * so that we only generate the label if necessary
 */
Consrewriteviewsinfo( a_rvi, r_rvi )	-> [view_gen_rewritedefs_c:
    r_rvi
    a_rvi
					];
Rewriteviewinfo( Id(Str(v)), rri )	-> [view_gen_rewritedefs_c:
{ gl_rewrite_rewriteinfo = rri; }
{ if ( strcmp(v->name, "base_rview" )==0 ) } ${
    $0:view_gen_rewritedefs_default_c
$} { else } ${
    $0:view_gen_rewritedefs_other_c
$}
{ gl_rewrite_rewriteinfo = 0; }
					];

Rewriteviewinfo( *, Nilrewriterulesinfo() ) -> [view_gen_rewritedefs_default_c:
{ if (gl_rewrite_goto_used) } ${
"    kc_rewrite_default:
"
$}
"    default:;
"
];

Rewriteviewinfo( v, * )			-> [view_gen_rewritedefs_default_c:
"    default:
"
{ if (gl_rewrite_goto_used) } ${
"    kc_rewrite_default:
"
$}
"    case " v "_enum: {
		" v "_class& kc_current_view=static_cast<"v"_class&>(kc_current_view_base);
"
{   gl_view = v; }
    gl_alternative
{   gl_view = 0; }
"    }
"
					];
Rewriteviewinfo( *, Nilrewriterulesinfo() )
					-> [view_gen_rewritedefs_other_c: /* EMPTY */ ];
Rewriteviewinfo( v, * )			-> [view_gen_rewritedefs_other_c:
"    case " v "_enum: {
		" v "_class& kc_current_view=static_cast<"v"_class&>(kc_current_view_base);
"
{   gl_view = v; }
    gl_alternative
{   gl_view = 0; }
"    }
"
// { gl_rewrite_goto_used = true; }
					];

/***** vanaf hier volg de oude code ******/

Alternative( id, args )			-> [view_gen_rewritedefs_default_c:
{   gl_args=args; }
    gl_rewrite_rewriteinfo
{   gl_args = 0; }
					];
Alternative( id, args )
					-> [view_gen_rewritedefs_other_c:
{ if (! gl_rewrite_rewriteinfo->eq( Nilrewriterulesinfo())) } ${
{   gl_args=args; }
    gl_rewrite_rewriteinfo
{   gl_args = 0; }
 $}
					];

Nilarguments()				-> [view_gen_rewritedefs_rewritearg_c: /* EMPTY */ ];
Consarguments( a_arg, r_args )		-> [view_gen_rewritedefs_rewritearg_c:
    r_args
{ if (!g_options.rw_loop) } ${
{ if(g_options.smart_pointer) } ${
"	" a_arg "_ptr l_" a_arg "_" $0->seqnr " ="
$} { else } ${
"	" a_arg " l_" a_arg "_" $0->seqnr " ="
$}
	"\n"
{ if (g_options.covariant=='p') } ${ "#ifndef NO_COVARIANT_RETURN\n" $}
{ if (g_options.covariant!='n') } ${	"\v" a_arg "_" $0->seqnr "->rewrite(kc_current_view_base);\r\n" $}
{ if (g_options.covariant=='p') } ${ "#else\n" $}
{ if (g_options.covariant!='y') } ${	"\vstatic_cast<"a_arg">(" a_arg "_" $0->seqnr "->rewrite(kc_current_view_base));\r\n" $}
{ if (g_options.covariant=='p') } ${ "#endif // NO_COVARIANT_RETURN\n" $}
$}
					];
Nilarguments()				-> [view_gen_rewritedefs_nl_arg_c:
"	" gl_phylum " kc_rp = this;
"
					];
Consarguments( *, * )			-> [view_gen_rewritedefs_nl_arg_c:
"	" gl_phylum " kc_rp = ((" $0:view_gen_rewritedefs_dotestarg_c "))
	    ? this
	    : " gl_operator "(" $0:view_gen_rewritedefs_args_c ");
"
					];
Nilarguments()				-> [view_gen_rewritedefs_testarg_c:
"	return this;
"
					];
Consarguments( *, * )			-> [view_gen_rewritedefs_testarg_c:
{ gl_phylum = f_phylumofoperator(gl_operator); }
{ if(!g_options.rw_loop) } ${
"	if ((" $0:view_gen_rewritedefs_dotestarg_c "))
	    return this;
	else {
	    impl_" gl_phylum
	    {if(f_listelementphylum(gl_phylum)->eq(f_emptyId()))} ${ "_" gl_operator $}
	    "* kc_result= " gl_operator "(" $0:view_gen_rewritedefs_args_c ");
	    kc_result->rewrite_members(this);
	    return kc_result;
	}"
  $} { else } ${
"	return this;"
  $} 
{ gl_phylum = 0; }
					];
Nilarguments()				-> [view_gen_rewritedefs_dotestarg_c: /* EMPTY */ ];
Consarguments( a_arg, Nilarguments() )	-> [view_gen_rewritedefs_dotestarg_c:
"l_" a_arg "_" $0->seqnr " == " a_arg "_" $0->seqnr
					];
Consarguments( a_arg, r_args )		-> [view_gen_rewritedefs_dotestarg_c:
    r_args
") &&  (l_" a_arg "_" $0->seqnr " == " a_arg "_" $0->seqnr
					];
Nilarguments()				-> [view_gen_rewritedefs_args_c: /* EMPTY */ ];
Consarguments( a_arg, Nilarguments() )	-> [view_gen_rewritedefs_args_c:
    { if (!g_options.rw_loop) } ${ "l_" $} a_arg "_" $0->seqnr
					];
Consarguments( a_arg, r_args )		-> [view_gen_rewritedefs_args_c:
    r_args ", "
    { if (!g_options.rw_loop) } ${ "l_" $} a_arg "_" $0->seqnr
					];
Nilrewriterulesinfo()			-> [view_gen_rewritedefs_default_c:
"break;"
					];
Nilrewriterulesinfo()			-> [view_gen_rewritedefs_other_c:
"\vgoto kc_rewrite_default\r;
"
{ gl_rewrite_goto_used = true; }
					];

// MPi 20030926: This is the old new rule that doesn't apply anymore, I believe.
// Consrewriterulesinfo( Rewriteruleinfo( Conspatternrepresentation( *, Conspatternrepresentation(rep=PRUserPredicate( NilCexpression() ), Nilpatternrepresentation())), bindings, RewriteClause( *, t) ), * )
// MPi: This is a very old rule that probably always functioned as a catch for
// possibly empty patterns which should never happen (not before, not now).
// 
Consrewriterulesinfo( Rewriteruleinfo( Nilpatternrepresentation(), bindings, RewriteClause( *, t) ), * )
					-> [view_gen_rewritedefs_default_c view_gen_rewritedefs_other_c:
    { assertionFailed("Completely empty rewrite pattern not possible."); }
					];

// we skip the first predicate, it will be for the outermost operator that
// is already handled as we jumped to the right virtual function
// MPi 20030926 matching Consrewriterulesinfo(Rewriteruleinfo(...)) instead of
// just Rewriteruleinfo (and normal list unparse) is unnecessary except for the
// "dropped pattern" stuff which is superseded by the overlap-detection.
Consrewriterulesinfo( Rewriteruleinfo( Conspatternrepresentation(rep, Nilpatternrepresentation()), bindings, RewriteClause( *, t) ), r_rri )
    // Very short predicate: no condition at all
					-> [view_gen_rewritedefs_default_c view_gen_rewritedefs_other_c:
{ if(g_options.linedirec) } ${ pg_line rep->line " \"" { PRINT(g_options.dir_line.c_str()); } rep->file:view_filename "\"\n" $}
"	{ KC_TRACE_REWRITE_MATCH(kc_current_view, \"" rep->file "\", " rep->line ", this);
"
    bindings:view_rw_bindings
{ if(g_options.linedirec) } ${ pg_line t->line " \"" { PRINT(g_options.dir_line.c_str()); } t->file:view_filename "\"\n" $}

{ if(g_options.rw_loop) } ${
"	" gl_phylum " kc_result = " t ";
"   g_emptystring:view_printer_outputfileline
"	KC_TRACE_REWRITE_RESULT(kc_current_view,\"" t->file "\"," t->line ",kc_result);
	return kc_result;
"
$} { else } ${
{ if(g_options.smart_pointer) } ${
"	" gl_phylum "_ptr kc_result = " t ";
"   g_emptystring:view_printer_outputfileline
"	KC_TRACE_REWRITE_RESULT(kc_current_view,\"" t->file "\"," t->line ",kc_result);
	return (kc_result() == this ? this : kc_result->rewrite( kc_current_view_base ))->return_ptr();
"
$} { else } ${
"	" gl_phylum " kc_result = " t ";
"   g_emptystring:view_printer_outputfileline
"	KC_TRACE_REWRITE_RESULT(kc_current_view,\"" t->file "\"," t->line ",kc_result);
	return (const_cast<const impl_" gl_phylum "*>(kc_result) == this) ? this : kc_result->rewrite( kc_current_view_base );
"
$} $}
"
	}
"
    // drop the tail, cannot match anyway
    // but warn if the rest is not empty
{   if (g_options.warn_drop_identical_patterns) with (r_rri) {
	Nilrewriterulesinfo():	{ /* EMPTY - that's OK */ }
	Consrewriterulesinfo(*, *): {
	    foreach(rri; rewriterulesinfo $0) {
		warn_drop_identical_pattern(rri);
	    }
	}
    }
}
					];
Consrewriterulesinfo( Rewriteruleinfo( Conspatternrepresentation( rep, r_p ), bindings, RewriteClause( *, t) ), r_rri)
		    -> [view_gen_rewritedefs_default_c view_gen_rewritedefs_other_c:
    { gl_bindings.clear(); } bindings:view_predicate_bindings
    { if(g_options.linedirec) } ${ pg_line rep->line " \"" { PRINT(g_options.dir_line.c_str()); } rep->file:view_filename "\"\n" $}
"	if ((" r_p:view_rw_predicates ")) { KC_TRACE_REWRITE_MATCH(kc_current_view, \"" rep->file "\", " rep->line ", this);
"
    bindings:view_rw_bindings
//    g_emptystring:view_printer_outputfileline
    { if(g_options.linedirec) } ${ pg_line t->line " \"" { PRINT(g_options.dir_line.c_str()); } t->file:view_filename "\"\n" $}
{ if(g_options.rw_loop) } ${
"	" gl_phylum " kc_result = " t ";
"   g_emptystring:view_printer_outputfileline
"	KC_TRACE_REWRITE_RESULT(kc_current_view,\"" t->file "\"," t->line ",kc_result);
	return kc_result;
"
$} { else } ${
{ if(g_options.smart_pointer) } ${
"	" gl_phylum "_ptr kc_result = " t ";
"   g_emptystring:view_printer_outputfileline
"	KC_TRACE_REWRITE_RESULT(kc_current_view,\"" t->file "\"," t->line ",kc_result);
	return (kc_result() == this ? this : kc_result->rewrite( kc_current_view_base ))->return_ptr();
"
$} { else } ${
"	" gl_phylum " kc_result = " t ";
"   g_emptystring:view_printer_outputfileline
"	KC_TRACE_REWRITE_RESULT(kc_current_view,\"" t->file "\"," t->line ",kc_result);
	return (const_cast<const impl_" gl_phylum "*>(kc_result) == this) ? this : kc_result->rewrite( kc_current_view_base );
"
$} $}
"
	} else
"
    r_rri
					];

/* withcases stuff */
/* we do not skip the first predicate, because in first try we don't use a switch */
Nilwithcasesinfo()			-> [view_gen_withcases_and_default:
{ if (inforeachcontext.top()) } ${
"{/* EMPTY */ /*skip: no matching pattern in foreach patterns*/}
"
$} { else if ( (strcmp( gl_return_type, "" ) == 0) ||
       ((gl_star_count == 0) &&
        (! f_isphylum( gl_return_ID )) &&
        (! f_is_known_ptr_type( gl_return_ID )) ) ) } ${
"kc_no_default_in_with( \"" gl_function "\", __LINE__, __FILE__ );
"
$} { else } ${
"{ kc_no_default_in_with( \"" gl_function "\", __LINE__, __FILE__ );
   return static_cast<" gl_return_type { charruns star_string = Stars()->set(gl_star_count); } star_string ">(0); }
"
$}
					];
Conswithcasesinfo( Withcaseinfo( Nilpatternrepresentation(), bindings, ct ), * ),
/* special case for 'outermost wildcard' - shouldn't be triggered
 */
Conswithcasesinfo( Withcaseinfo( Conspatternrepresentation( PRDefault(), * ), bindings, ct ), * ),
Conswithcasesinfo( Withcaseinfo( Conspatternrepresentation( PRUserPredicate( NilCexpression() ), * ), bindings, ct ), * )
					-> [:
"{
"
    { if(g_options.linedirec) } ${ pg_line ct->line " \"" { PRINT(g_options.dir_line.c_str()); } ct->file:view_filename "\"\n" $}
    bindings:view_wc_bindings
    { if(g_options.linedirec) } ${ pg_line ct->line " \"" { PRINT(g_options.dir_line.c_str()); } ct->file:view_filename "\"\n" $}
    ct:view_gen_initializephyla_c
    g_emptystring:view_printer_outputfileline
"}
"
					];
Conswithcasesinfo( Withcaseinfo( p , bindings, ct ), r_rri)
					-> [:
    { gl_bindings.clear(); } bindings:view_predicate_bindings
    { if(g_options.linedirec) } ${ pg_line ct->line " \"" { PRINT(g_options.dir_line.c_str()); } ct->file:view_filename "\"\n" $}
"	if ((" p:view_wc_predicates ")) {
"
    { if(g_options.linedirec) } ${ pg_line ct->line " \"" { PRINT(g_options.dir_line.c_str()); } ct->file:view_filename "\"\n" $}
    bindings:view_wc_bindings
{ operatorstack.push( f_operatorofpatternrepresentation( p ) ); }
    { if(g_options.linedirec) } ${ pg_line ct->line " \"" { PRINT(g_options.dir_line.c_str()); } ct->file:view_filename "\"\n" $}
    ct:view_gen_initializephyla_c
{ operatorstack.pop(); }
g_emptystring:view_printer_outputfileline
"	} else
"
    r_rri
					];

/* pattern stuff */
Conspatternrepresentation( p, Nilpatternrepresentation() )
				-> [view_rw_predicates view_wc_predicates view_unp_predicates:
    p
					];
Conspatternrepresentation( p, r_p )
				-> [view_rw_predicates view_wc_predicates view_unp_predicates:
    p
    ") && ("
    r_p
					];

Conspatternrepresentation( PRUserPredicate( cexpr ), Nilpatternrepresentation() )
                                -> [view_rw_predicates view_wc_predicates view_unp_predicates:
    { gl_outer_view=kc_current_view; }
     "KC_TRACE_PROVIDED((" cexpr:view_gen_user_predicates "), \""cexpr->file"\", "cexpr->line", this)"
                                        ];

Conspatternrepresentation( PRUserPredicate( cexpr ), r_p )
                                -> [view_rw_predicates view_wc_predicates view_unp_predicates:
    { gl_outer_view=kc_current_view; }
    r_p
    ") && KC_TRACE_PROVIDED((" cexpr:view_gen_user_predicates "), \""cexpr->file"\", "cexpr->line", this"
					];


PRNonLeafBinding( p, id, * ),
PRBinding( p, id )			-> [:
${
{   ID gl_type;
    if ($0->type->eq( f_emptyId())) {
	gl_type = f_typeof( p );
    } else {
	gl_type = $0->type;
}   }
    { if(g_options.linedirec) } ${ pg_line id->line " \"" { PRINT(g_options.dir_line.c_str()); } id->file:view_filename "\"\n" $}
"	const " gl_type " " id " = "
{    with (p) {
	Nilpath(): { }
	Conspath(*, r_p): { r_p->unparse(kc_printer, view_gen_cast); }
}  }
    p ";
"
$}
					];
PRNonLeafBinding( p, Id(Str(id)), * ),
PRBinding( p, Id(Str(id)) )		-> [view_predicate_bindings:
    { gl_bindings[id->name]=p; }	];

Nilpath()				-> [: /* EMPTY */ ];
/* special case for start of withcase pattern. because we do not skip the
 * first operator (no switch) we have to place the Nilpath in this place
 * Also, because the first Conspath contains the expression number,
 * we special-case this, such that we get 'selvar_exprnumber' as var name.
 */
Conspath( i, Nilpath() )		-> [view_wc_bindings view_wc_predicates:
{ ID selvar = cf_topselvar(); }
    selvar "_" i
					];
Nilpath()				-> [view_unp_bindings view_unp_predicates:
    "this/**/"
					];
Conspath( i, r_p )			-> [view_gen_cast:
{   bool isnotlist = f_listelementphylum(f_phylumofoperator($0->op))->eq(f_emptyId());
    if(isnotlist)
    }
    ${
    "phylum_cast<const " $0->op:view_class_of_op "*>"
    $}
    "(" r_p
					];
Conspath( i, r_p=Nilpath() )		-> [view_unp_bindings view_unp_predicates:
    { argument gl_argument = f_argumentofoperator( r_p->op, Int( i )); }
    // "this->" usually is a no-op; sometimes scope contains locals of same name
    "this->" gl_argument
    { gl_argument->free(false); }
					];
Conspath( i, r_p )			-> [:
    r_p
    ")->"
    { argument gl_argument = f_argumentofoperator( r_p->op, Int( i )); }
    gl_argument
    { gl_argument->free(false); }
					];
// special case for start of rewrite path. because we skip the first operator that is in
// the virtual function call we always have a Conspath in a rewrite pattern representation
Nilpath()				-> [view_rw_bindings view_rw_predicates:
{ if (gl_args->is_nil() || g_options.rw_loop) } ${
	"this"
    $} { else } ${
	"(((" gl_args:view_gen_rewritedefs_dotestarg_c ")) ? this : " gl_operator "(" gl_args:view_gen_rewritedefs_args_c "))"
    $}
					];
Conspath( i, r_p=Nilpath() )		-> [view_rw_bindings view_rw_predicates:
    { argument gl_argument = f_argumentofoperator( r_p->op, Int( i )); }
    { if (!g_options.rw_loop) } ${ "l_" $} gl_argument
    { gl_argument->free(false); }
					];
PRVarPredicate( ps, *, * )		-> [:
    ps
					];
Nilpaths()				-> [: /* EMPTY */ ];
Conspaths(*, Nilpaths())		-> [: /* EMPTY */ ];
Conspaths(p1=Conspath(*, r_p1), Conspaths(p2=Conspath(*, r_p2), Nilpaths()))
					-> [:
    r_p1:view_gen_cast p1"->eq(" r_p2:view_gen_cast p2 ")"
					];
Conspaths(p1=Conspath(*, r_p1), pp1=Conspaths(p2=Conspath(*, r_p2), *))	    -> [:
    r_p1:view_gen_cast p1"->eq(" r_p2:view_gen_cast p2 ")) && (" pp1
					];
/* strip leading/trailing 0 from the Oper path */
PROperPredicate( *, * )			-> [view_unp_predicates:
     " true "
					];
PROperPredicate( Conspath( *, p=Conspath(*, r_p)), id )	-> [view_unp_predicates:
    r_p:view_gen_cast p "->prod_sel() == sel_" id
					];
PROperPredicate( Nilpath(), * )		-> [view_unp_predicates: /* EMPTY */ ];

PROperPredicate( Conspath( *, p=Conspath(*, r_p)), id )	-> [:
    r_p:view_gen_cast p "->prod_sel() == sel_" id
					];
PROperPredicate( Nilpath(), * )		-> [: /* EMPTY */ ];
PRDefault(),
PRWildcard( * )				-> [:
    "1 /*default*/"
					];
PRStringLiteral( p=Conspath(*, r_p), Cexprdq ) -> [:
    { if ((strcmp( f_strofID( f_typeof( p ) ), "casestring" ) == 0) ||
	(strcmp( f_strofID( f_typeof( p ) ), "nocasestring" ) == 0)) ${ }
	    "kc_strcmp(" r_p:view_gen_cast p "->name, kc_t(\"" Cexprdq "\"))==0"
    { $} else ${
	/* internal error */
	assertionFailed("String literal type neither casestring nor nocasestring");
    $} }
					];
PRIntLiteral( p=Conspath(*, r_p), i )	-> [:
    "(" r_p:view_gen_cast p ")->value == " i
					];

TVariable( id )				-> [: id ];
TOperator( id, t )			-> [: id "(" t ")" ];
TMethod( t, id, ts)			-> [: t "->" id "(" ts ")" ];
TMethodDot( t, id, ts)			-> [: t "." id "(" ts ")" ];
TMemberVar( t, id)			-> [: t "->" id ];
TMemberVarDot( t, id)			-> [: t "." id ];
TCTerm( Cexpr )				-> [: Cexpr ];
TStringLiteral( str )			-> [: "\"" str "\"" ];
TIntLiteral( i )			-> [: i ];
Nilterms()				-> [: /* EMPTY */ ];
Consterms( t, Nilterms() )		-> [: t ];
Consterms( t, r_t )			-> [: r_t ", " t ];

/***************************************************************************/
Consbaseclass_list( head, Nilbaseclass_list()) -> [:
	"public " head:view_gen_fn_pointer_name
					];

Consbaseclass_list( head, tail)		-> [:
	tail ", public " head:view_gen_fn_pointer_name
					];

/***************************************************************************/

Nilfndeclarations()			-> [view_gen_fnk_h: /* EMPTY */ ];
Consfndeclarations( fnd, r_fnds )	-> [view_gen_fnk_h:
    r_fnds
    fnd
					];
/* All global functions except main processed */
FnAcDeclaration( fn_ds, fn_d, *, *, *, *, GlobalFn() )
					-> [view_gen_fnk_h:
fn_ds " " fn_d:view_gen_fn_pointer_name " (" $0->sorted ");
"
					];
/* All functions ignored, except global functions excluding "main" */
FnAcDeclaration( *, *, *, *, *, Id(Str("main")), GlobalFn() ),
FnAcDeclaration( *, *, *, *, *, *, StaticFn( * ) ),
FnAcDeclaration( *, *, *, *, *, *, MemberFn() ),
FnAcDeclaration( *, *, *, *, *, *, ConstructorFn() ),
FnAcDeclaration( *, *, *, *, *, *, DestructorFn() ),
FnAcDeclaration( *, *, *, *, *, *, ConvOperatorFn() )
					-> [view_gen_fnk_h: /* EMPTY */ ];
AcMemberDeclaration( *, *, *, *)
					-> [: /* EMPTY */ ];

/***************************************************************************/

Nilfndeclarations()			-> [view_gen_fnkdecls_c:
"
#ifndef KC_TRACE_PROVIDED
#define KC_TRACE_PROVIDED(COND,FILE,LINE,NODE) COND
#endif

"
					];
Consfndeclarations( fnd, r_fnds )	-> [view_gen_fnkdecls_c:
    r_fnds
    fnd
					];

/* All non-static functions ignored */
FnAcDeclaration( *, *, *, *, *, *, GlobalFn() ),
FnAcDeclaration( *, *, *, *, *, *, MemberFn() ),
FnAcDeclaration( *, *, *, *, *, *, ConstructorFn() ),
FnAcDeclaration( *, *, *, *, *, *, DestructorFn() ),
FnAcDeclaration( *, *, *, *, *, *, ConvOperatorFn() )
					-> [view_gen_fnkdecls_c: /* EMPTY */ ];
/* All static functions processed */
FnAcDeclaration( fn_ds, fn_d, *, *, *, *, fn_c=StaticFn( * ) )
					-> [view_gen_fnkdecls_c:
fn_c fn_ds " " fn_d:view_gen_fn_pointer_name " (" $0->sorted ");
"
					];

Nilfndeclarations()			-> [view_gen_fnk_c: /* EMPTY */ ];
Consfndeclarations( fnd, r_fnds )	-> [view_gen_fnk_c:
    r_fnds
    fnd
					];
GlobalFn()				-> [view_gen_fnk_c: /* EMPTY */ ];
StaticFn( * )				-> [: "static " ];

FnAcDeclaration( fn_ds, fn_d=AcDeclarator(*,*,
	AcQualifiedDeclProto(*,AcDirectDeclId(oid),params,*)), *, *, *, *, fnc=ConstructorFn() ),
FnAcDeclaration( fn_ds, fn_d=AcDeclarator(*,*,
	AcQualifiedDeclProto(*,AcDirectDeclId(oid),params,*)), *, *, *, *, fnc=DestructorFn() )
					-> [view_gen_member_dcl_h:
	{ bool is_ctor=false;
		with(fnc) {
		ConstructorFn(): { is_ctor=true; }
		default: {}
	} }
	fn_ds " "
	{ if(!is_ctor) PRINT("~"); }
	fn_d:view_gen_fn_pointer_name "("
	{ arguments args=f_argumentsofoperator(oid);
	 if(is_ctor) } ${
		args:view_count_args
		{ if (f_ispredefinedphylum(f_phylumofoperator(oid))) } ${
			args:view_gen_fnarg_and_decls_predef
		$} { else } ${
			args:view_gen_fnarg_and_decls
		$}
		{ if(gl_no_of_args && !f_no_params(params)) { PRINT(","); } }
		params:view_gen_fnk_h
	$}
	");
"
					];

FnAcDeclaration( *, fn_d, *, *, *, *, ConvOperatorFn() )
					-> [view_gen_member_dcl_h:
	fn_d
					];
FnAcDeclaration( fn_ds, fn_d, *, *, *, *, * )
					-> [view_gen_member_dcl_h:
	fn_ds " " fn_d
					];

AcMemberDeclaration( fn_ds, fn_d, *, *) -> [view_gen_member_dcl_h:
	fn_ds " " fn_d ";
"
					];
AcMemberDecl( *, id, idxs )		-> [view_gen_member_dcl_h:
	id idxs
					];
AcConvOperatorDecl( *, id )		-> [view_gen_member_dcl_h:
	"operator " id
					];

Consac_constant_expression_list( head, Nilac_constant_expression_list() ) 
                    -> [view_gen_base_init_expression_list:
	head
					];

Consac_constant_expression_list( head, tail ) -> [view_gen_base_init_expression_list:
	tail "," head
					];

Consac_constant_expression_list( head, tail ) -> [:
	tail "[" head "]"
					];

AcQualifiedDeclProto(*,id, args, opt_const) -> [view_gen_member_dcl_h:
	id "(" args ")" opt_const
	";
"
					];

AcParDeclDecl( ds, d, Noac_constant_expression() ) -> [view_gen_member_dcl_h: ds " " d ];
AcParDeclDecl( ds, d, Yesac_constant_expression(expr) ) -> [view_gen_member_dcl_h: ds " " d "=" expr ];
AcParDeclAbsdecl( ds, ad, Noac_constant_expression() ) -> [view_gen_member_dcl_h: ds " " ad ];
AcParDeclAbsdecl( ds, ad, Yesac_constant_expression(expr) ) -> [view_gen_member_dcl_h: ds " " ad "=" expr ];

AcMemberDeclaration( fn_ds, fn_d, Noac_constant_expression() , StaticFn(*)) -> [view_gen_fnk_c:
{ if(g_options.linedirec) } ${ pg_line $0->last_line " \"" { PRINT(g_options.dir_line.c_str()); } $0->file:view_filename "\"\n" $}
 fn_ds " " fn_d ";
"
					];

AcMemberDeclaration( fn_ds, fn_d, Yesac_constant_expression( expr ) , StaticFn(*))
					-> [view_gen_fnk_c:
{ if(g_options.linedirec) } ${ pg_line $0->last_line " \"" { PRINT(g_options.dir_line.c_str()); } $0->file:view_filename "\"\n" $}
 fn_ds " " fn_d "=" expr ";
"
					];

AcMemberDeclaration( *, *, Noac_constant_expression() , *) -> [view_gen_fnk_c: ];

AcMemberDecl( clid, id, idxs )		-> [view_gen_fnk_c view_gen_fn_pointer_name:
	clid:view_gen_fn_pointer_name "::" id idxs
					];
AcConvOperatorDecl( clid, id )		-> [view_gen_fnk_c view_gen_fn_pointer_name:
	clid:view_gen_fn_pointer_name "::operator " id
					];

FnAcDeclaration( fn_ds, fn_d, *, *, ct, fn_name, fnc )
					-> [view_gen_fnk_c:
{
    gl_return_ID = f_ID_of_ac_declaration_specifiers( fn_ds );
    gl_return_type = f_strofID( gl_return_ID );
    gl_star_count = f_stars_of_declarator( fn_d );
    gl_function = f_strofID( fn_name );
    if (strcmp(gl_function, "main")==0) PRINT("} // namespace kc\n");
}
fnc fn_ds " " fn_d:view_gen_fn_pointer_name "(" $0->sorted ")" fn_d:view_gen_opt_const "\n"
    { if(g_options.linedirec) } ${ pg_line ct->line " \"" { PRINT(g_options.dir_line.c_str()); } ct->file:view_filename "\"\n" $}
"{"
    ct:view_gen_initializephyla_c
"\n"
    { if(g_options.linedirec) } ${ pg_line $0->last_line " \"" { PRINT(g_options.dir_line.c_str()); } $0->file:view_filename "\"\n" $}
"}"
g_emptystring:view_printer_outputfileline
"
"
{   gl_return_type = "";
    gl_return_ID = 0;
    gl_star_count = 0;
    if (strcmp(gl_function, "main")==0) PRINT("namespace kc {\r\n");
    gl_function = "";
}
					];

FnAcDeclaration( fn_ds, fn_d, *, *, ct, fn_name, fnc=ConvOperatorFn() )
					-> [view_gen_fnk_c:
{
    gl_return_ID = 0;
    gl_return_type = "";
    gl_star_count = f_stars_of_declarator( fn_d );
    gl_function = f_strofID( fn_name );
}
fn_d:view_gen_fn_pointer_name "()" fn_d:view_gen_opt_const "\n"
    { if(g_options.linedirec) } ${ pg_line ct->line " \"" { PRINT(g_options.dir_line.c_str()); } ct->file:view_filename "\"\n" $}
"{"
    ct:view_gen_initializephyla_c
"\n"
    { if(g_options.linedirec) } ${ pg_line $0->last_line " \"" { PRINT(g_options.dir_line.c_str()); } $0->file:view_filename "\"\n" $}
"}"
g_emptystring:view_printer_outputfileline
"
"
{   gl_return_type = "";
    gl_return_ID = 0;
    gl_star_count = 0;
    gl_function = "";
}
					];

FnAcDeclaration( fn_ds, fn_d=AcDeclarator(*,*,
	AcQualifiedDeclProto(*,AcDirectDeclId(oid),params,*)), *, base_init, ct, *, fnc=ConstructorFn() ),
FnAcDeclaration( fn_ds, fn_d=AcDeclarator(*,*,
	AcQualifiedDeclProto(*,AcDirectDeclId(oid),params,*)), *, base_init, ct, *, fnc=DestructorFn() )
					-> [view_gen_fnk_c:
{
    gl_return_ID = 0;
    gl_return_type = "";
    gl_star_count = f_stars_of_declarator( fn_d );
    gl_function = f_strofID(f_id_of_ctor_dtor_decl(fn_d));
    gl_operator=oid;
    bool is_ctor=false;
    with(fnc) {
	ConstructorFn(): { is_ctor=true; }
	default: {}
} }
fn_d:view_gen_fn_pointer_name "::"
{ if(!is_ctor) { PRINT("~"); } }
fn_d:view_gen_fn_pointer_name "("
    { arguments args=f_argumentsofoperator(oid);
    if(is_ctor) } ${
	args:view_count_args
	{ if (f_ispredefinedphylum(f_phylumofoperator(oid))) } ${
	    args:view_gen_fnarg_and_decls_predef
	$} { else } ${
	    args:view_gen_fnarg_and_decls
	$}
	{ if(gl_no_of_args && !f_no_params(params)) { PRINT(","); } }
	$0->sorted
    $}
    ")" base_init "\n"
    { if(g_options.linedirec) } ${ pg_line ct->line " \"" { PRINT(g_options.dir_line.c_str()); } ct->file:view_filename "\"\n" $}
"{"
    { if(is_ctor) } ${
	{ if (f_ispredefinedphylum(f_phylumofoperator(oid))) } ${
	    args:view_gen_assignments_predef
	$} { else if(The_abstract_phylum_decl->subphylum(0)->eq(oid)) } ${
	    { if(g_options.smart_pointer) } ${
		"_ref=0;
		"
	    $}
	$} { else } ${
	    args:view_gen_assignments
	$}
    $}
    ct:view_gen_initializephyla_c
"\n"
{ if(g_options.linedirec) } ${ pg_line $0->last_line " \"" { PRINT(g_options.dir_line.c_str()); } $0->file:view_filename "\"\n" $}
"}"
g_emptystring:view_printer_outputfileline
"
"
{   gl_return_type = "";
    gl_return_ID = 0;
    gl_star_count = 0;
    gl_function = "";
}
					];

AcYesBaseInit( base_init_list )		-> [view_gen_fnk_c: ":" base_init_list ];
AcYesBaseInit( * )			-> [: ];
AcNoBaseInit()				-> [: ];
Consac_base_init_list( head, Nilac_base_init_list() ) ->  [view_gen_fnk_c: head ];
Consac_base_init_list( head, tail )	-> [view_gen_fnk_c: tail "," head ];
AcBaseInit( id, expr )			-> [view_gen_fnk_c: id:view_gen_fn_pointer_name "(" expr:view_gen_base_init_expression_list ")" ];

AcDeclaration( ds, idlo )		->  [:
    ds " " idlo ";
"
					];

Consac_declaration_list( h, t )		-> [: t h ];

Consac_declaration_specifiers( h, Nilac_declaration_specifiers() ) -> [: h ];
Consac_declaration_specifiers( h, t )	-> [: t " " h ];
AcAuto()				-> [: "auto" ];
AcRegister()				-> [: "register" ];
AcStatic()				-> [view_gen_member_dcl_h: "static" ];
AcExtern()				-> [: "extern" ];
AcTypedef()				-> [: "typedef" ];
AcVirtual()				-> [view_gen_fnk_c: ];
AcVirtual()				-> [: "virtual" ];

AcTypeSpec( i )				-> [: i ];

AcConst()				-> [: "const" ];
AcVolatile()				-> [: "volatile" ];
AcUnsigned()				-> [: "unsigned" ];

Consac_init_declarator_list( h , t )	-> [: t " " h ];
Consac_init_declarator_list( h, Nilac_init_declarator_list() ) -> [: h ];

AcInitDecl( d )				-> [: d ];

AcDeclarator( po, rr, dd )		-> [: po rr dd ];

AcDirectDeclId( i )			-> [: i ];
AcDirectDeclPack( d )			-> [: "(" d ")" ];
AcDirectDeclArray( dd, ceo )		-> [: dd "[" ceo "]" ];
AcDirectDeclProto( dd, ptl )		-> [: dd "(" ptl ")" ];
AcQualifiedDeclProto( qq, id, ptl , oc) -> [: qq id "(" ptl ")" oc ];
AcOperatorDeclId( id )			-> [: "operator " id ];

Consac_class_qualifier_list( head, tail ) -> [:
	tail head "::"
					];

Nopointer()				-> [: /* EMPTY */ ];
Yespointer( p )				-> [: p ];

AcPointerNil( Nilac_type_qualifier_list() ) -> [: "*" ];
AcPointerNil( tql )			-> [: "* " tql " " ];
AcPointerCons( Nilac_type_qualifier_list(), p ) -> [: "*" p ];
AcPointerCons( tql, p )			-> [: "* " tql " " p ];

AcRef()					-> [: "&" ];
AcNoRef()				-> [: /* EMPTY */ ];

Consac_type_qualifier_list( h, Nilac_type_qualifier_list() ) -> [: h ];
Consac_type_qualifier_list( h, t )	-> [: t " " h ];

AcParList( pl )				-> [: pl ];
/* AcParList( Nilac_parameter_list() )	-> [: "void" ]; */
AcParList3Dot( pl )			-> [: pl " ..." ];

Consac_parameter_list( h, Nilac_parameter_list() ) -> [: h ];
Consac_parameter_list( h, t )		-> [: t ", " h ];

AcParDeclDecl( ds, d, Noac_constant_expression() )
					-> [view_gen_fnk_h view_gen_fnkdecls_c: ds " " d ];
AcParDeclDecl( ds, d, Yesac_constant_expression(expr) )
					-> [view_gen_fnk_h view_gen_fnkdecls_c: ds " " d "=" expr];
AcParDeclDecl( ds, d, * )		-> [: ds " " d ];
AcParDeclAbsdecl( ds, ad, Noac_constant_expression() )
					-> [view_gen_fnk_h view_gen_fnkdecls_c: ds " " ad ];
AcParDeclAbsdecl( ds, ad, Yesac_constant_expression(expr) )
					-> [view_gen_fnk_h view_gen_fnkdecls_c: ds " " ad "=" expr];
AcParDeclAbsdecl( ds, ad, * )		-> [: ds " " ad ];

Consac_identifier_list( h, Nilac_identifier_list() ) -> [: h ];
Consac_identifier_list( h, t )		-> [: t ", " h ];

AcAbsdeclPointer( p )			-> [: p ];
AcAbsdeclDirdecl( po, dad )		-> [: po dad ];

Yesac_direct_abstract_declarator( dad ) -> [: dad ];

AcDirAbsdeclPack( ad )			-> [: "(" ad ")" ];
AcDirAbsdeclArray( dado, ceo )		-> [: dado "[" ceo "]" ];
AcDirAbsdeclFn( dado, ptl )		-> [: dado "(" ptl ")" ];

AcConstExpr( ce )			-> [:
    ce:view_gen_initializephyla_c
					];

AcDeclarator( po, rr, dd )		-> [view_gen_fn_pointer_name: po rr dd ];
AcDirectDeclProto( dd, * )		-> [view_gen_fn_pointer_name: dd ];
AcQualifiedDeclProto( dd, id, *, * )	-> [view_gen_fn_pointer_name: dd id ];
id=Id( uniqId = Str(s) )		-> [view_gen_fn_pointer_name:
	{ if(f_ispredefinedphylum(id) && strncmp(s->name, "abstract_", 9)!=0) } ${
		"impl_" uniqId "_"
		{ UNPARSE(f_operatorofphylum(id, 1)); }
	$} { else if(f_isphylum(id)) } ${
		"impl_" uniqId
	$} { else if(f_alternativeofoperator(id)) } ${
		{ UNPARSE(f_phylumofoperator(id)); }
		"_" uniqId
	$} { else } ${
		uniqId
	$}
					];

AcDeclarator( *, *, dd )		-> [view_gen_opt_const: dd ];
AcDirectDeclProto( *, * )		-> [view_gen_opt_const: ];
AcQualifiedDeclProto( *, *, *, co )	-> [view_gen_opt_const: co ];

AcParList( Nilac_parameter_list() )	-> [view_gen_fnkargs:  ];
AcParList3Dot( pl )			-> [view_gen_fnkargs: pl ];
AcParDeclDecl( *, d, * )		-> [view_gen_fnkargs: d ];
AcParDeclAbsdecl( *, ad, * )		-> [view_gen_fnkargs: ad ];
AcDeclarator( *, *, dd )		-> [view_gen_fnkargs: dd ];
AcDirectDeclPack( d )			-> [view_gen_fnkargs: d ];
AcDirectDeclArray( dd, * )		-> [view_gen_fnkargs: dd ];
AcDirectDeclProto( dd, * )		-> [view_gen_fnkargs: dd ];
AcAbsdeclPointer( * )			-> [view_gen_fnkargs: "kc_arg_missing" ];
AcAbsdeclDirdecl( *, dad )		-> [view_gen_fnkargs: dad ];
AcDirAbsdeclPack( ad )			-> [view_gen_fnkargs: ad ];
AcDirAbsdeclArray( dado, * )		-> [view_gen_fnkargs: dado ];
AcDirAbsdeclFn( dado, * )		-> [view_gen_fnkargs: dado ];
AcQualifiedDeclProto( *, dd, *, *)	-> [view_gen_fnkargs: dd ];

AcParList( Nilac_parameter_list() )	-> [view_gen_fnkdecls:  ];
AcParList3Dot( pl )			-> [view_gen_fnkdecls: pl ];
Consac_parameter_list( h, Nilac_parameter_list() ) -> [view_gen_fnkdecls: h ";" ];
Consac_parameter_list( h, t )		-> [view_gen_fnkdecls: t "\n" h ";" ];
AcParDeclDecl( ds, d, Noac_constant_expression() ) -> [view_gen_fnkdecls: ds " " d ];
AcParDeclDecl( ds, d, Yesac_constant_expression(expr) ) -> [view_gen_fnkdecls: ds " " d "=" expr];
AcParDeclAbsdecl( ds, ad, Noac_constant_expression() ) -> [view_gen_fnkdecls: ds " " ad ];
AcParDeclAbsdecl( ds, ad, Yesac_constant_expression(expr) ) -> [view_gen_fnkdecls: ds " " ad "=" expr];
AcDeclarator( po, rr, dd )		-> [view_gen_fnkdecls: po rr dd ];
AcDirectDeclId( i )			-> [view_gen_fnkdecls: i ];
AcDirectDeclPack( d )			-> [view_gen_fnkdecls: "(" d ")" ];
AcDirectDeclArray( dd, ceo )		-> [view_gen_fnkdecls: dd "[" ceo "]" ];
AcDirectDeclProto( dd, * )		-> [view_gen_fnkdecls: dd "()" ];
AcAbsdeclPointer( p )			-> [view_gen_fnkdecls: p " kc_arg_missing" ];
AcAbsdeclDirdecl( p, dad )		-> [view_gen_fnkdecls: p dad ];

AcQualifiedDeclProto( Nilac_class_qualifier_list(),dd, *, *) -> [view_gen_fnkdecls: dd "()" ];
AcQualifiedDeclProto( *, *, *, *)	-> [view_gen_fnkdecls: ];

/***************************************************************************/

PhylumDeclarations( * )			-> [view_gen_fns_start_h:
{ string printablefilename = f_make_identifier_basename( g_options.hfilename ); }
"/* translation of file \"" pg_filename "\" */
/* generated by:
 *  " kimwitu_copyright "
 */
#ifndef KC_FUNCTIONS_" printablefilename "_HEADER
#define KC_FUNCTIONS_" printablefilename "_HEADER
#include \"" { PRINT(g_options.prefix.c_str()); } "k.h\"    // in case a user forgets

"
					];
PhylumDeclarations( * )			-> [view_gen_fns_end_h:
{ string printablefilename = f_make_identifier_basename( g_options.hfilename ); }
"
#endif // !  KC_FUNCTIONS_" printablefilename "_HEADER

"
					];

/***************************************************************************/

PhylumDeclarations( * )			-> [view_gen_fns_start_c:
{ string printablefilename = f_make_identifier_basename( g_options.ccfilename ); }
"/* translation of file \"" pg_filename "\" */
/* generated by:
 *  " kimwitu_copyright "
 */
#define KC_FUNCTIONS_" printablefilename "
"
{ if(g_options.stdafx!="") {
	PRINT("#include \"");
	PRINT(g_options.stdafx.c_str());
	PRINT("\"\n");
}	}
"
#include <stdlib.h>
#include \"" { PRINT(g_options.prefix.c_str()); } "k.h\"
"
					];
PhylumDeclarations( * )			-> [view_gen_fns_owninclude_c:
"#include \"" { PRINT(g_options.hfilename.c_str()); } "\"
"
					];

/***************************************************************************/

/***************************************************************************/

PhylumDeclarations( * )			-> [view_gen_unpk_h:
"/* translation of file(s)\n"
Thefnfiles
" */
/* generated by:
 *  " kimwitu_copyright "
 */
#ifndef KC_UNPARSE_HEADER
#define KC_UNPARSE_HEADER

"
					];

PhylumDeclarations( pds )		-> [view_gen_unparsedecls_h:
    { if(pg_languageshavebeendefined) } ${
	"\n"
	"#ifndef is_language\n"
	"#define is_language(L) kc_language==kc_language_##L\n"
	"#endif\n\n"

	"#ifndef set_language\n"
	"#define set_language(L) kc_language=kc_language_##L\n"
	"#endif\n\n"

	"extern char** kc_language;\n"

	Thelanguages
    $}
"
/* Use uviews instead
extern char *kc_view_names[];
*/
"
    Theuviewnames:view_uview_class_def

"
void unparse(abstract_phylum kc_p, printer_functor kc_printer, uview kc_current_view);
void unparse(void *kc_p, printer_functor kc_printer, uview kc_current_view);
void unparse(int kc_v, printer_functor kc_printer, uview kc_current_view);
void unparse(double kc_v, printer_functor kc_printer, uview kc_current_view);
void unparse(kc_char_t *kc_v, printer_functor kc_printer, uview kc_current_view);
void unparse(kc_string_t kc_v, printer_functor kc_printer, uview kc_current_view);
#define PRINT(string) kc_printer(string,kc_current_view)
#define UNPARSE(node) node->unparse(kc_printer,kc_current_view)
"
					];
Nilviewnames()				-> [view_gen_rewritek_h view_gen_unparsedecls_h view_uview_def: /* EMPTY */ ];
Consviewnames( vn, Nilviewnames())	-> [view_gen_unparsedecls_h: "\t" vn ];
Consviewnames( vn, r_vn)		-> [view_gen_unparsedecls_h:
    r_vn ",\n\t" vn
					];

Consviewnames( vn, r_vn)		-> [view_gen_rewritek_h:
    r_vn vn "_enum" ",\n\t"
					];

Consviewnames( vn, r_vn)		-> [view_uview_def:
    r_vn vn "_enum" ",\n\t"
					];

node=Consviewnames( vn, r_vn)		-> [view_uview_class_def:
    r_vn
	{ if(!node->is_extern) } ${
"struct "
{ if(g_options.dllexports!="") {
	PRINT(g_options.dllexports.c_str());
	PRINT(" ");
} }
vn "_class: uview_class {
	"vn"_class():uview_class("vn"_enum){}
};
extern "vn"_class "vn";
"
	$} { else } ${
"class "
{ if(g_options.dllexports!="") {
	PRINT(g_options.dllexports.c_str());
	PRINT(" ");
} }
vn "_baseclass: public uview_class {
\rprotected:\v
	"vn"_baseclass():uview_class("vn"_enum){}
};
// class " vn "_class is defined externally
"   $}
					];
PhylumDeclarations( * )			-> [view_gen_end_unpk_h:
"#endif // KC_UNPARSE_HEADER
"
					];

/***************************************************************************/

PhylumDeclarations( * )			-> [view_gen_unpk_c:
"/* translation of file(s)\n"
Thefnfiles
" */
/* generated by:
 *  " kimwitu_copyright "
 */
#define KC_UNPARSE
"
{ if(g_options.stdafx!="") {
	PRINT("#include \"");
	PRINT(g_options.stdafx.c_str());
	PRINT("\"\n");
}	}
"
#include <stdio.h>
#include <string>
#include <stdlib.h>
#include \"" { PRINT(g_options.prefix.c_str()); } "k.h\"
#include \"" { PRINT(g_options.prefix.c_str()); } "unpk.h\"

"
    $0:view_open_namespace
    Theuviewnames:view_gen_viewvars_c
"
impl_uviews uviews[] = {
" Theuviewnames
"	{0,0}
};
"
    { if(pg_languageshavebeendefined) } ${
	"\n"
	"#ifndef LANG_TEXT\n"
	"#define LANG_TEXT(i) kc_language[i]\n"
	"#endif\n\n"
    $}

					];
Nilviewnames()				-> [view_gen_rewritek_c view_gen_unpk_c view_gen_viewvars_c: /* EMPTY */ ];

node=Consviewnames( vn, r_vn)		-> [view_gen_unpk_c view_gen_rewritek_c:
    r_vn
   { if(!node->is_extern) } ${
    "{\"" vn "\",&" vn "},
	"
   $} {else} ${
    "{\"" vn "\", 0},
	"
   $}
					];

node=Consviewnames( vn, Nilviewnames()) -> [view_gen_viewvars_c :
	{ if(!node->is_extern) } ${
	vn "_class " vn ";
"
	$}
					];
node=Consviewnames( vn, r_vn)		-> [view_gen_viewvars_c :
	r_vn
	{ if(!node->is_extern) } ${
	vn "_class " vn ";
"
	$}
					];

/***************************************************************************/

PhylumDeclarations( * )			-> [view_gen_default_types_unpk_c:
"
#ifndef KC_TRACE_PROVIDED
#define KC_TRACE_PROVIDED(COND,FILE,LINE,NODE) COND
#endif

void
impl_abstract_phylum::unparse(printer_function opf, uview uv)
{
    printer_functor_function_wrapper pf(opf);
    do_unparse(pf, uv);
}

// Everything given as a pointer is expected to have an unparse-method (we
// believe it's a phylum), unless there's a specialisation for it

void
unparse(abstract_phylum kc_p, printer_functor kc_printer, uview kc_current_view)
{
    kc_p->unparse(kc_printer, kc_current_view);
}

void
unparse(void *kc_p, printer_functor kc_printer, uview kc_current_view)
{
    // MPi: 20020628 there shouldn't be any left
    assertionFailed(\"Unparse called for untyped pointer\");
    // MPi: cast should be unnecessary, but there are still void*
    reinterpret_cast<impl_abstract_phylum*>(kc_p)->unparse(kc_printer, kc_current_view);
}

void
unparse(int kc_v, printer_functor kc_printer, uview kc_current_view)
{
    kc_char_t kc_string[200];
    kc_print_integer(kc_string, kc_v);
    kc_printer(kc_string, kc_current_view);
}

void
unparse(double kc_v, printer_functor kc_printer, uview kc_current_view)
{
    kc_char_t kc_string[200];
    kc_print_real(kc_string, kc_v);
    kc_printer(kc_string, kc_current_view);
}

void
unparse(kc_char_t *kc_v, printer_functor kc_printer, uview kc_current_view)
{
    kc_printer(kc_v, kc_current_view);
}

void
unparse(kc_string_t kc_v, printer_functor kc_printer, uview kc_current_view)
{
    kc_printer(kc_v.c_str(), kc_current_view);
}
"
    g_emptystring:view_printer_outputfileline
	{ assertReason(!g_options.no_unparse, "shouldn't create unpk.cc when not even generating unparse stuff"); /* MPi 20021009 */ }
	{ if (!g_options.no_unparse) } ${
"void
impl_abstract_phylum::default_unparse(printer_functor kc_printer, uview kc_current_view)
{
    register int no_sons = operator_info[prod_sel()].no_sons;
    for (int i=0; i < no_sons; i++)
	subphylum(i)->unparse(kc_printer, kc_current_view);
}

void
impl_casestring__Str::do_unparse(printer_functor kc_printer, uview kc_current_view)
{
    kc::unparse(name, kc_printer, kc_current_view);
}

void
impl_nocasestring_NoCaseStr::do_unparse(printer_functor kc_printer, uview kc_current_view)
{
    kc::unparse(name, kc_printer, kc_current_view);
}

void
impl_integer__Int::do_unparse(printer_functor kc_printer, uview kc_current_view)
{
    kc::unparse(value, kc_printer, kc_current_view);
}

void
impl_real__Real::do_unparse(printer_functor kc_printer, uview kc_current_view)
{
    kc::unparse(value, kc_printer, kc_current_view);
}

void
impl_voidptr__VoidPtr::do_unparse(printer_functor kc_printer, uview kc_current_view)
{
    kc::unparse(pointer, kc_printer, kc_current_view);
}

"
$}
					];

PhylumDeclarations( pds )		-> [view_gen_unparsedefs_c:
    pds
					];
Consphylumdeclarations( pd, rpds )	-> [view_gen_unparsedefs_c:
    rpds
    pd
					];
Nilphylumdeclarations()			-> [view_gen_unparsedefs_c: /* EMPTY */ ];
PhylumDeclaration( *, *, PredefinedAlternatives( * ), * ),
PhylumDeclaration( *, *, Emptyproductionblock(), * )
					-> [view_gen_unparsedefs_c: /* EMPTY */ ];
PhylumDeclaration( id, *, pb, * )	-> [view_gen_unparsedefs_c:
{   ID selvar = Id(Str(mkcasestring("this")));
    /*cf_pushselvar( selvar );*/
    dollarvarstack.push( selvar );
    dollarvarextstack.push( f_emptyId() );
    gl_phylum = id; }
    pb
{   gl_phylum = 0;
    /*cf_popselvar();*/
    dollarvarstack.pop();
    dollarvarextstack.pop();
}
					];

PredefinedAlternatives( * )		-> [view_gen_unparsedefs_c: /* EMPTY */ ];
NonlistAlternatives( a )		-> [view_gen_unparsedefs_c:
    a
					];

///////////////////////////////////////////
// Generation of *::unparse functions
ListAlternatives( Consalternatives(consa=Alternative(consid,*),
	    Consalternatives(nila=Alternative(nilid,*), *)), * )
					->[ view_gen_unparsedefs_c:
    // For the tail, ie the recursion, it is critical not to call another function
    // to keep the stack smaller. This might also enable tail recursion elimination
    // for some very clever compiler.
    "void
impl_" gl_phylum "::do_unparse(printer_functor kc_printer, uview kc_current_view_base)
{
    if(is_nil())
	nil_do_unparse(kc_printer, kc_current_view_base);
    else
	switch(kc_current_view_base) {
"
{   unparseviewsinfo a_unparseviewsinfo = f_unparseviewsinfo_of_alternative( consa, Theuviewnames );
    gl_operator = consid; }
    a_unparseviewsinfo:view_gen_unparsedefs_c
"	}
}

void
impl_" gl_phylum "::nil_do_unparse(printer_functor kc_printer, uview kc_current_view_base)
{
    switch(kc_current_view_base) {
"
{   freespineandelements(a_unparseviewsinfo);
    a_unparseviewsinfo = f_unparseviewsinfo_of_alternative( nila, Theuviewnames );
    gl_operator = nilid; }
    a_unparseviewsinfo:view_gen_unparsedefs_c
"    }
}

"
{   freespineandelements(a_unparseviewsinfo); }
					];

Alternative(oid, *)			-> [view_gen_unparsedefs_c:
{   unparseviewsinfo a_unparseviewsinfo = f_unparseviewsinfo_of_alternative( $0, Theuviewnames );
    gl_phylum = f_phylumofoperator(oid);
    gl_operator = oid;
    gl_unparse_goto_used = false; }
    g_emptystring:view_printer_outputfileline
	"void
impl_" gl_phylum "_" oid "::do_unparse(printer_functor kc_printer, uview kc_current_view_base)
{
    switch(kc_current_view_base) {
"
    a_unparseviewsinfo:view_gen_unparsedefs_c
"	}
}

"
{   freespineandelements(a_unparseviewsinfo);
    gl_phylum = 0;
}
					];

// This cleans out the list and its elements, but _not_ the subphyla
// of all the elements (as a_unparseviewsinfo->free(true) would).
void
freespineandelements(unparseviewsinfo a_unparseviewsinfo)
{
    abstract_phylum kc_p = a_unparseviewsinfo;
    while(kc_p) {
	if (kc_p->subphylum(0)) kc_p->subphylum(0)->free(false);
	kc_p = kc_p->subphylum(1);
    };
    a_unparseviewsinfo->freelist();
}
void
freespineandelements(rewriteviewsinfo a_rewriteviewsinfo)
{
    abstract_phylum kc_p = a_rewriteviewsinfo;
    while(kc_p) {
	if (kc_p->subphylum(0)) kc_p->subphylum(0)->free(false);
	kc_p = kc_p->subphylum(1);
    };
    a_rewriteviewsinfo->freelist();
}

%{ KC_UNPARSE
    // Definition of the view class for view_gen_unparsedefs_default_c;
    // it contains an additional var to indicate whether we are unparsing a list pylum
    // and another to show whether the user has supplied rules for the base view
    struct view_gen_unparsedefs_default_c_class :view_gen_unparsedefs_default_c_baseclass
    {
	bool isList;
	bool isOnlyDefault;
	view_gen_unparsedefs_default_c_class(bool LonL, bool oD):
	    isList(LonL), isOnlyDefault(oD) { }
    };
    view_gen_unparsedefs_default_c_class view_gen_unparsedefs_default_c(false, false);
%}

Nilunparseviewsinfo()			-> [view_gen_unparsedefs_c: /* EMPTY */ ];
/*
 * IMPORTANT we unparse the viewsinfo in reverse order, to make sure that
 * the kc_unparsing_label is used before defined, ie.
 * the default view is the last in the switch
 * so that we can set a variable when we generate a goto,
 * so that we only generate the label if necessary
 */
Consunparseviewsinfo( a_uvi, r_uvi )	-> [view_gen_unparsedefs_c:
    r_uvi
    a_uvi
					];

Unparseviewinfo( Id(Str(v)), * )	-> [view_gen_unparsedefs_c:
{ if ( strcmp(v->name, "base_uview" )==0 ) } ${
    $0:view_gen_unparsedefs_default_c
$} { else } ${
    $0:view_gen_unparsedefs_other_c
$}
					];
Unparseviewinfo( v, udi )		-> [view_gen_unparsedefs_default_c:
g_emptystring:view_printer_outputfileline
"    default:
"
{ if (gl_unparse_goto_used) } ${
"    kc_unparsing_default:
"
$}
"    case " v "_enum: {
		uview kc_current_view=kc_current_view_base;
"
    // If the user has not supplied any rules for the base view,
    // it is possible to use a more efficient default later on
    {   bool onlyDefault;
	with (udi) {
	    Nilunparsedeclsinfo(): { onlyDefault = true; }
	    default: { onlyDefault = false; } } }
    %uviewvar view_gen_unparsedefs_default_c vgudcD(/* is list ? */ false, onlyDefault);
    udi:vgudcD
"	break;
    }
"
					];
Unparseviewinfo( *, Nilunparsedeclsinfo() )
					-> [view_gen_unparsedefs_other_c: /* EMPTY */ ];
Unparseviewinfo( v, udi )		-> [view_gen_unparsedefs_other_c:
"    case " v "_enum: {
		"v"_class& kc_current_view=static_cast<"v"_class&>(kc_current_view_base);
"
    udi
"	break;
    }
"
					];
Nilunparsedeclsinfo()			-> [view_gen_unparsedefs_other_c:
"\vgoto kc_unparsing_default\r;
"
{ gl_unparse_goto_used = true; }
					];
Nilunparsedeclsinfo()			-> [view_gen_unparsedefs_default_c:
{ phylumdeclaration phydecl = f_lookupdecl( gl_phylum );
  if ( phydecl == 0 ) } ${ {
    v_report(NonFatal( FileLine( gl_phylum->file, gl_phylum->line ), Problem1S1ID( "internal error: could not find declaration of phylum:", gl_phylum )));
  } $} { else } ${
    phydecl
  $}
					];

PhylumDeclaration( *, *, PredefinedAlternatives( * ), * ),
PhylumDeclaration( *, *, Emptyproductionblock(), * )
					-> [view_gen_unparsedefs_default_c: /* EMPTY */ ];
PhylumDeclaration( *, *, ListAlternatives( *, * ), * )
					-> [view_gen_unparsedefs_default_c:
{   alternative a = f_alternativeofoperator(gl_operator); }
    %uviewvar view_gen_unparsedefs_default_c vgudcL(/* is list ? */ true, kc_current_view.isOnlyDefault);
    a:vgudcL
					];
PhylumDeclaration( *, *, NonlistAlternatives( * ), * )
					-> [view_gen_unparsedefs_default_c:
{   alternative a = f_alternativeofoperator(gl_operator); }
    a
					];
Alternative( *, args )			-> [view_gen_unparsedefs_default_c:
"	{
"   args
"	}
"					];

Consarguments( tail, Consarguments( head, Nilarguments()))
	provided (kc_current_view.isList && kc_current_view.isOnlyDefault)
					-> [view_gen_unparsedefs_default_c:
    // Unparsing lists can be done iteratively if the user has not provided
    // any rules for the base view - this is much better on resources (stack)
"	    for (" tail " iterator_ = this; iterator_->" tail "_1 != 0; iterator_ = iterator_->" tail "_1)
		\viterator_->" head "_1->unparse(kc_printer, kc_current_view);\r
"
					];
Consarguments( a, rargs )
	provided (kc_current_view.isList && !kc_current_view.isOnlyDefault)
					-> [view_gen_unparsedefs_default_c:
    // Whenever we want to unparse something which is the same operator as the one already
    // handled, we can call the private do_unparse method. That's particularly good when
    // unparsing lists, and incidentally that's also the only place where it happens.
    // (Only for lists can we be sure we are in the same operator (there's only one).)
    rargs
"	    " a "_" $0->seqnr "->"
{	    if (a->eq(f_phylumofoperator(gl_operator)) &&
		kc_current_view.isList) } ${  "do_" $}
	    "unparse(kc_printer, kc_current_view );
"
					];
Consarguments				-> [view_gen_unparsedefs_default_c:
    // Now for the non-list phyla. These can be extended with phylum-wide
    // unparse methods, therefore we call the appropriate virtual function.
    "default_unparse(kc_printer, kc_current_view );
"
					];


// we skip the first predicate, it will be for the outermost operator that
// is already handled as we jumped to the right virtual function
// MPi 20030926 matching Consunparsedeclsinfo(Unparsedeclinfo(...)) instead of
// just Unparsedeclinfo (and normal list unparse) is unnecessary except for the
// "dropped pattern" stuff which is superseded by the overlap-detection.
Consunparsedeclsinfo( Unparsedeclinfo( p=Conspatternrepresentation( *, Nilpatternrepresentation()), bindings, uc ), r_udi )
    // Very short predicate: no condition at all
					-> [view_gen_unparsedefs_other_c view_gen_unparsedefs_default_c:
    "{\n"
    bindings:view_unp_bindings
{ operatorstack.push( f_operatorofpatternrepresentation( p ) ); }
    uc
{ operatorstack.pop(); }
	"}
"
    // drop the tail, cannot match anyway
    // but warn if the rest is not empty
{   if (g_options.warn_drop_identical_patterns) with (r_udi) {
	Nilunparsedeclsinfo():	{ /* EMPTY - that's OK */ }
	Consunparsedeclsinfo(*, *): {
	    foreach(udi; unparsedeclsinfo $0) {
		warn_drop_identical_pattern(udi);
	    }
	}
    }
}
					];
Consunparsedeclsinfo( Unparsedeclinfo( p=Conspatternrepresentation( *, r_p ), bindings, uc ), r_udi)
					-> [view_gen_unparsedefs_other_c view_gen_unparsedefs_default_c:
    { gl_bindings.clear(); } bindings:view_predicate_bindings
"	if ((" r_p:view_unp_predicates ")) {
"
    bindings:view_unp_bindings
{ operatorstack.push( f_operatorofpatternrepresentation( p ) ); }
    uc
{ operatorstack.pop(); }
"	} else
"
    r_udi
					];
UnparseClause( *, ui )			-> [view_gen_unparsedefs_other_c view_gen_unparsedefs_default_c:
    ui
					];
Nilunparseitems()			-> [view_gen_unparsedefs_other_c view_gen_unparsedefs_default_c: /* EMPTY */ ];
Consunparseitems( a_ui, r_ui )		-> [view_gen_unparsedefs_other_c view_gen_unparsedefs_default_c:
    r_ui
    a_ui
					];
NoViewname()				-> [view_gen_unparsedefs_other_c view_gen_unparsedefs_default_c:
    "kc_current_view"
					];
YesViewname( v )			-> [view_gen_unparsedefs_other_c view_gen_unparsedefs_default_c:
    v
					];
UnpStr( *, a_CexpressionDQ, a_vnameopt )    -> [view_gen_unparsedefs_other_c view_gen_unparsedefs_default_c:
{ ug_viewnameopt = a_vnameopt; }
{ if(pg_languageshavebeendefined) } ${
	{
	static char buf[10];
	static long last_nr=-1;
	sprintf(buf,"%d",$0->text_nr);
	}
	{ if(last_nr!=$0->text_nr) } ${
	    { last_nr=$0->text_nr;  }
	    "       { kc_printer(LANG_TEXT("
	    { kc_printer( buf, base_uview ); }
	    "), "
	    a_vnameopt "); }\n"
	$}
$} { else } ${
    { kc_printer( "", view_no_of_printed_string_chars_reset ); }
"	{ kc_printer(kc_t(\"" a_CexpressionDQ:view_gen_unpstr_c "\"), " a_vnameopt "); }
"
$}
{ ug_viewnameopt = 0; }
					];
ConsCexpressionDQ( cedqe, cedq )	-> [view_gen_unpstr_c view_output_collection: cedq cedqe ];
NilCexpressionDQ()			-> [view_gen_unpstr_c: /* EMPTY */ ];
CExpressionDQPart( cs )			-> [view_gen_unpstr_c view_output_collection: cs ];
CExpressionDQNl()			-> [view_gen_unpstr_c view_output_collection: "\\\n\\n"];

UnpSubexpr(lang, sub, a_vnameopt )	-> [view_gen_unparsedefs_other_c view_gen_unparsedefs_default_c:
{ ID phy = f_typeofunpsubterm( sub, operatorstack.top() ); }
    lang
    "kc::unparse(" sub ", kc_printer, " a_vnameopt ");
"
					];
UnpSubTerm( st )			-> [view_gen_unparsedefs_other_c view_gen_unparsedefs_default_c:
    st
					];
UnpDollarvarTerm( * )			-> [view_gen_unparsedefs_other_c view_gen_unparsedefs_default_c:
    $0:view_gen_initializephyla_c
					];
UnpSubAttr( st, a_unpattributes )	-> [view_gen_unparsedefs_other_c view_gen_unparsedefs_default_c:
    st a_unpattributes
					];
UnpDollarvarAttr( *, a_unpattributes )	-> [view_gen_unparsedefs_other_c view_gen_unparsedefs_default_c:
    $0:view_gen_initializephyla_c a_unpattributes
					];
UnpCastedVariable( *, a_id )		-> [view_gen_unparsedefs_other_c view_gen_unparsedefs_default_c:
    a_id
					];
UnpCtext(lang, ct )			-> [view_gen_unparsedefs_other_c view_gen_unparsedefs_default_c:
lang
{ if(lang->prod_sel()==sel_LanguageList) } ${
	"{\n"
$}
{ if(g_options.linedirec) } ${ pg_line ct->line " \"" { PRINT(g_options.dir_line.c_str()); } ct->file:view_filename "\"\n" $}
ct:view_gen_initializephyla_c
g_emptystring:view_printer_outputfileline
{ if(lang->prod_sel()==sel_LanguageList) } ${
    "}\n"
$}
					];
UnpBody(lang, a_unparseitems )		-> [view_gen_unparsedefs_other_c view_gen_unparsedefs_default_c:
lang
    "{
"
    a_unparseitems
    " }
"
					];
UViewVarDecl(type, name,NilCexpression()) -> [view_gen_unparsedefs_other_c view_gen_unparsedefs_default_c:
	"\t" type "_class " name ";
"
					];

UViewVarDecl(type, name, expr)		-> [view_gen_unparsedefs_other_c view_gen_unparsedefs_default_c:
	"\t" type "_class " name expr:view_gen_initializephyla_c ";
"
					];

Nilunpattributes()			-> [view_gen_unparsedefs_other_c view_gen_unparsedefs_default_c: /* EMPTY */ ];
Consunpattributes( a_attr, r_attr )	-> [view_gen_unparsedefs_other_c view_gen_unparsedefs_default_c:
    r_attr "->" a_attr
					];

LanguageList( langs )			-> [view_gen_unparsedefs_other_c view_gen_unparsedefs_default_c:
    "if(" langs ")\n    "
					];

NoLanguagename()			-> [view_gen_unparsedefs_other_c view_gen_unparsedefs_default_c: /* EMPTY */ ];

Conslanguagenames( id, tail )		-> [ view_gen_unparsedecls_h:
    tail
    "extern char* kc_language_" id "[];\n"
					]
					[view_gen_unparsedefs_other_c view_gen_unparsedefs_default_c:
    tail " || is_language(" id : base_uview ")"
					];

Conslanguagenames( id, Nillanguagenames()) -> [ view_gen_unparsedecls_h:
    "extern char* kc_language_" id "[];\n"
					]
					[view_gen_unparsedefs_other_c view_gen_unparsedefs_default_c:
    "is_language(" id : base_uview ")"
					];

id=Id(*)				-> [ view_output_collection:
    "char* kc_language_" id : base_uview " [] = {\n"
					];

UnpStr(*, expr, *)			-> [ view_output_collection: "\t\"" expr "\"" ];

/* this list is already in right order, do not turn */
Consunparseitems(head, tail)		-> [ view_output_collection: head " " tail ];

Consunparseitems(head, Nilunparseitems()) -> [ view_output_collection: head ];

Nilunparseitems()			-> [ view_output_collection: "\t\"\"" ];

%{ KC_UNPARSE
// To avoid covariant return types for broken compilers, we want to have three choices:
// Use them, don't use them, generate both and decide with preprocessor macros

// extended version: typename also in function name
void
covariant_choice(ID yest, const char* yess1, const char* yess2, const char *no1, const char *no2,
	printer_functor kc_printer, uview kc_current_view)
{
    kc_printer("\n", kc_current_view);
    if (g_options.covariant == 'p') kc_printer("#ifndef NO_COVARIANT_RETURN\n", kc_current_view);
    if (g_options.covariant != 'n') {
	yest->unparse(kc_printer, kc_current_view);
	kc_printer(yess1, kc_current_view);
	if (yess2!=0) {
	    yest->unparse(kc_printer, kc_current_view);
	    kc_printer(yess2, kc_current_view);
	}
    }
    if (g_options.covariant == 'p') kc_printer("\n#else\n", kc_current_view);
    if (g_options.covariant != 'y') {
	kc_printer(no1, kc_current_view);
	if (no2!=0) {
	    yest->unparse(kc_printer, kc_current_view);
	    kc_printer(no2, kc_current_view);
	}
    }
    if (g_options.covariant == 'p') kc_printer("\n#endif // NO_COVARIANT_RETURN\n", kc_current_view);
}

// short version: typename exactly once
inline void
covariant_choice(ID yest, const char* yess, const char *no, printer_functor kc_printer, uview kc_current_view)
{ covariant_choice(yest, yess, 0, no, 0, kc_printer, kc_current_view); }

// This printer functor doesn't print, but instead counts each of
// its invocations. Handy to find out whether a future unparsing
// will produce any output at all.
class count_printer: public printer_functor_class {
    int count;
public:
    count_printer(): count(0) { }
    virtual void operator()(const char* s, uview v) { count++;}
    int operator()() { return count;}
};

%}

Id(oid)					-> [view_class_of_op:
    {	ID pid=f_phylumofoperator($0);
	if (f_listelementphylum(pid)->eq(f_emptyId())) } ${
	    pid:view_class_of_phy "_" oid
	$} { else } ${
	    pid:view_class_of_phy
	$}
					];

Id(pid)					-> [view_class_of_phy:
    "impl_" pid
					];

// vim:sts=4:ts=8:cino=g0,t0,\:0
