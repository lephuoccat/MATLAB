function plot_spectrum(fname,x,fs,win,L)
%
% function to plot waveform and linear and log magnitude spectrums of a 
% user-selected region of a signal
%
% Inputs:
%   fname: signal filename
%   x: signal array
%   fs: sampling rate of signal (Hz)
%   win: analysis window for signal processing
%   L: length of analysis window in samples
    
% nfft is size of fft calculation
    nfft=1000;

% plot waveform
    irun=1;
    clear figs;
    
    while (irun == 1)
        figure(1),orient landscape;
        set(1,'Position',[280,278,990,660]);
        subplot(411),plot(0:length(x)-1,x,'k','LineWidth',2),...
        xlabel('time in samples'),ylabel('amplitude'),grid on,axis tight;
        hold on;
        
% choose section of speech
        [xd,yd]=ginput(1);
        ss=round(xd+1);
        if (ss+L-1 >= length(x)) 
            irun=0;
        else
    
% title for plots
        s1=sprintf('magnitude and log magnitude spectra for file:');
        s2=sprintf('%s, ss: %d, window length: %d msec ',fname,ss,L);
        stitle=strcat(s1,s2);
        title(stitle);
        
% scale frame by window
        xin=x(ss:ss+L-1).*win;
        
% demark beginning and end of frame
        plot([ss-1 ss-1],[min(x) max(x)],'r:','LineWidth',2);
        plot([ss+L-1 ss+L-1],[min(x) max(x)],'r:','LineWidth',2);

% plot frame of speech
        subplot(412),plot(ss:ss+L-1,xin,'k','LineWidth',2),...
        xlabel('time in samples'),ylabel('amplitude'),axis tight;
    
% compute magnitude spectrum using fft
        xlins=abs(fft(xin,nfft));
        freq=0:fs/nfft:fs/2;
    
% plot linear magnitude spectrum (0-fs/2)
        subplot(413),plot(freq,xlins(1:nfft/2+1),'k','LineWidth',2),...
        xlabel('frequency'),ylabel('magnitude'),axis tight;
  
% compute and plot log magnitude spectrum (0-fs/2)
        xlogs=20*log10(xlins);
        subplot(414),plot(freq,xlogs(1:nfft/2+1),'k','LineWidth',2),...
        xlabel('frequency'),ylabel('log magnitude (db)'),axis tight;
    end
end
