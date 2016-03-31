%ISZENITY checks if Zenity is installed and loaded
% If Zenity is installed but not loaded ISZENITY loads it.
%
% OUTPUT:  Z - TRUE/FALSE - Zenity is installed and active or not
%
% USAGE:   [Z] = iszenity();
%
% Author: Hani Andreas Ibrahim

function Z = iszenity()

path = getenv('PATH');
  
% Is Zenity installed on system
if ispc() % for Windows
  if (!isempty(file_in_path(path,'zenity.exe')))
    zenity_inst = 1;
  else
    zenity_inst = 0;
  endif
else % for platforms other than Windows (UNIX, incl. Mac OS X)
  if (!isempty(file_in_path(path,'zenity')))
    zenity_inst = 1;
  else
    zenity_inst = 0;
  endif
endif

% Check if Zenity package is installed and loaded
inst=pkg('list'); % Cell array/structs with installed packages
pkgnum = size(inst)(2); % Number of packages
for i=1:pkgnum
  if strcmpi(inst{i}.name, 'zenity') && inst{i}.loaded == 1 % Zenity installed & loaded
    Z = 1;
    break;
  elseif strcmpi(inst{i}.name, 'zenity') && inst{i}.loaded == 0 % Zenity installed but not loaded
    pkg load zenity;
    Z = 1;
    break;
  else
    Z = 0;
  endif
endfor

return;

endfunction