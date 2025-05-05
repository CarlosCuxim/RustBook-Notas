\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{qx-files/qx-notes}[2025-05-04 Qx class for multipurpose notes creation]

% ==============================================================================
%
% PRELIMINARY DECLARATIONS =====================================================
%
% ==============================================================================


% This load special if commands, to make comparations
\RequirePackage{etoolbox}


% ==============================================================================
%
% OPTIONS DECLARATION
%
% ==============================================================================

% Create boolean variables to store the options. Per default, this new ifs will
% be created by the \DeclareKeys, but I put here for clarification
% \newif\ifqx@pagecolor
% \newif\ifqx@stretchmode
% \newif\ifqx@draftmode

\DeclareKeys[qx-notes]{
  pagecolor.if = qx@pagecolor,
  pagecolor.pass-to-packages = true,
  %
  pagesize.store = \qx@pageSize,
  %
  stretchmode.if = qx@stretchmode,
  %
  draft.if = qx@draftmode,
}

\ProcessKeyOptions


% Set default values for options
\ifdefempty{\qx@pageSize}{%
  \renewcommand*\qx@pageSize{letterpaper}%
}{}




% ==============================================================================
%
% BASE CLASS LOAD
%
% ==============================================================================

% Pass draft mode to article class
\ifqx@draftmode
  \PassOptionsToClass{draft}{article}%
\fi

% Base document class
\LoadClass{article}



% ==============================================================================
%
% PACKAGE LOADING
%
% ==============================================================================


% Page size control packages
\ifdefstring{\qx@pageSize}{mobile}{%
  \PassOptionsToPackage{
    paperwidth  = 3.5in,
    paperheight = 7.5in,
    margin      = 0.1in,
  }{geometry}%
}{%
  \PassOptionsToPackage{\qx@pageSize}{geometry}%
}

\RequirePackage{geometry}


\RequirePackage{qx-files/qx-listings}




% ==============================================================================
%
% CLASS DECLARATIONS
%
% ==============================================================================

% Stretch Mode -----------------------------------------------------------------
\ifqx@stretchmode
  \emergencystretch=1in%
  \hbadness=10000%
\fi


% Theme Declaration ------------------------------------------------------------


\ifqx@pagecolor
  \pagecolor{qx-page}
  \color{qx-text}
\fi




\endinput
