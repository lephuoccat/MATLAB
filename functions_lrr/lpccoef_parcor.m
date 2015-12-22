function k=lpccoef_parcor(p,a)
%
% function to convert from lpc polynomial coefficients to parcor
% coefficients
%
% Inputs:
%   p=lpc order
%   a=set of lpc coefficients for p-th order solution, A(z)=1-sum(i=1 to p)
%   a-sub-i times z.^(-i)
% Output:
%   k=set of parcor coefficients

% initialize alpha array
    alpha(1:p,1:p)=0;
    alpha(1:p,p)=a;
    k(p)=alpha(p,p);
    
% run the recursion backwards (from p-th order solution to first order
% solution; end result is the set of k's
    for i=p:-1:2
        for j=1:i-1
            alpha(j,i-1)=(alpha(j,i)+k(i)*alpha(i-j,i))/(1-k(i).^2);
        end
        k(i-1)=alpha(i-1,i-1);
    end
end
