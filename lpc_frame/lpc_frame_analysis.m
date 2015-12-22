function [f,h0,ha,hc,hl,U_log_STFT,U_log_LPC,U_log_LPC_co_la]=...
    lpc_frame_analysis(xin,fs,ss,Lm,iwin_LPC,iwin_STFT,p,nfft)
%
% Solve for lpc solution using three analysis methods
% Method 1: autocorrelation analysis using (Hamming or rectangular) window
% Method 2: covariance analysis using extended rectangular window
% Method 3: lattice analysis
%
% use all three lpc solutions on a specified frame of speech
%
%  read in speech file, choose section of speech and solve for set of
%  lpc coefficients using the autocorrelation method, the covariance 
%  method, and the lattice method
%
%  determine spectral correction factor due to different window sizes and
%  frame durations
%
%  plot the resulting log magnitude spectra from all three methods along
%  with the log magnitude of the STFT of the speech frame
%
% Inputs:
%   xin: input speech array
%   fs: speech sampling rate
%   ss: starting sample in file
%   Lm: frame duration in msec
%   iwin_LPC: window type (1:Hamming, 2:Rectangular)
%   iwin_STFT: window type for STFT (1:Hamming, 2:Rectangular)
%   p: lpc analysis order
%   nfft: fft size
%
% Outputs:
%   f: frequency axis for log magnitude spectra
%   h0: log magnitude of STFT of speech frame
%   ha: log magnitude of lpc autocorrelation method analysis
%   hc: log magnitude of lpc covariance method analysis
%   hl: log magnitude of lpc lattice method analysis
%   U_log_STFT: window correction factor for STFT computation
%   U_log_LPC: window correction factor for LPC computation
%   U_log_LPC_co_la: window correction for covariance and lattice methods

% convert from msec to samples for Lm
    L=round(Lm*fs/1000);

%  get original log magnitude spectrum from STFT of analysis frame
if (iwin_STFT == 1)
    xino=[(xin(ss:ss+L-1).*hamming(L))' zeros(1,nfft-L)];
else
    xino=[(xin(ss:ss+L-1).*boxcar(L))' zeros(1,nfft-L)];
end
    h0=fft(xino,nfft);
    f=0:fs/nfft:fs/2;
    
% determine spectral correction factor for STFT computation
    if (iwin_STFT == 1)
        U_STFT=sum(hamming(L)'.^2);
    elseif (iwin_STFT == 2)
        U_STFT=L;
    end
    U_log_STFT=10*log10(U_STFT);
    
% determine spectral correction factor for LPC spectrum computation
    if (iwin_LPC == 1)
        U_LPC=sum(hamming(L).^2);
    elseif (iwin_LPC == 2)
        U_LPC=L;
    end
    U_log_LPC=10*log10(U_LPC);
    U_log_LPC_co_la=10*log10(L+p);
    
%  autocorrelation method
    xf=xin(ss:ss+L-1);
    [R,E,k,alpha,G]=durbin(xf,L,p,iwin_LPC);
    alphap=alpha(1:p,p);
    num=[1 -alphap'];
    % ha=20*log10(G)-20*log10(abs(fft(num,nfft)));
    [ha,f1]=freqz(G,num,nfft,'whole',fs);
    
%  covariance method--choose section of speech, compute correlation matrix
%   and covariance vector
    if (ss < p+1) ss=p+1; end
    xc=xin(ss-p:ss+L-1);
    [phim,phiv,EC,alphac,GC]=cholesky(xc,L,p);
    numc=[1 -alphac'];
    [hc,f1]=freqz(GC,numc,nfft,'whole',fs);
    
%  lattice method--choose section of speech, compute forward and backward
%  errors
    xl=xin(ss-p:ss+L-1);
    [EL,alphal,GL,k]=lattice(xl,L,p);
    alphalat=alphal(:,p);
    numl=[1 -alphalat'];
    [hl,f1]=freqz(GL,numl,nfft,'whole',fs);
end

