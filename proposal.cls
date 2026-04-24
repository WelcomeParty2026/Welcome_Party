\LoadClass[twoside,uplatex, 11pt]{jsreport}
\ProvidesClass{proposal}
\usepackage{silence}
\WarningFilter{caption}{Unknown document}
\usepackage[top=20truemm,bottom=20truemm,left=15truemm,right=15truemm,headheight=20pt]{geometry}
\usepackage{listings,jvlisting}
\usepackage{hyperref}
\usepackage{fancyhdr}
\usepackage{amsmath}
\usepackage{lastpage}
\usepackage{xcolor}
\usepackage{graphicx}
\usepackage{amsmath,amsfonts,amssymb,mathtools,ascmac,bm,float,comment,url,fancybox}
\usepackage{calc,subcaption,multicol,tablefootnote,threeparttable}
\usepackage{wrapfig}
\usepackage[T1]{fontenc}
\usepackage{tikz,listings}
\usepackage{pdfpages}
\usepackage{here}
\usepackage{tabularx}
\usepackage{parnotes}
\usepackage{longtable}
\usepackage{multirow}
\usepackage{enumitem}
\usepackage{titlesec}
\usepackage{array} 
\usepackage{arydshln} 

\bibliographystyle{junsrt}
\hypersetup{
    colorlinks=true,
    citecolor=black,
    linkcolor=black,
    urlcolor=black
}

\titleformat{\chapter}% command
    [block]% shape
    {\Huge}% format
    {\textbf{第\ \thechapter\ 項}}% label
    {0.5em}% sep
    \textbf{}% before-code
\titlespacing{\chapter}
    {-5pt}% left
    {-18pt}% before-sep
    {15pt}% after-sep

\renewcommand{\chaptermark}[1]{\markboth{第\ \thechapter\ 項\ \ #1}{}}
\fancypagestyle{report}{
    \fancyhf{}
    \fancyhead[RE]{\leftmark\hspace{.5cm}\raisebox{-1mm}{\color{gray}\rule{.5mm}{6mm}}\hspace{.5cm}\thepage\hspace{.5cm}}
    \fancyhead[LO]{\hspace{.5cm}\thepage\hspace{.5cm}\raisebox{-1mm}{\color{gray}\rule{.5mm}{6mm}}\hspace{.5cm}\leftmark}
    \pagenumbering{arabic}
}
\fancypagestyle{appendixstyle}{
    \fancyhf{}
    \fancyhead[RE]{付録\hspace{.5cm}\raisebox{-1mm}{\color{gray}\rule{.5mm}{6mm}}\hspace{.5cm}\thepage\hspace{.5cm}}
    \fancyhead[LO]{\hspace{.5cm}\thepage\hspace{.5cm}\raisebox{-1mm}{\color{gray}\rule{.5mm}{6mm}}\hspace{.5cm}付録}
}

\newcolumntype{C}{>{\centering\arraybackslash}X}
\newcolumntype{R}{>{\raggedright\arraybackslash}X}
\newcolumntype{L}{>{\raggedleft\arraybackslash}X} 

\renewcommand{\figurename}{図}
\renewcommand{\tablename}{表}
\renewcommand{\lstlistingname}{src.}
\renewcommand{\thefootnote}{\fnsymbol{footnote}}
\renewcommand{\contentsname}{目次}
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\thetable}{\thechapter-\arabic{table}}
\renewcommand{\theequation}{\thechapter.\arabic{equation}}
\renewcommand{\postchaptername}{項}
\renewcommand{\eqref}[1]{式(\ref{#1})}
\newcommand{\figref}[1]{図\ref{#1}}
\newcommand{\tblref}[1]{表\ref{#1}}
\newcommand{\srcref}[1]{src.\ref{#1}}
\renewcommand{\appendix}{
    \chapter*{付録}
    \pagestyle{appendixstyle}
    \addcontentsline{toc}{chapter}{付録}
    \setcounter{section}{0}
    \renewcommand{\thesection}{\Alph{section}}
}
\newcommand{\group}[1]{\def\@group{#1}}
\newcommand{\version}[1]{\def\@version{Ver#1}}
\renewcommand{\and}{\\}

\makeatletter
\@addtoreset{figure}{chapter}
\@addtoreset{table}{chapter}
\@addtoreset{lstlisting}{chapter}
\@addtoreset{footnote}{page}
\renewcommand{\chapter}{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \global\@topnum\z@
    \secdef\@chapter\@schapter}
\makeatother
\AtBeginDocument{
    \renewcommand{\thelstlisting}{\thesection-\arabic{lstlisting}}
}
\makeatletter
\def\studentid#1{\def\@studentid{#1}}
\def\group#1{\def\@group{#1}}
\def\institution#1{\def\@institution{#1}}
\def\name#1{\def\@name{#1}}
\def\titlehead#1{\def\@titlehead{#1}}
\def\version#1{\def\@version{#1}}

\renewcommand{\maketitle}{
  \mbox{}
  \vfill
  \begin{center}
    \noindent{\huge\bf \@title}\\
    \rule{\textwidth}{2pt}
  \end{center}
  \begin{flushright}
    \vskip -3mm
    \@group\\
    作成日 : \@date\\
    Ver.\@version
  \end{flushright}
  \vfill\vfill
  \begin{flushleft}
    \@author
  \end{flushleft}
  \vskip -5mm\rule{\textwidth}{1pt}
}
\makeatother
\AtBeginDocument{
    \begin{titlepage}
        \thispagestyle{empty}
        \maketitle
    \end{titlepage}
    \pagestyle{report}
    \tableofcontents
    \setcounter{page}{1}
}

\newenvironment{tpacol}%
{
    \begin{minipage}[t]{.99\linewidth}
}%
{
    \end{minipage}
    \vspace{1mm}
    }
\newenvironment{tpbcol}%
{
    \begin{minipage}[t]{.99\linewidth}
}%
{
    \end{minipage}
    \vspace{1mm}
}
\newenvironment{tpccol}%
{
    \begin{minipage}[t]{.99\linewidth}
}%
{   
    \end{minipage}
    \vspace{1mm}
}
\newenvironment{tpdcol}%
{
    \begin{minipage}[t]{.98\linewidth}       
}%
{
    \end{minipage}
    \vspace{1mm}
}
\newenvironment{tpecol}%
{
    \begin{minipage}[t]{.98\linewidth}       
}%
{
    \end{minipage}
    \vspace{1mm}
}