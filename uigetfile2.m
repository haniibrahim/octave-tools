## -*- texinfo -*-
## @deftypefn  @var{fname} = uigetfile2 ()
## @deftypefnx @var{fname} = uigetfile2 (@var{flt})
## @deftypefnx @var{fname} = uigetfile2 (@var{flt}, @var{dialog_name})
## @deftypefnx @var{fname} = uigetfile2 (@var{flt}, @var{dialog_name}, @var{default_file})
## @deftypefnx @var{fname} = uigetfile2 (@dots{}, "Position", [@var{px} @var{py}])
## @deftypefnx @var{fname} = uigetfile2 (@dots{}, "MultiSelect", @var{mode})
##
## Open a GUI dialog for selecting a file and return the filename @var{fname}
## incl. path (in comparison to the original "uigetfile()"). Works equally on
## Octave 3.8 and 4.0.
##
## @var{flt} contains a (list of) file filter string(s) in one of the following
## formats:
##
## @table @asis
## @item @qcode{"/path/to/filename.ext"}
## If a filename is given then the file extension is extracted and used as
## filter.  In addition, the path is selected as current path and the filename
## is selected as default file.  Example: @code{uigetfile ("myfun.m")}
##
## @item A single file extension @qcode{"*.ext"}
## Example: @code{uigetfile ("*.ext")}
##
## @item A 2-column cell array
## containing a file extension in the first column and a brief description in
## the second column.
## Example: @code{uigetfile (@{"*.ext", "My Description";"*.xyz",
## "XYZ-Format"@})}
##
## The filter string can also contain a semicolon separated list of filter
## extensions.
## Example: @code{uigetfile (@{"*.gif;*.png;*.jpg", "Supported Picture
## Formats"@})}
## @end table
##
## @var{dialog_name} can be used to customize the dialog title.
##
## If @var{default_file} is given then it will be selected in the GUI dialog.
## If, in addition, a path is given it is also used as current path.
##
## The screen position of the GUI dialog can be set using the
## @qcode{"Position"} key and a 2-element vector containing the pixel
## coordinates.  Two or more files can be selected when setting the
## @qcode{"MultiSelect"} key to @qcode{"on"}.  In that case @var{fname} is a
## cell array containing the files.
## @seealso{uiputfile, uigetdir}
## @end deftypefn

## Author: Hani Andreas Ibrahim
## License: GPL3 <http://www.gnu.org/licenses/gpl-3.0.html>

function path = uigetfile2(init_path, dialog_name)
  if (~exist("init_path","var")); init_path = ''; endif
  if (~exist("dialog_name","var")); dialog_name = ''; endif
  [f,p] = uigetfile(init_path, dialog_name); # f=filename | p=path
  if isgeversion(4) || ~(isgeversion(4) && isguirunning()) % Octave Version >= 4.0 or < 4 but CLI version
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