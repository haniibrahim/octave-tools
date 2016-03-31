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
## @deftypefn {Function File} {} text_menu_de (@var{title}, @var{opt1}, @dots{})
## NOTE: Formely known as "menu()" in Octave version < 4. In Octave 4 "menu()" is a
## GUI widget.
##
## The output of this version is in German language.
## 
## Print a title string followed by a series of options.  Each option will
## be printed along with a number.  The return value is the number of the
## option selected by the user.  This function is useful for interactive
## programs.  There is no limit to the number of options that may be passed
## in, but it may be confusing to present more than will fit easily on one
## screen.
##
## EXAMPLE:
##@example
##text_menu_de("Waehle", "1ste Wahl", "2te Wahl", "3te Wahl")
##Waehle
##
##  [ 1] 1ste Wahl
##  [ 2] 2te Wahl
##  [ 3] 3te Wahl
##
##Waehle eine Nummer:
## @end example
## @seealso{disp, printf, input}
## @end deftypefn

## Author: jwe

function num = text_menu_de (title, varargin)

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
    s = input ("Waehle eine Nummer: ", "s");
    num = sscanf (s, "%d");
    if (! isscalar (num) || num < 1 || num > nopt)
      printf ("\nerror: Eingabe ungueltig oder ausserhalb des Bereichs\n\n");
    else
      break;
    endif
  endwhile

endfunction

