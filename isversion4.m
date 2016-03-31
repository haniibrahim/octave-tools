% Check for Octave version 4 or higher
%
% OUTPUT: [v] : TRUE  - You use version 4 or higher
%               FALSE - You use version 3 or lower

function [v] = isversion4()
  ver = OCTAVE_VERSION;
  ind = index(ver, ".");
  if ind == 0 
    ver_n = str2num(ver); % ver does not contain a dot (.), take the whole string for ver_n
  endif
  ver_n = str2num(strtrunc(ver, ind-1)); % ver_n = First level version numer, e.g. ver=3.8.2 => ver_n=3
  if ver_n >= 4
    v = 1;
  elseif ver_n < 4  
    v = 0;
  endif
endfunction