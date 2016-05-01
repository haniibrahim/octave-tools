% Returns the number after the decimal point as a decimal number. 
% Do not consider negative numbers.
% 
% INPUT:
%        num: decimal number, e.g. 15.265 
%
% OUTPUT:
%        x  : decimal number w/o the integerpart, e.g. 0.265
%
% EXAMPLE
%
%      afterdecimal(12.23)
%      => 0.23000
%
%      afterdecimal(-12.23)
%      => 0.23000

function x = afterdecimal(num)
  if nargin < 1 || nargin > 1; error("Commit one decimal number"); endif
  if ~isnumeric(num); error("Only decimal number is allowed!"); endif
  
  if num < 0; num = num * -1; endif
  x = num - floor(num); 

%  xstr       = num2str(num,100); % Make number to string
%  comma_idx  = index(xstr, "."); % Find index of the decimal point in the string
%  if comma_idx == 0
%    x = 0;
%  else
%    sub = substr(xstr, comma_idx); % Cut the chars up to the decimal point
%    x   = str2num(sub); % Convert string back to a number
%  endif
  
  return;
  
endfunction