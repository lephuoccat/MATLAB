function [ a,b,c ] = func1( x,y,z,u,v )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
A=[x y z u v];
a=sum(A);
b=prod(A);
c=mean(A);
end

