\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesPackage{newseye_del}[2019/2/27 NewsEye Deliverable Package]

% Passes and class options to the underlying article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions

% Load the KOMA article class
% Paragraphs are supposed to be separated by "a blank line":
% KOMA provides this with the full+ option
\LoadClass[10pt, a4paper, parskip=full-]{scrartcl}


\RequirePackage[%
    lmargin=2.54cm, rmargin=2.54cm, tmargin=2.41cm, bmargin=2.06cm,
    footskip=0.8cm, includefoot%
]{geometry} % decreases margins
% Text width within margins is 15.98cm

\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage[utf8]{inputenc}

\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}

\RequirePackage{graphicx}
\RequirePackage[absolute]{textpos}
\RequirePackage{tabularx}
\RequirePackage{lastpage}
\RequirePackage{multirow}
\RequirePackage{datetime}  % for defining document dates
\RequirePackage[table]{xcolor}
\RequirePackage{float}


\RequirePackage{makecell}     % Makes it possible to add line breaks to table cells
\renewcommand{\cellalign}{tl} % Set the default alignment for cells created with \makecell to top left


% Use Helvetica: it's an open source font that looks
% like Arial, which is what's required
\usepackage{helvet}
% Use sans serif fonts throughout
\renewcommand{\familydefault}{\sfdefault}

% Some general formatting setup to follow the guidelines
% Line spacing should be 1.2
\linespread{1.2}
% But don't but spacing between list items
\RequirePackage{enumitem}
\setlist[itemize]{parsep=0pt}
\setlist[enumerate]{parsep=0pt}
% Not too much spacing around headings
\RedeclareSectionCommand[%
    beforeskip=5pt plus 3pt minus 3pt,%
    afterskip=1sp plus 2pt minus 0pt%
]{section}
\RedeclareSectionCommand[%
    beforeskip=3pt plus 3pt minus 2pt,%
    afterskip=1sp plus 0pt minus 0pt%
]{subsection}
\RedeclareSectionCommand[%
    beforeskip=1sp plus 1sp minus 1sp,%
    afterskip=-10pt%
]{paragraph}


% Styling of hyperlinks
\RequirePackage[final]{hyperref} % adds hyper links inside the generated pdf file
\hypersetup{
	colorlinks=true,       % false: boxed links; true: colored links
	linkcolor=blue,        % color of internal links
	citecolor=blue,        % color of links to bibliography
	filecolor=magenta,     % color of file links
	urlcolor=blue
}


% Define header and footer
\RequirePackage{fancyhdr}

\fancyhf{}
\lhead{\includegraphics[height=1cm]{newsEye}}
\chead{D\vardnum: \varshorttitle}
\rhead{CULT-COOP-09-2017}
\lfoot{\thepage\ of \pageref*{LastPage}}

\renewcommand{\headrulewidth}{1pt}
\renewcommand{\footrulewidth}{1pt}
\setlength{\headheight}{1.16cm}


%%% Variables for title page info
% Deliverable number
\newcommand{\dnum}[1]{\def\vardnum{#1}}
% Subtitle
\newcommand{\subtit}[1]{\def\varsubtit{#1}}
% Main author
\newcommand{\mainauthor}[1]{\def\varauthor{#1}}
% Co-author(s)
\newcommand{\coauthor}[1]{\def\varcoauthor{#1}}
% Dissemination level
\newcommand{\distribution}[1]{\def\vardist{#1}}
% Deliverable type
\newcommand{\type}[1]{\def\vartype{#1}}
% Status: one of three
\newcommand{\stat}[1]{\def\varstat{#1}}
\newcommand{\resp}[1]{\def\varresp{#1}}
\newcommand{\contri}[1]{\def\varcontri{#1}}
\newcommand{\intrew}[1]{\def\varinrew{#1}}
\newcommand{\shorttitle}[1]{\def\varshorttitle{#1}}
\newcommand{\docid}[1]{\def\vardocid{#1}}
\newcommand{\version}[1]{\def\varversion{#1}}
\newcommand{\duemonth}[1]{\def\varduemonth{#1}}


% Redefine the \titlepage command to generate
% the full cover matter for the deliverable
\renewcommand{\titlepage}{
    \pagestyle{empty}
    \begin{center}
        \vspace{3.5cm}
        \includegraphics[width=2.6cm]{newsEye}  \hfill \includegraphics[width=2.7cm]{eu}

        \vspace{2.2cm}
        \textsf{Project Number: \textbf{770299}}  \\
        \vspace{1.1cm}
        \textbf{\large NewsEye:} \\
        \vspace{0.3cm}
        \textbf{\large A Digital Investigator for Historical Newspapers} \\
        \vspace{1.5cm}
        \textsf{Research and Innovation Action} \\
        \textsf{Call H2020-SC-CULT-COOP-2016-2017} \\
        \vspace{1.25cm}
        \textsf{\textbf{\Large D\vardnum: \@title}} \\
        \textsf{\textbf{\large \varsubtit}} \\
        \vfill
        \textsf{Due date of deliverable: M\varduemonth{} (\getdateday{duedate} \monthname[\getdatemonth{duedate}] \getdateyear{duedate})}\\
        \vspace{0.2cm}
        \textsf{Actual submission date: \getdateday{versiondate} \monthname[\getdatemonth{versiondate}] \getdateyear{versiondate}}\\
    \end{center}

    \vfill
    \textbf{Start date of project:} 1 May 2018 \hfill \textbf{Duration:} 36 months
    \vfil

    Partner organization name in charge of deliverable: \varresp
    \vspace{0.25cm}

    % Actual widths: |p{1.27cm}|p{13.28cm}|p{1.31cm}|
    % \tabcolsep = 0.21cm, subtracted from each width (0.42, for both sides)
    \begin{tabular}{ |p{0.85cm}|p{12.86cm}|p{0.89cm}| }
    \hline
    \rowcolor{lightgray}
    \multicolumn{3}{|c|}{\textbf{Project co-funded by the European Commission within Horizon 2020}} \\
    \hline
    \rowcolor{lightgray}
    \multicolumn{3}{|c|}{\textbf{Dissemination Level}} \\
    \hline
    PU & \footnotesize{Public} & - \\
    PP & \footnotesize{Restricted to other programme participants (including the Commission Services)} & - \\
    RE & \footnotesize{Restricted to a group specified by the Consortium (including the Commission Services)} & - \\
    CO & \footnotesize{Confidential, only for members of the Consortium (including the Commission Services)} & CO \\
    \hline
    \end{tabular}


    \newpage
    \textbf{Revision History}\\[5pt]
    \noindent\begin{tabularx}{\textwidth}{|l|l|l|}
        \hline
        \rowcolor{lightgray} \multicolumn{3}{|l|}{\textbf{Document administrative information}} \\
        \hline
        \textbf{Project acronym:} & \multicolumn{2}{|X|}{NewsEye}\\
        \hline
        \textbf{Project number:} & \multicolumn{2}{|X|}{770299}\\
        \hline
        \textbf{Deliverable number:} & \multicolumn{2}{|X|}{D\vardnum}\\
        \hline
        \textbf{Deliverable full title:} & \multicolumn{2}{|X|}{\@title\  \varsubtit}\\
        \hline
        \textbf{Deliverable short title:} & \multicolumn{2}{|X|}{\varshorttitle}\\
        \hline
        \textbf{Document identifier:} & \multicolumn{2}{|X|}{\vardocid}\\
        \hline
        \textbf{Lead partner short name:} & \multicolumn{2}{|X|}{\varresp}\\
        \hline
        \textbf{Report version:} & \multicolumn{2}{|X|}{V\varversion}\\
        \hline
        \textbf{Report preparation date:} & \multicolumn{2}{|X|}{\getdateday{versiondate}.\getdatemonth{versiondate}.\getdateyear{versiondate}}\\
        \hline
        \textbf{Dissemination level:} & \multicolumn{2}{|X|}{\vardist}\\
        \hline
        \textbf{Nature:} & \multicolumn{2}{|X|}{\vartype}\\
        \hline
        \textbf{Lead author:} & \multicolumn{2}{|X|}{\varauthor}\\
        \hline
        \textbf{Co-authors:} & \multicolumn{2}{|X|}{\varcoauthor}\\
        \hline
        \textbf{Internal reviewers:} & \multicolumn{2}{|X|}{\varinrew}\\
        \hline
        \multirow{3}{*}{\textbf{Status:}}
            & \ifthenelse{\equal{\varstat}{Draft}}{x}{} & Draft\\
            \cline{2-3}
            & \ifthenelse{\equal{\varstat}{Final}}{x}{} & Final\\
            \cline{2-3}
            & \ifthenelse{\equal{\varstat}{Submitted}}{x}{} & Submitted\\
        \hline
    \end{tabularx}

  \def\titlepage{}
  \pagestyle{fancy}
}
