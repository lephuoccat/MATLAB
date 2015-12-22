% Add spectrogram to display

% spectrogram parameters
    winlen_WB=3;
    nfft_WB=1024;
    overlap=96;
    map_index=2;
    select_win=1;
    logLinear_index=1;
    dyn_range=60;
    
% converting window lengths from ms to samples
    winlen_WBsamples = fix(winlen_WB*0.001*fs); 
% overlap in samples based on window size
	overlap_WB=fix(overlap*winlen_WBsamples/100);
% selection of window
	w_WB = window(@hamming,winlen_WBsamples);
    
% **************************************************
    
% gray scale map
	t=colormap(gray);
	colormap(1-t);

% create and plot wideband spectrogram on graphics Panel 2
        [B,BA,F,T]=create_spectrogram(curr_file,nfft_WB,fs,w_WB,dyn_range,logLinear_index,overlap_WB);        
        axes(graphicPanel2);
        imagesc(T,F,BA);            
        
        xpp=['Time in Seconds; fs=',num2str(fs),' samples/second'];
        axis xy,xlabel(xpp),ylabel('Frequency in Hz');
        axis([0 length(curr_file)/fs 0 fs/2]);
        axis tight;
        title('Wideband Spectrogram -- Original Signal');
        
% **************************************************

% create spectrogram function
    function [B,BA,F,T]=create_spectrogram(y,nfft,fs,w,dyn_range,logLinear_index,overlap_new)
        %windowoverlap=fix(0.9*windowwb);
 %       [B,F,T]=spectrogram(y,w,overlap_new,nfft,fs,'yaxis');
[B,F,T]=spectrogram(y,nfft,fs,w,overlap_new);
        BA=[];
        if (logLinear_index == 1)
            BA=20*log10(abs(B));
            BAM=max(BA);
            BAmax=max(BAM);
            BA(find(BA < BAmax-dyn_range))=BAmax-dyn_range;
            
        end
    end
    
% **************************************************