function b=bpf(n,fl1,fh1,fh2,fl2,fs,iplot)
%
% design bandpass filter from user specifications
% Inputs:
%   n: length of bandpass filter impulse response
%   fl1: low end frequency of first stopband
%   fh1: low end frequency of passband
%   fh2: high end frequency of passband
%   fl2: high end frequency of second stopband
%   fs: sampling frequency
%   iplot: option to plot log magnitude response
% Output:
%   b: set of fir filter coefficients (b(1),b(2),...,b(n+1))

% define ideal frequency band, F, normalized to frequency scale of [0 1]
% define ideal amplitufe band, A, with 1 being passband, 0 being
% stopband
    F=[0 2*fl1/fs 2*fh1/fs 2*fh2/fs 2*fl2/fs 1];
    A=[0 0 1 1 0 0];
    
% design ideal FIR filter using firpm (Remez)
    b=firpm(n,F,A);
    
% plot log magnitude response, if requested
    if (iplot == 1)
        figure,orient landscape;
        nl=0:n;
        subplot(211),plot(nl,b,'b','LineWidth',2),...
            xlabel('time in samples'),ylabel('amplitude');
            grid on, axis tight;
            stitle=sprintf('bandpass filter, n: %d, F: %d %d %d %d',...
                n+1,fl1,fh1,fh2,fl2);
            title(stitle);
            nf=2000;
            h=freqz(b,1,nf,'whole',fs);
            f=0:fs/nf:fs/2;
            fresp=20*log10(abs(h(1:nf/2+1)));
            fresp(find(fresp < -100))=-100;
        subplot(212),plot(f,fresp,'r','LineWidth',2),...
            xlabel('frequency in Hz'),...
            ylabel('log magnitude (dB)'),grid,axis tight;
    end
end