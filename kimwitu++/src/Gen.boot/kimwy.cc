/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton implementation for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.3"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Using locations.  */
#define YYLSP_NEEDED 0



/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     T_ID = 258,
     T_OPNAME = 259,
     T_INT = 260,
     T_CNEWLINES = 261,
     T_CLINE = 262,
     T_CEXPRESSION = 263,
     T_DOLLARVAR = 264,
     T_INCLUDEEND = 265,
     T_INCLUDESTART = 266,
     T_ENDOFINCLUDESTART = 267,
     T_LIST = 268,
     T_ARROW = 269,
     T_PROVIDED = 270,
     T_STATIC = 271,
     T_WITH = 272,
     T_FOREACH = 273,
     T_FOREACH_AFTER = 274,
     T_DEFAULT = 275,
     T_UNPBLOCKSTART = 276,
     T_UNPBLOCKEND = 277,
     T_PERCENTRVIEW = 278,
     T_PERCENTRVIEWVAR = 279,
     T_PERCENTUVIEW = 280,
     T_PERCENTUVIEWVAR = 281,
     T_PERCENTSTORAGECLASS = 282,
     T_PERCENTLANGUAGE = 283,
     T_AUTO = 284,
     T_REGISTER = 285,
     T_EXTERN = 286,
     T_TYPEDEF = 287,
     T_CONST = 288,
     T_VOLATILE = 289,
     T_UNSIGNED = 290,
     T_VIRTUAL = 291,
     T_DOTDOTDOT = 292,
     T_COLONCOLON = 293,
     T_OPERATOR = 294,
     T_CONSTRUCTOR = 295,
     T_DESTRUCTOR = 296,
     T_MEMBER = 297,
     T_ATTR = 298,
     T_BASECLASS = 299
   };
#endif
/* Tokens.  */
#define T_ID 258
#define T_OPNAME 259
#define T_INT 260
#define T_CNEWLINES 261
#define T_CLINE 262
#define T_CEXPRESSION 263
#define T_DOLLARVAR 264
#define T_INCLUDEEND 265
#define T_INCLUDESTART 266
#define T_ENDOFINCLUDESTART 267
#define T_LIST 268
#define T_ARROW 269
#define T_PROVIDED 270
#define T_STATIC 271
#define T_WITH 272
#define T_FOREACH 273
#define T_FOREACH_AFTER 274
#define T_DEFAULT 275
#define T_UNPBLOCKSTART 276
#define T_UNPBLOCKEND 277
#define T_PERCENTRVIEW 278
#define T_PERCENTRVIEWVAR 279
#define T_PERCENTUVIEW 280
#define T_PERCENTUVIEWVAR 281
#define T_PERCENTSTORAGECLASS 282
#define T_PERCENTLANGUAGE 283
#define T_AUTO 284
#define T_REGISTER 285
#define T_EXTERN 286
#define T_TYPEDEF 287
#define T_CONST 288
#define T_VOLATILE 289
#define T_UNSIGNED 290
#define T_VIRTUAL 291
#define T_DOTDOTDOT 292
#define T_COLONCOLON 293
#define T_OPERATOR 294
#define T_CONSTRUCTOR 295
#define T_DESTRUCTOR 296
#define T_MEMBER 297
#define T_ATTR 298
#define T_BASECLASS 299




/* Copy the first part of user declarations.  */

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



/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif

#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int i)
#else
static int
YYID (i)
    int i;
#endif
{
  return i;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef _STDLIB_H
#      define _STDLIB_H 1
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined _STDLIB_H \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef _STDLIB_H
#    define _STDLIB_H 1
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss;
  YYSTYPE yyvs;
  };

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack)					\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack, Stack, yysize);				\
	Stack = &yyptr->Stack;						\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  3
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   764

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  66
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  159
/* YYNRULES -- Number of rules.  */
#define YYNRULES  379
/* YYNRULES -- Number of states.  */
#define YYNSTATES  614

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   299

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      55,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    50,    56,     2,    63,     2,    62,    57,
      52,    53,    64,     2,    47,     2,    65,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,    45,    46,
      60,    54,    61,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    58,     2,    59,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    48,    51,    49,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     5,     7,     9,    10,    13,    14,    17,
      19,    21,    23,    25,    27,    29,    31,    33,    35,    37,
      43,    45,    49,    50,    58,    59,    63,    68,    71,    75,
      76,    79,    81,    83,    87,    89,    93,    97,    98,    99,
     106,   110,   111,   114,   119,   120,   125,   128,   129,   132,
     137,   138,   139,   143,   144,   147,   149,   151,   153,   157,
     161,   165,   169,   172,   175,   178,   181,   182,   185,   187,
     189,   191,   193,   194,   197,   199,   201,   202,   205,   207,
     209,   211,   215,   216,   217,   222,   224,   226,   227,   232,
     233,   234,   240,   241,   242,   248,   250,   252,   254,   255,
     256,   262,   263,   264,   268,   270,   272,   274,   276,   277,
     282,   283,   288,   290,   291,   295,   296,   297,   298,   309,
     310,   311,   321,   322,   323,   324,   332,   333,   335,   336,
     342,   346,   347,   349,   351,   354,   355,   361,   363,   366,
     372,   374,   376,   378,   382,   384,   388,   389,   392,   394,
     398,   401,   403,   407,   409,   412,   416,   420,   423,   429,
     433,   436,   439,   440,   441,   442,   449,   451,   456,   458,
     460,   464,   465,   470,   472,   473,   475,   477,   481,   483,
     486,   490,   494,   496,   501,   508,   515,   519,   523,   524,
     529,   530,   535,   537,   538,   540,   542,   546,   548,   551,
     555,   559,   561,   564,   568,   569,   575,   580,   582,   585,
     591,   596,   602,   607,   610,   611,   614,   615,   618,   619,
     620,   628,   632,   635,   640,   641,   642,   650,   652,   654,
     657,   660,   665,   667,   670,   673,   676,   677,   680,   683,
     687,   691,   693,   697,   700,   705,   709,   715,   718,   722,
     726,   730,   732,   736,   739,   744,   748,   754,   757,   761,
     765,   769,   771,   774,   778,   781,   785,   789,   798,   806,
     813,   819,   825,   826,   829,   831,   835,   840,   841,   844,
     845,   848,   852,   854,   857,   860,   864,   866,   869,   872,
     876,   878,   880,   882,   884,   886,   888,   890,   891,   893,
     895,   897,   899,   901,   903,   906,   909,   913,   915,   918,
     921,   925,   927,   930,   933,   937,   940,   944,   946,   950,
     955,   960,   965,   966,   971,   973,   977,   983,   989,   991,
     995,   997,  1000,  1001,  1003,  1005,  1008,  1011,  1015,  1017,
    1020,  1021,  1023,  1025,  1028,  1032,  1034,  1038,  1042,  1046,
    1048,  1050,  1053,  1057,  1062,  1066,  1071,  1075,  1077,  1078,
    1081,  1083,  1086,  1088,  1089,  1094,  1099,  1100,  1102,  1106,
    1108,  1111,  1115,  1119,  1123,  1127,  1129,  1132,  1136,  1139
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
      70,     0,    -1,     9,    -1,     3,    -1,     5,    -1,    -1,
      71,    72,    -1,    -1,    72,    73,    -1,    76,    -1,   136,
      -1,   183,    -1,   132,    -1,   162,    -1,   177,    -1,   179,
      -1,   181,    -1,   223,    -1,    74,    -1,    44,    68,    45,
      75,    46,    -1,    68,    -1,    75,    47,    68,    -1,    -1,
      68,    78,    45,    77,    79,    85,    46,    -1,    -1,    48,
      68,    49,    -1,    48,    50,    68,    49,    -1,    48,     1,
      -1,    48,    50,     1,    -1,    -1,    13,    68,    -1,    80,
      -1,    81,    -1,    80,    51,    81,    -1,     1,    -1,    80,
      51,     1,    -1,    80,     1,    81,    -1,    -1,    -1,    68,
      52,    82,    84,    83,    53,    -1,    68,    52,     1,    -1,
      -1,    84,    68,    -1,    84,     3,    45,    68,    -1,    -1,
      48,    86,   131,    49,    -1,    48,     1,    -1,    -1,    86,
      87,    -1,    68,    68,    88,    46,    -1,    -1,    -1,    54,
      89,    90,    -1,    -1,    90,    91,    -1,     8,    -1,    67,
      -1,    55,    -1,    56,    95,    56,    -1,    57,    97,    57,
      -1,    52,    92,    53,    -1,    58,    92,    59,    -1,    56,
       1,    -1,    57,     1,    -1,    52,     1,    -1,    58,     1,
      -1,    -1,    92,    93,    -1,    91,    -1,    47,    -1,    56,
      -1,     1,    -1,    -1,    95,    96,    -1,     8,    -1,    55,
      -1,    -1,    97,    98,    -1,     8,    -1,    55,    -1,   100,
      -1,    99,    47,   100,    -1,    -1,    -1,    68,   101,    90,
     102,    -1,    90,    -1,   103,    -1,    -1,   104,    47,   105,
     103,    -1,    -1,    -1,    48,   107,   112,   108,    49,    -1,
      -1,    -1,    48,   110,   112,   111,    49,    -1,   116,    -1,
     160,    -1,     1,    -1,    -1,    -1,    48,   114,   116,   115,
      49,    -1,    -1,    -1,   116,   117,   118,    -1,     7,    -1,
      67,    -1,    55,    -1,     6,    -1,    -1,    56,   119,    95,
      56,    -1,    -1,    57,   120,    97,    57,    -1,   113,    -1,
      -1,    18,   121,   125,    -1,    -1,    -1,    -1,    17,   122,
      52,   123,   104,   124,    53,    48,   160,    49,    -1,    -1,
      -1,    52,   142,    46,   126,    99,    53,   109,   127,   128,
      -1,    -1,    -1,    -1,    19,   129,    52,   142,   130,    53,
     109,    -1,    -1,   113,    -1,    -1,    11,   134,   133,    12,
      10,    -1,    11,     1,    10,    -1,    -1,   135,    -1,     3,
      -1,   135,     3,    -1,    -1,   146,    14,   137,   138,   140,
      -1,   139,    -1,   138,   139,    -1,    60,   166,    45,   155,
      61,    -1,    46,    -1,     1,    -1,   142,    -1,   141,    47,
     142,    -1,   143,    -1,   142,    62,   143,    -1,    -1,   144,
     145,    -1,   147,    -1,    52,   141,    53,    -1,    63,    68,
      -1,   147,    -1,   146,    47,   147,    -1,     1,    -1,   146,
       1,    -1,   146,    47,     1,    -1,   146,     1,   147,    -1,
      68,   148,    -1,    68,    52,   153,    53,   148,    -1,    68,
      54,   147,    -1,    64,   148,    -1,    20,   148,    -1,    -1,
      -1,    -1,    15,    52,   149,    90,   150,    53,    -1,    68,
      -1,    68,    52,   153,    53,    -1,    64,    -1,    20,    -1,
      68,    54,   151,    -1,    -1,    56,   152,    95,    56,    -1,
      69,    -1,    -1,   154,    -1,   151,    -1,   154,    47,   151,
      -1,     1,    -1,   154,     1,    -1,   154,    47,     1,    -1,
     154,     1,   151,    -1,    68,    -1,    68,    52,   158,    53,
      -1,   155,    14,    68,    52,   158,    53,    -1,   155,    65,
      68,    52,   158,    53,    -1,   155,    14,    68,    -1,   155,
      65,    68,    -1,    -1,    57,   156,    97,    57,    -1,    -1,
      56,   157,    95,    56,    -1,    69,    -1,    -1,   159,    -1,
     155,    -1,   159,    47,   155,    -1,     1,    -1,   159,     1,
      -1,   159,    47,     1,    -1,   159,     1,   155,    -1,   161,
      -1,   160,   161,    -1,   141,    45,   113,    -1,    -1,   146,
      14,   163,   164,    46,    -1,   146,    14,     1,    46,    -1,
     165,    -1,   164,   165,    -1,    58,   166,    45,   167,    59,
      -1,    58,   166,    45,     1,    -1,    58,     1,    45,   167,
      59,    -1,    58,     1,    45,     1,    -1,    58,     1,    -1,
      -1,   166,    68,    -1,    -1,   167,   168,    -1,    -1,    -1,
     221,    56,   169,    95,    94,   170,   176,    -1,   221,   173,
     176,    -1,   221,   113,    -1,   221,    21,   167,    22,    -1,
      -1,    -1,    26,    68,    68,   171,    90,   172,    46,    -1,
      68,    -1,    67,    -1,    68,   174,    -1,    67,   174,    -1,
      52,    68,    53,    68,    -1,   175,    -1,   174,   175,    -1,
      14,    68,    -1,    14,     1,    -1,    -1,    45,    68,    -1,
      45,     1,    -1,    25,   178,    46,    -1,    25,     1,    46,
      -1,    68,    -1,    52,    68,    53,    -1,   178,    68,    -1,
     178,    52,    68,    53,    -1,   178,    47,    68,    -1,   178,
      47,    52,    68,    53,    -1,   178,     1,    -1,   178,    47,
       1,    -1,    23,   180,    46,    -1,    23,     1,    46,    -1,
      68,    -1,    52,    68,    53,    -1,   180,    68,    -1,   180,
      52,    68,    53,    -1,   180,    47,    68,    -1,   180,    47,
      52,    68,    53,    -1,   180,     1,    -1,   180,    47,     1,
      -1,    27,   182,    46,    -1,    27,     1,    46,    -1,    68,
      -1,   182,    68,    -1,   182,    47,    68,    -1,   182,     1,
      -1,   182,    47,     1,    -1,   189,   196,   219,    -1,    68,
      38,    39,    68,    52,    53,   207,   219,    -1,    40,    68,
      52,   210,    53,   184,   219,    -1,    41,   193,    68,    52,
      53,   219,    -1,    42,   190,   198,   188,    46,    -1,    43,
     190,   198,   188,    46,    -1,    -1,    45,   185,    -1,   186,
      -1,   185,    47,   186,    -1,    68,    52,   203,    53,    -1,
      -1,    54,   216,    -1,    -1,    54,   216,    -1,    52,   216,
      53,    -1,   194,    -1,   191,   194,    -1,   195,   194,    -1,
     191,   195,   194,    -1,   194,    -1,   192,   194,    -1,   195,
     194,    -1,   192,   195,   194,    -1,    29,    -1,    30,    -1,
      16,    -1,    31,    -1,    32,    -1,    36,    -1,    16,    -1,
      -1,    36,    -1,    68,    -1,    33,    -1,    34,    -1,    35,
      -1,   204,    -1,   208,   204,    -1,    62,   204,    -1,   208,
      62,   204,    -1,   200,    -1,   208,   200,    -1,    62,   200,
      -1,   208,    62,   200,    -1,   201,    -1,   208,   201,    -1,
      62,   201,    -1,   208,    62,   201,    -1,   208,   200,    -1,
     208,    62,   200,    -1,   218,    -1,    52,   199,    53,    -1,
     200,    58,   215,    59,    -1,   200,    52,   210,    53,    -1,
      68,    38,    68,   202,    -1,    -1,   202,    58,   216,    59,
      -1,   216,    -1,   203,    47,   216,    -1,   205,    52,   210,
      53,   207,    -1,   205,    52,     1,    53,   207,    -1,   206,
      -1,   205,    38,   206,    -1,    68,    -1,    39,     4,    -1,
      -1,    33,    -1,    64,    -1,    64,   209,    -1,    64,   208,
      -1,    64,   209,   208,    -1,   195,    -1,   209,   195,    -1,
      -1,    37,    -1,   211,    -1,   211,    37,    -1,   211,    47,
      37,    -1,   212,    -1,   211,    47,   212,    -1,   189,   197,
     187,    -1,   189,   213,   187,    -1,   208,    -1,   214,    -1,
     208,   214,    -1,    52,   213,    53,    -1,   214,    58,   215,
      59,    -1,    58,   215,    59,    -1,   214,    52,   210,    53,
      -1,    52,   210,    53,    -1,   216,    -1,    -1,   217,    90,
      -1,    68,    -1,    63,    68,    -1,   106,    -1,    -1,     1,
      46,   220,   219,    -1,    60,   222,    61,    45,    -1,    -1,
      68,    -1,   222,    47,    68,    -1,     1,    -1,   222,     1,
      -1,   222,    47,     1,    -1,   222,     1,    68,    -1,    28,
     224,    46,    -1,    28,     1,    46,    -1,    68,    -1,   224,
      68,    -1,   224,    47,    68,    -1,   224,     1,    -1,   224,
      47,     1,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   286,   286,   291,   296,   308,   308,   316,   318,   322,
     324,   330,   332,   334,   336,   338,   340,   342,   344,   349,
     354,   356,   362,   361,   369,   370,   372,   374,   376,   382,
     383,   388,   393,   395,   397,   399,   401,   406,   406,   406,
     409,   415,   416,   418,   425,   426,   428,   434,   435,   440,
     446,   448,   447,   460,   461,   466,   468,   470,   472,   474,
     476,   478,   480,   482,   484,   486,   492,   493,   498,   500,
     505,   506,   511,   512,   517,   519,   525,   526,   531,   533,
     538,   540,   546,   548,   545,   553,   558,   560,   560,   572,
     574,   571,   581,   583,   580,   589,   591,   598,   604,   606,
     603,   613,   615,   614,   621,   623,   625,   627,   630,   629,
     635,   634,   640,   644,   643,   649,   651,   653,   648,   662,
     664,   662,   696,   698,   699,   697,   730,   731,   736,   736,
     742,   748,   751,   756,   765,   778,   777,   785,   787,   792,
     804,   805,   809,   811,   816,   818,   823,   823,   829,   831,
     833,   838,   840,   842,   844,   846,   848,   853,   856,   859,
     862,   865,   872,   873,   873,   873,   878,   880,   882,   884,
     886,   889,   888,   893,   899,   900,   905,   907,   909,   911,
     913,   915,   920,   923,   927,   930,   933,   936,   940,   939,
     946,   945,   951,   958,   959,   964,   966,   968,   970,   972,
     974,   979,   981,   986,   992,   991,   996,  1001,  1003,  1008,
    1018,  1020,  1022,  1024,  1030,  1031,  1037,  1038,  1044,  1046,
    1043,  1053,  1055,  1057,  1060,  1060,  1059,  1066,  1068,  1070,
    1072,  1077,  1082,  1084,  1089,  1091,  1097,  1098,  1100,  1105,
    1107,  1112,  1116,  1120,  1124,  1128,  1132,  1136,  1138,  1143,
    1145,  1150,  1154,  1158,  1162,  1166,  1170,  1174,  1176,  1181,
    1183,  1188,  1192,  1196,  1200,  1202,  1207,  1217,  1237,  1257,
    1277,  1284,  1295,  1296,  1301,  1303,  1308,  1314,  1316,  1322,
    1324,  1327,  1338,  1342,  1348,  1354,  1366,  1370,  1376,  1382,
    1394,  1396,  1398,  1400,  1402,  1404,  1409,  1415,  1416,  1425,
    1430,  1432,  1434,  1439,  1441,  1443,  1445,  1450,  1452,  1454,
    1456,  1461,  1463,  1465,  1467,  1472,  1474,  1479,  1481,  1483,
    1485,  1490,  1496,  1497,  1502,  1504,  1509,  1515,  1525,  1527,
    1532,  1534,  1544,  1545,  1550,  1552,  1554,  1556,  1561,  1563,
    1569,  1570,  1572,  1574,  1576,  1581,  1583,  1588,  1590,  1595,
    1597,  1599,  1604,  1606,  1608,  1610,  1612,  1620,  1624,  1624,
    1631,  1633,  1638,  1640,  1640,  1644,  1647,  1651,  1653,  1655,
    1657,  1659,  1661,  1666,  1668,  1673,  1675,  1677,  1679,  1681
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "T_ID", "T_OPNAME", "T_INT",
  "T_CNEWLINES", "T_CLINE", "T_CEXPRESSION", "T_DOLLARVAR", "T_INCLUDEEND",
  "T_INCLUDESTART", "T_ENDOFINCLUDESTART", "T_LIST", "T_ARROW",
  "T_PROVIDED", "T_STATIC", "T_WITH", "T_FOREACH", "T_FOREACH_AFTER",
  "T_DEFAULT", "T_UNPBLOCKSTART", "T_UNPBLOCKEND", "T_PERCENTRVIEW",
  "T_PERCENTRVIEWVAR", "T_PERCENTUVIEW", "T_PERCENTUVIEWVAR",
  "T_PERCENTSTORAGECLASS", "T_PERCENTLANGUAGE", "T_AUTO", "T_REGISTER",
  "T_EXTERN", "T_TYPEDEF", "T_CONST", "T_VOLATILE", "T_UNSIGNED",
  "T_VIRTUAL", "T_DOTDOTDOT", "T_COLONCOLON", "T_OPERATOR",
  "T_CONSTRUCTOR", "T_DESTRUCTOR", "T_MEMBER", "T_ATTR", "T_BASECLASS",
  "':'", "';'", "','", "'{'", "'}'", "'!'", "'|'", "'('", "')'", "'='",
  "'\\n'", "'\"'", "'''", "'['", "']'", "'<'", "'>'", "'&'", "'$'", "'*'",
  "'.'", "$accept", "dollarvar", "id", "integer", "specification", "@1",
  "declarations", "declaration", "baseclassdeclaration", "baseclass_list",
  "phylumdeclaration", "@2", "storageoption", "productionblock",
  "alternatives", "alternative", "@3", "@4", "arguments", "Ccode_option",
  "attributes_option", "attribute", "attribute_init_option", "@5",
  "Cexpression", "Cexpression_elem", "Cexpression_inner",
  "Cexpression_elem_inner", "quote_or_error", "CexpressionDQ",
  "CexpressionDQ_elem", "CexpressionSQ", "CexpressionSQ_elem",
  "idCexpressions", "idCexpression", "@6", "@7", "withCexpression",
  "withCexpressions", "@8", "MainCbody", "@9", "@10", "MainCbodyinC",
  "@11", "@12", "MainCBodycontinuation", "Cbody", "@13", "@14", "Ctext",
  "@15", "Ctext_elem", "@16", "@17", "@18", "@19", "@20", "@21",
  "foreach_continuation", "@22", "@23", "foreach_end_continuation", "@24",
  "@25", "init_option", "includedeclaration", "@26", "includefiles_option",
  "includefiles", "rwdeclaration", "@27", "rwclauses", "rwclause",
  "semi_or_error", "patternchains", "patternchain",
  "patternchainitem_lineinfo", "@28", "patternchainitem",
  "outmostpatterns", "outmostpattern", "provideds", "@29", "@30",
  "pattern", "@31", "patternsoption", "patterns", "term", "@32", "@33",
  "termsoption", "terms", "withcases", "withcase", "unparsedeclaration",
  "@34", "unparseclauses", "unparseclause", "useviewnames", "unparseitems",
  "unparseitem", "@35", "@36", "@37", "@38", "unpsubterm", "unpattributes",
  "unpattribute", "viewnameoption", "uviewdeclaration", "defuviewnames",
  "rviewdeclaration", "defrviewnames", "storageclassdeclaration",
  "defstorageclasses", "ac_function_definition", "ac_opt_base_init_list",
  "ac_base_init_list", "ac_base_init", "ac_default_arg_init",
  "ac_opt_member_init", "ac_declaration_specifiers",
  "ac_member_declaration_specifiers", "ac_storage_class_specifier",
  "ac_member_storage_class_specifier", "opt_virtual", "ac_type_specifier",
  "ac_type_qualifier", "ac_fn_declarator", "ac_declarator",
  "ac_member_declarator", "ac_pointer_declarator", "ac_direct_declarator",
  "ac_direct_member_declarator", "ac_constant_expression_list",
  "ac_constant_expression_init_list", "ac_direct_fn_declarator",
  "ac_qualifier", "ac_fn_declarator_id", "ac_opt_const", "ac_pointer",
  "ac_type_qualifier_list", "ac_parameter_type_list", "ac_parameter_list",
  "ac_parameter_declaration", "ac_abstract_declarator",
  "ac_direct_abstract_declarator", "ac_constant_expression_option",
  "ac_constant_expression", "@39", "ac_identifier",
  "ac_compound_statement", "@40", "languageoption", "languageoptions",
  "languagedeclaration", "deflanguagenames", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,    58,    59,    44,   123,   125,
      33,   124,    40,    41,    61,    10,    34,    39,    91,    93,
      60,    62,    38,    36,    42,    46
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    66,    67,    68,    69,    71,    70,    72,    72,    73,
      73,    73,    73,    73,    73,    73,    73,    73,    73,    74,
      75,    75,    77,    76,    78,    78,    78,    78,    78,    79,
      79,    79,    80,    80,    80,    80,    80,    82,    83,    81,
      81,    84,    84,    84,    85,    85,    85,    86,    86,    87,
      88,    89,    88,    90,    90,    91,    91,    91,    91,    91,
      91,    91,    91,    91,    91,    91,    92,    92,    93,    93,
      94,    94,    95,    95,    96,    96,    97,    97,    98,    98,
      99,    99,   101,   102,   100,   103,   104,   105,   104,   107,
     108,   106,   110,   111,   109,   112,   112,   112,   114,   115,
     113,   116,   117,   116,   118,   118,   118,   118,   119,   118,
     120,   118,   118,   121,   118,   122,   123,   124,   118,   126,
     127,   125,   128,   129,   130,   128,   131,   131,   133,   132,
     132,   134,   134,   135,   135,   137,   136,   138,   138,   139,
     140,   140,   141,   141,   142,   142,   144,   143,   145,   145,
     145,   146,   146,   146,   146,   146,   146,   147,   147,   147,
     147,   147,   148,   149,   150,   148,   151,   151,   151,   151,
     151,   152,   151,   151,   153,   153,   154,   154,   154,   154,
     154,   154,   155,   155,   155,   155,   155,   155,   156,   155,
     157,   155,   155,   158,   158,   159,   159,   159,   159,   159,
     159,   160,   160,   161,   163,   162,   162,   164,   164,   165,
     165,   165,   165,   165,   166,   166,   167,   167,   169,   170,
     168,   168,   168,   168,   171,   172,   168,   173,   173,   173,
     173,   173,   174,   174,   175,   175,   176,   176,   176,   177,
     177,   178,   178,   178,   178,   178,   178,   178,   178,   179,
     179,   180,   180,   180,   180,   180,   180,   180,   180,   181,
     181,   182,   182,   182,   182,   182,   183,   183,   183,   183,
     183,   183,   184,   184,   185,   185,   186,   187,   187,   188,
     188,   188,   189,   189,   189,   189,   190,   190,   190,   190,
     191,   191,   191,   191,   191,   191,   192,   193,   193,   194,
     195,   195,   195,   196,   196,   196,   196,   197,   197,   197,
     197,   198,   198,   198,   198,   199,   199,   200,   200,   200,
     200,   201,   202,   202,   203,   203,   204,   204,   205,   205,
     206,   206,   207,   207,   208,   208,   208,   208,   209,   209,
     210,   210,   210,   210,   210,   211,   211,   212,   212,   213,
     213,   213,   214,   214,   214,   214,   214,   215,   217,   216,
     218,   218,   219,   220,   219,   221,   221,   222,   222,   222,
     222,   222,   222,   223,   223,   224,   224,   224,   224,   224
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     1,     1,     0,     2,     0,     2,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     5,
       1,     3,     0,     7,     0,     3,     4,     2,     3,     0,
       2,     1,     1,     3,     1,     3,     3,     0,     0,     6,
       3,     0,     2,     4,     0,     4,     2,     0,     2,     4,
       0,     0,     3,     0,     2,     1,     1,     1,     3,     3,
       3,     3,     2,     2,     2,     2,     0,     2,     1,     1,
       1,     1,     0,     2,     1,     1,     0,     2,     1,     1,
       1,     3,     0,     0,     4,     1,     1,     0,     4,     0,
       0,     5,     0,     0,     5,     1,     1,     1,     0,     0,
       5,     0,     0,     3,     1,     1,     1,     1,     0,     4,
       0,     4,     1,     0,     3,     0,     0,     0,    10,     0,
       0,     9,     0,     0,     0,     7,     0,     1,     0,     5,
       3,     0,     1,     1,     2,     0,     5,     1,     2,     5,
       1,     1,     1,     3,     1,     3,     0,     2,     1,     3,
       2,     1,     3,     1,     2,     3,     3,     2,     5,     3,
       2,     2,     0,     0,     0,     6,     1,     4,     1,     1,
       3,     0,     4,     1,     0,     1,     1,     3,     1,     2,
       3,     3,     1,     4,     6,     6,     3,     3,     0,     4,
       0,     4,     1,     0,     1,     1,     3,     1,     2,     3,
       3,     1,     2,     3,     0,     5,     4,     1,     2,     5,
       4,     5,     4,     2,     0,     2,     0,     2,     0,     0,
       7,     3,     2,     4,     0,     0,     7,     1,     1,     2,
       2,     4,     1,     2,     2,     2,     0,     2,     2,     3,
       3,     1,     3,     2,     4,     3,     5,     2,     3,     3,
       3,     1,     3,     2,     4,     3,     5,     2,     3,     3,
       3,     1,     2,     3,     2,     3,     3,     8,     7,     6,
       5,     5,     0,     2,     1,     3,     4,     0,     2,     0,
       2,     3,     1,     2,     2,     3,     1,     2,     2,     3,
       1,     1,     1,     1,     1,     1,     1,     0,     1,     1,
       1,     1,     1,     1,     2,     2,     3,     1,     2,     2,
       3,     1,     2,     2,     3,     2,     3,     1,     3,     4,
       4,     4,     0,     4,     1,     3,     5,     5,     1,     3,
       1,     2,     0,     1,     1,     2,     2,     3,     1,     2,
       0,     1,     1,     2,     3,     1,     3,     3,     3,     1,
       1,     2,     3,     4,     3,     4,     3,     1,     0,     2,
       1,     2,     1,     0,     4,     4,     0,     1,     3,     1,
       2,     3,     3,     3,     3,     1,     2,     3,     2,     3
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       5,     0,     7,     1,     0,   153,     3,     0,   292,   162,
       0,     0,     0,     0,   290,   291,   293,   294,   300,   301,
     302,   295,     0,   297,     0,     0,     0,   162,   299,     8,
      18,     9,    12,    10,     0,   151,    13,    14,    15,    16,
      11,     0,     0,   282,     0,    17,     0,   133,   128,   132,
       0,   161,     0,     0,   251,     0,     0,     0,   241,     0,
       0,   261,     0,     0,   375,     0,     0,   298,     0,   296,
     299,     0,     0,   286,     0,     0,     0,   160,     0,     0,
       0,     0,     0,   157,   154,     0,     0,     0,     0,   334,
     330,     0,   303,     0,   328,     0,   283,     0,   284,   130,
       0,   134,   163,   250,     0,   257,   249,     0,     0,   253,
     240,     0,   247,   239,     0,     0,   243,   260,   264,   259,
       0,   262,   374,   378,   373,     0,   376,   340,     0,     0,
       0,   279,   311,     0,   287,     0,   288,   279,     0,     0,
      27,     0,     0,   178,     4,   169,   171,   168,   166,   173,
     176,     0,     0,   162,   159,    22,   156,     0,     0,     0,
     155,   152,   331,   305,   338,   336,   335,     0,    89,   362,
     266,     0,     0,     0,   304,   285,     0,    53,   252,   258,
       0,   255,     0,   242,   248,     0,   245,     0,   265,   263,
     379,   377,   341,     0,     0,   342,   345,     0,   313,     0,
     358,   358,     0,     0,   312,   289,     0,    20,     0,     0,
      28,     0,    25,    72,     0,     0,   162,   179,     0,     0,
     206,   214,     0,   137,     0,     0,   207,   339,   337,   363,
       0,   329,     0,     0,   306,   129,   164,     0,   254,     0,
     244,   340,   358,     0,     0,   360,   277,   307,   349,   277,
     350,   317,   272,   343,     0,     0,   322,     0,    53,   280,
     270,   314,   271,    19,     0,     0,    26,     0,     0,   170,
     158,   181,   180,   177,    34,     0,     0,    44,     0,    32,
       0,   141,   140,   138,   136,   213,     0,   205,   208,     0,
      97,    90,   102,     0,   142,   144,     0,   146,   201,   332,
     332,    55,     2,     0,    57,     0,     0,     0,    56,    54,
       0,   256,   246,   340,     0,   349,     0,     0,     0,   357,
       0,   309,   361,   358,   347,   340,   358,     0,   308,   351,
     348,   340,   358,     0,     0,   344,   346,   269,   321,   281,
     359,    21,   332,    74,    75,   172,    73,   167,    30,     0,
       0,     0,     0,     0,     0,   215,     0,     0,   364,     0,
       0,     0,   146,   146,   146,     0,   147,   148,   202,   333,
     327,   326,    64,     0,    62,     0,    63,     0,    65,     0,
     165,   349,   318,     0,   315,   356,   352,   354,     0,   278,
       0,     0,   310,     0,     0,     0,   273,   274,   268,   358,
       0,    40,    41,    46,   126,    23,    36,    35,    33,   190,
     188,   182,   192,     0,   212,   366,   210,   366,    91,   107,
     104,   115,   113,    98,   106,   108,   110,   105,   112,   103,
     203,   143,   145,     0,   150,    69,    60,    68,    67,    58,
      78,    79,    59,    77,    61,   316,   320,   319,   355,   353,
     358,     0,     0,   267,    38,     0,    48,   127,     0,    72,
      76,     0,     0,   139,     0,     0,   211,     0,   217,     0,
     209,     0,     0,   101,    72,    76,   149,     0,   324,   275,
     323,     3,    42,     0,    50,    45,     0,     0,   197,   195,
       0,     0,   186,   187,     0,   369,   367,     0,   216,     0,
     218,   228,   227,   222,   236,   116,   146,   114,   102,     0,
       0,   358,   276,     0,    39,    51,     0,   191,   189,   183,
     198,     0,     0,     0,   224,   370,     0,     0,   366,     0,
      72,     0,   230,   232,   229,     0,   221,    53,     0,     0,
     109,   111,   325,    43,    53,    49,   200,   199,   196,     0,
       0,    53,   372,   371,   368,   365,   223,     0,     0,   235,
     234,   233,   238,   237,    85,    86,   117,   119,   100,    52,
     184,   185,   225,   231,    71,    70,   219,    87,     0,     0,
       0,   236,    53,     0,    82,     0,    80,   226,   220,    88,
     146,    53,     0,     0,   146,    83,    81,    92,   120,   118,
      84,     0,   122,    93,   123,   121,     0,     0,    94,   146,
     124,     0,     0,   125
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,   308,    70,   412,     1,     2,     4,    29,    30,   208,
      31,   219,    82,   277,   278,   279,   402,   483,   454,   351,
     404,   456,   516,   544,   564,   309,   373,   438,   576,   267,
     346,   377,   443,   585,   586,   591,   600,   565,   566,   582,
     169,   230,   359,   598,   601,   606,   291,   428,   473,   539,
     292,   360,   429,   474,   475,   472,   471,   537,   578,   507,
     579,   602,   605,   607,   611,   458,    32,   100,    48,    49,
      33,   158,   222,   223,   284,   293,   294,   295,   296,   366,
      34,    35,    83,   177,   310,   150,   213,   151,   152,   489,
     460,   459,   490,   491,   297,   298,    36,   159,   225,   226,
     280,   415,   468,   530,   581,   551,   580,   504,   532,   533,
     536,    37,    59,    38,    55,    39,    62,    40,   334,   396,
     397,   324,   202,   193,    71,    42,    72,    68,    43,    44,
      91,   246,   131,   314,   384,   132,   338,   477,    92,    93,
      94,   370,   133,   166,   316,   195,   196,   317,   250,   318,
     319,   258,   251,   170,   289,   469,   497,    45,    65
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -417
static const yytype_int16 yypact[] =
{
    -417,    41,  -417,  -417,   362,  -417,  -417,   539,  -417,    17,
     253,   336,   412,   522,  -417,  -417,  -417,  -417,  -417,  -417,
    -417,  -417,    47,    58,   568,   568,    47,    17,   491,  -417,
    -417,  -417,  -417,  -417,   463,  -417,  -417,  -417,  -417,  -417,
    -417,   167,   500,  -417,    47,  -417,   140,  -417,  -417,   158,
     136,  -417,   188,    47,  -417,   441,   192,    47,  -417,   468,
     209,  -417,   371,   269,  -417,   597,   280,  -417,    47,  -417,
    -417,    23,   500,  -417,    47,    23,   341,  -417,   415,   240,
      42,    36,   439,  -417,    36,   162,    32,   485,   168,   515,
    -417,    80,  -417,   103,  -417,   120,  -417,    47,  -417,  -417,
     482,  -417,  -417,  -417,   458,  -417,  -417,   380,    47,  -417,
    -417,   471,  -417,  -417,   407,    47,  -417,  -417,  -417,  -417,
     566,  -417,  -417,  -417,  -417,   569,  -417,   622,   480,    47,
     499,   554,  -417,    43,  -417,    47,  -417,   554,    47,    47,
    -417,   608,   495,  -417,  -417,  -417,  -417,  -417,   579,  -417,
    -417,   529,   216,   431,  -417,  -417,  -417,   506,   523,   533,
    -417,  -417,  -417,  -417,  -417,  -417,   515,   567,  -417,  -417,
    -417,   168,   525,   168,  -417,  -417,   595,  -417,  -417,  -417,
      47,  -417,   573,  -417,  -417,    47,  -417,   583,  -417,  -417,
    -417,  -417,  -417,   128,   588,   289,  -417,   593,  -417,    47,
    -417,  -417,   603,    47,  -417,  -417,   604,  -417,   107,   626,
    -417,   570,  -417,  -417,    42,   137,    17,   137,    87,   586,
    -417,  -417,    98,  -417,   330,   366,  -417,  -417,  -417,  -417,
     261,  -417,   607,   627,  -417,  -417,   572,   628,  -417,   629,
    -417,   404,  -417,    70,    47,  -417,   625,   199,    57,   625,
     249,  -417,   638,  -417,   632,    80,  -417,   631,  -417,  -417,
    -417,  -417,  -417,  -417,    47,   633,  -417,    62,   634,  -417,
    -417,  -417,  -417,  -417,  -417,    47,   636,   637,   363,  -417,
     213,  -417,  -417,  -417,  -417,   645,   230,  -417,  -417,    80,
    -417,  -417,   640,   592,   630,  -417,   145,   642,  -417,   660,
     660,  -417,  -417,   444,  -417,   264,   229,   288,  -417,  -417,
     641,  -417,  -417,   404,   643,   142,   646,   647,   648,  -417,
     649,   199,  -417,  -417,  -417,   622,  -417,    70,   199,   249,
    -417,   622,  -417,    47,    80,  -417,  -417,  -417,   650,  -417,
     572,  -417,   660,  -417,  -417,  -417,  -417,  -417,  -417,   224,
     427,   651,    47,   639,   193,  -417,   282,   422,  -417,   652,
     559,   654,  -417,  -417,  -417,    47,  -417,  -417,  -417,  -417,
    -417,  -417,  -417,   565,  -417,   266,  -417,   204,  -417,   538,
    -417,   319,  -417,    70,   199,  -417,  -417,  -417,   184,  -417,
     653,   655,   199,   656,   657,   658,   664,  -417,  -417,  -417,
      80,  -417,  -417,  -417,   124,  -417,  -417,  -417,  -417,  -417,
    -417,   663,  -417,   234,  -417,   453,  -417,   504,  -417,  -417,
    -417,  -417,  -417,  -417,  -417,  -417,  -417,  -417,  -417,  -417,
    -417,   630,  -417,   402,  -417,  -417,  -417,  -417,  -417,  -417,
    -417,  -417,  -417,  -417,  -417,   199,  -417,  -417,  -417,  -417,
    -417,    47,   659,  -417,   692,    47,  -417,  -417,   668,  -417,
    -417,   301,    47,  -417,    47,    47,  -417,   644,  -417,    45,
    -417,   667,   671,  -417,  -417,  -417,  -417,   433,  -417,  -417,
    -417,   675,  -417,   672,   674,  -417,   304,   344,  -417,    14,
     676,   241,   678,   679,    47,  -417,  -417,    77,  -417,    47,
    -417,   684,   684,  -417,   677,  -417,  -417,  -417,   683,   411,
     372,  -417,  -417,    47,  -417,  -417,   666,  -417,  -417,  -417,
     193,   365,   301,   301,  -417,    47,   669,   681,   206,   680,
    -417,   670,   684,  -417,   684,   673,  -417,  -417,   305,   685,
    -417,  -417,  -417,  -417,  -417,  -417,    14,  -417,    14,   682,
     686,  -417,  -417,  -417,  -417,  -417,  -417,    47,   272,  -417,
    -417,  -417,  -417,  -417,   572,  -417,   689,  -417,  -417,   572,
    -417,  -417,   572,  -417,  -417,  -417,  -417,  -417,   687,    47,
     691,   677,  -417,   690,  -417,   451,  -417,  -417,  -417,  -417,
    -417,  -417,    47,   693,   694,   572,  -417,  -417,  -417,  -417,
    -417,   261,   702,  -417,  -417,  -417,   695,   696,  -417,  -417,
     630,   697,   693,  -417
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -417,  -333,    -4,   -40,  -417,  -417,  -417,  -417,  -417,  -417,
    -417,  -417,  -417,  -417,  -417,   155,  -417,  -417,  -417,  -417,
    -417,  -417,  -417,  -417,  -175,   231,   396,  -417,  -417,  -295,
    -417,  -416,  -417,  -417,   112,  -417,  -417,   123,  -417,  -417,
    -417,  -417,  -417,   115,  -417,  -417,   141,  -330,  -417,  -417,
     251,  -417,  -417,  -417,  -417,  -417,  -417,  -417,  -417,  -417,
    -417,  -417,  -417,  -417,  -417,  -417,  -417,  -417,  -417,  -417,
    -417,  -417,  -417,   524,  -417,   381,  -357,   384,  -417,  -417,
    -417,   -70,     3,  -417,  -417,   138,  -417,   535,  -417,  -337,
    -417,  -417,   -50,  -417,   161,  -296,  -417,  -417,  -417,   527,
     530,  -342,  -417,  -417,  -417,  -417,  -417,  -417,   254,   143,
     172,  -417,  -417,  -417,  -417,  -417,  -417,  -417,  -417,  -417,
     306,   509,   618,   755,   735,  -417,  -417,  -417,    88,     0,
    -417,  -417,   688,  -417,  -180,   -95,  -417,  -417,   -59,  -417,
     590,   -55,   -20,  -417,  -107,  -417,   508,   571,  -229,   260,
    -197,  -417,  -417,  -232,  -417,  -417,  -417,  -417,  -417
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -341
static const yytype_int16 yytable[] =
{
      28,   368,   236,   257,   259,   431,    54,    58,    61,    64,
     375,   154,    51,   247,   156,   417,   161,   413,    66,   329,
     194,    95,    76,   337,    74,    74,     6,   427,   462,   163,
      77,   430,    50,   160,   198,     6,   174,    90,   204,     6,
     149,     3,    97,   143,   487,     6,     6,   144,     6,   104,
       6,   109,     9,   111,   302,   116,     9,   358,   121,   510,
       6,   126,   145,   321,   128,   233,   498,   130,   328,   165,
     343,   130,   135,     6,   457,   142,   148,   153,   525,   464,
     153,   167,   153,   340,    90,   129,   329,    89,   272,   164,
       6,    90,   144,   423,    67,  -174,    27,   499,   146,   281,
      27,   500,   398,   181,   182,   203,   147,   145,   261,   241,
     186,   187,    73,    73,   234,   242,   189,   344,   345,   327,
     244,   191,   320,     6,   526,   130,   389,     6,   168,   130,
      96,     6,    98,   244,   207,   209,   501,   211,   527,   503,
       6,   171,   144,   146,   282,     6,   228,   392,     6,   538,
      99,   147,   329,   263,   264,   172,   528,   145,   221,    87,
     134,   101,   136,   157,   486,     9,   227,    90,   453,    90,
       6,     6,   423,   248,   149,   149,   237,   149,   149,   509,
     241,   239,   173,   546,   548,   175,   242,     6,   102,   245,
     243,   244,    89,   146,   241,   256,     6,   364,   144,   130,
     242,   147,   452,   445,   383,   244,    87,    87,   365,    27,
     148,   148,   440,   148,   148,   276,     6,   217,   390,   270,
    -204,   315,  -135,   205,   393,   401,   367,   -37,   556,    88,
     376,    89,   465,     6,   103,   558,   320,   -76,   110,   245,
     322,   140,   520,     6,   245,   371,   383,   244,   462,   409,
     410,   325,   610,   478,    52,   117,     6,   326,   354,   441,
     341,   442,   290,   218,  -146,   374,   467,  -101,  -101,  -175,
    -101,   348,   -72,   574,   343,   357,   355,   -37,  -101,  -101,
     343,  -146,   355,   414,   -76,  -216,   -76,   400,   521,   378,
     141,  -216,   153,   381,  -194,   463,   -66,   -66,   368,   464,
     388,   331,   488,  -216,     6,    53,   144,   332,  -216,  -101,
    -101,   245,   343,  -146,   542,   122,  -101,  -101,  -101,   -72,
     -72,   344,   439,   245,  -146,  -146,   253,   344,   575,   395,
    -216,   285,   127,  -214,  -216,   -66,   254,    56,  -216,     6,
     -66,  -216,  -216,   -66,   -66,   -66,   -66,   -66,   276,   276,
     411,   567,   440,   269,  -193,   271,   273,   409,   410,   344,
     517,   434,    -6,     5,   352,     6,   547,   363,     6,   569,
     144,   313,   118,     7,     6,  -214,   572,   242,     8,   245,
     440,   179,     9,     6,   245,    10,   138,    11,    57,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,   441,
     455,   518,    22,    23,    24,    25,    26,     6,   184,   -31,
       6,   -31,   287,    60,   353,     6,   595,   119,   120,   343,
       8,   409,   410,   416,   224,  -216,    27,   441,   403,   541,
     -47,  -216,   180,    14,    15,    16,    17,    18,    19,    20,
      21,   192,   105,  -216,     6,   372,    50,   395,  -216,   362,
     482,   484,   -66,   -66,   139,   476,   313,   411,   492,   185,
     493,   494,   242,   496,    84,   502,   344,   540,    89,   112,
    -216,     6,   549,   550,  -216,   -47,   -47,    85,  -216,   465,
     511,  -216,  -216,    80,   155,    81,   512,   106,   107,   162,
     524,   -66,  -162,   108,   176,   529,   -66,   -66,   592,   -66,
     -66,   -66,   -66,     6,   593,  -162,    50,   406,   408,   543,
      86,   178,   466,   467,   113,   114,   411,   411,   411,   411,
     115,   552,   554,    63,   183,     6,   232,   560,     6,    78,
     465,   563,   197,    18,    19,    20,   -24,   199,  -162,    79,
      46,     8,    47,    80,   212,    81,   301,   302,    18,    19,
      20,  -131,   220,   573,    14,    15,    16,    17,    18,    19,
      20,    21,   192,   470,   467,   419,   420,   188,   302,     6,
     190,     6,     6,   301,   302,   584,   421,   422,  -340,    89,
     301,   302,   216,   221,    69,   435,   391,   274,   584,     6,
     303,   224,   394,   304,   305,   306,   307,   444,   123,   275,
       6,    18,    19,    20,   437,   235,   200,   423,   201,   210,
     437,     6,   435,   229,   424,   425,   426,   303,   436,   266,
     304,   305,   306,   307,   303,     6,   238,   304,   305,   306,
     307,   214,   -29,   215,   -29,     6,   240,   361,     8,   362,
     407,   252,     6,   124,   125,   495,   255,     6,     8,   260,
     262,    14,    15,    16,    17,    18,    19,    20,    21,   192,
     299,    14,    15,    16,    17,    18,    19,    20,    21,   335,
     553,   559,     6,     6,   562,   561,     6,   561,   265,   323,
     300,   311,   312,   333,   339,   350,   342,   347,   349,   -95,
     356,   -96,   363,   369,   380,   481,   382,   405,   531,   385,
     386,   418,   423,   379,   596,   589,   446,   387,   399,   448,
     450,   451,   545,    89,   447,   461,   449,   485,   480,   505,
     513,   604,   535,   506,   508,   514,   555,   613,   515,   519,
     522,   523,   -99,   557,   568,   570,   577,   587,   590,   571,
     583,   597,   603,   599,   608,   433,   283,   432,   609,   268,
     612,   594,   288,   588,   286,   206,   534,   479,   330,    41,
      75,   231,   336,   137,   249
};

static const yytype_uint16 yycheck[] =
{
       4,   297,   177,   200,   201,   362,    10,    11,    12,    13,
     305,    81,     9,   193,    84,   357,    86,   354,    22,   248,
     127,    41,    26,   255,    24,    25,     3,   360,    14,    88,
      27,   361,    15,     1,   129,     3,    95,    41,   133,     3,
      80,     0,    42,     1,   460,     3,     3,     5,     3,    53,
       3,    55,    20,    57,     9,    59,    20,   289,    62,   475,
       3,    65,    20,   243,    68,   172,    21,    71,   248,    89,
       8,    75,    72,     3,   404,    79,    80,    81,     1,    65,
      84,     1,    86,   258,    88,    62,   315,    64,     1,    89,
       3,    95,     5,    48,    36,    53,    64,    52,    56,     1,
      64,    56,   334,   107,   108,    62,    64,    20,   203,    52,
     114,   115,    24,    25,   173,    58,   120,    55,    56,    62,
      63,   125,    52,     3,    47,   129,   323,     3,    48,   133,
      42,     3,    44,    63,   138,   139,   469,   141,    61,   469,
       3,    38,     5,    56,    46,     3,   166,   327,     3,   506,
      10,    64,   381,    46,    47,    52,   498,    20,    60,    39,
      72,     3,    74,     1,   459,    20,   166,   171,   400,   173,
       3,     3,    48,   193,   214,   215,   180,   217,   218,   474,
      52,   185,    62,   520,   521,    97,    58,     3,    52,   193,
      62,    63,    64,    56,    52,   199,     3,    52,     5,   203,
      58,    64,   399,   383,    62,    63,    39,    39,    63,    64,
     214,   215,     8,   217,   218,   219,     3,     1,   325,   216,
      58,   241,    60,   135,   331,     1,   296,     3,    22,    62,
       1,    64,    26,     3,    46,   530,    52,     8,    46,   243,
     244,     1,     1,     3,   248,   300,    62,    63,    14,    56,
      57,    52,   609,   450,     1,    46,     3,    58,    45,    55,
     264,    57,     1,    47,     3,     1,    60,     6,     7,    53,
       9,   275,     8,     1,     8,    45,   280,    53,    17,    18,
       8,    20,   286,     1,    55,     3,    57,   342,    47,     1,
      50,     9,   296,   313,    53,    61,     8,     9,   594,    65,
     320,    52,     1,    21,     3,    52,     5,    58,    26,    48,
      49,   315,     8,    52,   511,    46,    55,    56,    57,    55,
      56,    55,    56,   327,    63,    64,    37,    55,    56,   333,
      48,     1,    52,     3,    52,    47,    47,     1,    56,     3,
      52,    59,    60,    55,    56,    57,    58,    59,   352,   353,
     354,    46,     8,   215,    53,   217,   218,    56,    57,    55,
      56,   365,     0,     1,     1,     3,     1,    62,     3,   544,
       5,    52,     1,    11,     3,    45,   551,    58,    16,   383,
       8,     1,    20,     3,   388,    23,    45,    25,    52,    27,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    55,
     404,    57,    40,    41,    42,    43,    44,     3,     1,    46,
       3,    48,    46,     1,    51,     3,   591,    46,    47,     8,
      16,    56,    57,     1,    58,     3,    64,    55,     1,    57,
       3,     9,    52,    29,    30,    31,    32,    33,    34,    35,
      36,    37,     1,    21,     3,     1,    15,   451,    26,    47,
     454,   455,     8,     9,    39,    53,    52,   461,   462,    52,
     464,   465,    58,   467,     1,   469,    55,    56,    64,     1,
      48,     3,   522,   523,    52,    48,    49,    14,    56,    26,
      47,    59,    60,    52,    45,    54,    53,    46,    47,     4,
     494,    47,     1,    52,    12,   499,    52,    53,    47,    55,
      56,    57,    58,     3,    53,    14,    15,   352,   353,   513,
      47,    53,    59,    60,    46,    47,   520,   521,   522,   523,
      52,   525,   526,     1,    53,     3,     1,   531,     3,    38,
      26,   535,    52,    33,    34,    35,    45,    38,    47,    48,
       1,    16,     3,    52,    49,    54,     8,     9,    33,    34,
      35,    12,    46,   557,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    59,    60,     6,     7,     1,     9,     3,
       1,     3,     3,     8,     9,   579,    17,    18,    53,    64,
       8,     9,    53,    60,    16,    47,   326,     1,   592,     3,
      52,    58,   332,    55,    56,    57,    58,    59,     1,    13,
       3,    33,    34,    35,   373,    10,    52,    48,    54,     1,
     379,     3,    47,    46,    55,    56,    57,    52,    53,    49,
      55,    56,    57,    58,    52,     3,    53,    55,    56,    57,
      58,    52,    46,    54,    48,     3,    53,    45,    16,    47,
       1,    53,     3,    46,    47,     1,    53,     3,    16,    46,
      46,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      53,    29,    30,    31,    32,    33,    34,    35,    36,    37,
       1,     1,     3,     3,     1,   532,     3,   534,    52,    54,
      53,    53,    53,    45,    53,    48,    53,    53,    52,    49,
      45,    49,    62,    33,    53,     3,    53,    46,    14,    53,
      53,    49,    48,   307,   592,   582,    53,    59,    58,    53,
      52,    47,    46,    64,    59,    52,    59,    49,    59,    52,
      45,    19,    45,    52,   473,    53,    45,   612,    54,    53,
      52,    52,    49,    53,    49,    53,    47,    46,    48,    53,
      53,    48,   601,    49,    49,   364,   222,   363,    52,   214,
      53,   590,   225,   581,   224,   137,   502,   451,   249,     4,
      25,   171,   254,    75,   193
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    70,    71,     0,    72,     1,     3,    11,    16,    20,
      23,    25,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    40,    41,    42,    43,    44,    64,    68,    73,
      74,    76,   132,   136,   146,   147,   162,   177,   179,   181,
     183,   189,   191,   194,   195,   223,     1,     3,   134,   135,
      15,   148,     1,    52,    68,   180,     1,    52,    68,   178,
       1,    68,   182,     1,    68,   224,    68,    36,   193,    16,
      68,   190,   192,   194,   195,   190,    68,   148,    38,    48,
      52,    54,    78,   148,     1,    14,    47,    39,    62,    64,
      68,   196,   204,   205,   206,   208,   194,   195,   194,    10,
     133,     3,    52,    46,    68,     1,    46,    47,    52,    68,
      46,    68,     1,    46,    47,    52,    68,    46,     1,    46,
      47,    68,    46,     1,    46,    47,    68,    52,    68,    62,
      68,   198,   201,   208,   194,   195,   194,   198,    45,    39,
       1,    50,    68,     1,     5,    20,    56,    64,    68,    69,
     151,   153,   154,    68,   147,    45,   147,     1,   137,   163,
       1,   147,     4,   204,   195,   208,   209,     1,    48,   106,
     219,    38,    52,    62,   204,   194,    12,   149,    53,     1,
      52,    68,    68,    53,     1,    52,    68,    68,     1,    68,
       1,    68,    37,   189,   210,   211,   212,    52,   201,    38,
      52,    54,   188,    62,   201,   194,   188,    68,    75,    68,
       1,    68,    49,   152,    52,    54,    53,     1,    47,    77,
      46,    60,   138,   139,    58,   164,   165,   195,   208,    46,
     107,   206,     1,   210,   204,    10,    90,    68,    53,    68,
      53,    52,    58,    62,    63,    68,   197,   200,   208,   213,
     214,   218,    53,    37,    47,    53,    68,   216,   217,   216,
      46,   201,    46,    46,    47,    52,    49,    95,   153,   151,
     148,   151,     1,   151,     1,    13,    68,    79,    80,    81,
     166,     1,    46,   139,   140,     1,   166,    46,   165,   220,
       1,   112,   116,   141,   142,   143,   144,   160,   161,    53,
      53,     8,     9,    52,    55,    56,    57,    58,    67,    91,
     150,    53,    53,    52,   199,   208,   210,   213,   215,   216,
      52,   200,    68,    54,   187,    52,    58,    62,   200,   214,
     187,    52,    58,    45,   184,    37,   212,   219,   202,    53,
      90,    68,    53,     8,    55,    56,    96,    53,    68,    52,
      48,    85,     1,    51,    45,    68,    45,    45,   219,   108,
     117,    45,    47,    62,    52,    63,   145,   147,   161,    33,
     207,   207,     1,    92,     1,    95,     1,    97,     1,    92,
      53,   208,    53,    62,   200,    53,    53,    59,   208,   216,
     210,   215,   200,   210,   215,    68,   185,   186,   219,    58,
     207,     1,    82,     1,    86,    46,    81,     1,    81,    56,
      57,    68,    69,   155,     1,   167,     1,   167,    49,     6,
       7,    17,    18,    48,    55,    56,    57,    67,   113,   118,
     113,   142,   143,   141,    68,    47,    53,    91,    93,    56,
       8,    55,    57,    98,    59,   200,    53,    59,    53,    59,
      52,    47,   216,   219,    84,    68,    87,   113,   131,   157,
     156,    52,    14,    61,    65,    26,    59,    60,   168,   221,
      59,   122,   121,   114,   119,   120,    53,   203,   216,   186,
      59,     3,    68,    83,    68,    49,    95,    97,     1,   155,
     158,   159,    68,    68,    68,     1,    68,   222,    21,    52,
      56,    67,    68,   113,   173,    52,    52,   125,   116,    95,
      97,    47,    53,    45,    53,    54,    88,    56,    57,    53,
       1,    47,    52,    52,    68,     1,    47,    61,   167,    68,
     169,    14,   174,   175,   174,    45,   176,   123,   142,   115,
      56,    57,   216,    68,    89,    46,   155,     1,   155,   158,
     158,   171,    68,     1,    68,    45,    22,    53,    95,     1,
      68,   175,     1,    68,    90,   103,   104,    46,    49,    90,
      53,    53,    90,    68,     1,    56,    94,    47,   124,   126,
     172,   170,   105,    53,    68,    99,   100,    46,   176,   103,
      48,   101,    47,    53,   160,    90,   100,    48,   109,    49,
     102,   110,   127,   112,    19,   128,   111,   129,    49,    52,
     142,   130,    53,   109
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */

#define YYFAIL		goto yyerrlab

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
     fprintf (File, "%d.%d-%d.%d",			\
	      (Loc).first_line, (Loc).first_column,	\
	      (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *bottom, yytype_int16 *top)
#else
static void
yy_stack_print (bottom, top)
    yytype_int16 *bottom;
    yytype_int16 *top;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; bottom <= top; ++bottom)
    YYFPRINTF (stderr, " %d", *bottom);
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yyrule)
    YYSTYPE *yyvsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      fprintf (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       );
      fprintf (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into YYRESULT an error message about the unexpected token
   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
   including the terminating null byte.  If YYRESULT is null, do not
   copy anything; just return the number of bytes that would be
   copied.  As a special case, return 0 if an ordinary "syntax error"
   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
   size calculation.  */
static YYSIZE_T
yysyntax_error (char *yyresult, int yystate, int yychar)
{
  int yyn = yypact[yystate];

  if (! (YYPACT_NINF < yyn && yyn <= YYLAST))
    return 0;
  else
    {
      int yytype = YYTRANSLATE (yychar);
      YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
      YYSIZE_T yysize = yysize0;
      YYSIZE_T yysize1;
      int yysize_overflow = 0;
      enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
      char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
      int yyx;

# if 0
      /* This is so xgettext sees the translatable formats that are
	 constructed on the fly.  */
      YY_("syntax error, unexpected %s");
      YY_("syntax error, unexpected %s, expecting %s");
      YY_("syntax error, unexpected %s, expecting %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
# endif
      char *yyfmt;
      char const *yyf;
      static char const yyunexpected[] = "syntax error, unexpected %s";
      static char const yyexpecting[] = ", expecting %s";
      static char const yyor[] = " or %s";
      char yyformat[sizeof yyunexpected
		    + sizeof yyexpecting - 1
		    + ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
		       * (sizeof yyor - 1))];
      char const *yyprefix = yyexpecting;

      /* Start YYX at -YYN if negative to avoid negative indexes in
	 YYCHECK.  */
      int yyxbegin = yyn < 0 ? -yyn : 0;

      /* Stay within bounds of both yycheck and yytname.  */
      int yychecklim = YYLAST - yyn + 1;
      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
      int yycount = 1;

      yyarg[0] = yytname[yytype];
      yyfmt = yystpcpy (yyformat, yyunexpected);

      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	  {
	    if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
	      {
		yycount = 1;
		yysize = yysize0;
		yyformat[sizeof yyunexpected - 1] = '\0';
		break;
	      }
	    yyarg[yycount++] = yytname[yyx];
	    yysize1 = yysize + yytnamerr (0, yytname[yyx]);
	    yysize_overflow |= (yysize1 < yysize);
	    yysize = yysize1;
	    yyfmt = yystpcpy (yyfmt, yyprefix);
	    yyprefix = yyor;
	  }

      yyf = YY_(yyformat);
      yysize1 = yysize + yystrlen (yyf);
      yysize_overflow |= (yysize1 < yysize);
      yysize = yysize1;

      if (yysize_overflow)
	return YYSIZE_MAXIMUM;

      if (yyresult)
	{
	  /* Avoid sprintf, as that infringes on the user's name space.
	     Don't have undefined behavior even if the translation
	     produced a string with the wrong number of "%s"s.  */
	  char *yyp = yyresult;
	  int yyi = 0;
	  while ((*yyp = *yyf) != '\0')
	    {
	      if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		{
		  yyp += yytnamerr (yyp, yyarg[yyi++]);
		  yyf += 2;
		}
	      else
		{
		  yyp++;
		  yyf++;
		}
	    }
	}
      return yysize;
    }
}
#endif /* YYERROR_VERBOSE */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  YYUSE (yyvaluep);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}


/* Prevent warnings from -Wmissing-prototypes.  */

#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */



/* The look-ahead symbol.  */
int yychar;

/* The semantic value of the look-ahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;



/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{
  
  int yystate;
  int yyn;
  int yyresult;
  /* Number of tokens to shift before error messages enabled.  */
  int yyerrstatus;
  /* Look-ahead token as an internal (translated) token number.  */
  int yytoken = 0;
#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

  /* Three stacks and their tools:
     `yyss': related to states,
     `yyvs': related to semantic values,
     `yyls': related to locations.

     Refer to the stacks thru separate pointers, to allow yyoverflow
     to reallocate them elsewhere.  */

  /* The state stack.  */
  yytype_int16 yyssa[YYINITDEPTH];
  yytype_int16 *yyss = yyssa;
  yytype_int16 *yyssp;

  /* The semantic value stack.  */
  YYSTYPE yyvsa[YYINITDEPTH];
  YYSTYPE *yyvs = yyvsa;
  YYSTYPE *yyvsp;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  YYSIZE_T yystacksize = YYINITDEPTH;

  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;


  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY;		/* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */

  yyssp = yyss;
  yyvsp = yyvs;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;


	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),

		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss);
	YYSTACK_RELOCATE (yyvs);

#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;


      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     look-ahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to look-ahead token.  */
  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a look-ahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid look-ahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the look-ahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
    { (yyval.yt_INT) = Int( (yyvsp[(1) - (1)].yt_integer) ); pf_setfileline( (yyval.yt_INT) ); ;}
    break;

  case 3:
    { (yyval.yt_ID) = Id( Str( (yyvsp[(1) - (1)].yt_casestring) )); pf_setfileline( (yyval.yt_ID) ); ;}
    break;

  case 4:
    { (yyval.yt_INT) = Int( (yyvsp[(1) - (1)].yt_integer) ); pf_setfileline( (yyval.yt_INT) ); ;}
    break;

  case 5:
    { /* initialize variables and scanner state */
	  pl_phylum = 0;
	  pl_withvariables = Nilwithexpressions();
	  do_NORMAL();
	;}
    break;

  case 9:
    { Thephylumdeclarations = mergephylumdeclarations( (yyvsp[(1) - (1)].yt_phylumdeclaration), Thephylumdeclarations ); ;}
    break;

  case 10:
    { Therwdeclarations = Consrwdeclarations( (yyvsp[(1) - (1)].yt_rwdeclaration), Therwdeclarations ); ;}
    break;

  case 11:
    { Thefndeclarations = Consfndeclarations( (yyvsp[(1) - (1)].yt_fndeclaration), Thefndeclarations ); ;}
    break;

  case 12:
    { ;}
    break;

  case 13:
    { Theunparsedeclarations = Consunparsedeclarations( (yyvsp[(1) - (1)].yt_unparsedeclaration), Theunparsedeclarations ); ;}
    break;

  case 14:
    { ;}
    break;

  case 15:
    { ;}
    break;

  case 16:
    { ;}
    break;

  case 17:
    { Thelanguages = merge_languagenames( (yyvsp[(1) - (1)].yt_languagenames), Thelanguages ); ;}
    break;

  case 18:
    { Thebaseclasses = Consbaseclass_declarations( (yyvsp[(1) - (1)].yt_baseclass_decl), Thebaseclasses ); ;}
    break;

  case 19:
    { (yyval.yt_baseclass_decl)=BaseClassDecl( (yyvsp[(2) - (5)].yt_ID), (yyvsp[(4) - (5)].yt_baseclass_list) ); ;}
    break;

  case 20:
    { (yyval.yt_baseclass_list)=Consbaseclass_list((yyvsp[(1) - (1)].yt_ID),Nilbaseclass_list()); ;}
    break;

  case 21:
    { (yyval.yt_baseclass_list)=Consbaseclass_list((yyvsp[(3) - (3)].yt_ID),(yyvsp[(1) - (3)].yt_baseclass_list)); ;}
    break;

  case 22:
    { pl_phylum = (yyvsp[(1) - (3)].yt_ID); ;}
    break;

  case 23:
    { (yyval.yt_phylumdeclaration) = PhylumDeclaration( (yyvsp[(1) - (7)].yt_ID), (yyvsp[(2) - (7)].yt_storageoption), (yyvsp[(5) - (7)].yt_productionblock), (yyvsp[(6) - (7)].yt_Ccode_option) ); v_extendoccur( pl_phylum, ITUserPhylum( (yyval.yt_phylumdeclaration) ) ); ;}
    break;

  case 24:
    { (yyval.yt_storageoption) = NoStorageOption(); ;}
    break;

  case 25:
    { (yyval.yt_storageoption) = PositiveStorageOption( (yyvsp[(2) - (3)].yt_ID) ); v_extendoccur( (yyvsp[(2) - (3)].yt_ID), ITStorageClass() ); ;}
    break;

  case 26:
    { (yyval.yt_storageoption) = NegativeStorageOption( (yyvsp[(3) - (4)].yt_ID) ); v_extendoccur( (yyvsp[(3) - (4)].yt_ID), ITStorageClass() ); ;}
    break;

  case 27:
    { (yyval.yt_storageoption) = NoStorageOption(); ;}
    break;

  case 28:
    { (yyval.yt_storageoption) = NoStorageOption(); ;}
    break;

  case 29:
    { (yyval.yt_productionblock) = Emptyproductionblock(); ;}
    break;

  case 30:
    { (yyval.yt_productionblock) = ListAlternatives( makeListAlternatives( pl_phylum, (yyvsp[(2) - (2)].yt_ID) ), (yyvsp[(2) - (2)].yt_ID) );
	  Theargsnumbers = insert_in_argsnumbers(0, Theargsnumbers);
	  Theargsnumbers = insert_in_argsnumbers(2, Theargsnumbers);
	;}
    break;

  case 31:
    { (yyval.yt_productionblock) = NonlistAlternatives( (yyvsp[(1) - (1)].yt_alternatives) ); ;}
    break;

  case 32:
    { (yyval.yt_alternatives) = Consalternatives( (yyvsp[(1) - (1)].yt_alternative), Nilalternatives() ); ;}
    break;

  case 33:
    { yyerrok; (yyval.yt_alternatives) = Consalternatives( (yyvsp[(3) - (3)].yt_alternative), (yyvsp[(1) - (3)].yt_alternatives) ); ;}
    break;

  case 34:
    { (yyval.yt_alternatives) = Nilalternatives(); ;}
    break;

  case 35:
    { (yyval.yt_alternatives) = (yyvsp[(1) - (3)].yt_alternatives); ;}
    break;

  case 36:
    { yyerrok; (yyval.yt_alternatives)=Consalternatives( (yyvsp[(3) - (3)].yt_alternative), (yyvsp[(1) - (3)].yt_alternatives) ); ;}
    break;

  case 37:
    { pg_no_of_arguments = 0; ;}
    break;

  case 38:
    { Theargsnumbers = insert_in_argsnumbers(pg_no_of_arguments, Theargsnumbers); ;}
    break;

  case 39:
    { (yyval.yt_alternative) = Alternative( (yyvsp[(1) - (6)].yt_ID), (yyvsp[(4) - (6)].yt_arguments) );
	  v_extendoccur( (yyvsp[(1) - (6)].yt_ID), ITUserOperator( (yyval.yt_alternative), pl_phylum ) ); ;}
    break;

  case 40:
    { (yyval.yt_alternative) = Alternative( (yyvsp[(1) - (3)].yt_ID), Nilarguments()); ;}
    break;

  case 41:
    { (yyval.yt_arguments) = Nilarguments(); ;}
    break;

  case 42:
    { (yyval.yt_arguments) = Consarguments( (yyvsp[(2) - (2)].yt_ID), (yyvsp[(1) - (2)].yt_arguments) ); pg_no_of_arguments++; ;}
    break;

  case 43:
    { (yyvsp[(4) - (4)].yt_ID)->named_subphylum = (yyvsp[(2) - (4)].yt_casestring);
	  (yyval.yt_arguments) = Consarguments( (yyvsp[(4) - (4)].yt_ID), (yyvsp[(1) - (4)].yt_arguments) ); pg_no_of_arguments++; ;}
    break;

  case 44:
    { (yyval.yt_Ccode_option) = CcodeOption( Nilattributes(), NilCtexts() ); ;}
    break;

  case 45:
    { (yyval.yt_Ccode_option) = CcodeOption( (yyvsp[(2) - (4)].yt_attributes), (yyvsp[(3) - (4)].yt_Ctexts) ); ;}
    break;

  case 46:
    { (yyval.yt_Ccode_option) = CcodeOption( Nilattributes(), NilCtexts() ); ;}
    break;

  case 47:
    { (yyval.yt_attributes) = Nilattributes(); ;}
    break;

  case 48:
    { (yyval.yt_attributes) = Consattributes( (yyvsp[(2) - (2)].yt_attribute), (yyvsp[(1) - (2)].yt_attributes) ); ;}
    break;

  case 49:
    { (yyval.yt_attribute) = Attribute( (yyvsp[(1) - (4)].yt_ID), (yyvsp[(2) - (4)].yt_ID), (yyvsp[(3) - (4)].yt_attribute_initialisation_option) ); ;}
    break;

  case 50:
    { (yyval.yt_attribute_initialisation_option) = Noattribute_initialisation(); ;}
    break;

  case 51:
    { do_CEXPR(); ;}
    break;

  case 52:
    { do_NORMAL();
	  (yyval.yt_attribute_initialisation_option) = Yesattribute_initialisation( (yyvsp[(3) - (3)].yt_Cexpression) ); ;}
    break;

  case 53:
    { (yyval.yt_Cexpression) = NilCexpression(); pf_setfileline( (yyval.yt_Cexpression) ); ;}
    break;

  case 54:
    { (yyval.yt_Cexpression) = ConsCexpression( (yyvsp[(2) - (2)].yt_Cexpression_elem), (yyvsp[(1) - (2)].yt_Cexpression) ); (yyval.yt_Cexpression)->file = (yyvsp[(1) - (2)].yt_Cexpression)->file; (yyval.yt_Cexpression)->line = (yyvsp[(1) - (2)].yt_Cexpression)->line; ;}
    break;

  case 55:
    { (yyval.yt_Cexpression_elem) = CExpressionPart( (yyvsp[(1) - (1)].yt_casestring) ); ;}
    break;

  case 56:
    { (yyval.yt_Cexpression_elem) = CExpressionDollarvar( (yyvsp[(1) - (1)].yt_INT) ); ;}
    break;

  case 57:
    { (yyval.yt_Cexpression_elem) = CExpressionNl(); ;}
    break;

  case 58:
    { (yyval.yt_Cexpression_elem) = CExpressionDQ( (yyvsp[(2) - (3)].yt_CexpressionDQ) ); ;}
    break;

  case 59:
    { (yyval.yt_Cexpression_elem) = CExpressionSQ( (yyvsp[(2) - (3)].yt_CexpressionSQ) ); ;}
    break;

  case 60:
    { (yyval.yt_Cexpression_elem) = CExpressionPack( (yyvsp[(2) - (3)].yt_Cexpression) ); ;}
    break;

  case 61:
    { (yyval.yt_Cexpression_elem) = CExpressionArray( (yyvsp[(2) - (3)].yt_Cexpression) ); ;}
    break;

  case 62:
    { (yyval.yt_Cexpression_elem) = CExpressionPart(mkcasestring("")); ;}
    break;

  case 63:
    { (yyval.yt_Cexpression_elem) = CExpressionPart(mkcasestring("")); ;}
    break;

  case 64:
    { (yyval.yt_Cexpression_elem) = CExpressionPart(mkcasestring("")); ;}
    break;

  case 65:
    { (yyval.yt_Cexpression_elem) = CExpressionArray( ConsCexpression( CExpressionPart(mkcasestring("")), NilCexpression())); ;}
    break;

  case 66:
    { (yyval.yt_Cexpression) = NilCexpression(); pf_setfileline( (yyval.yt_Cexpression) ); ;}
    break;

  case 67:
    { (yyval.yt_Cexpression) = ConsCexpression( (yyvsp[(2) - (2)].yt_Cexpression_elem), (yyvsp[(1) - (2)].yt_Cexpression) ); (yyval.yt_Cexpression)->file = (yyvsp[(1) - (2)].yt_Cexpression)->file; (yyval.yt_Cexpression)->line = (yyvsp[(1) - (2)].yt_Cexpression)->line; ;}
    break;

  case 68:
    { (yyval.yt_Cexpression_elem) = (yyvsp[(1) - (1)].yt_Cexpression_elem); ;}
    break;

  case 69:
    { (yyval.yt_Cexpression_elem) = CExpressionPart( mkcasestring(",") ); ;}
    break;

  case 72:
    { (yyval.yt_CexpressionDQ) = NilCexpressionDQ(); ;}
    break;

  case 73:
    { (yyval.yt_CexpressionDQ) = ConsCexpressionDQ( (yyvsp[(2) - (2)].yt_CexpressionDQ_elem), (yyvsp[(1) - (2)].yt_CexpressionDQ) ); ;}
    break;

  case 74:
    { (yyval.yt_CexpressionDQ_elem) = CExpressionDQPart( (yyvsp[(1) - (1)].yt_casestring) ); ;}
    break;

  case 75:
    { (yyval.yt_CexpressionDQ_elem) = CExpressionDQNl(); ;}
    break;

  case 76:
    { (yyval.yt_CexpressionSQ) = NilCexpressionSQ(); ;}
    break;

  case 77:
    { (yyval.yt_CexpressionSQ) = ConsCexpressionSQ( (yyvsp[(2) - (2)].yt_CexpressionSQ_elem), (yyvsp[(1) - (2)].yt_CexpressionSQ) ); ;}
    break;

  case 78:
    { (yyval.yt_CexpressionSQ_elem) = CExpressionSQPart( (yyvsp[(1) - (1)].yt_casestring) ); ;}
    break;

  case 79:
    { (yyval.yt_CexpressionSQ_elem) = CExpressionSQNl(); ;}
    break;

  case 80:
    { (yyval.yt_idCexpressions) = ConsidCexpressions( (yyvsp[(1) - (1)].yt_idCexpression), NilidCexpressions() ); ;}
    break;

  case 81:
    { (yyval.yt_idCexpressions) = ConsidCexpressions( (yyvsp[(3) - (3)].yt_idCexpression), (yyvsp[(1) - (3)].yt_idCexpressions) ); ;}
    break;

  case 82:
    { do_CEXPR(); ;}
    break;

  case 83:
    { do_NORMAL(); ;}
    break;

  case 84:
    { (yyval.yt_idCexpression) = IdCexpression( (yyvsp[(1) - (4)].yt_ID), (yyvsp[(3) - (4)].yt_Cexpression) ); ;}
    break;

  case 85:
    { (yyval.yt_withexpression) = WECexpression( (yyvsp[(1) - (1)].yt_Cexpression) ); pf_setstacktopfileline( (yyval.yt_withexpression) ); ;}
    break;

  case 86:
    { (yyval.yt_withexpressions) = Conswithexpressions( (yyvsp[(1) - (1)].yt_withexpression), Nilwithexpressions() ); ;}
    break;

  case 87:
    { pf_pushfileline(); ;}
    break;

  case 88:
    { (yyval.yt_withexpressions) = Conswithexpressions( (yyvsp[(4) - (4)].yt_withexpression), (yyvsp[(1) - (4)].yt_withexpressions) );
	  pf_popfileline();  ;}
    break;

  case 89:
    { do_MainC(); pf_pushfileline(); pf_pushwithvariable(); pf_resetwithvariable(); ;}
    break;

  case 90:
    { do_NORMAL(); ;}
    break;

  case 91:
    { yyerrok; (yyval.yt_Ctext) = (yyvsp[(3) - (5)].yt_Ctext); pf_setstacktopfileline( (yyval.yt_Ctext) ); pf_popfileline(); pf_popwithvariable(); ;}
    break;

  case 92:
    { do_MainC(); pf_pushfileline(); pf_pushwithvariable(); pf_resetwithvariable(); ;}
    break;

  case 93:
    { do_C(); ;}
    break;

  case 94:
    { yyerrok; (yyval.yt_Ctext) = (yyvsp[(3) - (5)].yt_Ctext); pf_setstacktopfileline( (yyval.yt_Ctext) ); pf_popfileline(); pf_popwithvariable(); ;}
    break;

  case 95:
    { (yyval.yt_Ctext) = (yyvsp[(1) - (1)].yt_Ctext); pf_setstacktopfileline( (yyval.yt_Ctext) ); ;}
    break;

  case 96:
    { Ctext_elem tmp = CTextWithexpression( pf_topwithvariable(), (yyvsp[(1) - (1)].yt_withcases), NotInForeachContext() );
	  pf_setstacktopfileline( tmp );
	  (yyval.yt_Ctext) = ConsCtext( tmp, NilCtext() );
	  pf_setstacktopfileline( (yyval.yt_Ctext) );
	  if (! non_default_outmostpattern ) v_report(NonFatal( NoFileLine(), Problem1S( "can not infer type from 'default' pattern(s)" )));
	  non_default_outmostpattern = 0; ;}
    break;

  case 97:
    { (yyval.yt_Ctext) = NilCtext(); ;}
    break;

  case 98:
    { do_C(); pf_pushfileline(); pf_push_no_operators(); ;}
    break;

  case 99:
    { do_NORMAL(); ;}
    break;

  case 100:
    { (yyval.yt_Ctext) = (yyvsp[(3) - (5)].yt_Ctext); pf_setstacktopfileline( (yyval.yt_Ctext) ); pf_popfileline(); pf_pop_no_operators(); ;}
    break;

  case 101:
    { (yyval.yt_Ctext) = NilCtext(); pf_setfileline( (yyval.yt_Ctext) ); ;}
    break;

  case 102:
    { pf_pushfileline(); ;}
    break;

  case 103:
    { (yyval.yt_Ctext) = ConsCtext( (yyvsp[(3) - (3)].yt_Ctext_elem), (yyvsp[(1) - (3)].yt_Ctext) ); pf_setstacktopfileline( (yyvsp[(3) - (3)].yt_Ctext_elem) ); pf_popfileline(); (yyval.yt_Ctext)->file = (yyvsp[(1) - (3)].yt_Ctext)->file; (yyval.yt_Ctext)->line = (yyvsp[(1) - (3)].yt_Ctext)->line; ;}
    break;

  case 104:
    { (yyval.yt_Ctext_elem) = CTextLine( (yyvsp[(1) - (1)].yt_casestring) ); ;}
    break;

  case 105:
    { (yyval.yt_Ctext_elem) = CTextDollarVar( (yyvsp[(1) - (1)].yt_INT) ); ;}
    break;

  case 106:
    { (yyval.yt_Ctext_elem) = CTextNl( mkinteger(1) ); ;}
    break;

  case 107:
    { (yyval.yt_Ctext_elem) = CTextNl( (yyvsp[(1) - (1)].yt_integer) ); ;}
    break;

  case 108:
    { do_CEXPRDQ(); ;}
    break;

  case 109:
    { do_C();
	  (yyval.yt_Ctext_elem) = CTextCexpressionDQ( (yyvsp[(3) - (4)].yt_CexpressionDQ) ); ;}
    break;

  case 110:
    { do_CEXPRSQ(); ;}
    break;

  case 111:
    { do_C();
	  (yyval.yt_Ctext_elem) = CTextCexpressionSQ( (yyvsp[(3) - (4)].yt_CexpressionSQ) ); ;}
    break;

  case 112:
    { do_C();
	  (yyval.yt_Ctext_elem) = CTextCbody( (yyvsp[(1) - (1)].yt_Ctext) ); ;}
    break;

  case 113:
    { do_NORMAL(); ;}
    break;

  case 114:
    { do_C();
	  (yyval.yt_Ctext_elem) = (yyvsp[(3) - (3)].yt_Ctext_elem); ;}
    break;

  case 115:
    { do_NORMAL(); ;}
    break;

  case 116:
    { do_CEXPR(); pf_pushfileline(); ;}
    break;

  case 117:
    { do_NORMAL(); pf_popfileline(); ;}
    break;

  case 118:
    { do_C();
	  (yyval.yt_Ctext_elem) = CTextWithexpression( (yyvsp[(5) - (10)].yt_withexpressions), (yyvsp[(9) - (10)].yt_withcases), NotInForeachContext() );
	  if (! non_default_outmostpattern ) v_report(NonFatal( NoFileLine(), Problem1S( "can not infer type from 'default' pattern(s)" )));
	  non_default_outmostpattern = 0; ;}
    break;

  case 119:
    { non_default_outmostpattern = 0; ;}
    break;

  case 120:
    {
	      pf_pushidCexpressions((yyvsp[(5) - (7)].yt_idCexpressions));
	    ;}
    break;

  case 121:
    { patternchains pc_list = Conspatternchains((yyvsp[(2) - (9)].yt_patternchain), Nilpatternchains());
	  patternchains rewritten = pc_list->rewrite(base_rview);
	  withexpressions wexpr = pf_gen_foreachwith_vars( (yyvsp[(5) - (9)].yt_idCexpressions) );
	  Ctext_elem ctwe =
		    CTextWithexpression(
			wexpr,
			Conswithcases(
			    Withcase(
				syn_patternchains_fileline(
				    rewritten, pg_filename, pg_lineno ),
				(yyvsp[(7) - (9)].yt_Ctext) ),
			    Nilwithcases()
			),
			InForeachContext((yyvsp[(2) - (9)].yt_patternchain)) );
	  Ctext ctxts0 = NilCtext();
	  Ctext ctxts1 = ConsCtext( ctwe, ctxts0 );
	  pf_setstacktopfileline( ctwe );
	  pf_setstacktopfileline( ctxts0 );
	  pf_setstacktopfileline( ctxts1 );
	  check_no_patternchaingroup_in_patternchain(
		  (yyvsp[(2) - (9)].yt_patternchain)->file, (yyvsp[(2) - (9)].yt_patternchain)->line, (yyvsp[(2) - (9)].yt_patternchain), "'foreach variable/pattern'" );
	  (yyval.yt_Ctext_elem) = CTextForeachexpression( (yyvsp[(2) - (9)].yt_patternchain), (yyvsp[(5) - (9)].yt_idCexpressions), wexpr, ctxts1, (yyvsp[(9) - (9)].yt_foreach_after));
	  pf_popidCexpressions();
	;}
    break;

  case 122:
    { (yyval.yt_foreach_after) = NoForeachAfter(); ;}
    break;

  case 123:
    { do_NORMAL(); pf_pushfileline(); ;}
    break;

  case 124:
    { non_default_outmostpattern = 0; ;}
    break;

  case 125:
    { patternchains pc_list = Conspatternchains((yyvsp[(4) - (7)].yt_patternchain), Nilpatternchains());
	  patternchains rewritten = pc_list->rewrite(base_rview);
	  withexpressions wexpr = pf_gen_foreachwith_listvars( pf_topidCexpressions() );
	  Ctext_elem ctwe =
	      CTextWithexpression(
		      wexpr,
		      Conswithcases(
			  Withcase(
			      syn_patternchains_fileline(
				  rewritten, pg_filename, pg_lineno ),
			      (yyvsp[(7) - (7)].yt_Ctext) ),
			  Nilwithcases()
				   ),
		      InForeachContext((yyvsp[(4) - (7)].yt_patternchain)) );
	  Ctext ctxts0 = NilCtext();
	  Ctext ctxts1 = ConsCtext( ctwe, ctxts0 );
	  pf_setstacktopfileline( ctwe );
	  pf_setstacktopfileline( ctxts0 );
	  pf_setstacktopfileline( ctxts1 );
	  check_no_patternchaingroup_or_pattern_in_patternchain(
		(yyvsp[(4) - (7)].yt_patternchain)->file, (yyvsp[(4) - (7)].yt_patternchain)->line, (yyvsp[(4) - (7)].yt_patternchain), "'foreach variable/pattern'" );
	  (yyval.yt_foreach_after) = ForeachAfter( (yyvsp[(4) - (7)].yt_patternchain), pf_topidCexpressions(), wexpr, ctxts1 );
	  pf_setstacktopfileline( (yyval.yt_foreach_after) );
	  pf_popfileline();
	;}
    break;

  case 126:
    { (yyval.yt_Ctexts) = NilCtexts(); ;}
    break;

  case 127:
    { (yyval.yt_Ctexts) = ConsCtexts( (yyvsp[(1) - (1)].yt_Ctext), NilCtexts() ); ;}
    break;

  case 128:
    { pf_pushfileline(); ;}
    break;

  case 129:
    {{includedeclaration pl_includedeclaration = IncludeDeclaration( (yyvsp[(5) - (5)].yt_casestring) );
	  set_includefiles( (yyvsp[(2) - (5)].yt_includefiles), pl_includedeclaration );
	  pf_setstacktopfileline( pl_includedeclaration );
	  pf_popfileline();
	};}
    break;

  case 130:
    { (yyval.yt_includedeclaration) =IncludeDeclaration(mkcasestring("")); ;}
    break;

  case 131:
    {{ includefile pl_includefile = IncludeFile( mkcasestring("CODE") );
	  (yyval.yt_includefiles) = Consincludefiles( pl_includefile, Nilincludefiles() );
	};}
    break;

  case 132:
    { (yyval.yt_includefiles) = (yyvsp[(1) - (1)].yt_includefiles); ;}
    break;

  case 133:
    {{ includefile pl_includefile = IncludeFile( (yyvsp[(1) - (1)].yt_casestring) );
	  if ((pl_includefile->inc_type == include_file) || (pl_includefile->inc_type == include_header)) {
		(yyval.yt_includefiles) = Consincludefiles( pl_includefile, Nilincludefiles() );
	  } else {
	    v_report(NonFatal( NoFileLine(), ProblemSC( "unknown include redirection keyword:", (yyvsp[(1) - (1)].yt_casestring) )));
		(yyval.yt_includefiles) = Nilincludefiles();
	  }
	};}
    break;

  case 134:
    {{ includefile pl_includefile = IncludeFile( (yyvsp[(2) - (2)].yt_casestring) );
	  if ((pl_includefile->inc_type == include_file) || (pl_includefile->inc_type == include_header)) {
		(yyval.yt_includefiles) = Consincludefiles( pl_includefile, (yyvsp[(1) - (2)].yt_includefiles) );
	  } else {
	    v_report(NonFatal( NoFileLine(), ProblemSC( "unknown include redirection keyword:", (yyvsp[(2) - (2)].yt_casestring) )));
		(yyval.yt_includefiles) = (yyvsp[(1) - (2)].yt_includefiles);
	  }
	};}
    break;

  case 135:
    { if (! non_default_outmostpattern ) v_report(NonFatal( NoFileLine(), Problem1S( "can not infer type from 'default' pattern(s)" )));
	  non_default_outmostpattern = 0; ;}
    break;

  case 136:
    { yyerrok; (yyval.yt_rwdeclaration) = RwDeclaration( (yyvsp[(1) - (5)].yt_outmostpatterns), (yyvsp[(4) - (5)].yt_rewriteclauses) ); ;}
    break;

  case 137:
    { (yyval.yt_rewriteclauses) = Consrewriteclauses( (yyvsp[(1) - (1)].yt_rewriteclause), Nilrewriteclauses() ); ;}
    break;

  case 138:
    { (yyval.yt_rewriteclauses) = Consrewriteclauses( (yyvsp[(2) - (2)].yt_rewriteclause), (yyvsp[(1) - (2)].yt_rewriteclauses) ); ;}
    break;

  case 139:
    { if ((yyvsp[(2) - (5)].yt_viewnames)->eq(Nilviewnames())) {
	      (yyval.yt_rewriteclause) = RewriteClause( Consviewnames( Id( Str( mkcasestring( "base_rview" ))), (yyvsp[(2) - (5)].yt_viewnames) ), (yyvsp[(4) - (5)].yt_term) );
	  } else {
	      (yyval.yt_rewriteclause) = RewriteClause( (yyvsp[(2) - (5)].yt_viewnames), (yyvsp[(4) - (5)].yt_term) );
	} ;}
    break;

  case 142:
    { (yyval.yt_patternchains) = Conspatternchains( (yyvsp[(1) - (1)].yt_patternchain), Nilpatternchains() ); ;}
    break;

  case 143:
    { (yyval.yt_patternchains) = Conspatternchains( (yyvsp[(3) - (3)].yt_patternchain), (yyvsp[(1) - (3)].yt_patternchains) ); ;}
    break;

  case 144:
    { (yyval.yt_patternchain) = Conspatternchain( (yyvsp[(1) - (1)].yt_patternchainitem), Nilpatternchain() ); ;}
    break;

  case 145:
    { (yyval.yt_patternchain) = Conspatternchain( (yyvsp[(3) - (3)].yt_patternchainitem), (yyvsp[(1) - (3)].yt_patternchain) ); ;}
    break;

  case 146:
    { pf_pushfileline(); ;}
    break;

  case 147:
    { (yyval.yt_patternchainitem) = (yyvsp[(2) - (2)].yt_patternchainitem); pf_setstacktopfileline((yyval.yt_patternchainitem)); pf_popfileline(); ;}
    break;

  case 148:
    { (yyval.yt_patternchainitem) = PatternchainitemOutmost( (yyvsp[(1) - (1)].yt_outmostpattern) ); ;}
    break;

  case 149:
    { (yyval.yt_patternchainitem) = PatternchainitemGroup( (yyvsp[(2) - (3)].yt_patternchains) ); ;}
    break;

  case 150:
    { (yyval.yt_patternchainitem) = PatternchainitemDollarid( (yyvsp[(2) - (2)].yt_ID) ); pf_setwithvariable( (yyvsp[(2) - (2)].yt_ID) );  ;}
    break;

  case 151:
    { (yyval.yt_outmostpatterns) = Consoutmostpatterns( (yyvsp[(1) - (1)].yt_outmostpattern), Niloutmostpatterns() ); ;}
    break;

  case 152:
    { yyerrok; (yyval.yt_outmostpatterns) = Consoutmostpatterns( (yyvsp[(3) - (3)].yt_outmostpattern), (yyvsp[(1) - (3)].yt_outmostpatterns) ); ;}
    break;

  case 153:
    { (yyval.yt_outmostpatterns) = Niloutmostpatterns(); ;}
    break;

  case 154:
    { (yyval.yt_outmostpatterns)=(yyvsp[(1) - (2)].yt_outmostpatterns); ;}
    break;

  case 155:
    { (yyval.yt_outmostpatterns)=(yyvsp[(1) - (3)].yt_outmostpatterns); ;}
    break;

  case 156:
    { yyerrok; (yyval.yt_outmostpatterns) = Consoutmostpatterns( (yyvsp[(3) - (3)].yt_outmostpattern), (yyvsp[(1) - (3)].yt_outmostpatterns) ); ;}
    break;

  case 157:
    { (yyval.yt_outmostpattern) = OPOperatorWildcard( (yyvsp[(1) - (2)].yt_ID), (yyvsp[(2) - (2)].yt_Cexpression) ); non_default_outmostpattern = 1;
	(yyval.yt_outmostpattern)->file = pg_filename; (yyval.yt_outmostpattern)->line = pg_lineno; ;}
    break;

  case 158:
    { (yyval.yt_outmostpattern) = OPOperator( (yyvsp[(1) - (5)].yt_ID), (yyvsp[(3) - (5)].yt_patterns), (yyvsp[(5) - (5)].yt_Cexpression) ); non_default_outmostpattern = 1;
	(yyval.yt_outmostpattern)->file = pg_filename; (yyval.yt_outmostpattern)->line = pg_lineno; ;}
    break;

  case 159:
    { (yyval.yt_outmostpattern) = OPNonLeafVariable( (yyvsp[(1) - (3)].yt_ID), (yyvsp[(3) - (3)].yt_outmostpattern) ); non_default_outmostpattern = 1;
	(yyval.yt_outmostpattern)->file = pg_filename; (yyval.yt_outmostpattern)->line = pg_lineno; ;}
    break;

  case 160:
    { (yyval.yt_outmostpattern) = OPWildcard( (yyvsp[(2) - (2)].yt_Cexpression) );
	(yyval.yt_outmostpattern)->file = pg_filename; (yyval.yt_outmostpattern)->line = pg_lineno; ;}
    break;

  case 161:
    { (yyval.yt_outmostpattern) = OPDefault( (yyvsp[(2) - (2)].yt_Cexpression) );
	(yyval.yt_outmostpattern)->file = pg_filename; (yyval.yt_outmostpattern)->line = pg_lineno;;}
    break;

  case 162:
    { (yyval.yt_Cexpression) = NilCexpression(); ;}
    break;

  case 163:
    { do_CEXPR(); ;}
    break;

  case 164:
    { do_NORMAL(); ;}
    break;

  case 165:
    { (yyval.yt_Cexpression) = (yyvsp[(4) - (6)].yt_Cexpression); ;}
    break;

  case 166:
    { (yyval.yt_pattern) = PVariable( (yyvsp[(1) - (1)].yt_ID) ); ;}
    break;

  case 167:
    { (yyval.yt_pattern) = POperator( (yyvsp[(1) - (4)].yt_ID), (yyvsp[(3) - (4)].yt_patterns) ); ;}
    break;

  case 168:
    { (yyval.yt_pattern) = PWildcard(); ;}
    break;

  case 169:
    { (yyval.yt_pattern) = PWildcard(); ;}
    break;

  case 170:
    { (yyval.yt_pattern) = PNonLeafVariable( (yyvsp[(1) - (3)].yt_ID), (yyvsp[(3) - (3)].yt_pattern) ); ;}
    break;

  case 171:
    { do_CEXPRDQ(); ;}
    break;

  case 172:
    { do_NORMAL();
	  (yyval.yt_pattern) = PStringLiteral( (yyvsp[(3) - (4)].yt_CexpressionDQ) ); ;}
    break;

  case 173:
    { (yyval.yt_pattern) = PIntLiteral( (yyvsp[(1) - (1)].yt_INT) ); ;}
    break;

  case 174:
    { (yyval.yt_patterns) = Nilpatterns(); ;}
    break;

  case 175:
    { (yyval.yt_patterns) = (yyvsp[(1) - (1)].yt_patterns); ;}
    break;

  case 176:
    { (yyval.yt_patterns) = Conspatterns( (yyvsp[(1) - (1)].yt_pattern), Nilpatterns() ); ;}
    break;

  case 177:
    { yyerrok; (yyval.yt_patterns) = Conspatterns( (yyvsp[(3) - (3)].yt_pattern), (yyvsp[(1) - (3)].yt_patterns) ); ;}
    break;

  case 178:
    { (yyval.yt_patterns) = Nilpatterns(); ;}
    break;

  case 179:
    { (yyval.yt_patterns) = (yyvsp[(1) - (2)].yt_patterns); ;}
    break;

  case 180:
    { (yyval.yt_patterns) = (yyvsp[(1) - (3)].yt_patterns); ;}
    break;

  case 181:
    { yyerrok; (yyval.yt_patterns) = Conspatterns( (yyvsp[(3) - (3)].yt_pattern), (yyvsp[(1) - (3)].yt_patterns) ); ;}
    break;

  case 182:
    { (yyval.yt_term) = TVariable( (yyvsp[(1) - (1)].yt_ID) );
		(yyval.yt_term)->file = pg_filename; (yyval.yt_term)->line = pg_lineno; ;}
    break;

  case 183:
    { (yyval.yt_term) = TOperator( (yyvsp[(1) - (4)].yt_ID), (yyvsp[(3) - (4)].yt_terms) );
	  (yyval.yt_term)->file = pg_filename; (yyval.yt_term)->line = pg_lineno;
	;}
    break;

  case 184:
    { (yyval.yt_term) = TMethod( (yyvsp[(1) - (6)].yt_term), (yyvsp[(3) - (6)].yt_ID), (yyvsp[(5) - (6)].yt_terms) );
	  (yyval.yt_term)->file = pg_filename; (yyval.yt_term)->line = pg_lineno; ;}
    break;

  case 185:
    { (yyval.yt_term) = TMethodDot( (yyvsp[(1) - (6)].yt_term), (yyvsp[(3) - (6)].yt_ID), (yyvsp[(5) - (6)].yt_terms) );
	  (yyval.yt_term)->file = pg_filename; (yyval.yt_term)->line = pg_lineno; ;}
    break;

  case 186:
    { (yyval.yt_term) = TMemberVar( (yyvsp[(1) - (3)].yt_term), (yyvsp[(3) - (3)].yt_ID) );
	  (yyval.yt_term)->file = pg_filename; (yyval.yt_term)->line = pg_lineno; ;}
    break;

  case 187:
    { (yyval.yt_term) = TMemberVarDot( (yyvsp[(1) - (3)].yt_term), (yyvsp[(3) - (3)].yt_ID) );
	  (yyval.yt_term)->file = pg_filename; (yyval.yt_term)->line = pg_lineno; ;}
    break;

  case 188:
    { do_CEXPRSQ(); ;}
    break;

  case 189:
    { do_NORMAL();
	  (yyval.yt_term) = TCTerm( (yyvsp[(3) - (4)].yt_CexpressionSQ) );
	  (yyval.yt_term)->file = pg_filename; (yyval.yt_term)->line = pg_lineno; ;}
    break;

  case 190:
    { do_CEXPRDQ(); ;}
    break;

  case 191:
    { do_NORMAL();
	  (yyval.yt_term) = TStringLiteral( (yyvsp[(3) - (4)].yt_CexpressionDQ) );
	  (yyval.yt_term)->file = pg_filename; (yyval.yt_term)->line = pg_lineno; ;}
    break;

  case 192:
    { (yyval.yt_term) = TIntLiteral( (yyvsp[(1) - (1)].yt_INT) );
	(yyval.yt_term)->file = pg_filename; (yyval.yt_term)->line = pg_lineno; ;}
    break;

  case 193:
    { (yyval.yt_terms) = Nilterms(); ;}
    break;

  case 194:
    { (yyval.yt_terms) = (yyvsp[(1) - (1)].yt_terms); ;}
    break;

  case 195:
    { (yyval.yt_terms) = Consterms( (yyvsp[(1) - (1)].yt_term), Nilterms() ); ;}
    break;

  case 196:
    { yyerrok; (yyval.yt_terms) = Consterms( (yyvsp[(3) - (3)].yt_term), (yyvsp[(1) - (3)].yt_terms) ); ;}
    break;

  case 197:
    { (yyval.yt_terms) = Nilterms(); ;}
    break;

  case 198:
    { (yyval.yt_terms) = (yyvsp[(1) - (2)].yt_terms); ;}
    break;

  case 199:
    { (yyval.yt_terms) = (yyvsp[(1) - (3)].yt_terms); ;}
    break;

  case 200:
    { yyerrok; (yyval.yt_terms) = Consterms( (yyvsp[(3) - (3)].yt_term), (yyvsp[(1) - (3)].yt_terms) ); ;}
    break;

  case 201:
    { (yyval.yt_withcases) = Conswithcases( (yyvsp[(1) - (1)].yt_withcase), Nilwithcases() ); ;}
    break;

  case 202:
    { (yyval.yt_withcases) = Conswithcases( (yyvsp[(2) - (2)].yt_withcase), (yyvsp[(1) - (2)].yt_withcases) ); ;}
    break;

  case 203:
    { (yyval.yt_withcase) = Withcase( syn_patternchains_fileline((yyvsp[(1) - (3)].yt_patternchains)->rewrite(base_rview), pg_filename, pg_lineno ), (yyvsp[(3) - (3)].yt_Ctext) ); ;}
    break;

  case 204:
    { if (! non_default_outmostpattern ) v_report(NonFatal( NoFileLine(), Problem1S( "can not infer type from 'default' pattern(s)" )));
	  non_default_outmostpattern = 0; ;}
    break;

  case 205:
    { (yyval.yt_unparsedeclaration) = UnparseDeclaration( (yyvsp[(1) - (5)].yt_outmostpatterns), (yyvsp[(4) - (5)].yt_unparseclauses) ); ;}
    break;

  case 206:
    { (yyval.yt_unparsedeclaration) = UnparseDeclaration( (yyvsp[(1) - (4)].yt_outmostpatterns), Nilunparseclauses()); ;}
    break;

  case 207:
    { (yyval.yt_unparseclauses) = Consunparseclauses( (yyvsp[(1) - (1)].yt_unparseclause), Nilunparseclauses() ); ;}
    break;

  case 208:
    { (yyval.yt_unparseclauses) = Consunparseclauses( (yyvsp[(2) - (2)].yt_unparseclause), (yyvsp[(1) - (2)].yt_unparseclauses) ); ;}
    break;

  case 209:
    { if ((yyvsp[(2) - (5)].yt_viewnames)->eq( Nilviewnames())) {
	      (yyval.yt_unparseclause) = UnparseClause( Consviewnames( Id( Str( mkcasestring( "base_uview" ))), (yyvsp[(2) - (5)].yt_viewnames) ), (yyvsp[(4) - (5)].yt_unparseitems) );
	  } else {
	      (yyval.yt_unparseclause) = UnparseClause( (yyvsp[(2) - (5)].yt_viewnames), (yyvsp[(4) - (5)].yt_unparseitems) );
	} inc_text_nr(); yyerrok;
	;}
    break;

  case 210:
    { (yyval.yt_unparseclause) = UnparseClause( (yyvsp[(2) - (4)].yt_viewnames), Nilunparseitems()); ;}
    break;

  case 211:
    { yyerrok; (yyval.yt_unparseclause) = UnparseClause( Nilviewnames(), (yyvsp[(4) - (5)].yt_unparseitems)); ;}
    break;

  case 212:
    { (yyval.yt_unparseclause) = UnparseClause( Nilviewnames(), Nilunparseitems()); ;}
    break;

  case 213:
    { (yyval.yt_unparseclause) = UnparseClause( Nilviewnames(), Nilunparseitems()); ;}
    break;

  case 214:
    { (yyval.yt_viewnames) = Nilviewnames(); ;}
    break;

  case 215:
    { (yyval.yt_viewnames) = Consviewnames( (yyvsp[(2) - (2)].yt_ID), (yyvsp[(1) - (2)].yt_viewnames) ); ;}
    break;

  case 216:
    { (yyval.yt_unparseitems) = Nilunparseitems(); ;}
    break;

  case 217:
    { (yyval.yt_unparseitems) = Consunparseitems( (yyvsp[(2) - (2)].yt_unparseitem), (yyvsp[(1) - (2)].yt_unparseitems) ); ;}
    break;

  case 218:
    { do_CEXPRDQ(); ;}
    break;

  case 219:
    { do_NORMAL(); ;}
    break;

  case 220:
    { (yyval.yt_unparseitem) = UnpStr( (yyvsp[(1) - (7)].yt_languageoption), (yyvsp[(4) - (7)].yt_CexpressionDQ), (yyvsp[(7) - (7)].yt_viewnameoption) );
	  (yyval.yt_unparseitem)->text_nr=get_text_nr();
	  if(!(yyvsp[(7) - (7)].yt_viewnameoption)->eq(NoViewname()))
	    inc_text_nr();
	;}
    break;

  case 221:
    { (yyval.yt_unparseitem) = UnpSubexpr( (yyvsp[(1) - (3)].yt_languageoption), (yyvsp[(2) - (3)].yt_unpsubterm), (yyvsp[(3) - (3)].yt_viewnameoption) ); inc_text_nr(); ;}
    break;

  case 222:
    { (yyval.yt_unparseitem) = UnpCtext( (yyvsp[(1) - (2)].yt_languageoption), (yyvsp[(2) - (2)].yt_Ctext) ); inc_text_nr(); ;}
    break;

  case 223:
    { (yyval.yt_unparseitem) = UnpBody( (yyvsp[(1) - (4)].yt_languageoption), (yyvsp[(3) - (4)].yt_unparseitems) ); inc_text_nr(); ;}
    break;

  case 224:
    { do_CEXPR(); ;}
    break;

  case 225:
    { do_NORMAL(); ;}
    break;

  case 226:
    { (yyval.yt_unparseitem) = UViewVarDecl( (yyvsp[(2) - (7)].yt_ID), (yyvsp[(3) - (7)].yt_ID), (yyvsp[(5) - (7)].yt_Cexpression) ); ;}
    break;

  case 227:
    { (yyval.yt_unpsubterm) = UnpSubTerm( (yyvsp[(1) - (1)].yt_ID) ); ;}
    break;

  case 228:
    { (yyval.yt_unpsubterm) = UnpDollarvarTerm( (yyvsp[(1) - (1)].yt_INT) ); ;}
    break;

  case 229:
    { (yyval.yt_unpsubterm) = UnpSubAttr( (yyvsp[(1) - (2)].yt_ID), (yyvsp[(2) - (2)].yt_unpattributes) ); ;}
    break;

  case 230:
    { (yyval.yt_unpsubterm) = UnpDollarvarAttr( (yyvsp[(1) - (2)].yt_INT), (yyvsp[(2) - (2)].yt_unpattributes) ); ;}
    break;

  case 231:
    { (yyval.yt_unpsubterm) = UnpCastedVariable( (yyvsp[(2) - (4)].yt_ID), (yyvsp[(4) - (4)].yt_ID) ); ;}
    break;

  case 232:
    { (yyval.yt_unpattributes) = Consunpattributes( (yyvsp[(1) - (1)].yt_ID), Nilunpattributes() ); ;}
    break;

  case 233:
    { (yyval.yt_unpattributes) = Consunpattributes( (yyvsp[(2) - (2)].yt_ID), (yyvsp[(1) - (2)].yt_unpattributes) ); ;}
    break;

  case 234:
    { (yyval.yt_ID) = (yyvsp[(2) - (2)].yt_ID); ;}
    break;

  case 235:
    { (yyval.yt_ID) = Id(Str(mkcasestring("error"))); ;}
    break;

  case 236:
    { (yyval.yt_viewnameoption) = NoViewname(); ;}
    break;

  case 237:
    { (yyval.yt_viewnameoption) = YesViewname( (yyvsp[(2) - (2)].yt_ID) ); ;}
    break;

  case 238:
    { (yyval.yt_viewnameoption) = NoViewname(); ;}
    break;

  case 239:
    { yyerrok; (yyval.yt_viewnames) = (yyvsp[(2) - (3)].yt_viewnames); pg_uviewshavebeendefined = true; ;}
    break;

  case 240:
    { yyerrok; (yyval.yt_viewnames) = Nilviewnames(); ;}
    break;

  case 241:
    { (yyval.yt_viewnames) = Consviewnames( (yyvsp[(1) - (1)].yt_ID), Nilviewnames());
	  v_add_to_uviewnames( (yyvsp[(1) - (1)].yt_ID) );
	  v_extendoccur( (yyvsp[(1) - (1)].yt_ID), ITUserUView() ); ;}
    break;

  case 242:
    { (yyval.yt_viewnames) = Consviewnames( (yyvsp[(2) - (3)].yt_ID), Nilviewnames());
	  v_add_to_uviewnames_ext( (yyvsp[(2) - (3)].yt_ID) );
	  v_extendoccur( (yyvsp[(2) - (3)].yt_ID), ITUserUView() ); ;}
    break;

  case 243:
    { (yyval.yt_viewnames) = Consviewnames( (yyvsp[(2) - (2)].yt_ID), (yyvsp[(1) - (2)].yt_viewnames) );
	  v_add_to_uviewnames( (yyvsp[(2) - (2)].yt_ID) );
	  v_extendoccur( (yyvsp[(2) - (2)].yt_ID), ITUserUView() ); ;}
    break;

  case 244:
    { (yyval.yt_viewnames) = Consviewnames( (yyvsp[(3) - (4)].yt_ID), (yyvsp[(1) - (4)].yt_viewnames) );
	  v_add_to_uviewnames_ext( (yyvsp[(3) - (4)].yt_ID) );
	  v_extendoccur( (yyvsp[(3) - (4)].yt_ID), ITUserUView() ); ;}
    break;

  case 245:
    { (yyval.yt_viewnames) = Consviewnames( (yyvsp[(3) - (3)].yt_ID), (yyvsp[(1) - (3)].yt_viewnames) );
	  v_add_to_uviewnames( (yyvsp[(3) - (3)].yt_ID) );
	  v_extendoccur( (yyvsp[(3) - (3)].yt_ID), ITUserUView() ); ;}
    break;

  case 246:
    { (yyval.yt_viewnames) = Consviewnames( (yyvsp[(4) - (5)].yt_ID), (yyvsp[(1) - (5)].yt_viewnames) );
	  v_add_to_uviewnames_ext( (yyvsp[(4) - (5)].yt_ID) );
	  v_extendoccur( (yyvsp[(4) - (5)].yt_ID), ITUserUView() ); ;}
    break;

  case 247:
    { (yyval.yt_viewnames) = (yyvsp[(1) - (2)].yt_viewnames); ;}
    break;

  case 248:
    { (yyval.yt_viewnames) = (yyvsp[(1) - (3)].yt_viewnames); ;}
    break;

  case 249:
    { yyerrok; (yyval.yt_viewnames) = (yyvsp[(2) - (3)].yt_viewnames); pg_rviewshavebeendefined = true; ;}
    break;

  case 250:
    { yyerrok; (yyval.yt_viewnames) = Nilviewnames(); ;}
    break;

  case 251:
    { (yyval.yt_viewnames) = Consviewnames( (yyvsp[(1) - (1)].yt_ID), Nilviewnames());
	  v_add_to_rviewnames( (yyvsp[(1) - (1)].yt_ID) );
	  v_extendoccur( (yyvsp[(1) - (1)].yt_ID), ITUserRView() ); ;}
    break;

  case 252:
    { (yyval.yt_viewnames) = Consviewnames( (yyvsp[(2) - (3)].yt_ID), Nilviewnames());
	  v_add_to_rviewnames_ext( (yyvsp[(2) - (3)].yt_ID) );
	  v_extendoccur( (yyvsp[(2) - (3)].yt_ID), ITUserRView() ); ;}
    break;

  case 253:
    { (yyval.yt_viewnames) = Consviewnames( (yyvsp[(2) - (2)].yt_ID), (yyvsp[(1) - (2)].yt_viewnames) );
	  v_add_to_rviewnames( (yyvsp[(2) - (2)].yt_ID) );
	  v_extendoccur( (yyvsp[(2) - (2)].yt_ID), ITUserRView() ); ;}
    break;

  case 254:
    { (yyval.yt_viewnames) = Consviewnames( (yyvsp[(3) - (4)].yt_ID), (yyvsp[(1) - (4)].yt_viewnames) );
	  v_add_to_rviewnames_ext( (yyvsp[(3) - (4)].yt_ID) );
	  v_extendoccur( (yyvsp[(3) - (4)].yt_ID), ITUserRView() ); ;}
    break;

  case 255:
    { (yyval.yt_viewnames) = Consviewnames( (yyvsp[(3) - (3)].yt_ID), (yyvsp[(1) - (3)].yt_viewnames) );
	  v_add_to_rviewnames( (yyvsp[(3) - (3)].yt_ID) );
	  v_extendoccur( (yyvsp[(3) - (3)].yt_ID), ITUserRView() ); ;}
    break;

  case 256:
    { (yyval.yt_viewnames) = Consviewnames( (yyvsp[(4) - (5)].yt_ID), (yyvsp[(1) - (5)].yt_viewnames) );
	  v_add_to_rviewnames_ext( (yyvsp[(4) - (5)].yt_ID) );
	  v_extendoccur( (yyvsp[(4) - (5)].yt_ID), ITUserRView() ); ;}
    break;

  case 257:
    { (yyval.yt_viewnames) = (yyvsp[(1) - (2)].yt_viewnames); ;}
    break;

  case 258:
    { (yyval.yt_viewnames) = (yyvsp[(1) - (3)].yt_viewnames); ;}
    break;

  case 259:
    { yyerrok; (yyval.yt_storageclasses) = (yyvsp[(2) - (3)].yt_storageclasses); pg_storageclasseshavebeendefined = true; ;}
    break;

  case 260:
    { yyerrok; (yyval.yt_storageclasses) = Nilstorageclasses(); ;}
    break;

  case 261:
    { (yyval.yt_storageclasses) = Consstorageclasses( (yyvsp[(1) - (1)].yt_ID), Nilstorageclasses());
	  v_add_to_storageclasses( (yyvsp[(1) - (1)].yt_ID), f_emptyId() );
	  v_extendoccur( (yyvsp[(1) - (1)].yt_ID), ITStorageClass() ); ;}
    break;

  case 262:
    { (yyval.yt_storageclasses) = Consstorageclasses( (yyvsp[(2) - (2)].yt_ID), (yyvsp[(1) - (2)].yt_storageclasses) );
	  v_add_to_storageclasses( (yyvsp[(2) - (2)].yt_ID), f_emptyId() );
	  v_extendoccur( (yyvsp[(2) - (2)].yt_ID), ITStorageClass() ); ;}
    break;

  case 263:
    { (yyval.yt_storageclasses) = Consstorageclasses( (yyvsp[(3) - (3)].yt_ID), (yyvsp[(1) - (3)].yt_storageclasses) );
	  v_add_to_storageclasses( (yyvsp[(3) - (3)].yt_ID), f_emptyId() );
	  v_extendoccur( (yyvsp[(3) - (3)].yt_ID), ITStorageClass() ); ;}
    break;

  case 264:
    { (yyval.yt_storageclasses) = (yyvsp[(1) - (2)].yt_storageclasses); ;}
    break;

  case 265:
    { (yyval.yt_storageclasses) = (yyvsp[(1) - (3)].yt_storageclasses); ;}
    break;

  case 266:
    {
	    fnclass tmp_type = f_fnclass_info((yyvsp[(1) - (3)].yt_ac_declaration_specifiers), pg_filename, (yyvsp[(2) - (3)].yt_ac_declarator) );
	    ID tmp_id = f_ID_of_fn_declarator((yyvsp[(2) - (3)].yt_ac_declarator), tmp_type);
	    (yyval.yt_fndeclaration) = FnAcDeclaration( (yyvsp[(1) - (3)].yt_ac_declaration_specifiers), (yyvsp[(2) - (3)].yt_ac_declarator), Nilac_declaration_list(), AcNoBaseInit(), (yyvsp[(3) - (3)].yt_Ctext), tmp_id, tmp_type );
	    pf_resetwithvariable();
	    v_defoccur( tmp_id, ITUserFunction( tmp_type ) );
	    (yyval.yt_fndeclaration)->file = pg_filename; (yyval.yt_fndeclaration)->last_line = pg_lineno;
	;}
    break;

  case 267:
    {
	    fnclass tmp_type=ConvOperatorFn();
	    ac_declarator decl= AcDeclarator(Nopointer(),AcNoRef(),
		    AcQualifiedDeclProto(
			    Nilac_class_qualifier_list(),
			    AcConvOperatorDecl((yyvsp[(1) - (8)].yt_ID), (yyvsp[(4) - (8)].yt_ID)),
			    AcParList(Nilac_parameter_list()),
			    (yyvsp[(7) - (8)].yt_ac_type_qualifier) )
		    );
	    ID tmp_id = (yyvsp[(4) - (8)].yt_ID);
	    (yyval.yt_fndeclaration) = FnAcDeclaration(
		    Nilac_declaration_specifiers(),
		    decl,
		    Nilac_declaration_list(), AcNoBaseInit(), (yyvsp[(8) - (8)].yt_Ctext), tmp_id, tmp_type
	    );
	    pf_resetwithvariable();
	    v_defoccur( tmp_id, ITUserFunction( tmp_type ) );
	    (yyval.yt_fndeclaration)->file = pg_filename; (yyval.yt_fndeclaration)->last_line = pg_lineno;
	;}
    break;

  case 268:
    {
		fnclass tmp_type=ConstructorFn();
		ac_declarator decl= AcDeclarator(Nopointer(),AcNoRef(),
			AcQualifiedDeclProto(
				Nilac_class_qualifier_list(),
				AcDirectDeclId((yyvsp[(2) - (7)].yt_ID)),
				(yyvsp[(4) - (7)].yt_ac_parameter_type_list),
				AcNoQualifier() )
			);
		ID tmp_id = f_ID_of_fn_declarator(decl, tmp_type);
		(yyval.yt_fndeclaration) = FnAcDeclaration(
			Nilac_declaration_specifiers(),
			decl,
			Nilac_declaration_list(), (yyvsp[(6) - (7)].yt_ac_opt_base_init_list), (yyvsp[(7) - (7)].yt_Ctext), tmp_id, tmp_type
		);
		pf_resetwithvariable();
		v_defoccur( tmp_id, ITUserFunction( tmp_type ) );
		(yyval.yt_fndeclaration)->file = pg_filename; (yyval.yt_fndeclaration)->last_line = pg_lineno;
	;}
    break;

  case 269:
    {
		fnclass tmp_type=DestructorFn();
		ac_declarator decl= AcDeclarator(Nopointer(),AcNoRef(),
			AcQualifiedDeclProto(
				Nilac_class_qualifier_list(),
				AcDirectDeclId((yyvsp[(3) - (6)].yt_ID)),
				AcParList( Nilac_parameter_list() ),
				AcNoQualifier() )
			);
		ID tmp_id = f_ID_of_fn_declarator(decl, tmp_type);
		(yyval.yt_fndeclaration) = FnAcDeclaration(
			(yyvsp[(2) - (6)].yt_ac_declaration_specifiers),
			decl,
			Nilac_declaration_list(), AcNoBaseInit(), (yyvsp[(6) - (6)].yt_Ctext), tmp_id, tmp_type
		);
		pf_resetwithvariable();
		v_defoccur( tmp_id, ITUserFunction( tmp_type ) );
		(yyval.yt_fndeclaration)->file = pg_filename; (yyval.yt_fndeclaration)->last_line = pg_lineno;
	;}
    break;

  case 270:
    {
		fnclass tmp_type = f_member_class_info((yyvsp[(2) - (5)].yt_ac_declaration_specifiers), pg_filename);
		(yyval.yt_fndeclaration)=AcMemberDeclaration((yyvsp[(2) - (5)].yt_ac_declaration_specifiers),(yyvsp[(3) - (5)].yt_ac_declarator),(yyvsp[(4) - (5)].yt_ac_constant_expression_option),tmp_type);
		(yyval.yt_fndeclaration)->is_attr=false;
		(yyval.yt_fndeclaration)->file = pg_filename; (yyval.yt_fndeclaration)->last_line = pg_lineno;
	;}
    break;

  case 271:
    {
		fnclass tmp_type = f_member_class_info((yyvsp[(2) - (5)].yt_ac_declaration_specifiers), pg_filename);
		(yyval.yt_fndeclaration)=AcMemberDeclaration((yyvsp[(2) - (5)].yt_ac_declaration_specifiers),(yyvsp[(3) - (5)].yt_ac_declarator),(yyvsp[(4) - (5)].yt_ac_constant_expression_option),tmp_type);
		(yyval.yt_fndeclaration)->is_attr=true;
		(yyval.yt_fndeclaration)->file = pg_filename; (yyval.yt_fndeclaration)->last_line = pg_lineno;
	;}
    break;

  case 272:
    { (yyval.yt_ac_opt_base_init_list) = AcNoBaseInit(); ;}
    break;

  case 273:
    { (yyval.yt_ac_opt_base_init_list) = AcYesBaseInit( (yyvsp[(2) - (2)].yt_ac_base_init_list) ); ;}
    break;

  case 274:
    { (yyval.yt_ac_base_init_list) = Consac_base_init_list( (yyvsp[(1) - (1)].yt_ac_base_init), Nilac_base_init_list() ); ;}
    break;

  case 275:
    { (yyval.yt_ac_base_init_list) = Consac_base_init_list( (yyvsp[(3) - (3)].yt_ac_base_init), (yyvsp[(1) - (3)].yt_ac_base_init_list) ); ;}
    break;

  case 276:
    { (yyval.yt_ac_base_init)= AcBaseInit( (yyvsp[(1) - (4)].yt_ID), (yyvsp[(3) - (4)].yt_ac_constant_expression_list) ); ;}
    break;

  case 277:
    { (yyval.yt_ac_constant_expression_option)=Noac_constant_expression(); ;}
    break;

  case 278:
    { (yyval.yt_ac_constant_expression_option)=Yesac_constant_expression((yyvsp[(2) - (2)].yt_ac_constant_expression)); ;}
    break;

  case 279:
    { (yyval.yt_ac_constant_expression_option)=Noac_constant_expression(); ;}
    break;

  case 280:
    { (yyval.yt_ac_constant_expression_option)=Yesac_constant_expression((yyvsp[(2) - (2)].yt_ac_constant_expression)); ;}
    break;

  case 281:
    { (yyval.yt_ac_constant_expression_option)=Yesac_constant_expression((yyvsp[(2) - (3)].yt_ac_constant_expression)); ;}
    break;

  case 282:
    { (yyval.yt_ac_declaration_specifiers) = Consac_declaration_specifiers(
		AcDeclSpecTypeSpec( (yyvsp[(1) - (1)].yt_ac_type_specifier) ),
		Nilac_declaration_specifiers() ); ;}
    break;

  case 283:
    { (yyval.yt_ac_declaration_specifiers) = Consac_declaration_specifiers(
	     AcDeclSpecTypeSpec( (yyvsp[(2) - (2)].yt_ac_type_specifier) ),
	     Consac_declaration_specifiers(
		AcDeclSpecStorageSpec( (yyvsp[(1) - (2)].yt_ac_storage_class_specifier) ),
		Nilac_declaration_specifiers() )); ;}
    break;

  case 284:
    { (yyval.yt_ac_declaration_specifiers) = Consac_declaration_specifiers(
	     AcDeclSpecTypeSpec( (yyvsp[(2) - (2)].yt_ac_type_specifier) ),
	     Consac_declaration_specifiers(
	       AcDeclSpecTypeQual( (yyvsp[(1) - (2)].yt_ac_type_qualifier) ),
	       Nilac_declaration_specifiers() )); ;}
    break;

  case 285:
    { (yyval.yt_ac_declaration_specifiers) = Consac_declaration_specifiers(
	     AcDeclSpecTypeSpec( (yyvsp[(3) - (3)].yt_ac_type_specifier) ),
	     Consac_declaration_specifiers(
	       AcDeclSpecTypeQual( (yyvsp[(2) - (3)].yt_ac_type_qualifier) ),
	       Consac_declaration_specifiers(
		 AcDeclSpecStorageSpec( (yyvsp[(1) - (3)].yt_ac_storage_class_specifier) ),
		 Nilac_declaration_specifiers() )));
	;}
    break;

  case 286:
    { (yyval.yt_ac_declaration_specifiers) = Consac_declaration_specifiers(
		AcDeclSpecTypeSpec( (yyvsp[(1) - (1)].yt_ac_type_specifier) ),
		Nilac_declaration_specifiers() ); ;}
    break;

  case 287:
    { (yyval.yt_ac_declaration_specifiers) = Consac_declaration_specifiers(
	     AcDeclSpecTypeSpec( (yyvsp[(2) - (2)].yt_ac_type_specifier) ),
	     Consac_declaration_specifiers(
		AcDeclSpecStorageSpec( (yyvsp[(1) - (2)].yt_ac_storage_class_specifier) ),
		Nilac_declaration_specifiers() )); ;}
    break;

  case 288:
    { (yyval.yt_ac_declaration_specifiers) = Consac_declaration_specifiers(
	     AcDeclSpecTypeSpec( (yyvsp[(2) - (2)].yt_ac_type_specifier) ),
	     Consac_declaration_specifiers(
	       AcDeclSpecTypeQual( (yyvsp[(1) - (2)].yt_ac_type_qualifier) ),
	       Nilac_declaration_specifiers() )); ;}
    break;

  case 289:
    { (yyval.yt_ac_declaration_specifiers) = Consac_declaration_specifiers(
	     AcDeclSpecTypeSpec( (yyvsp[(3) - (3)].yt_ac_type_specifier) ),
	     Consac_declaration_specifiers(
	       AcDeclSpecTypeQual( (yyvsp[(2) - (3)].yt_ac_type_qualifier) ),
	       Consac_declaration_specifiers(
		 AcDeclSpecStorageSpec( (yyvsp[(1) - (3)].yt_ac_storage_class_specifier) ),
		 Nilac_declaration_specifiers() )));
	;}
    break;

  case 290:
    { (yyval.yt_ac_storage_class_specifier) = AcAuto(); ;}
    break;

  case 291:
    { (yyval.yt_ac_storage_class_specifier) = AcRegister(); ;}
    break;

  case 292:
    { (yyval.yt_ac_storage_class_specifier) = AcStatic(); ;}
    break;

  case 293:
    { (yyval.yt_ac_storage_class_specifier) = AcExtern(); ;}
    break;

  case 294:
    { (yyval.yt_ac_storage_class_specifier) = AcTypedef(); ;}
    break;

  case 295:
    { (yyval.yt_ac_storage_class_specifier) = AcVirtual(); ;}
    break;

  case 296:
    { (yyval.yt_ac_storage_class_specifier) = AcStatic(); ;}
    break;

  case 297:
    { (yyval.yt_ac_declaration_specifiers) = Nilac_declaration_specifiers(); ;}
    break;

  case 298:
    { (yyval.yt_ac_declaration_specifiers) = Consac_declaration_specifiers(
			AcDeclSpecStorageSpec( AcVirtual() ),
			Nilac_declaration_specifiers()
		);
	;}
    break;

  case 299:
    { (yyval.yt_ac_type_specifier) = AcTypeSpec( (yyvsp[(1) - (1)].yt_ID) ); ;}
    break;

  case 300:
    { (yyval.yt_ac_type_qualifier) = AcConst(); ;}
    break;

  case 301:
    { (yyval.yt_ac_type_qualifier) = AcVolatile(); ;}
    break;

  case 302:
    { (yyval.yt_ac_type_qualifier) = AcUnsigned(); ;}
    break;

  case 303:
    { (yyval.yt_ac_declarator) = AcDeclarator( Nopointer(), AcNoRef(), (yyvsp[(1) - (1)].yt_ac_direct_declarator) ); ;}
    break;

  case 304:
    { (yyval.yt_ac_declarator) = AcDeclarator( Yespointer( (yyvsp[(1) - (2)].yt_ac_pointer) ), AcNoRef(), (yyvsp[(2) - (2)].yt_ac_direct_declarator) ); ;}
    break;

  case 305:
    { (yyval.yt_ac_declarator) = AcDeclarator( Nopointer(), AcRef(), (yyvsp[(2) - (2)].yt_ac_direct_declarator) ); ;}
    break;

  case 306:
    { (yyval.yt_ac_declarator) = AcDeclarator( Yespointer( (yyvsp[(1) - (3)].yt_ac_pointer) ), AcRef(), (yyvsp[(3) - (3)].yt_ac_direct_declarator) ); ;}
    break;

  case 307:
    { (yyval.yt_ac_declarator) = AcDeclarator(Nopointer(), AcNoRef(), (yyvsp[(1) - (1)].yt_ac_direct_declarator) ); ;}
    break;

  case 308:
    { (yyval.yt_ac_declarator) = AcDeclarator( Yespointer( (yyvsp[(1) - (2)].yt_ac_pointer) ), AcNoRef(), (yyvsp[(2) - (2)].yt_ac_direct_declarator) ); ;}
    break;

  case 309:
    { (yyval.yt_ac_declarator) = AcDeclarator(Nopointer(), AcRef(), (yyvsp[(2) - (2)].yt_ac_direct_declarator) ); ;}
    break;

  case 310:
    { (yyval.yt_ac_declarator) = AcDeclarator( Yespointer( (yyvsp[(1) - (3)].yt_ac_pointer) ), AcRef(), (yyvsp[(3) - (3)].yt_ac_direct_declarator) ); ;}
    break;

  case 311:
    { (yyval.yt_ac_declarator) = AcDeclarator( Nopointer(), AcNoRef(), (yyvsp[(1) - (1)].yt_ac_direct_declarator) ); ;}
    break;

  case 312:
    { (yyval.yt_ac_declarator) = AcDeclarator( Yespointer( (yyvsp[(1) - (2)].yt_ac_pointer) ), AcNoRef(), (yyvsp[(2) - (2)].yt_ac_direct_declarator) ); ;}
    break;

  case 313:
    { (yyval.yt_ac_declarator) = AcDeclarator( Nopointer(), AcRef(), (yyvsp[(2) - (2)].yt_ac_direct_declarator) ); ;}
    break;

  case 314:
    { (yyval.yt_ac_declarator) = AcDeclarator( Yespointer( (yyvsp[(1) - (3)].yt_ac_pointer) ), AcRef(), (yyvsp[(3) - (3)].yt_ac_direct_declarator) ); ;}
    break;

  case 315:
    { (yyval.yt_ac_declarator) = AcDeclarator( Yespointer( (yyvsp[(1) - (2)].yt_ac_pointer) ), AcNoRef(), (yyvsp[(2) - (2)].yt_ac_direct_declarator) ); ;}
    break;

  case 316:
    { (yyval.yt_ac_declarator) = AcDeclarator( Yespointer( (yyvsp[(1) - (3)].yt_ac_pointer) ), AcRef(), (yyvsp[(3) - (3)].yt_ac_direct_declarator) ); ;}
    break;

  case 317:
    { (yyval.yt_ac_direct_declarator) = AcDirectDeclId( (yyvsp[(1) - (1)].yt_ID) ); ;}
    break;

  case 318:
    { (yyval.yt_ac_direct_declarator) = AcDirectDeclPack( (yyvsp[(2) - (3)].yt_ac_declarator) ); ;}
    break;

  case 319:
    { (yyval.yt_ac_direct_declarator) = AcDirectDeclArray( (yyvsp[(1) - (4)].yt_ac_direct_declarator), (yyvsp[(3) - (4)].yt_ac_constant_expression_option) ); ;}
    break;

  case 320:
    { (yyval.yt_ac_direct_declarator) = AcDirectDeclProto( (yyvsp[(1) - (4)].yt_ac_direct_declarator), (yyvsp[(3) - (4)].yt_ac_parameter_type_list) ); ;}
    break;

  case 321:
    { (yyval.yt_ac_direct_declarator) = AcMemberDecl( (yyvsp[(1) - (4)].yt_ID), (yyvsp[(3) - (4)].yt_ID), (yyvsp[(4) - (4)].yt_ac_constant_expression_list) ); ;}
    break;

  case 322:
    { (yyval.yt_ac_constant_expression_list)=Nilac_constant_expression_list(); ;}
    break;

  case 323:
    { (yyval.yt_ac_constant_expression_list)=Consac_constant_expression_list((yyvsp[(3) - (4)].yt_ac_constant_expression),(yyvsp[(1) - (4)].yt_ac_constant_expression_list)); ;}
    break;

  case 324:
    { (yyval.yt_ac_constant_expression_list)=Consac_constant_expression_list((yyvsp[(1) - (1)].yt_ac_constant_expression), Nilac_constant_expression_list()); ;}
    break;

  case 325:
    { (yyval.yt_ac_constant_expression_list)=Consac_constant_expression_list((yyvsp[(3) - (3)].yt_ac_constant_expression),(yyvsp[(1) - (3)].yt_ac_constant_expression_list)); ;}
    break;

  case 326:
    {
    ac_direct_declarator decl=NULL;
	ac_class_qualifier_list q=f_check_build_qualifier((yyvsp[(1) - (5)].yt_ac_class_qualifier_help_list),decl);
	(yyval.yt_ac_direct_declarator) = AcQualifiedDeclProto( q, decl, (yyvsp[(3) - (5)].yt_ac_parameter_type_list) ,(yyvsp[(5) - (5)].yt_ac_type_qualifier) );
	;}
    break;

  case 327:
    {
	ac_direct_declarator decl=NULL;
	ac_class_qualifier_list q=f_check_build_qualifier((yyvsp[(1) - (5)].yt_ac_class_qualifier_help_list),decl);
	(yyval.yt_ac_direct_declarator) = AcQualifiedDeclProto( q, decl, AcParList( Nilac_parameter_list() ),(yyvsp[(5) - (5)].yt_ac_type_qualifier) );
        yyerrok;
    ;}
    break;

  case 328:
    { (yyval.yt_ac_class_qualifier_help_list)=Consac_class_qualifier_help_list((yyvsp[(1) - (1)].yt_ac_direct_declarator),Nilac_class_qualifier_help_list()); ;}
    break;

  case 329:
    { (yyval.yt_ac_class_qualifier_help_list)=Consac_class_qualifier_help_list((yyvsp[(3) - (3)].yt_ac_direct_declarator),(yyvsp[(1) - (3)].yt_ac_class_qualifier_help_list)); ;}
    break;

  case 330:
    { (yyval.yt_ac_direct_declarator)=AcDirectDeclId((yyvsp[(1) - (1)].yt_ID)); ;}
    break;

  case 331:
    {
	ac_operator_name op_name=AcOperatorName((yyvsp[(2) - (2)].yt_casestring));
	pf_setfileline( op_name );
	(yyval.yt_ac_direct_declarator)=AcOperatorDeclId(op_name);
    ;}
    break;

  case 332:
    { (yyval.yt_ac_type_qualifier)=AcNoQualifier(); ;}
    break;

  case 333:
    { (yyval.yt_ac_type_qualifier)=AcConst(); ;}
    break;

  case 334:
    { (yyval.yt_ac_pointer) = AcPointerNil( Nilac_type_qualifier_list() ); ;}
    break;

  case 335:
    { (yyval.yt_ac_pointer) = AcPointerNil( (yyvsp[(2) - (2)].yt_ac_type_qualifier_list) ); ;}
    break;

  case 336:
    { (yyval.yt_ac_pointer) = AcPointerCons( Nilac_type_qualifier_list(), (yyvsp[(2) - (2)].yt_ac_pointer) ); ;}
    break;

  case 337:
    { (yyval.yt_ac_pointer) = AcPointerCons( (yyvsp[(2) - (3)].yt_ac_type_qualifier_list), (yyvsp[(3) - (3)].yt_ac_pointer) ); ;}
    break;

  case 338:
    { (yyval.yt_ac_type_qualifier_list) = Consac_type_qualifier_list( (yyvsp[(1) - (1)].yt_ac_type_qualifier), Nilac_type_qualifier_list() ); ;}
    break;

  case 339:
    { (yyval.yt_ac_type_qualifier_list) = Consac_type_qualifier_list( (yyvsp[(2) - (2)].yt_ac_type_qualifier), (yyvsp[(1) - (2)].yt_ac_type_qualifier_list) ); ;}
    break;

  case 340:
    { (yyval.yt_ac_parameter_type_list) = AcParList( Nilac_parameter_list() ); ;}
    break;

  case 341:
    { (yyval.yt_ac_parameter_type_list) = AcParList3Dot( Nilac_parameter_list() ); ;}
    break;

  case 342:
    { (yyval.yt_ac_parameter_type_list) = AcParList( (yyvsp[(1) - (1)].yt_ac_parameter_list) ); ;}
    break;

  case 343:
    { (yyval.yt_ac_parameter_type_list) = AcParList3Dot( (yyvsp[(1) - (2)].yt_ac_parameter_list) ); ;}
    break;

  case 344:
    { (yyval.yt_ac_parameter_type_list) = AcParList3Dot( (yyvsp[(1) - (3)].yt_ac_parameter_list) ); ;}
    break;

  case 345:
    { (yyval.yt_ac_parameter_list) = Consac_parameter_list( (yyvsp[(1) - (1)].yt_ac_parameter_declaration), Nilac_parameter_list() ); ;}
    break;

  case 346:
    { (yyval.yt_ac_parameter_list) = Consac_parameter_list( (yyvsp[(3) - (3)].yt_ac_parameter_declaration), (yyvsp[(1) - (3)].yt_ac_parameter_list) ); ;}
    break;

  case 347:
    { (yyval.yt_ac_parameter_declaration) = AcParDeclDecl( (yyvsp[(1) - (3)].yt_ac_declaration_specifiers), (yyvsp[(2) - (3)].yt_ac_declarator), (yyvsp[(3) - (3)].yt_ac_constant_expression_option) ); ;}
    break;

  case 348:
    { (yyval.yt_ac_parameter_declaration) = AcParDeclAbsdecl( (yyvsp[(1) - (3)].yt_ac_declaration_specifiers), (yyvsp[(2) - (3)].yt_ac_abstract_declarator), (yyvsp[(3) - (3)].yt_ac_constant_expression_option) ); ;}
    break;

  case 349:
    { (yyval.yt_ac_abstract_declarator) = AcAbsdeclPointer( (yyvsp[(1) - (1)].yt_ac_pointer) ); ;}
    break;

  case 350:
    { (yyval.yt_ac_abstract_declarator) = AcAbsdeclDirdecl( Nopointer(), (yyvsp[(1) - (1)].yt_ac_direct_abstract_declarator) ); ;}
    break;

  case 351:
    { (yyval.yt_ac_abstract_declarator) = AcAbsdeclDirdecl( Yespointer( (yyvsp[(1) - (2)].yt_ac_pointer) ), (yyvsp[(2) - (2)].yt_ac_direct_abstract_declarator) ); ;}
    break;

  case 352:
    { (yyval.yt_ac_direct_abstract_declarator) = AcDirAbsdeclPack( (yyvsp[(2) - (3)].yt_ac_abstract_declarator) ); ;}
    break;

  case 353:
    { (yyval.yt_ac_direct_abstract_declarator) = AcDirAbsdeclArray( Yesac_direct_abstract_declarator( (yyvsp[(1) - (4)].yt_ac_direct_abstract_declarator) ), (yyvsp[(3) - (4)].yt_ac_constant_expression_option) ); ;}
    break;

  case 354:
    { (yyval.yt_ac_direct_abstract_declarator) = AcDirAbsdeclArray( Noac_direct_abstract_declarator(), (yyvsp[(2) - (3)].yt_ac_constant_expression_option) ); ;}
    break;

  case 355:
    { (yyval.yt_ac_direct_abstract_declarator) = AcDirAbsdeclFn( Yesac_direct_abstract_declarator( (yyvsp[(1) - (4)].yt_ac_direct_abstract_declarator) ), (yyvsp[(3) - (4)].yt_ac_parameter_type_list) ); ;}
    break;

  case 356:
    { (yyval.yt_ac_direct_abstract_declarator) = AcDirAbsdeclFn( Noac_direct_abstract_declarator(), (yyvsp[(2) - (3)].yt_ac_parameter_type_list) ); ;}
    break;

  case 357:
    { (yyval.yt_ac_constant_expression_option) = Yesac_constant_expression( (yyvsp[(1) - (1)].yt_ac_constant_expression) ); ;}
    break;

  case 358:
    { do_CEXPR(); ;}
    break;

  case 359:
    { do_NORMAL();
	 (yyval.yt_ac_constant_expression) = AcConstExpr( (yyvsp[(2) - (2)].yt_Cexpression) ); ;}
    break;

  case 360:
    { (yyval.yt_ID) = (yyvsp[(1) - (1)].yt_ID); ;}
    break;

  case 361:
    { (yyval.yt_ID) = (yyvsp[(2) - (2)].yt_ID); pf_setwithvariable( (yyvsp[(2) - (2)].yt_ID) ); ;}
    break;

  case 362:
    { (yyval.yt_Ctext) = (yyvsp[(1) - (1)].yt_Ctext); ;}
    break;

  case 363:
    { yyerrok; ;}
    break;

  case 364:
    { (yyval.yt_Ctext) = (yyvsp[(4) - (4)].yt_Ctext); ;}
    break;

  case 365:
    { yyerrok; (yyval.yt_languageoption) = LanguageList((yyvsp[(2) - (4)].yt_languagenames)); ;}
    break;

  case 366:
    { yyerrok; (yyval.yt_languageoption) = NoLanguagename(); ;}
    break;

  case 367:
    { (yyval.yt_languagenames) = Conslanguagenames( (yyvsp[(1) - (1)].yt_ID), Nillanguagenames()); ;}
    break;

  case 368:
    { yyerrok; (yyval.yt_languagenames) = Conslanguagenames( (yyvsp[(3) - (3)].yt_ID), (yyvsp[(1) - (3)].yt_languagenames) ); ;}
    break;

  case 369:
    { (yyval.yt_languagenames) = Nillanguagenames(); ;}
    break;

  case 370:
    { (yyval.yt_languagenames) = (yyvsp[(1) - (2)].yt_languagenames); ;}
    break;

  case 371:
    { (yyval.yt_languagenames) = (yyvsp[(1) - (3)].yt_languagenames); ;}
    break;

  case 372:
    { yyerrok; (yyval.yt_languagenames) = Conslanguagenames( (yyvsp[(3) - (3)].yt_ID), (yyvsp[(1) - (3)].yt_languagenames) ); ;}
    break;

  case 373:
    { yyerrok; (yyval.yt_languagenames) = (yyvsp[(2) - (3)].yt_languagenames); pg_languageshavebeendefined = true; ;}
    break;

  case 374:
    { yyerrok; (yyval.yt_languagenames) = Nillanguagenames(); ;}
    break;

  case 375:
    { (yyval.yt_languagenames) = Conslanguagenames( (yyvsp[(1) - (1)].yt_ID), Nillanguagenames()); ;}
    break;

  case 376:
    { (yyval.yt_languagenames) = Conslanguagenames( (yyvsp[(2) - (2)].yt_ID), (yyvsp[(1) - (2)].yt_languagenames) ); ;}
    break;

  case 377:
    { (yyval.yt_languagenames) = Conslanguagenames( (yyvsp[(3) - (3)].yt_ID), (yyvsp[(1) - (3)].yt_languagenames) ); ;}
    break;

  case 378:
    { (yyval.yt_languagenames) = (yyvsp[(1) - (2)].yt_languagenames); ;}
    break;

  case 379:
    { (yyval.yt_languagenames) = (yyvsp[(1) - (3)].yt_languagenames); ;}
    break;


/* Line 1267 of yacc.c.  */
      default: break;
    }
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;


  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
      {
	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
	  {
	    YYSIZE_T yyalloc = 2 * yysize;
	    if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
	      yyalloc = YYSTACK_ALLOC_MAXIMUM;
	    if (yymsg != yymsgbuf)
	      YYSTACK_FREE (yymsg);
	    yymsg = (char *) YYSTACK_ALLOC (yyalloc);
	    if (yymsg)
	      yymsg_alloc = yyalloc;
	    else
	      {
		yymsg = yymsgbuf;
		yymsg_alloc = sizeof yymsgbuf;
	      }
	  }

	if (0 < yysize && yysize <= yymsg_alloc)
	  {
	    (void) yysyntax_error (yymsg, yystate, yychar);
	    yyerror (yymsg);
	  }
	else
	  {
	    yyerror (YY_("syntax error"));
	    if (yysize != 0)
	      goto yyexhaustedlab;
	  }
      }
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse look-ahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse look-ahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  *++yyvsp = yylval;


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#ifndef yyoverflow
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEOF && yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval);
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}




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

