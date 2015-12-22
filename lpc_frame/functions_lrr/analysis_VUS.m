function [energy,zerocrossings,c1,alpha1,Vp,nfrm]=analysis_VUS(xin,L,R,p,fs)
%
% Short-time analysis of speech signal to provide log energy, zero
% crossing rate, first autocorrelation coefficient (normalized), first 
% lpc coefficient of p pole analysis, and normalized prediction
% error of p-pole lpc analysis features
%
% Inputs:
%   xin: input speech signal
%   L: analysis frame length in samples
%   R: analysis frame shift in samples
%   p: order of lpc analysis
%   fs: sampling frequency in Hertz
% Outputs:
%   energy: log energy contour of utterance; energy(1,nfrm), normalized
%   to a peak log energy of 0 dB (i.e., all log energies are relative
%   to the peak and thus are <= 0 dB)
%   zerocrossings: normalized (per 10 msec interval) zero crossings 
%   contour of utterance; zerocrossings(1,nfrm)
%   c1: first autocorrelation coefficient; c1(1,nfrm)
%   alpha1: first lpc coefficient of p pole analysis; alpha1(1,nfrm)
%   Vp: normalized prediction error of p-pole lpc analysis; Vp(1,nfrm)
%   nfrm: number of frames in full utterance

% begin short-time analysis
    nsamples=length(xin);
    
% initialize counter (ss), energy, zerocrossings, c1, alpha1, Vp arrays
    ss=1;
    energy=[];
    zerocrossings=[];
    c1=[];
    alpha1=[];
    Vp=[];
    
% loop for all analysis frames; Hamming window assumed
% compute the five analysis parameters
    while (ss+L-1 <= nsamples)
        if (max(abs(xin(ss:ss+L-1))) ~= 0)
            frame=xin(ss:ss+L-1).*hamming(L);
            energy=[energy 10*log10(sum(frame.^2))];
            zerocrossings=[zerocrossings sum(abs(diff(sign(frame))))];
            [Rl,E,k,alpha,G]=durbin(frame,L,p,0);
            c1=[c1 Rl(2)/Rl(1)];
            alpha1=[alpha1 alpha(1,p)];
            Vp=[Vp E(p+1)/E(1)]; 
            ss=ss+R;
        else
            break;
        end
    end
    
% nfrm is the number of frames in the utterance
    nfrm=length(energy);
    
% normalize log energy to 0 dB peak
    maxe=max(energy);
    energy=energy-maxe;
    
% normalize zero crossings count to 10 msec interval
    zerocrossings=zerocrossings*R/(2*L);
    
% debug mode--plot all 5 parameters
    if (1 == 0)
        h1=figure(1);orient landscape;
        set(h1,'Position',[280 278 990 660]);
        t=0:nfrm-1;
        subplot(511),plot(t,energy,'r','LineWidth',2),legend('log energy');
        stitle=sprintf('analysis parameters, N: %d, M: %d, p:%d, fs: %d',...
            L,R,p,fs);
            title(stitle);
        subplot(512),plot(t,zerocrossings,'r','LineWidth',2),...
            legend('zero crossings');
        subplot(513),plot(t,c1,'r','LineWidth',2),legend('c1');;
        subplot(514),plot(t,alpha1,'r','LineWidth',2),legend('alpha1');
        subplot(515),plot(t,Vp,'r','LineWidth',2),...
            legend('Vp'),xlabel('time in frames'),ylabel('value');
    end
end