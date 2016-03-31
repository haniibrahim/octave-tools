%RADMONFLOAT computes a matrix of random floating point numbers 
% between "min" and "max" and with "row" lines and "col" columns
%
% INPUT:  min - minimum value of the random float numbers
%         max - maximum value of the random float numbers
%         row - number of rows
%         col - number of colomns
% OUTPUT: Z_f - matrix of floats (row x col)
%
% USAGE:  [Z_f] = randomfloat(min, max, row, col)
%
% Author: Hani Andreas Ibrahim

function Z_f = randomfloat(min, max, row, col)

  if (min > max) % if min is greater than max => max=min & min=max
    min_1 = min;
    min = max;
    max = min_1;
  endif
  
   Z_f = min + (max-min).*rand(row,col);
   
   return;
endfunction

    