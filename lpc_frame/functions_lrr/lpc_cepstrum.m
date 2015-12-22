function xhat=lpc_cepstrum(a,p,lxhat)
%
% function to convert from lpc coefficients to cepstral coefficients 
% for all pole filter
%
% Inputs:
%   a(1:p) is the input set of lpc coefficients
%   p is the lpc order
%   lxhat is the number of cepstral coefficients to be computed
%
% Output:
%   xhat(1:lxhat) is the set of cepstral coefficients of the frame
%

% run the recursion formula for minimum phase signal
    xhat(1:lxhat)=0;
    xhat(1)=a(1);
    ae=[a zeros(1,lxhat-p)];
    aef=fliplr(ae);
    xhatf=fliplr(xhat);
    scale=[zeros(1,lxhat-1) 1];
    
    for n=2:lxhat
        xhat(n)=aef(lxhat+1-n)+sum(xhatf.*aef.*scale)/n;
        xhatf(1:lxhat-1)=xhatf(2:lxhat);
        xhatf(lxhat)=xhat(n);
        scale(1:lxhat-1)=scale(2:lxhat);
        scale(lxhat)=n;
    end
end