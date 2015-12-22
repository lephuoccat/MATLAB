function a=parcor_lpccoef(p,k)
%
% function to convert from parcor coefficients to lpc polynomial
% coefficients
%
% Inputs:
%   p=lpc order
%   k=set of parcor coefficients (k(1:p))
% Output:
%   a=set of lpc coefficients for p-th order solution, A(z)=1-sum(i=1 to p)
%   a-sub-i times z.^(-i)

% initialize the lpc polynomial coefficients to 0
    alpha(1:p,1:p)=0;
 
% perform the recursion from k's to alpha's to a's for first through p-th
% order solutions
    for i=1:p
        alpha(i,i)=k(i);
        if (i > 1)
            for j=1:i-1
                alpha(j,i)=alpha(j,i-1)-k(i)*alpha(i-j,i-1);
            end
        end
    end
    
% final solution
    a(1:p)=alpha(1:p,p);
end
