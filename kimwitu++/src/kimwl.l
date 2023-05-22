%{
//
// The Termprocessor Kimwitu++
//
// Copyright (C) 1991 University of Twente, Dept TIOS.
// Copyright (C) 1997-2007 Humboldt-Universität zu Berlin, Institute of Informatics
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
%option noyywrap
%option never-interactive
%{
/*
 * kimwl.l
 */
static char kimwl_lAccesSid[] = "@(#)$Id: kimwl.l,v 1.40 2007-01-30 14:10:30 piefel Exp $";

/* For windows (NT at least) we need to redefine fileno */
#if defined(_WIN32) && ! defined (__GNUC__)
# define fileno _fileno
#endif


/***************************************************************************/
/*
 * Name conventions: tokens and states are in CAPITALS
 * operators are capitalized
 *
 */
%}

%start NORMAL INCL INCLSTART CEXPR CEXPRDQ CEXPRSQ C OPNAME
%x OPTION
%{
#include <cstdlib>
#include <string>

#include "k.h"
#include "yystype.h"
#include "kimwy.h"

namespace {
std::string cinclude("");
int cinit_paren_nesting =0;
int cinit_array_nesting =0;
void reset_nestcount();

int eat_comment(casestring);
void eat_line_comment();
void count(bool = true);
} // namespace
%}

special [\_]
ident   (([[:alpha:]]|{special})([[:alnum:]]|{special})*)
nonident [^a-zA-Z0-9\_]
int     ([[:digit:]]+)
exp     ([Ee][-+]?[[:digit:]]+)
float   ([-+]?[[:digit:]]+\.?[[:digit:]]*)
wsnl	[\ \n\t\v\f]
ws	[\ \t]

op_name (\+|-|\*|\/|%|^|&|\||~|!|=|<|>|\+=|-=|\*=|\/=|%=|^=|&=|\|=|<<|>>|<<=|>>=|==|!=|<=|>=|&&|\|\||\+\+|--|,|->\*|->)
operator_name ({op_name}|new(\[\])?|delete(\[\])?|\[\]|\(\))

%%
<NORMAL>{wsnl}			 	{ count(false); }
<NORMAL>^%uview				{ count(); return T_PERCENTUVIEW; }
<NORMAL>%uviewvar			{ count(); return T_PERCENTUVIEWVAR; }
<NORMAL>^%rview				{ count(); return T_PERCENTRVIEW; }
<NORMAL>%rviewvar			{ count(); return T_PERCENTRVIEWVAR; }
<NORMAL>^%storageclass			{ count(); return T_PERCENTSTORAGECLASS; }
<NORMAL>^%language			{ count(); return T_PERCENTLANGUAGE; }
<NORMAL>^%option			{ count(); BEGIN OPTION; }

<NORMAL>^\%\{{ws}*			{ count(); BEGIN INCLSTART; return T_INCLUDESTART; }
<INCLSTART>{ident}			{ count(); yylval.yt_casestring = mkcasestring(yytext); return T_ID; }
<INCLSTART>{ws}				{ count(false); }
<INCLSTART>\n				{ count(); cinclude = ""; cinclude.reserve(1024); BEGIN INCL; return T_ENDOFINCLUDESTART; }
<INCL>.|\n				{ count(); cinclude += yytext[0]; }
<INCL>^\%\{{ws}*			{ count(); v_report(Warning(FileLine(pg_filename, pg_lineno), Problem1S("Opening '%{' (nested C++ includes; preceding closing '%}' not found)"))); cinclude += yytext; }
<INCL>^\%\}{ws}*\n			{ count(); BEGIN NORMAL; yylval.yt_casestring = mkcasestring(cinclude.c_str()); return T_INCLUDEEND; }
<C,CEXPR>\/\*				{ count(); yylval.yt_integer = mkinteger(eat_comment(pg_filename)); return T_CNEWLINES; }
<NORMAL,INCLSTART>\/\*			{ count(); eat_comment(pg_filename); }
<C,CEXPR>\/\/				{ count(); eat_line_comment(); yylval.yt_integer = mkinteger(1); return T_CNEWLINES; }
<NORMAL,INCLSTART>\/\/			{ count(); eat_line_comment(); }
<NORMAL>\-\>				{ count(); return T_ARROW; }
<NORMAL>provided			{ count(); return T_PROVIDED; }
<NORMAL>default				{ count(); return T_DEFAULT; }
<NORMAL>\-?{int}			{ count(); yylval.yt_integer = mkinteger(atoi(yytext)); return T_INT; }
<NORMAL>list				{ count(); return T_LIST; }
<NORMAL>static				{ count(); return T_STATIC; }
<NORMAL>auto				{ count(); return T_AUTO; }
<NORMAL>register			{ count(); return T_REGISTER; }
<NORMAL>extern				{ count(); return T_EXTERN; }
<NORMAL>typedef				{ count(); return T_TYPEDEF; }
<NORMAL>const				{ count(); return T_CONST; }
<NORMAL>volatile			{ count(); return T_VOLATILE; }
<NORMAL>unsigned			{ count(); return T_UNSIGNED; }
<NORMAL>virtual				{ count(); return T_VIRTUAL; }
<NORMAL>operator			{ count(); BEGIN OPNAME; return T_OPERATOR; }
<NORMAL>^%ctor				{ count(); return T_CONSTRUCTOR; }
<NORMAL>^%dtor				{ count(); return T_DESTRUCTOR; }
<NORMAL>^%member			{ count(); return T_MEMBER; }
<NORMAL>^%attr				{ count(); return T_ATTR; }
<NORMAL>^%base				{ count(); return T_BASECLASS; }
<NORMAL>\.\.\.				{ count(); return T_DOTDOTDOT; }
<NORMAL>::				{ count(); return T_COLONCOLON; }
<OPNAME>{wsnl}*			 	{ count(false); }
<OPNAME>{operator_name}			{ count(); BEGIN NORMAL; yylval.yt_casestring = mkcasestring(yytext); return T_OPNAME ; }
<OPNAME>{ident}				{ count(); BEGIN NORMAL; yylval.yt_casestring = mkcasestring(yytext); return T_ID ; }
<NORMAL>{ident}	 			{ count(); yylval.yt_casestring = mkcasestring(yytext); return T_ID ; }
<CEXPR>[^\n\\"';,\(\)\[\]$]+		{ count(); yylval.yt_casestring = mkcasestring(yytext); return T_CEXPRESSION; }
<NORMAL,CEXPR>\${int}			{ count(); yylval.yt_integer = mkinteger(atoi(yytext+1)); return T_DOLLARVAR; }
<NORMAL>\$\{				{ count(); return T_UNPBLOCKSTART; }
<NORMAL>\$\}				{ count(); return T_UNPBLOCKEND; }
<CEXPR>\$				{ count(); yylval.yt_casestring = mkcasestring(yytext); return T_CEXPRESSION; }
<CEXPR,CEXPRDQ,CEXPRSQ,C>\n		{ count(); return yytext[0]; }
<CEXPR,CEXPRDQ,CEXPRSQ>\\		{ count(); yylval.yt_casestring = mkcasestring("\\"); return T_CEXPRESSION; }
<CEXPR,CEXPRDQ,CEXPRSQ>\\\\		{ count(); yylval.yt_casestring = mkcasestring("\\\\"); return T_CEXPRESSION; }
<NORMAL,C,CEXPR>\"			{ count(); BEGIN CEXPRDQ; return yytext[0]; }
<NORMAL,C,CEXPR>'			{ count(); BEGIN CEXPRSQ; return yytext[0]; }
<CEXPR>;				{ count(); BEGIN NORMAL; reset_nestcount(); return yytext[0]; }
<CEXPR>\,				{ count(); return yytext[0]; }
<CEXPR>\(				{ count(); cinit_paren_nesting++;  yylval.yt_casestring = mkcasestring("(");  return yytext[0]; }
<CEXPR>\)				{ count(); if (cinit_paren_nesting == 0) {
					      BEGIN NORMAL; reset_nestcount(); return yytext[0];
					    } else {
					      cinit_paren_nesting--; yylval.yt_casestring = mkcasestring(")");  return yytext[0]; }
					}
<CEXPR>\[				{ count(); cinit_array_nesting++;  yylval.yt_casestring = mkcasestring("[");  return yytext[0]; }
<CEXPR>\]				{ count(); if (cinit_array_nesting == 0) {
					      BEGIN NORMAL; reset_nestcount(); return yytext[0];
					    } else {
					      cinit_array_nesting--; yylval.yt_casestring = mkcasestring("]");  return yytext[0]; }
					}
<CEXPRDQ>[^\n\\"]+			{ count(); yylval.yt_casestring = mkcasestring(yytext); return T_CEXPRESSION; }
<CEXPRDQ>\"				{ count(); BEGIN CEXPR; return yytext[0]; }
<CEXPRDQ>\\\"				{ count(); yylval.yt_casestring = mkcasestring("\\\""); return T_CEXPRESSION; }
<CEXPRSQ>'				{ count(); BEGIN CEXPR; return yytext[0]; }
<CEXPRSQ>\\'				{ count(); yylval.yt_casestring = mkcasestring("\\'"); return T_CEXPRESSION; }
<CEXPRSQ>[^\n\\']+			{ count(); yylval.yt_casestring = mkcasestring(yytext); return T_CEXPRESSION; }
<C>\$\$					{ count(); yylval.yt_casestring = mkcasestring("$"); return T_CLINE; }
<C>\\\\					{ count(); yylval.yt_casestring = mkcasestring("\\\\"); return T_CLINE; }
<C>\\					{ count(); yylval.yt_casestring = mkcasestring("\\"); return T_CLINE ; }
<C>\$\{					{ count(); yylval.yt_casestring = mkcasestring("{"); /*WARNING-NO LONGER SUPPORTED*/ return T_CLINE ; }
<C>\$\}					{ count(); yylval.yt_casestring = mkcasestring("}"); /*WARNING-NO LONGER SUPPORTED*/ return T_CLINE ; }
<C>\$[0-9]*				{ count(); if (strcmp(yytext, "$") == 0) return yytext[0];
					  yylval.yt_integer = mkinteger(atoi(yytext+1));
					  return T_DOLLARVAR;
					}
<C>{wsnl}*afterforeach/{nonident}	{ count(); return T_FOREACH_AFTER; }
<C>{ident}				{ count(); if (strcmp(yytext, "foreach") ==0) {
					      return T_FOREACH;
					  } else if (strcmp(yytext, "afterforeach") ==0) {
					      return T_FOREACH_AFTER;
					  } else if (strcmp(yytext, "with") ==0) {
					      return T_WITH;
					  } else {
					      yylval.yt_casestring = mkcasestring(yytext);
					      return T_CLINE ;
					  }
					}
<C>[^\n{}w/"'a-zA-Z_\$\\]+		{ count(); yylval.yt_casestring = mkcasestring(yytext); return T_CLINE; }
<C>\/					{ count(); yylval.yt_casestring = mkcasestring(yytext); return T_CLINE; }
<C>\/\*[ \t]*EMPTY[ \t]*\*\/		{ count(); yylval.yt_casestring = mkcasestring(yytext); return T_CLINE; }
<C>\/\*[ \t]*NOTREACHED[ \t]*\*\/	{ count(); yylval.yt_casestring = mkcasestring(yytext); return T_CLINE; }
<C>\/\*[ \t]*SUPPRESS[ \t]*[0-9]+[ \t]*\*\/	{ count(); yylval.yt_casestring = mkcasestring(yytext); return T_CLINE; }
.					{ count(); return yytext[0]; }

<OPTION>[ \t]*			 	{ count(false); }
<OPTION>\n				{ count(false); BEGIN NORMAL; }
<OPTION>yystype				{ count(); if (g_options.for_bison!="" && g_options.for_bison!="yystype.h") v_report(Warning(FileLine(pg_filename, pg_lineno), Problem2S("Name of yystype header is set to ", g_options.for_bison.c_str()))); else g_options.for_bison="yystype.h"; }
<OPTION>no-csgio			{ count(); g_options.no_csgio=true; }
<OPTION>no-unparse			{ count(); g_options.no_unparse=true; }
<OPTION>no-rewrite			{ count(); g_options.no_rewrite=true; }
<OPTION>no-printdot			{ count(); g_options.no_printdot=true; }
<OPTION>no-hashtables			{ count(); g_options.no_hashtables=true; }
<OPTION>smart-pointer			{ count(); g_options.smart_pointer=true; }
<OPTION>weak-pointer			{ count(); g_options.smart_pointer=true; g_options.weak_pointer=true; }
<OPTION>.				{ count(); return yytext[0]; }

%%

void do_NORMAL()	{ BEGIN NORMAL; reset_nestcount(); }
void do_CEXPR()		{ BEGIN CEXPR; }
void do_CEXPRDQ()	{ BEGIN CEXPRDQ; }
void do_CEXPRSQ()	{ BEGIN CEXPRSQ; }
void do_C()		{ BEGIN C; }

namespace {
void
reset_nestcount()
{
    /* WARNING if these are not == 0 */
    if (cinit_paren_nesting != 0) {
	v_report( NonFatal( PosNoFileLine(), Problem1S( "opening parenthesis '(' was not closed" )));
    }
    if (cinit_array_nesting != 0) {
	v_report( NonFatal( PosNoFileLine(), Problem1S( "opening bracket '[' was not closed" )));
    }
    cinit_paren_nesting = 0;
    cinit_array_nesting = 0;
}

int
eat_comment(casestring start_filename)
{
    char c1, c2;		/* comment string */
    int nest;
    int start_lineno = pg_lineno;

    for(nest=1, c2 = ' ';;){
	c1 = c2;
	c2 = yyinput();
	if (c2 == '\n') {
	    pg_lineno++;
	    pg_column = 0;
	    pg_charpos ++;
	} else if (c2 == '\t') {
	    pg_column += 8	- (pg_column %	8);
	    pg_charpos += 8	- (pg_charpos %	8);
	} else if (c2 == 0) {
	    v_report( Fatal( FileLine( start_filename, start_lineno ), Problem1S( "start of comment containing unexpected eof" )));
	} else {
	    pg_column++;
	    pg_charpos ++;
	}
	if (c1 == '/' && c2 == '*')
	    nest++;
	else if (c1 == '*' && c2 == '/')
	    nest--;
	if (nest <= 0)
	    break;
    }
    return pg_lineno - start_lineno;
}

void
eat_line_comment()
{
    while (yyinput()!='\n')
	;
    pg_lineno++;
    pg_column = 0;
    pg_charpos++;
}

void
count(bool notwhite)
{
    register char *s;

#ifdef MYLEXDEBUG
    if (notwhite)
	printf ("symbol	found: %s\n", yytext);
#endif
    for	(s = yytext; *s; s++)
	if (*s == '\n')	{
	    pg_column = 0;
	    pg_lineno++;
	    pg_charpos++;
	} else if	(*s	== '\t') {
	    pg_column += 8	- (pg_column %	8);
	    pg_charpos += 8	- (pg_charpos %	8);
	} else {
	    pg_column++;
	    pg_charpos++;
	}
}

} // namespace

// vim:sts=4:ts=8:cino=g0,t0,\:0
