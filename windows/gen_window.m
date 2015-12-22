function [win1,win2,win3,win4,win5,win6] = gen_window(WL,M)
%
% Given window length of WL samples, with M=WL-1, generate window shape
% for each of the 5 standard window types and for modified Hamming window
%
% Inputs:
%   WL: window length in samples
%   M: WL-1
%
% Outputs:
%   win1: shape of rectangular window
%   win2: shape of triangular window
%   win3: shape of Hann window
%   win4: shape of Hamming window
%   win5: shape of modified Hamming window
%   win6: shape of Blackman window

% rectangular window
    n=0:M;
    win1(1+n)=1;
    
% triangular window
    if (mod(M,2) == 0)
        n1=0:M/2;
        win2(1+n1)=2*n1/M;
        n2=M/2+1:M;
        win2(n2+1)=2-2*n2/M;
    else
        n1=0:(M-1)/2;
        win2(n1+1)=2*n1/M;
        n2=(M+1)/2:M;
        win2(n2+1)=2-2*n2/M;
    end
    
% Hann window
    n1=0:M;
    win3(1+n1)=0.5-0.5*cos(2*pi*n1/M);
    
% Hamming window
    n1=0:M;
    win4(1+n1)=0.54-0.46*cos(2*pi*n1/M);
    
% Modified Hamming window (last window sample set to 0)
    n1=0:M;
    win5(1+n1)=0.54-0.46*cos(2*pi*n1/M);
    win5(M+1)=0;
    
% Blackman window
    n1=0:M;
    win6(1+n1)=0.42-0.5*cos(2*pi*n1/M)+0.08*cos(4*pi*n1/M);

end

