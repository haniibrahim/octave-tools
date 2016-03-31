%GETPLATFORM returns platform of the current machine
%
% OUTPUT: os - win: MS-Windows NT, 2000, XP, Vista, 7, 8.x
%              unx: GNU/Linux, *BSD, UNIX
%              mac: MacOSX, Darwin
%              unk: unknown
%
% USAGE:  [os] = getplatform()
%
% Author: Hani Andreas Ibrahim

function os = getplatform()
  if (ispc() && (getenv('OS') == 'Windows_NT'))
    os = 'win';
  elseif (ismac())
    os = 'mac';
  elseif (isunix())
    os = 'unx';
  else
    os = 'unk';
  endif
  
  return;
endfunction