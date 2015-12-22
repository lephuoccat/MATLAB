function [x,xs1,xs2,e,es]=lpc_error_spectrum(xin,fs,ss,iwin,iwin_STFT,L,nfft,p)
%
% compute lpc and error analysis showing both the signals and the resulting
% log magnitude spectra
%
% Inputs:
%   xin: speech array
%   fs: sampling rate of speech
%   ss: starting sample in file
%   iwin: LPC autocorrelation analysis window type (1:Hamming, 2:Rectangular)
%   iwin_STFT: window type for STFT analysis (1:Hamming, 2:Rectangular)
%   L: frame duration in samples
%   nfft: fft size for spectral computations
%   p: lpc analysis order
%
% Outputs:
%   x: window weighted frame of speech
%   xs1: log magnitude spectrum of original signal STFT
%   xs2: lpc spectrum
%   e: error signal obtained by filtering lpc input frame by inverse filter
%   es: error spectrum

% begin signal processing-define LPC analysis window
    if (iwin == 1)
        win=hamming(L);
        U_LPC=sum(hamming(L)'.^2);
    else
        win=ones(1,L)';
        U_LPC=L;
    end
    U_log_LPC=10*log10(U_LPC);
    
% define STFT window
    if (iwin_STFT == 1)
        win_STFT=hamming(L);
        U_STFT=sum(hamming(L)'.^2);
    else
        win_STFT=ones(1,L)';
        U_STFT=L;
    end
    U_log_STFT=10*log10(U_STFT);
    
% load window of speech from ss to ss+L-1
    x=xin(ss:ss+L-1).*win;
    x_STFT=x.*win_STFT;
    
% compute log magnitude spectrum of original signal STFT
    xs1=20*log10(abs(fft(x_STFT,nfft)))-U_log_STFT;
    
% perform LPC analysis to determine LPC polynomial, a
    [A,G,a,r]=autolpc(x,p);
    
% compute lpc spectrum
    xs2=20*log10(G)-20*log10(abs(fft(A,nfft)))-U_log_LPC;
    
% compute error signal by convolving lpc input frame by inverse filter
    % xe=[x' zeros(1,p)];
    % e=filter(A,1,xe);
    
    numc=A';
    e=conv(numc,x');
    e_STFT=e(p+1:p+L).*win_STFT';
    
% compute error spectrum
    es=20*log10(abs(fft(e_STFT,nfft)));

end

