function a=cepstrum_lpc(xhat,p,lxhat)
%
% function to convert from cepstral coefficients to lpc coefficients for
% the all pole filter
%
% Inputs:
%   xhat(1:lxhat) is the set of cepstral coefficients of the frame
%   p is the lpc analysis order
%   lxhat is the length of the cepstral coefficient sequence
%
% Output:
%   a is the set of lpc coefficients for the frame
%

% solve for lpc coefficients using the cepstral recursion
    a(1:lxhat)=0;
    a(1)=xhat(1);
    aef=fliplr(a);
    xhatf=fliplr(xhat);
    scale=[zeros(1,lxhat-p) p:-1:1];
    
    for n=2:p
        a(n)=xhatf(lxhat+1-n)-sum(xhatf.*aef.*scale)/n;
        aef(1:lxhat-1)=aef(2:lxhat);
        aef(lxhat)=a(n);
    end
end