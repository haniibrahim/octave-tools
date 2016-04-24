% Checks whether the committed NUM is a integer. You can specify if only
% positive or postive and negative integers are accepted as well as zero is 
% a valid integer or not. 
%
% USAGE
%        int = isint(num)
%        int = isint(num, onlypos)
%        int = isint(num, onlypos, z)
%  
% INPUT:
%        num     : Number to be checked
%        onlypos : If 0 (default): Checks for positive and negative integers
%                  If 1: Checks only for positive integers incl. 0.
%        z       : If 0: Checks for integers w/o zero (0) 
%                  If 1 (default): Checks integers w/ zero (0)
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
    error("Second (and third) argument has to be 1 or 0, true or false resp."); 
  endif
  
  if isnumeric(num) && (num-floor(num) == 0) && onlypos == false && z == true
    int = true;
  elseif isnumeric(num) && (num-floor(num) == 0) && onlypos == false && ...
         z == false && num != 0
    int = true;
  elseif isnumeric(num) && (num-floor(num) == 0) && onlypos == true && ...
         num > 0 && z == false
    int = true;;
  elseif isnumeric(num) && (num-floor(num) == 0) && onlypos == true && ...
         z == 1 && num >= 0
    int = true;
  else
    int = false;
  endif 
  
  return;

endfunction