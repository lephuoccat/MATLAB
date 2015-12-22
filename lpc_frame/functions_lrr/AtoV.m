function [r,D,G]=AtoV(A,rN)
%
% [r,D,G]=AtoV(A,rN)
%
% Function to transform from a set of area functions for a lossless tube
% model to an equivalent vocal tract transfer function
%
% A model with N-1 equal length lossless tube section is assumed, where 
% each tube section is of length \Delta x, and the sequence of tube 
% areas is of the form: [A(1) A(2) ... A(N-1)].  An N-th tube, 
% with area A(N), is assumed to be infinite
% in length and looking into an impedance which gives a reflection
% coefficient at the lips of rN.  The reflection coefficient at
% the glottis is assumed to be rG=1, i.e, no loss at the glottis.
%
% To transform from a set of lossless tube areas to a set of reflection
% coefficients we use the simple formula for the reflection coefficients:
%       r_k=(A_{k+1}-A_k)/(A_{k+1}+A_k),    k=1,2,...,N-1
%       r_N=user specified value, e.g., r_N=0.7.
%       r_G is assumed to be 1; i.e., no loss at the glottis
%
% We solve for the vocal tract transfer function:
%       V(z)=G/D(z)=\prod_{k=1}^N (1+r_k) z^{-N/2} / D(z)
%
% The recursion for D(z) is as follows:
%       D_0 (z)=1
%       D_k(z)=D_{k-1}(z)+r_k z^{-k} D_{k-1}(z^{-1}), k=1,2,...,N
%       D(z)=D_N(z)
%
% Inputs:
%   A: set of areas of tubes 1 to N
%   rN: reflection coefficient at the N-th section (user specified)
% Outputs:
%   r: set of reflection coefficients, r1,r2,...,r{N-1}
%   D: denominator polynomial of vocal tract transfer function
%   G: numerator gain of vocal tract transfer function

% determine whether A is a row or column vector; if a column vector,
% make it a row vector
    [M,N]=size(A);
    if(M~=1) A=A'; end      %make row vector
    N=length(A);
    
% compute set of reflection coefficients, r1 to r{N-1}
    r=[];
    for m=1:N-1
        r=[r (A(m+1)-A(m))/(A(m+1)+A(m))];
    end

% extend r with rN reflection coefficient for N-th tube section
    r=[r rN];
    
% recursion for D polynomial; derive G term at the same time
    D=[1];
    G=1;
    for m=1:N
        G=G*(1+r(m));
        D=[D 0] + r(m).*[0 fliplr(D)];
    end
