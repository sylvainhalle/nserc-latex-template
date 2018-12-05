%% --------------------------------------
%% NSERC Appendix class
%% (C) 2011-2018 Sylvain Hallé
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%% http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%%
%% The Current Maintainer of this work is Sylvain Hallé.
%%
%% Usage notes
%% -----------
%% For instructions on how to use this class, see the file example.tex
%% provided with this package. Most of its content is self-explanatory.
%% --------------------------------------

%% ------------------------
%% Declarations
%% ------------------------
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{nserc-appendix}
              [2018/12/05 v1.4 Classe annexe CRSNG par Sylvain Hallé]

%% ------------------------
%% Definition of the language parameters
%% ------------------------
\def\@langdemande{english}
\def\@inlinerefs{false}
\DeclareOption{french}{\def\@langdemande{french}}
\DeclareOption{english}{\def\@langdemande{english}}
\DeclareOption{inlinerefs}{\def\@inlinerefs{true}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions
\ifx\pdfoutput\undefined
  \LoadClass[letterpaper,onecolumn,dvips]{article}
\else
  \LoadClass[letterpaper,onecolumn,pdftex]{article}
\fi
\RequirePackage[sort,square,numbers]{natbib} %% Format bibliography
\RequirePackage[utf8]{inputenc}       %% Use UTF-8 in input files
\RequirePackage{lastpage}             %% To get number of last page
\RequirePackage[T1]{fontenc}          %% Type-1 font encoding
\RequirePackage{microtype}            %% Better handling of typo
\RequirePackage{fourier}              %% Sans-serif heading font
\RequirePackage{berasans}             %% Serif text font
\RequirePackage{fancyhdr}             %% Define header/footer
\RequirePackage{geometry}             %% Change page margins
\RequirePackage{ifthen}               %% Required to evaluate conditions
\RequirePackage[normalem]{ulem}       %% For non-ugly underlining
\RequirePackage[calcwidth]{titlesec}

%% Prevents heading and single lines to be split across pages
\widowpenalty=1000
\clubpenalty=1000

%% Get parameters passed at package instantiation
\newcommand{\nsercname}[1]{\def\@nname{#1}}
\newcommand{\nsercpin}[1]{\def\@npin{#1}}

%% Get commands to space section titles
\def\@sectspacing{10pt}
\newcommand{\setsectionspacing}[1]{\def\@sectspacing{#1}}

\ifthenelse{\equal{\@langdemande}{french}}{%
  \setlength{\parskip}{8pt}
  \setlength{\parindent}{0pt}
  \RequirePackage[french]{babel}
}{%
  \setlength{\parskip}{0pt}
  \RequirePackage[english]{babel}
}

%% Set page dimensions
\geometry{hmargin=.75in,vmargin=.75in}

%% Set interligne
\renewcommand{\baselinestretch}{1}

%% Set headers and footers
\fancypagestyle{plain}{%
\fancyhf{}
\fancyhead[L]{\footnotesize Page \thepage}%/\pageref{LastPage}}
\fancyhead[R]{\footnotesize \@nname~$\bullet$~\@npin}
\renewcommand{\footrulewidth}{0pt}
\renewcommand{\headrulewidth}{0.4pt}%
}

%% Redefine title
\renewcommand\maketitle{%
\pagestyle{plain}
{\noindent\sf\bfseries\Large\@title}
\vskip 8pt
}

%% Redefine section heading
\titleformat{\section}{\sf\bfseries}{\thesection.\quad}{0pt}{}{}

%% Redefine sub-section heading
\renewcommand\thesubsection{\alph{subsection})}
\titleformat{\subsection}[block]{}{\thesubsection}{.5em}{}[\vspace{-2em}\rule{\titlewidth}{0.75pt}]

%% Redefine paragraph
\titleformat{\paragraph}[runin]{\bfseries}{\quad}{0pt}{}{}

%% ------------------------------
%% New: subsubsubsection
%% ------------------------------
\newcommand\subsubsubsection[1]{%
\noindent{\textit{#1}}
}

%% ------------------------------
%% So that the bibliography environment in the document
%% uses the proper heading
%% ------------------------------
\renewcommand\bibsection{\section*{\refname}}

% Hack: to compress bibitems
\makeatletter
\newcommand{\oldbibitem}[2][]{}
\let\oldbibitem\bibitem
\renewcommand{\bibitem}[2][]{\oldbibitem[#1]{#2} \vskip -4pt}
\makeatother

%% :mode=latex:wrap=none:
