## -*- texinfo -*-
##
##@deftypefn {Function File} @var{retval} = isgeversion(@var{version})
##
##"isgeversion" checks whether the used Octave version is equal or greater than 
##the commited version number @var{version}.
##
##@var{version} is a floating point number (e.g. 3.8). Three-level version 
##numbers are not possible of course.
##
##@var{retval} is a boolean which is TRUE if the Octave version you use is 
##equal or greater then @var{version}, otherwise @var{retval} is FALSE.
##
##@example
##@group
##OCTAVE_VERSION
##@result{} 4.0.0
##isgeversion(3.8)
##@result{} 1
##
##The used Octave version (4.0.0) is obviously greater than 3.8.
##@end group
##@end example
##@end deftypefn

function [retval] = isgeversion(v)
  
  % Check argument
  if (nargin == 0); print_usage; endif
  if (~isnumeric(v))
    fprintf(stderr, ...
      "error: The committed value VERSION has to be a numeric (e.g. 3.8)\n");
    print_usage(); endif
  
  ver_curr = OCTAVE_VERSION; % current Octave version
  ind = strfind(ver_curr, "."); % indices where dots are in the strings
  
  if isempty(ind) 
    ver_s = ver_curr; % ver does not contain a dot (.), take the whole string for ver_n
  else  
    ver_s = strtrunc(ver_curr, ind(2)-1); % cut the "ver" string just before the second dot if applicable.
  endif
  
  ver_n = str2num(ver_s);
    
  if ver_n >= v
    retval = true;
  elseif ver_n < v  
    retval = false;
  endif
endfunction