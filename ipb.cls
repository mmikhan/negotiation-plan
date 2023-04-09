\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ipb}[2015/11/24 MSc class]

\LoadClass[12pt,twoside]{report}

%% Required packages.
% Line spacing
\RequirePackage{setspace}
\RequirePackage{graphicx}
\RequirePackage[utf8]{inputenc}
\RequirePackage[acronym,toc,nonumberlist]{glossaries}
\RequirePackage{emptypage}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

%%%%%
%%%%%   SETUP MARGINS AND PENALTIES
%%%%%

% We need 1" margins except on the binding edge, where it is 1 1/2"
% Theses may be either single or double sided
  \if@twoside
     \setlength\oddsidemargin   {0\p@}
     \setlength\evensidemargin  {0\p@}
     \setlength\marginparwidth {40\p@}
  \else
     \setlength\oddsidemargin   {0\p@}
     \setlength\evensidemargin  {0\p@}
     \setlength\marginparwidth  {40\p@}
  \fi

\marginparsep 10pt
%\oddsidemargin 0.5in \evensidemargin 0in
%\marginparwidth 40pt


\topmargin 0pt \headsep 1cm
\textheight 22cm \textwidth 16cm

% Disallow page breaks at hyphens (this will give some underfull vbox's,
% so an alternative is to use \brokenpenalty=100 and manually search
% for and fix such page breaks)
\brokenpenalty=10000

\setstretch{1.0}
%%%%%
%%%%%   SETUP COMMANDS
%%%%%

\def\courseyear#1{\gdef\@courseyear{#1}}

\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage{lmodern}

\def\coverpage{
\setlength{\voffset}{-1.5cm}
\setlength{\headsep}{5pt}

\begin{center}
    \includegraphics[width=0.9\columnwidth, keepaspectratio]{images/hanzelogo.png}\\
\end{center}

\begin{center}
	\vspace{4em}
    {\Huge\expandafter{\bf \@title}}
    \vfill

    \vspace{2em}
    by

    {\Large\textbf{
    \@author \ifdefined\@authnum \quad\@authnum \fi\\
    }}
    \vfill
    \vspace{4em}
    PROFESSIONAL SKILLS ASSIGNMENT
    \vfill
    \vspace{4em}
    \normalsize
    Submitted to

    Hanze University of Applied Sciences Groningen
    \vfill
    \vspace{1em}
    in partial fulfillment of the requirements \\
    for the degree of
    \vfill
    \vspace{1em}
    Master Smart Systems Engineering

    \vspace{5.5em}
	Groningen\\
	\@courseyear
\end{center}
}

\def\beforepreface{%
    \pagenumbering{gobble}
    \pagestyle{empty}
    \coverpage
}

\def\afterpreface{%
    \clearpage

    \pagenumbering{arabic}
    \setcounter{page}{2}
    \tableofcontents
}

\def\bodystart{%
    \clearpage
    \pagestyle{plain}
}

\let\@ldthebibliography\thebibliography
\renewcommand{\thebibliography}[1]{\newpage
                \@ldthebibliography{#1}%
\addcontentsline{toc}{chapter}{\bibname}}


\pagestyle{headings}

\makeatother
