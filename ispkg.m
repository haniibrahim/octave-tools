## -*- texinfo -*-
##
##@deftypefn {Function File} @var{retval} = ispkg(@var{pak})
##
##"ispkg" checks whether the package @var{pack} is installed.
##
##@var{pak} is a string. @var{retval} is a boolean which is TRUE if the package 
##@var{pak} is installed and FALSE if not. "ispkg" does not say whether the 
##package is loaded or not.
##
##@example
##@group
##ispkg("io")
##@result{} 1
##
##The package "io" is installed.
##@end group
##@end example
##@end deftypefn

%ISPKG checks whether a package is installed and loaded or not
% If package "pack" is installed but not loaded ISPKG loads "pack" if
% "loadpkg" is true.
%
% INPUT :  pack    - STRING - name of the package you want to look for
% OUTPUT:  P       - TRUE/FALSE - Package is installed and loaded or not
%
% USAGE:   P = ispkg("zenity");
%
% Author: Hani Andreas Ibrahim

function P = ispkg(pack)

% Checking argument
if (nargin == 0); print_usage(); endif

P=0;

inst=pkg('list'); % Cell array/structs with installed packages
pkgnum = size(inst)(2); % Number of packages

for i=1:pkgnum
  if strcmpi(inst{i}.name, pack)
    P = true;
    break;
  else
    P = false;
  endif
endfor
return;
endfunction
