## Copyright (C) 1993-2013 John W. Eaton
##
## This file is part of Octave.
##
## Octave is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or (at
## your option) any later version.
##
## Octave is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with Octave; see the file COPYING.  If not, see
## <http://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {Function File} {} text_menu (@var{title}, @var{opt1}, @dots{})
##
## Print a title string followed by a series of options.  Each option will
## be printed along with a number.  The return value is the number of the
## option selected by the user.  This function is useful for interactive
## programs.  There is no limit to the number of options that may be passed
## in, but it may be confusing to present more than will fit easily on one
## screen.
##
## NOTE: Formely known as "menu()" in Octave versions < 4. In Octave 4 "menu()" 
## is a GUI widget. text_menu() has a text-UI. Just renamed the original function
## menu().
##
## EXAMPLE:
##@example
##text_menu("Choose number", "1st Choice", "2nd Choice", "3rd Choice")
##Choose number
##
##  [ 1] 1st Choice
##  [ 2] 2nd Choice
##  [ 3] 3rd Choice
##Pick a number:
## @end example
## @seealso{disp, printf, input}
## @end deftypefn

## Author: jwe (renamed for Octave 4 by Hani A. Ibrahim)

function num = text_menu (title, varargin)

  if (nargin < 2)
    print_usage ();
  endif
  
  ## Force pending output to appear before the menu.

  fflush (stdout);

  ## Don't send the menu through the pager since doing that can cause
  ## major confusion.

  page_screen_output (0, "local");

  ## Process Supplied Options
  if (nargin == 2)
    ## List in a cell array
    if (iscell (varargin{1}))
      varargin = varargin{1};
      nopt = length (varargin);
      for i = 1:nopt
        while (iscell (varargin{i}))
          varargin{i} = varargin{i}{1};
        endwhile
      endfor
    else
      nopt = nargin - 1;
    endif
  else
    ## List with random elements in it - pick the first always
    for i = 1:nargin - 1
      if (iscell (varargin{i}))
        while (iscell (varargin{i}))
          varargin{i} = varargin{i}{1};
        endwhile
      else
        if (! ischar (varargin{i}))
          varargin{i} = varargin{i}(1);
        endif
      endif
    endfor
    nopt = length (varargin);
  endif

  if (! isempty (title))
    disp (title);
    printf ("\n");
  endif

  while (1)
    for i = 1:nopt
      printf ("  [%2d] ", i);
      disp (varargin{i});
    endfor
    printf ("\n");
    s = input ("Pick a number: ", "s");
    num = sscanf (s, "%d");
    if (! isscalar (num) || num < 1 || num > nopt)
      printf ("\nerror: Input not valid or out of range\n\n");
    else
      break;
    endif
  endwhile

endfunction

