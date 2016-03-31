% Check whether the committed NUM is a integer (postive and/or negative). 
%  
% INPUT:
%        num     : Number to be checked
%        onlypos : If 0 (default): Checks for positive and negative integers
%                  If 1: Checks only for positive integers incl. 0.
%        z       : If 0: Checks for integers w/o 0 
%                  If 1 (default): Checks integers w/ 0
%
% OUTPUT:
%        int     : TRUE (1) if num is an integer
%                  FALSE (0) if num is NOT an integer
%
% EXAMPLES:
%        isint(12)
%        => 1
%
%        isint(-12)
%        => 1
%
%        isint(12,1)
%        => 0
%
%        isint(12,1)
%        => 1
%
%        isint(-12,1)
%        => 0
%
%        isint(0, 0, 0)
%        => 0
%
%        isint(0, 0, 1)
%        => 1

function int = isint(num, onlypos, z)
  %Checking arguments
  if nargin < 1 || nargin > 3; error("Wrong numbers of arguments! Do 'help isint'"); endif
  if nargin == 1; onlypos = false; endif
  if nargin < 3; z = true; endif
  if ~isnumeric(num); error("First argument has to be numeric"); endif
  if (onlypos != false && onlypos != true) || (z != false && z != true) 
    error("Second (and third) argument has to be 1 or 0"); 
  endif
  
  if (isnumeric(num) && (num-floor(num) == 0) && onlypos == 0 && z == 1)
    int = true;
  elseif (isnumeric(num) && (num-floor(num) == 0) && onlypos == 0) && ...
         (z == 0 && num == 0)
    int = false;
  elseif (isnumeric(num) && (num-floor(num) == 0) && onlypos == 0) && ...
         (z == 0 && num != 0)
    int = true;;
  elseif (isnumeric(num) && (num-floor(num) == 0) && onlypos == 1 && num >= 0)
    int = true;
  elseif (isnumeric(num) && (num-floor(num) == 0) && onlypos == 1 && num < 0)
    int = false;
  else
    int = false;
  endif 
  
  return;

endfunction