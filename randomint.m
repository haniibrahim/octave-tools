%RADMOMINT computes a matrix of random integer numbers 
% between "min" and "max" and with "row" lines and "col" columns
%
% INPUT:  min - minimum value of the random integer numbers
%         max - maximum value of the random integer numbers
%         row - number of rows
%         col - number of colomns
% OUTPUT: Z_i - matrix of integers (row x col)
%
% USAGE:  [Z_i] = randomint(min, max, row, col)
%
% Author: Hani Andreas Ibrahim

function Z_i = randomint(min, max, row, col)
  if (min > max) % if min is greater than max => max=min & min=max
    min_1 = min;
    min = max;
    max = min_1;
  endif
  
   Z_i = floor(min + (max-min+1).*rand(row,col));
   
   return;
endfunction
    
    