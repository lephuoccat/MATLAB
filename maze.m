function [ A ] = maze( m,n )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
a(1:n)=[1:n];
b(1:m)=1;
X=b'*a;

c(1:m)=[1:m];
d(1:n)=1;
Y=d'*c;

A=X.^2+(Y.^2)';
end

