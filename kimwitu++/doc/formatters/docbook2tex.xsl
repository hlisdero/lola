<?xml version='1.0'?>
<!-- This stylesheet is licensed under the terms of the GNU General Public Licence.
     Copyright (C) 2002 Michael Piefel, Humboldt-University Berlin -->
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'
  xmlns:exsl="http://exslt.org/common"
  xmlns:str="http://exslt.org/strings"
  xmlns:mpi="http://www.informatik.hu-berlin.de/~piefel" >

<!-- XSL options -->
<xsl:output method="text"/>


<!-- The transformation begins here       {{{-->
<!-- - - - - - - - - - - - - - - - - - - - - -->
<xsl:template match="*">
  UNKNOWN TAG <xsl:value-of select="name()"/><xsl:text> </xsl:text>
  <xsl:message>Unknown tag <xsl:value-of select="name()"/></xsl:message>
  <xsl:apply-templates/>
</xsl:template>

<!-- Titles have to be matched inside their containers -->
<xsl:template match="title"/>

<!--xsl:template name="sectitles">
  <xsl:param name="thetitle" select="0"/>
  <xsl:apply-templates select="$thetitle"/>
</xsl:template-->
<!--}}}-->

<!-- Processing instructions              {{{-->
<!-- - - - - - - - - - - - - - - - - - - - - -->
<xsl:template match="processing-instruction('latex')">
  <xsl:value-of select="."/>
</xsl:template>

<xsl:template match="processing-instruction()">
  % PROCESSING INSTRUCTION NOT HANDLED <xsl:value-of select="name()"/><xsl:text>
  </xsl:text>
</xsl:template>

<!-- Handling text -->
<xsl:template match="text()" mode="value">
  <xsl:apply-templates select="."/>
</xsl:template>

<xsl:template match="text()">
  <xsl:call-template name="str:_replace">
    <xsl:with-param name="string" select="."/>
    <xsl:with-param name="replacements" select="document('')/*/mpi:utf8tolatex/replacement"/>
  </xsl:call-template>
</xsl:template>

<mpi:utf8tolatex>
  <!-- LaTeX special characters -->
  <replacement search="{">\textbraceleft{}</replacement>
  <replacement search="}">\textbraceright{}</replacement>
  <replacement search="$">\$</replacement>
  <replacement search="_">\_</replacement>
  <replacement search="%">\%</replacement>
  <replacement search="#">\#</replacement>
  <replacement search="&amp;">\&amp;</replacement>
  <replacement search="\">\textbackslash{}</replacement>
  <!-- LaTeX T1 ligatures -->
  <replacement search="&lt;&lt;">&lt;\/&lt;</replacement>
  <replacement search="&gt;&gt;">&gt;\/&gt;</replacement>
  <replacement search="--">-\/-</replacement>
  <replacement search="---">-\/-\/-</replacement>
  <replacement search="``">`\/`</replacement>
  <replacement search="''">'\/'</replacement>
  <replacement search="?`">?\/`</replacement>
  <replacement search="!`">!\/`</replacement>
  <!-- Quotation marks -->
  <replacement search="‘">\textquoteleft{}</replacement>
  <replacement search="’">\textquoteright{}</replacement>
  <replacement search="“">\textquotedblleft{}</replacement>
  <replacement search="”">\textquotedblright{}</replacement>
  <replacement search="„">\quotedblbase{}</replacement>
  <replacement search="&#x22;">\textquotedbl{}</replacement>
  <!-- Miscellaneous extra characters -->
  <replacement search="€">\EUR{}</replacement>
  <replacement search="ĳ">{i\kern-.1em j}</replacement>
  <replacement search="‐‐">-\/-</replacement>
  <replacement search="‐">-</replacement>
  <replacement search="––">--\,--</replacement>
  <replacement search="–">--</replacement>
  <replacement search="——">---\,---</replacement>
  <replacement search="—">---</replacement>
  <!--<replacement search="&#xE4F8;">"-</replacement><!- - from Private Use range -->
</mpi:utf8tolatex>

<!--}}}-->

<!-- Document root (book for book)        {{{-->
<!-- - - - - - - - - - - - - - - - - - - - - -->

<xsl:template name="latexheader">
  <xsl:param name="documentclass" select="'scrbook'"/>
\ifx\pdfoutput\undefined
\documentclass[10pt,twoside,dvips ,pointlessnumbers,bibtotoc,idxtotoc,openright]{<xsl:value-of
  select="$documentclass"/>}
\else
\documentclass[10pt,twoside,pdftex,pointlessnumbers,bibtotoc,idxtotoc,openany]{<xsl:value-of
  select="$documentclass"/>}
\pdfcompresslevel=7
\fi
\usepackage[latin1]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{newcent}\renewcommand\sfdefault{pvn}
\usepackage{mdwtab,booktabs,tabularx}
\usepackage{graphicx,color,ngerman,marvosym}
\let\Rightarrow\relax% Marvosym defines \Rightarrow, which is also in euler
\usepackage{euler,xspace,soul,relsize,remreset,float,listings}
\usepackage{makeidx}
\makeindex

\usepackage[T1,hyphens]{url}
\urlstyle{rm}

\lstset{columns=fullflexible,commentstyle=\itshape,literate={&lt;&lt;}{\textless{\kern-0.1em}\textless}2}

\paperwidth=21cm
\paperheight=297mm
\typearea{8}

\makeatletter

\ifx\pdfoutput\undefined
\newcommand{\hyperdef}[2]{}
\else
\setlength{\paperwidth}{24cm}
\setlength{\paperheight}{20cm}
\@twosidefalse
\typearea{15}
\usepackage[pagebackref,colorlinks,bookmarks,bookmarksopen]{hyperref}
\DeclareGraphicsExtensions{.pdf}
\fi % \if PDF

\newif\ifAppendicesBegun
\AppendicesBegunfalse

<xsl:choose>
  <xsl:when test="lang('en')">\selectlanguage{english}</xsl:when>
  <xsl:when test="lang('de')">\selectlanguage{ngerman}</xsl:when>
  <xsl:otherwise>
    <xsl:message>No known language given (try 'en' or 'de')</xsl:message>
  </xsl:otherwise>
</xsl:choose>

\floatstyle{plain}
\newfloat{example}{htb}{loe}[<xsl:choose>
  <xsl:when test="$documentclass='scrbook'">chapter</xsl:when>
  <xsl:otherwise>section</xsl:otherwise>
</xsl:choose>]
\floatname{example}{<xsl:choose>
      <xsl:when test="lang('en')">Example</xsl:when>
      <xsl:when test="lang('de')">Beispiel</xsl:when>
    </xsl:choose>}
%\newenvironment{informalexample}{\pagebreak[3]\kern2pt\hrule\kern-2pt\nopagebreak}{\nopagebreak\hrule\medskip\pagebreak[3]}
\newenvironment{informalexample}{}{\pagebreak[3]}
\restylefloat{table}
</xsl:template> <!-- latexheader -->

<xsl:template match="book">
  <xsl:call-template name="latexheader" />
\@removefromreset{footnote}{chapter}

\makeatother

\begin{document}
  \frontmatter
  <xsl:apply-templates/>
  \printindex
\end{document}
</xsl:template>

<xsl:template match="bookinfo">
\begin{titlepage}
  \enlargethispage{8ex}
  \noindent
  \vspace*{\fill}
  \begin{center}{\bfseries
  \Huge <xsl:apply-templates select="title" mode="value"/>\\[0.5em]
  \Large <xsl:apply-templates select="subtitle" mode="value"/>
  \vfill
  \vfill}
  <xsl:for-each select="author">
    \large <xsl:value-of select="firstname"/><xsl:text> </xsl:text><xsl:value-of select="surname"/>\\
    \normalsize <xsl:for-each select="affiliation">
      <xsl:value-of select="orgname"/>, <xsl:value-of select="orgdiv"/>\\
    </xsl:for-each>
    ~\\[1ex]
  </xsl:for-each>
  \end{center}
  \vfill
\end{titlepage}
\thispagestyle{empty}
\noindent\textbf{\large <xsl:apply-templates select="title" mode="value"/>
<xsl:if test="subtitle">: <xsl:apply-templates select="subtitle" mode="value"/></xsl:if>}\\
<xsl:for-each select="author">
  <xsl:value-of select="firstname"/><xsl:text> </xsl:text><xsl:value-of select="surname"/>
  <xsl:if test="not(position()=last())">, </xsl:if>
</xsl:for-each>
\\[2ex]
<xsl:for-each select="edition"><xsl:apply-templates select="." mode="value"/></xsl:for-each>
<xsl:for-each select="pubdate"><xsl:choose>
    <xsl:when test="../edition"><xsl:choose>
	<xsl:when test="lang('en')">, published </xsl:when>
	<xsl:when test="lang('de')">, veröffentlicht </xsl:when>
    </xsl:choose></xsl:when>
    <xsl:otherwise><xsl:choose>
	<xsl:when test="lang('en')">Published </xsl:when>
	<xsl:when test="lang('de')">Veröffentlicht </xsl:when>
    </xsl:choose></xsl:otherwise>
  </xsl:choose>
  <xsl:value-of select="."/>\\[2ex]<xsl:text/>
</xsl:for-each>

<xsl:for-each select="copyright">
  Copyright © <xsl:for-each select="year"><xsl:value-of select="."/>
    <xsl:if test="not(position()=last())">, </xsl:if>
  </xsl:for-each>~~
  <xsl:for-each select="holder"><xsl:value-of select="."/>
    <xsl:if test="not(position()=last())">, </xsl:if>
  </xsl:for-each>
</xsl:for-each>

\small
<xsl:for-each select="legalnotice">
  \vspace{2ex}
  <xsl:apply-templates/>
</xsl:for-each>

\vspace*{\fill}
\noindent
<xsl:choose>
  <xsl:when test="lang('en')">
    \noindent This paper was written in XML using the DocBook DTD.\\[1ex]
    Output is produced with the typesetting system \TeX{} using the KOMA Script package
    after conversion to \LaTeX{} with the XSLT program docbook2tex.
  </xsl:when>
  <xsl:when test="lang('de')">
    \noindent \small Diese Arbeit wurde in XML mit der DocBook-DTD geschrieben.\\[1ex]
    Die Ausgabe erfolgt durch Konvertierung mittels des XSLT-Programms docbook2tex nach
    \LaTeX{} mit dem Textsatzsystem \TeX{} unter Zuhilfenahme des KOMA-Script-Pakets.
  </xsl:when>
</xsl:choose>
\normalsize
\ifx\pdfoutput\undefined\else
\hypersetup{pdftitle=<xsl:value-of select="title"/>,%
	    pdfsubject=<xsl:value-of select="subtitle"/>,%
	    pdfauthor=<xsl:value-of select="author/firstname"/><xsl:text> </xsl:text><xsl:value-of select="author/surname"/>}
\fi
\clearpage
</xsl:template>

<xsl:template match="article">
  <xsl:call-template name="latexheader">
    <xsl:with-param name="documentclass">scrartcl</xsl:with-param>
  </xsl:call-template>
\makeatother

\begin{document}
  <xsl:apply-templates/>
  \printindex
\end{document}
</xsl:template>

<xsl:template match="articleinfo">
  <xsl:if test="count(authorgroup)+count(author)!=1">
    <xsl:message>Must specify exactly one authorgroup or author in articleinfo</xsl:message>
  </xsl:if>
  <xsl:choose>
    <xsl:when test="author">
      \author{<xsl:apply-templates select="."/>}
    </xsl:when>
    <xsl:otherwise>
      <xsl:text/>\author{
      <xsl:for-each select="authorgroup/author">
	<xsl:apply-templates select="."/>
	<xsl:if test="not(position()=last())">
	  <xsl:text> \and </xsl:text>
	</xsl:if>
      </xsl:for-each>}
    </xsl:otherwise>
  </xsl:choose>
  \title{<xsl:apply-templates select="title" mode="value"/>}
  <xsl:for-each select="pubdate">\date{<xsl:value-of select="."/>}</xsl:for-each>
  \maketitle
  <xsl:for-each select="keywordset">
    <xsl:choose>
      <xsl:when test="lang('en')">\noindent\textbf{Keywords: }</xsl:when>
      <xsl:when test="lang('de')">\noindent\textbf{Schlüsselwörter: }</xsl:when>
    </xsl:choose>
    <xsl:for-each select="keyword">
      <xsl:value-of select="."/>
      <xsl:if test="not(position()=last())">
	<xsl:text>, </xsl:text>
      </xsl:if>
    </xsl:for-each>
  </xsl:for-each>
</xsl:template>

<xsl:template match="articleinfo/author|articleinfo/authorgroup/author">
    <xsl:value-of select="firstname"/><xsl:text> </xsl:text><xsl:value-of select="surname"/>
    <xsl:for-each select="affiliation">
      (<xsl:value-of select="orgname"/>, <xsl:value-of select="orgdiv"/>)
    </xsl:for-each>
</xsl:template>

<!--}}}-->

<!-- Front matter                         {{{-->
<!-- - - - - - - - - - - - - - - - - - - - - -->
<xsl:template match="toc">
\pagestyle{plain}
\tableofcontents
\clearpage
\listof{example}{<xsl:choose>
      <xsl:when test="lang('en')">Examples</xsl:when>
      <xsl:when test="lang('de')">Beispiele</xsl:when>
    </xsl:choose>}
\cleardoublepage
\pagestyle{headings}
<xsl:if test="/book">\mainmatter</xsl:if>
</xsl:template>

<xsl:template match="preface">
\pagenumbering{roman}
\vspace*{\fill}
\begin{list}{}{\setlength{\leftmargin}{4em}\setlength{\rightmargin}{4em}}\item
\hspace*{\fill}\textbf{\LARGE <xsl:apply-templates select="title" mode="value"/>}\hspace*{\fill}
\vspace*{2ex}
  <xsl:apply-templates/>
\end{list}
\vspace*{\fill}

\cleardoublepage
</xsl:template>
<!--}}}-->

<!-- Upper level document structure       {{{1-->
<!-- - - - - - - - - - - - - - - - - - - - -  -->
<xsl:template match="part">
  <xsl:apply-templates select="partintro" mode="partintro"/>
\part{<xsl:apply-templates select="title" mode="value"/>}
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="partintro"/>
<xsl:template match="partintro" mode="partintro">
  \setpartpreamble{%
    \begin{list}{}{\setlength{\leftmargin}{4em}\setlength{\rightmargin}{4em}}\item
    \hspace*{\fill}\textbf{\Large <xsl:apply-templates select="title" mode="value"/>}\hspace*{\fill}
    \vspace*{2ex}
    <xsl:apply-templates/>
  \end{list}}
</xsl:template>

<xsl:template match="chapter">
\chapter{<xsl:apply-templates select="title" mode="value"/>}
  <xsl:call-template name="idtolabel"/>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="appendix">
  \ifAppendicesBegun\relax\else
    \appendix
    \AppendicesBeguntrue
  \fi
  \chapter{<xsl:apply-templates select="title" mode="value"/>}
  <xsl:call-template name="idtolabel"/>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="sect1">
  <xsl:if test="@label and @label!=''">
    \setcounter{section}{<xsl:value-of select="@label - 1"/>}
  </xsl:if>
  \section<xsl:if test="@label and @label=''">*</xsl:if>{<xsl:apply-templates select="title" mode="value"/>}
  <xsl:call-template name="idtolabel"/>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="sect2">
\subsection{<xsl:apply-templates select="title" mode="value"/>}
  <xsl:call-template name="idtolabel"/>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="sect3">
\subsubsection{<xsl:apply-templates select="title" mode="value"/>}
  <xsl:call-template name="idtolabel"/>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="sect4">
\paragraph{<xsl:apply-templates select="title" mode="value"/>}
  <xsl:call-template name="idtolabel"/>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="sect5">
\subparagraph{<xsl:apply-templates select="title" mode="value"/>}
  <xsl:call-template name="idtolabel"/>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="para">
  <xsl:apply-templates/>
  <xsl:text>
  </xsl:text>
</xsl:template>

<xsl:template match="variablelist">
  \begin{description}
  <xsl:apply-templates/>
  \end{description}
</xsl:template>

<xsl:template match="varlistentry">
  \item[<xsl:for-each select="term">
    <xsl:apply-templates/>
    <xsl:if test="position() &lt;last()">, </xsl:if>
  </xsl:for-each>]
  <xsl:apply-templates select="listitem"/>
</xsl:template>

<xsl:template match="listitem">
  <xsl:call-template name="idtolabel"/>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template name="idtolabel">
  <xsl:if test="@id">\label{<xsl:value-of select="@id"/>}</xsl:if>
</xsl:template>
<!--}}}1-->

<!-- Back matter                          {{{1-->
<!-- - - - - - - - - - - - - - - - - - - - -  -->
<!-- Glossary                             {{{2-->
<!-- - - - - - - - - - - - - - - - - - - - -  -->
<xsl:template match="glossary">
  \chapter*{<xsl:choose>
    <xsl:when test="title">
      <xsl:apply-templates select="title" mode="value"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:message>No title given for glossary</xsl:message>
      <xsl:choose>
	<xsl:when test="lang('en')">Glossary</xsl:when>
	<xsl:when test="lang('de')">Glossar</xsl:when>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>}
  <xsl:if test="count(glossentry) &gt; 0"><xsl:call-template name="OpenDescList"/></xsl:if>
  <xsl:apply-templates/>
  <xsl:if test="count(glossentry) &gt; 0"><xsl:call-template name="CloseDescList"/></xsl:if>
</xsl:template>

<xsl:template match="glossdiv">
  \section*{<xsl:apply-templates select="title" mode="value"/>}
  <xsl:call-template name="OpenDescList"/>
  <xsl:apply-templates/>
  <xsl:call-template name="CloseDescList"/>
</xsl:template>

<xsl:template match="glossentry">
  \item[<xsl:apply-templates select="glossterm" mode="value"/>
  <xsl:if test="count(acronym)+count(abbrev) &gt; 0"> (</xsl:if>
  <xsl:if test="count(acronym) &gt; 0"><xsl:value-of select="acronym"/></xsl:if>
  <xsl:if test="count(acronym) &gt; 0 and count(abbrev) &gt; 0">,</xsl:if>
  <xsl:if test="count(abbrev) &gt; 0"><xsl:value-of select="abbrev"/></xsl:if>
  <xsl:if test="count(acronym)+count(abbrev) &gt; 0">)</xsl:if>] 
  
  <xsl:for-each select="glosssee">
    <xsl:choose>
      <xsl:when test="lang('en')">see</xsl:when>
      <xsl:when test="lang('de')">siehe</xsl:when>
    </xsl:choose>
    <xsl:apply-templates/>
  </xsl:for-each>

  <xsl:for-each select="glossdef">
    <xsl:apply-templates select="*[name()!='glossseealso']"/>
    <xsl:if test="glossseealso">
      <xsl:choose>
	<xsl:when test="lang('en')">See also </xsl:when>
	<xsl:when test="lang('de')">Siehe auch </xsl:when>
      </xsl:choose>
      <xsl:for-each select="glossseealso">
	<xsl:value-of select="@otherterm"/>
	<xsl:if test="not(position()=last())">
	  <xsl:text>, </xsl:text>
	</xsl:if>
      </xsl:for-each><xsl:text>.</xsl:text>
    </xsl:if>
  </xsl:for-each>
</xsl:template>

<xsl:template name="OpenDescList">
  \begin{description}
</xsl:template>

<xsl:template name="CloseDescList">
  \end{description}
</xsl:template>
<!--}}}2-->

<!-- Bibliography                         {{{2-->
<!-- - - - - - - - - - - - - - - - - - - - -  -->
<xsl:template match="bibliography">
  <xsl:if test="title">\renewcommand{\bibname}{<xsl:apply-templates select="title" mode="value"/>}</xsl:if>
  \bib@heading
  <xsl:apply-templates select="*[not(starts-with(name(),biblio))]"/>
  
  <xsl:if test="not(bibliodiv)"><xsl:call-template name="OpenBibliography"/></xsl:if>
  <xsl:apply-templates select="*[starts-with(name(),biblio)]"/>
  <xsl:if test="not(bibliodiv)"><xsl:call-template name="CloseBibliography"/></xsl:if>
</xsl:template>

<xsl:template match="bibliodiv">
  \section*{<xsl:apply-templates select="title" mode="value"/>}
  <xsl:call-template name="OpenBibliography"/>
  <xsl:apply-templates/>
  <xsl:call-template name="CloseBibliography"/>
</xsl:template>

<xsl:template match="bibliomixed/*">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="bibliomset/*">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="biblioentry|bibliomixed">
  <xsl:if test="count(authorgroup)+count(author)!=1">
    <xsl:message>Must specify exactly one authorgroup or author in biblioentry/bibliomixed</xsl:message>
  </xsl:if>

  \bibitem<xsl:if test="abbrev">[<xsl:value-of select="abbrev"/>]</xsl:if>{<xsl:value-of select="@id"/>}

  <xsl:apply-templates select="authorgroup"/>
  <xsl:apply-templates select="author"/>

  <xsl:apply-templates select="title"/>
  <xsl:apply-templates select="subtitle"/>}

  <xsl:apply-templates select="publisher"/>
  <xsl:choose>
    <xsl:when test="pubdate">
      <xsl:apply-templates select="pubdate"/>
    </xsl:when>
    <xsl:when test="copyright/year">
      <xsl:apply-templates select="copyright/year"/>
    </xsl:when>
  </xsl:choose>

  <xsl:apply-templates select="bibliomisc"/>
</xsl:template>

<xsl:template match="biblioset/*">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="biblioentry/author|bibliomixed/author">
  <xsl:value-of select="firstname"/><xsl:text> </xsl:text> <xsl:value-of select="surname"/>.
</xsl:template>

<xsl:template match="biblioentry/authorgroup|bibliomixed/authorgroup">
  <xsl:for-each select="author">
    <xsl:value-of select="firstname"/><xsl:text> </xsl:text> <xsl:value-of select="surname"/>
    <xsl:choose>
      <xsl:when test="position() &lt;last()-1">, </xsl:when>
      <xsl:when test="position()=last()-1">
	<xsl:choose>
	  <xsl:when test="lang('en')"> and </xsl:when>
	  <xsl:when test="lang('de')"> und </xsl:when>
	</xsl:choose>
      </xsl:when>
    </xsl:choose>
  </xsl:for-each>.
</xsl:template>

<xsl:template match="biblioentry/title">
  \newblock {\em <xsl:value-of select="."/>
</xsl:template>

<xsl:template match="biblioentry/subtitle">
  <xsl:text/> -- <xsl:value-of select="."/>
</xsl:template>

<xsl:template match="biblioentry/bibliomisc"><xsl:text>

  </xsl:text>\newblock <xsl:apply-templates/>
</xsl:template>

<xsl:template match="biblioentry/publisher">
  \newblock <xsl:value-of select="publishername"/>,
  <xsl:if test="address/city"><xsl:value-of select="address/city"/>, </xsl:if>
  <xsl:if test="address/country"><xsl:value-of select="address/country"/>, </xsl:if>
</xsl:template>
  
<xsl:template match="biblioentry/copyright/year|biblioentry/pubdate">
  <xsl:value-of select="."/>
</xsl:template>


<xsl:template name="OpenBibliography">
  \begin{thebibliography}{MPi01}
</xsl:template>

<xsl:template name="CloseBibliography">
  \end{thebibliography}
</xsl:template>
<!--}}}2-->

<!--}}}1-->

<!-- Lower level document structure       {{{-->
<!-- - - - - - - - - - - - - - - - - - - - - -->
<xsl:template match="blockquote">
  \begin{quotation}
  <xsl:apply-templates/>
  <xsl:for-each select="attribution">
    \par\hfill\textit{<xsl:apply-templates/>}\\
  </xsl:for-each>
  \end{quotation}
  <xsl:text>
  </xsl:text>
</xsl:template>

<xsl:template match="blockquote/attribution"/>

<xsl:template match="quote">
  <xsl:choose>
    <xsl:when test="lang('en')">\textquotedblleft{}</xsl:when>
    <xsl:when test="lang('de')">\glqq{}</xsl:when>
  </xsl:choose>
  <xsl:apply-templates/>
  <xsl:choose>
    <xsl:when test="lang('en')">\textquotedblright{}</xsl:when>
    <xsl:when test="lang('de')">\grqq{}</xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="itemizedlist">
  \begin{itemize}
  <xsl:for-each select="listitem">
    \item <xsl:apply-templates select="."/>
  </xsl:for-each>
  \end{itemize}
</xsl:template>

<xsl:template match="orderedlist">
  \begin{enumerate}
  <xsl:for-each select="listitem">
    \item <xsl:apply-templates select="."/>
  </xsl:for-each>
  \end{enumerate}
</xsl:template>

<xsl:template match="programlisting">
  \begin{lstlisting}<xsl:text />
  <xsl:if test="@role">
    <xsl:text>[language=</xsl:text>
    <xsl:choose>
      <xsl:when test="@role='none'">{}</xsl:when>
      <xsl:otherwise><xsl:value-of select="@role"/></xsl:otherwise>
    </xsl:choose><xsl:text>]</xsl:text>
  </xsl:if>
  <xsl:text>{}</xsl:text>
  <xsl:value-of select="."/>
  <xsl:text/>  \end{lstlisting}
</xsl:template>

<xsl:template match="example">
  \begin{example}
  \caption{<xsl:call-template name="idtolabel"/>
  <xsl:apply-templates select="title" mode="value"/>}
  <xsl:apply-templates/>
  \end{example}
</xsl:template>

<xsl:template match="informalexample">
  \begin{informalexample}<xsl:text/>
  <xsl:if test='not(programlisting)'>
    <xsl:text>\vspace*{1ex}</xsl:text>
  </xsl:if>
  <xsl:apply-templates/>
  <xsl:text/>  \end{informalexample}
</xsl:template>

<xsl:template match="xref[name(id(@linkend))='biblioentry']">
  <xsl:text/>\cite{<xsl:value-of select="@linkend"/>}<xsl:text/>
</xsl:template>

<xsl:template match="xref">\ref{<xsl:value-of select="@linkend"/>}</xsl:template>

<xsl:template match="inlineequation[alt]">
  <xsl:value-of select="alt"/>
</xsl:template>

<xsl:template match="informalequation[alt]">
  \begin{center}<xsl:value-of select="alt"/>\end{center}
</xsl:template>

<xsl:template match="inlineequation[processing-instruction('latex')] |
  informalequation[processing-instruction('latex')]" priority="2.0">
  <xsl:value-of select="processing-instruction('latex')"/>
</xsl:template>

<xsl:template match="indexterm">
  <xsl:text>\index{</xsl:text>
  <xsl:choose>
    <xsl:when test="@startref"> <!-- End of range -->
      <xsl:if test="primary or secondary or tertiary">
	<xsl:message>Indexterm element must be empty for end of range.</xsl:message>
      </xsl:if>
      <xsl:apply-templates select="id(@startref)" mode="term"/>
      <xsl:text>|)</xsl:text>
    </xsl:when>
    <xsl:otherwise> <!-- Not end of range -->
      <xsl:apply-templates select="." mode="term"/>

      <xsl:if test="@class='startofrange' or see or @significance='preferred'">|</xsl:if>
      <xsl:if test="@class='startofrange'">
	<xsl:if test="not(@id)">
	  <xsl:message>Indexterm start of range must have an ID.</xsl:message>
	</xsl:if>
	<xsl:text>(</xsl:text>
      </xsl:if>
      <xsl:choose>
	<xsl:when test="see">see{<xsl:apply-templates select="see" mode="value"/>}</xsl:when>
	<xsl:otherwise>
	  <xsl:if test="@significance='preferred'">textbf</xsl:if>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose><xsl:text>}</xsl:text>
  <xsl:if test="@zone"><xsl:message>Index zones are not supported</xsl:message></xsl:if>
</xsl:template>

<xsl:template match="indexterm" mode="value">
  <xsl:apply-templates select="."/>
</xsl:template>

<xsl:template match="indexterm" mode="term">
  <xsl:if test="primary"><xsl:apply-templates select="primary" mode="value"/></xsl:if>
  <xsl:if test="secondary">!<xsl:apply-templates select="secondary" mode="value"/></xsl:if>
  <xsl:if test="tertiary">!<xsl:apply-templates select="tertiary" mode="value"/></xsl:if>
</xsl:template>

<xsl:template match="qandaset"><xsl:apply-templates/></xsl:template>

<xsl:template match="qandaentry"><xsl:apply-templates/></xsl:template>

<xsl:template match="question">
  \minisec{<xsl:apply-templates/>}
</xsl:template>

<xsl:template match="answer"><xsl:apply-templates/></xsl:template>

<!--}}}-->

<!-- Tables                               {{{-->
<!-- - - - - - - - - - - - - - - - - - - - - -->

<xsl:template match="table">
  \begin{table}[htb]
  \caption{<xsl:call-template name="idtolabel"/>
  <xsl:apply-templates select="title" mode="value"/>}<xsl:text/>
  <xsl:variable name="frame">
    <xsl:choose>
      <xsl:when test="@frame and @frame='none'">0</xsl:when>
      <xsl:otherwise>1</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:apply-templates><xsl:with-param name="frame" select="$frame"/></xsl:apply-templates>
  <xsl:text/>\end{table}
</xsl:template>

<xsl:template match="informaltable">
  <xsl:variable name="frame">
    <xsl:choose>
      <xsl:when test="@frame and @frame!='none'">1</xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:apply-templates><xsl:with-param name="frame" select="$frame"/></xsl:apply-templates>
</xsl:template>

<xsl:template match="tgroup">
  <xsl:param name="frame" select="1"/>
  <xsl:text>\begin{</xsl:text>
  <xsl:choose>
    <xsl:when test="processing-instruction('latex-table-type')">
      <xsl:value-of select="processing-instruction('latex-table-type')"/>
    </xsl:when>
    <xsl:otherwise>tabular</xsl:otherwise>
    </xsl:choose>}<xsl:choose>
      <xsl:when test="processing-instruction('latex-table-option')">
	<xsl:value-of select="processing-instruction('latex-table-option')"/>
      </xsl:when>
      </xsl:choose>{<xsl:choose>
    <xsl:when test="processing-instruction('latex-table-head')">
      <xsl:value-of select="processing-instruction('latex-table-head')"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="do-header">
	<xsl:with-param name="cols" select="@cols"/>
	<xsl:with-param name="align">
	  <xsl:choose>
	    <xsl:when test="@align = 'right'">r</xsl:when>
	    <xsl:when test="@align = 'center'">c</xsl:when>
	    <xsl:otherwise>l</xsl:otherwise>
	  </xsl:choose>
	</xsl:with-param>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>}<xsl:if test="$frame != 0">\toprule </xsl:if>
  <xsl:apply-templates select="thead"/>
  <xsl:apply-templates select="tbody"/>
  <xsl:apply-templates select="tfoot"/><xsl:if test="$frame != 0">\bottomrule </xsl:if>
  <xsl:text/>\end{<xsl:choose>
    <xsl:when test="processing-instruction('latex-table-type')">
      <xsl:value-of select="processing-instruction('latex-table-type')"/>
    </xsl:when>
    <xsl:otherwise>tabular</xsl:otherwise>
  </xsl:choose>}<xsl:text/>
</xsl:template>
  
<xsl:template match="thead|tbody|tfoot">
  <xsl:param name="name" select="name()"/>
  <xsl:if test="name()='tfoot'"><xsl:text>\midrule
  </xsl:text></xsl:if>
  <xsl:for-each select="row">
    <xsl:for-each select="entry">
      <xsl:if test="$name!='tbody'">\bf </xsl:if>
      <xsl:apply-templates/><xsl:if test="not(position()=last())"> &amp; </xsl:if>
    </xsl:for-each> \cr
  </xsl:for-each>
  <xsl:if test="name()='thead'"><xsl:text>\midrule
  </xsl:text></xsl:if>
</xsl:template>

<xsl:template name="do-header">
  <xsl:param name="cols" select="1"/>
  <xsl:param name="align" select="p"/>
  <xsl:if test="$cols != 0">
    <xsl:value-of select="$align"/>
    <xsl:call-template name="do-header">
      <xsl:with-param name="cols" select="$cols - 1"/>
      <xsl:with-param name="align" select="$align"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>
<!--}}}-->

<!-- Character styles                     {{{-->
<!-- - - - - - - - - - - - - - - - - - - - - -->

<xsl:template match="email">\url{<xsl:value-of select="."/>}</xsl:template>

<xsl:template match="ulink"><xsl:choose>
    <xsl:when test=".=@url or .=''">&lt;\url{<xsl:value-of select="@url"/>}&gt;</xsl:when>
    <xsl:otherwise><xsl:apply-templates/> (\url{<xsl:value-of select="@url"/>})</xsl:otherwise>
</xsl:choose></xsl:template>

<xsl:template match="emphasis"><xsl:choose>
    <xsl:when test="@role and (@role='bold' or @role='strong')">\textbf{<xsl:apply-templates/>}</xsl:when>
    <xsl:otherwise>\emph{<xsl:apply-templates/>}</xsl:otherwise>
</xsl:choose></xsl:template>

<xsl:template match="application">\textsf{<xsl:apply-templates/>}</xsl:template>

<xsl:template match="constant">\textsf{<xsl:apply-templates/>}</xsl:template>

<xsl:template match="classname">\textsf{<xsl:apply-templates/>}</xsl:template>

<xsl:template match="function">\textsf{<xsl:apply-templates/>}</xsl:template>

<xsl:template match="varname">\textsl{<xsl:apply-templates/>}</xsl:template>

<xsl:template match="computeroutput">\texttt{<xsl:apply-templates/>}</xsl:template>

<xsl:template match="userinput">\texttt{<xsl:apply-templates/>}</xsl:template>

<xsl:template match="literal">\texttt{<xsl:apply-templates/>}</xsl:template>

<xsl:template match="filename">\texttt{<xsl:apply-templates/>}</xsl:template>

<xsl:template match="acronym">\textsc{<xsl:apply-templates/>}</xsl:template>

<xsl:template match="replaceable">\textit{\textless{}<xsl:apply-templates/>\textgreater{}}</xsl:template>

<xsl:template match="abbrev"><xsl:apply-templates/></xsl:template>

<xsl:template match="wordasword"><xsl:apply-templates/></xsl:template>

<xsl:template match="superscript">
  <xsl:text/>\textsuperscript{<xsl:apply-templates/>}
</xsl:template>

<!--}}}-->

<!-- Mediaobjects                         {{{-->
<!-- - - - - - - - - - - - - - - - - - - - - -->
<xsl:template match="figure">
  <xsl:text>\begin{figure}[htb]\begin{center}</xsl:text>
  <xsl:apply-templates/>
  <xsl:if test="title">
    <xsl:text>\caption{</xsl:text>
    <xsl:call-template name="idtolabel"/>
    <xsl:apply-templates select="title" mode="value"/>
    <xsl:text>}</xsl:text>
  </xsl:if>
  \end{center}\end{figure}<xsl:text/>
</xsl:template>

<xsl:template match="mediaobject">
  <xsl:for-each select="imageobject">
    <xsl:if test="imagedata[@format='TEX']"><xsl:text>
      </xsl:text>\include{<xsl:value-of select="imagedata/@fileref"/>}<xsl:text/>
    </xsl:if>
    <xsl:if test="imagedata[@format='EPS']|
	imagedata[@format='PDF']|
	imagedata[@format='EPSPDF']"><xsl:text>
	</xsl:text>\includegraphics{<xsl:value-of select="@fileref"/>}<xsl:text/>
    </xsl:if>
  </xsl:for-each>
</xsl:template>

<xsl:template match="caption"/>


<!--}}}-->

<!-- EXSLT                                {{{-->
<!-- - - - - - - - - - - - - - - - - - - - - -->

<!-- Copied from www.exslt.org -->

<xsl:template name="str:_replace">
  <xsl:param name="string"
    select="''" />
  <xsl:param name="replacements"
    select="/.." />
  <xsl:choose>
    <xsl:when test="not($string)" />
    <xsl:when test="not($replacements)">
      <xsl:value-of select="$string" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:variable name="replacement"
	select="$replacements[1]" />
      <xsl:variable name="search"
	select="$replacement/@search" />
      <xsl:choose>
	<xsl:when test="not(string($search))">
	  <xsl:value-of select="substring($string, 1, 1)" />
	  <xsl:copy-of select="$replacement/node()" />
	  <xsl:call-template name="str:_replace">
	    <xsl:with-param name="string"
	      select="substring($string, 2)" />
	    <xsl:with-param name="replacements"
	      select="$replacements" />
	  </xsl:call-template>
	</xsl:when>
	<xsl:when test="contains($string, $search)">
	  <xsl:call-template name="str:_replace">
	    <xsl:with-param name="string"
	      select="substring-before($string, $search)" />
	    <xsl:with-param name="replacements"
	      select="$replacements[position() > 1]" />
	  </xsl:call-template>
	  <xsl:copy-of select="$replacement/node()" />
	  <xsl:call-template name="str:_replace">
	    <xsl:with-param name="string"
	      select="substring-after($string, $search)" />
	    <xsl:with-param name="replacements"
	      select="$replacements" />
	  </xsl:call-template>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:call-template name="str:_replace">
	    <xsl:with-param name="string"
	      select="$string" />
	    <xsl:with-param name="replacements"
	      select="$replacements[position() > 1]" />
	  </xsl:call-template>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
<!--}}}-->

</xsl:stylesheet> 
<!-- vim:set sw=2 ts=8 fdm=marker: -->
