function [r] = spCorrelum(x, fs, maxlag, show)
 if ~exist('maxlag', 'var') || isempty(maxlag)
     maxlag = fs/50; % F0 is greater than 50Hz => 20ms maxlag
 end
 if ~exist('show', 'var') || isempty(show)
     show = 0;
 end

 % Auto-correlation
 r = xcorr(x, maxlag, 'coeff');

 if show
     % plot waveform
     t=(0:length(x)-1)/fs;
     subplot(2,1,1);
     plot(t,x);
     legend('Waveform');
     xlabel('Time (s)');
     ylabel('Amplitude');
     xlim([t(1) t(end)]);

     % plot autocorrelation
     d=(-maxlag:maxlag)/fs;
     subplot(2,1,2);
     plot(d,r);
     legend('Auto-correlation');
     xlabel('Lag (s)');
     ylabel('Correlation coef');
 end
end