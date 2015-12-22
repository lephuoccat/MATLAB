function    [r,A]=VtoA(D,A1)
%
%   [r,A]=VtoA(D,A1)
%
% Function to transform from a vocal tract transfer function, D, to
% a set of area functions for an N-section lossless tube model.  The area
% of the first tube (closest to glottis) is arbitrary and is specified by
% the input parameter A1.
%
% A model with N-1 equal length lossless tube section is assumed, where 
% each tube section is of length \Delta x, and the sequence of tube 
% areas is of the form: [A(1) A(2) ... A(N-1)].  An N-th tube, 
% with area A(N), is assumed to be infinite
% in length and looking into an impedance which gives a reflection
% coefficient at the lips of rN.  The reflection coefficient at
% the glottis is assumed to be rG=1, i.e, no loss at the glottis.
%
% To transform from a set of reflection coefficients of a lossless tube 
% to a set of tube areas we use the simple formula:
%       A_k=A_{k-1}*(1_r_{k-1})/(1-r_{k+1}), k=2,3,...,N;  A(1) arbitrary
%       r_N=user specified value, e.g., r_N=0.7.
%       r_G is assumed to be 1; i.e., no loss at the glottis
%
% We solve for the vocal tract transfer function polynomial, D(z), 
% recursively from N down to 1 as follows:
%       D_k(z)=D_{k-1}(z)+r_k z^k D_{k-1}(z^{-1})
%       D_k(z^{-1})=D_{k-1}(z^{-1})+r_k z^{-k} D_{k-1}(z)
%       -r_k z^k D_k(z^{-1})=-r_k z^k D_{k-1}(z^{-1}) -r_k^2 D_{k-1}(z)
%       D_k(z)-r_k z^k D_k(z^{-1})=D_{k-1}(z)-r_k^2 D_{k-1}(z)
%       D_{k-1}(z)=(D_k(z)-r_k z^k D_k(z^{-1})/(1-r_k^2)=D_{k-1}(z)
%
% Inputs:
%   D: denominator polynomial of N-th order vocal tract system
%   A1: arbitrary area of first vocal tract lossless tube
% Outputs:
%   r: set of reflection coefficients, r1,r2,...,r{N-1}
%   A: tube areas, A(2),A(3),...,A(N)

% Initialize denominator polynomial
    Dm=D;
    
% determine whether Dm is a row or column array; if not a row array, take
% transpose to convert to a row array of length N+1
    [M,N]=size(Dm);
    if(M~=1) Dm=Dm'; end
    N=length(Dm)-1;
    
% recurse backwards to solve for vocal tract denominator polynomial for
% N-1,N-2,...,1 section solutions
% simultaneously determine r as the highest order term in the polynomial
    r=Dm(N+1);
    for m=(N):(-1):2
        Dm=(Dm-r(1)*fliplr(Dm))/(1-r(1)^2);
        Dm=Dm(1:m);
        r=[Dm(m) r];
    end
    
% solve for vocal tract tube areas; first area is arbitrary and is
% specified as A1 input parameter
    A=[A1];
    for m=2:N
        Am=A(m-1)*(1+r(m-1))/(1-r(m-1));
        A=[A Am];
    end