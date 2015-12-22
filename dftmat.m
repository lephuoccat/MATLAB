function [ A ] = dftmat( N )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
for k = 0:(N-1)
    for n = 0:(N-1)
        A(k+1,n+1) = exp(-2*pi*1j./N.*k.*n);
    end
end
end

