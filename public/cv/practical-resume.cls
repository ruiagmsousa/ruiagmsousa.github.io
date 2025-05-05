\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{practical-resume}[2020/07/01 Practical Résumé Class]
\LoadClass[9pt]{article}
\pagenumbering{arabic} %page numbering

% Standards
\RequirePackage{xunicode}
\RequirePackage[top=.6in, bottom=.6in, left=1in, right=1in]{geometry}
\RequirePackage{xltxtra}
\RequirePackage{fontspec}
\RequirePackage{ifmtarg} 
\RequirePackage{csquotes}
\RequirePackage{listings}
\RequirePackage{enumitem}
\RequirePackage{multicol} %for multiple columns

% Personalized colors
\RequirePackage[svgnames,dvipsnames]{xcolor}
\definecolor{linkpink}{HTML}{E91E63} % A nice pink (material pink 500)
\definecolor{linkgreen}{HTML}{388E3C}% Define a nice green color for email links
\definecolor{transp50}{gray}{0.5}

% Refs
\RequirePackage[ %(email, website)
    colorlinks=true,
    linkcolor=linkpink,
    urlcolor=linkpink,
    citecolor=linkpink
]{hyperref} 


% Footer
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
%center footnote
\fancyfoot[C]{
    \textcolor{transp50}{\sffamily\addfontfeature{LetterSpace=20}\selectfont\MakeUppercase\foot}
}

% Page counting
\RequirePackage{pageslts}
\pagenumbering{arabic} % Make sure to use the pagenumbering from pageslts
\fancyfoot[R]{
  \sffamily\small\MakeUppercase{Page} \thepage/\hypersetup{hidelinks}\pageref{LastPages}%
}

% Name Section
\DeclareTextFontCommand{\namefont}{\sffamily\addfontfeature{LetterSpace=15}\fontsize{20}{30}\selectfont}
\newcommand*{\namehead}{
	\centering\namefont{
		\MakeUppercase\name}
	\par
	\vspace{1em}
	}

% Address Section
\newcommand{\addressstyle}{%
  \centering\sffamily\addfontfeature{LetterSpace=15}\fontsize{10}{12}\selectfont
}

% Define the address environment with 2 columns (Address LEFT, Contact RIGHT)
\newenvironment{address}[4]{% <-- takes 4 arguments
  \addressstyle
  \begin{multicols}{2} % Start two-column layout
  \columnsep=-0.5em % Adjust space between columns

  % LEFT column — Mailing Address
  \raggedright
  #1\par

  \columnbreak % Break to second column

  % RIGHT column — Last updated, Email, Website
  \raggedright % Align all on the left in this column
  \noindent
  \textbf{Last updated:}~#4 \par\vspace{0.3em}

  \noindent
  \textbf{Email:}~\href{mailto:#2}{#2} \par \par
  \vspace{0.1em}
  \noindent
  \textbf{Website:}~\href{#3}{#3} \par

  \end{multicols}
}


% Section Headings
\DeclareTextFontCommand{\headingfont}{\sffamily\bfseries\addfontfeature{LetterSpace=5}\fontsize{8}{10}\selectfont} 
\newenvironment*{sectionheading}[1]{
	\vspace{0.25em}
	\raggedright\hrulefill\par
	\vspace{-0.25em}
	\headingfont{\textbf{\MakeUppercase{#1}}}
	\vspace{0.25em}
	\newline\par
}

% Company Name, Location, Dates
\makeatletter
	\newenvironment*{organization}[3]{
		\vspace*{-0.25em}
		\raggedright
		{\Large #1{\@ifmtarg{#2}{}{,}}} 
		#2
		\hfill {\large #3}
		\par
		\vspace{0.25em}
	}
\makeatother

% Position and responsibilites
\usepackage{ifthen} % Add this in your preamble

\makeatletter
\newenvironment{position}[3][]{%
    \def\@position@uselisting{#1}%
    \vspace{0em}%
    {\@ifmtarg{#2}{\empty\vspace*{-0.5em}}{\itshape #2}}%
    {\@ifmtarg{#3}{\empty}{#3}}%
    \ifthenelse{\equal{\@position@uselisting}{noitemize}}{}{%
        \begin{itemize}[leftmargin=2.5em, labelsep=0.5 em,itemsep=0em,label=\raisebox{0.2em}{\tiny$\bullet$}]%
        \vspace{-0.25em}%
    }%
}{%
    \ifthenelse{\equal{\@position@uselisting}{noitemize}}{}{%
        \end{itemize}%
    }%
    \vspace*{.5em}%
}
\makeatother

% Abstract
\RequirePackage{ragged2e}
\newcommand{\justifiedpar}{\justifying\setlength{\parindent}{0pt}}
\newenvironment{cvabstract}{%
    \par\vspace{0.5em}
    \hspace{0.5em}\textbf{Abstract: }%
    \justifiedpar
}{%
    \par\vspace{0.5em}%
}

% Optional: Create shorthand commands for common label types
\newcommand{\labelitem}[2]{\item[\textbf{#1:}] #2}

