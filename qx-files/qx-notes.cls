\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{qx-files/qx-notes}[2024-11-24 Qx package for notes creation]

% ==============================================================================
%
% PRELIMINARY DECLARATIONS =====================================================
%
% ==============================================================================


\RequirePackage{etoolbox}
\RequirePackage{ifthen}


% ==============================================================================
%
% OPTIONS DECLARATION
%
% ==============================================================================

% Create boolean variables to store the options

\DeclareKeys[qx-notes]{
  pagecolor.if = qx@pagecolor,
  %
  pagesize.store = \qx@pageSize,
  %
  stretchmode.if = qx@stretchmode,
  %
  draft.if = qx@draftmode,
  %
  store.store = \mystore
}

\ProcessKeyOptions


% Set default values for options
\ifdefvoid{\qx@pageSize}{\renewcommand*\qx@pageSize{letterpaper}}{}




% ==============================================================================
%
% BASE CLASS LOAD
%
% ==============================================================================

% Pass draft mode to article class
  \ifqx@draftmode \PassOptionsToClass{draft}{article}

% Base document class
\LoadClass{article}



% ==============================================================================
%
% PACKAGE LOADING
%
% ==============================================================================


% Page size control packages
\ifthenelse{\equal{\qx@pageSize}{mobile}}{%
  \PassOptionsToPackage{
    paperwidth  = 3.5in,
    paperheight = 7.5in,
    margin      = 0.1in,
  }{geometry}%
}{%
  \PassOptionsToPackage{\qx@pageSize}{geometry}%
}

\RequirePackage{geometry}



\PassOptionsToPackage{style=mocha}{catppuccinpalette}
\RequirePackage{catppuccinpalette}



% Box and listings package
\RequirePackage{tcolorbox}
  \tcbuselibrary{minted}
  \tcbuselibrary{skins}
  \tcbuselibrary{breakable}
  %
  \usetikzlibrary{babel}
  \usetikzlibrary{calc}
  \usetikzlibrary{backgrounds}
  \usetikzlibrary{arrows.meta}
  %
  \usemintedstyle{catppuccin-mocha} 



% ==============================================================================
%
% CLASS DECLARATIONS
%
% ==============================================================================

% Stretch Mode -----------------------------------------------------------------
\ifqx@stretchmode
  \emergencystretch=1in%
  \hbadness=10000
\fi


% Theme Declaration ------------------------------------------------------------


\colorlet{qx-page}{CtpBase}%
\colorlet{qx-text}{CtpText}%
\colorlet{qx-codebg}{CtpBase}
\colorlet{qx-codeframe}{CtpOverlay2}
\colorlet{qx-buttonbg}{CtpCrust}%
\colorlet{qx-buttontext}{CtpSubtext1}%
\colorlet{qx-buttonframe}{CtpOverlay0}%
\colorlet{qx-note}{CtpBlue}


\ifqx@pagecolor
  \pagecolor{qx-page}
  \color{qx-text}
\fi




\endinput
