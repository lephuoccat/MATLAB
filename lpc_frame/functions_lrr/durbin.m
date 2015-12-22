function [R,E,k,alpha,G]=durbin(xf,L,p,wtype)
%
% The function durbin is used to solve the autocorrelation method of linear
% prediction analysis
%
% function [R,E,k,alpha,G]=durbin(xf,N,p,wtype)
%
% Inputs:
%   xf: xf(1):xf(L), an array of speech samples for lpc analysis
%   L: length of speech frame being analyzed
%   p: lpc analysis order
%   wtype: window type for weighting speech samples; wtype=1 for Hamming
%   window; wtype=0 for rectangular window
% Outputs:
%   R: 1 x (p+1) array of the autocorrelation vector of the speech 
%       frame, R(1):R(p+1)
%   E: 1 x (p+1) array of residual energy for values of lpc order 
%       from 0 to p
%   k: 1 x p array of parcor parameters, k(1):k(p)
%   alpha: p x p array with lpc solutions for orders from 1 to p
%       alpha(1,1) is first order solution; alpha(1:2,2) is second
%       order solution, ... , alpha(1:p,p) is pth order solution
%   G: scalar lpc gain term
%
% Steps in solution via Durbin method:
%   - compute window based on wtype; wtype=1 for Hamming window, 
%   wtype=0 for Rectangular window
%
%   - compute R(0:p) from windowed xf
%
%   - solve Durbin recursion fo E,k,alpha in 8 easy steps
%       step 1--E(0)=R(0)
%       step 2--k(1)=R(1)/E(0)
%       step 3--alpha(1,1)=k(1)
%       step 4--E(1)=(1-k(1).^2)E(0)
%       steps 5-8--for i=2,3,...,p;  
%       step 5--k(i)=[R(i)-sum from j=1 to i-1 alpha(j,i-1).*R(i-j)]/E(i-1)
%       step 6--alpha(i,i)=k(i)
%       step 7--for j=1,2,...,i-1
%           alpha(j,i)=alpha(j,i-1)-k(i)alpha(i-j,i-1)
%       step 8--E(i)=(1-k(i).^2)E(i-1)

% design window sequence
    if wtype==1
        win=hamming(L);
    else
        win=boxcar(L);
    end
    
%  window frame for autocorrelation method    
    xf=xf.*win;

%  compute autocorrelation vector
    for k1=0:p
        R(k1+1)=sum(xf(1:L-k1).*xf(k1+1:L));
    end
    
%  solve for lpc coefficients using Durbin's method
%  initialize E, k and alpha arrays
    E=zeros(1,p);
    k=zeros(1,p);
    alpha=zeros(p,p);
    
% run Durbin recursion for lpc orders 2 to p
    E(1)=R(1);
    ind=1;
    k(ind)=R(ind+1)/E(ind);
    alpha(ind,ind)=k(ind);
    E(ind+1)=(1-k(ind).^2)*E(ind);
    for ind=2:p
        k(ind)=(R(ind+1)-sum(alpha(1:ind-1,ind-1)'.*R(ind:-1:2)))/E(ind);
        alpha(ind,ind)=k(ind);
        for jnd=1:ind-1
            alpha(jnd,ind)=alpha(jnd,ind-1)-k(ind)*alpha(ind-jnd,ind-1);
        end
        E(ind+1)=(1-k(ind).^2)*E(ind);
    end
    G=sqrt(E(p+1));
end
