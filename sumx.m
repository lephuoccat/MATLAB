function [ sumx ] = sumx( x )
%SUMX Summary of this function goes here
%   Detailed explanation goes here
sumx = 0;
x=1:5;
for k=1:length(x);
    sumx = sumx + x(k);

end

