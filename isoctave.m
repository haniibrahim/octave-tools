%ISOCTAVE checks if the enviroment is Octave or not (e.g. Matlab)
%
% OUTPUT: retval - 1(true) : Octave
%                - 0(false): Not Octave
%
% USAGE:  [retval] = isoctave()
%


function retval = isoctave()
  persistent cacheval; % speeds up repeated calls
  if isempty (cacheval)
    cacheval = (exist ('OCTAVE_VERSION', 'builtin') > 0);
  end
  retval = cacheval;
endfunction