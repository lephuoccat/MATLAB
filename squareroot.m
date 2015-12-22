function [r] = exx(x)
%EXX Summary of this function goes here
%   Detailed explanation goes here
if x < 0
    error('x is negative; sqrt(x) is imaginary');
else
    r=sqrt(x);

end

