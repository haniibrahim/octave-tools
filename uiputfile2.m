## -*- texinfo -*-
## @deftypefn  {Function File} @var{fname} = uiputfile2 ()
## @deftypefnx {Function File} @var{fname} = uiputfile2 (@var{flt})
## @deftypefnx {Function File} @var{fname} = uiputfile2 (@var{flt}, @var{dialog_name})
## @deftypefnx {Function File} @var{fname} = uiputfile2 (@var{flt}, @var{dialog_name}, @var{default_file})
## Open a GUI dialog for committing a file name and return the filename @var{fname}
## incl. path (in comparison to the original "uigetfile()"). Works equally on
## Octave 3.8 and 4.0.
##
## @var{flt} contains a (list of) file filter string(s) in one of the following
## formats:
##
## @table @asis
## @item @qcode{"/path/to/filename.ext"}
## If a filename is given the file extension is extracted and used as filter.
## In addition the path is selected as current path and the filename is
## selected as default file.  Example: @code{uiputfile ("myfun.m")}
##
## @item @qcode{"*.ext"}
## A single file extension.
## Example: @code{uiputfile ("*.ext")}
##
## @item @code{@{"*.ext", "My Description"@}}
## A 2-column cell array containing the file extension in the 1st column and
## a brief description in the 2nd column.
## Example: @code{uiputfile (@{"*.ext","My Description";"*.xyz",
## "XYZ-Format"@})}
## @end table
##
## The filter string can also contain a semicolon separated list of filter
## extensions.
## Example: @code{uiputfile (@{"*.gif;*.png;*.jpg",
## "Supported Picture Formats"@})}
##
## @var{dialog_name} can be used to customize the dialog title.
## If @var{default_file} is given it is preselected in the GUI dialog.
## If, in addition, a path is given it is also used as current path.
## @seealso{uigetfile, uigetdir}
## @end deftypefn

## Author: Hani Andreas Ibrahim
## License: GPL3 <http://www.gnu.org/licenses/gpl-3.0.html>

function path = uiputfile2(init_path, dialog_name)
  if (~exist("init_path","var")); init_path = ''; endif
  if (~exist("dialog_name","var")); dialog_name = ''; endif
  [f,p] = uiputfile(init_path, dialog_name); # f=filename | p=path
  if isgeversion(4) % Octave Version >= 4.0
    path = strcat(p, f);
  else % Octave version < 4.0 (e.g. 3.8)
    if ispc()
      path = strcat(p, '\', f);
    else
      path = strcat(p, '/', f);
    endif
  endif
  return;
endfunction
