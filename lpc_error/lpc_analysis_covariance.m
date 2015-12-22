function [x,xs1,error,es,xs2]=lpc_analysis_covariance(xin,ss,L,p,nfft,iwin_STFT);
%
% function to compute LPC covariance method analysis of selected frame, and
% to return the following:
%   -- the frame of speech (xin(ss-p:ss+L-1, 
%   -- the STFT of the frame of speech, xs1
%   -- the LPC spectrum, xs2
%   -- the error signal, (1:L)
%   -- the STFT of the error signal, es
%
% Inputs:
%   xin: speech file
%   ss: the starting sample of the lpc analysis frame
%   L: the length of the frame in samples
%   p: the lpc system order
%   nfft: the size fft used in STFT calculations
%   iwin_STFT: window type for STFT analysis of frame of speech and frame
%   of error signal
%
% Outputs:
%   x: the extended speech signal, x(ss-p:ss+L-1)
%   xs1: the STFT of the speech frame
%   error: the error signal from lpc analysis, error(1:L)
%   es: the STFT of the error signal
%   xs2: the lpc spectrum of the original signal

% define STFT window -- use rectangular window of length L+p samples
    win_STFT=ones(1,L+p)';
    U_STFT=L+p;
    U_log_STFT=10*log10(U_STFT);
    U_log_LPC=U_log_STFT;

% load speech window
    x=xin(ss-p:ss+L-1);
    x_STFT=x.*win_STFT;
    
% compute STFT of speech window
    xs1=20*log10(abs(fft(x_STFT,nfft)))-U_log_STFT;
    
% covariance method of lpc analysis
    [phim,phiv,EC,alphac,GC]=cholesky(x,L,p);
    numc=[1 -alphac'];
    xe=x';
    e=conv(numc,xe);
    error=e(p+1:L+p);

% define STFT window for error signal
    if (iwin_STFT == 1)
        error_STFT=error.*hamming(L)';
    else
        error_STFT=error(1:L);
    end
    
% error spectrum
    es=20*log10(abs(fft(error_STFT(1:L),nfft)))-U_log_LPC;
    
% lpc spectrum
    xs2=20*log10(GC)-20*log10(abs(fft(numc,nfft)))-U_log_LPC;  
end