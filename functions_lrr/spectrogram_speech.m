function spectrogram_speech(fname,xin,L,ul,drange,nfft,sc,fs,icolor)
%
% function to compute and plot wideband/narrowband spectrogram of
% designated speech file
%
% Inputs:
%   fname: filename of signal for which spectrogram is computed
%   xin: signal array for spectrogram computation
%   L: analysis frame length in msec
%   ul: option to use log or linear magnitude (1:log, 0:linear)
%   drange: dynamic range for ul=1 option (log magnitude)
%   nfft: size of FFT for STFT computation
%   sc: scale factor for ul=0 option (linear magnitude)
%   fs: sampling rate in Hz
%   icolor: gray scale (1) or color (0) option

% determine number of samples in signal file
    nsamp=length(xin);
    
% convert L (in msec) to window (in samples)
    window=fix(L*fs/1000);
    
% design triangular window of length window
    win=triang(window);
    
% determine window overlap in samples
    windowoverlap=fix(.9*window);
    
% use matlab call spectrogram to general spectral slices; former call was
% to specgram
%   [B,F,T]=specgram(xin,nfft,fs,win,windowoverlap);
    [B,F,T]=spectrogram(xin,win,windowoverlap,nfft,fs);
    
% for log magnitude spectrograms, limit dynamic range based on drange
% parameter
    if (ul==1)
        BA=20*log10(abs(B));
        BAM=max(BA);
        BAmax=max(BAM);
        BA(find(BA < BAmax-drange))=BAmax-drange;
        
% plot log magnitude spectrogram using imagesc command
        imagesc(T,F,BA);
    else
        
% plot linear magnitude spectrogram using imagesc command
        imagesc(T,F,abs(B).^sc);
    end
    
% flip x and y axes
    axis xy;
    xlabel('time in seconds'),ylabel('frequency in Hz');
    axis([0 nsamp/fs 0 fs/2]);
    
% gray scale plotting of spectrograms
    if (icolor == 1)
        t=colormap(gray);
        colormap(1-t);
    else
        
% color scale plotting of spectrograms
        t=colormap;
        colormap(1-t);
        colormap(jet);
    end
end