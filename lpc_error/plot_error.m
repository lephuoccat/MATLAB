function plot_error(e,error,ss,L,p,fs,ilpc,iwin,graphicPanel);
%
% function to plot current error frame

% Inputs:
%   e: lpc error signal using autocorrelation method; e(1:L+p)
%   error: lpc error signal using covariance method; error(1:L)
%   ss: starting sample in speech file for display of frame
%   L: duration of speech frame
%   p: lpc system order
%   fs: speech file sampling rate
%   ilpc: lpc analysis type (1:autocorrelation, 2:covariance)
%   iwin: window type (1:Hamming, 2:Rectangular)
%   graphicPanel: graphic panel in which speech frame plot to be shown

% create extended frame of error signal
    if (ilpc == 1)
        ew=[zeros(1,p), e(1:L+p)];
    else
        ew=[zeros(1,p), error(1:L), zeros(1,p)];
    end
        sw=ss-p:ss+L+p-1;
    
% clear graphics panel
    reset(graphicPanel);
    axes(graphicPanel);
    
% plot input signal over three regions
    plot(ss-p:ss-1,ew(1:p),'b:','LineWidth',2);hold on;  
    plot(ss:ss+L-1,ew(p+1:p+L),'b','LineWidth',2);
    plot(ss+L:ss+L+p-1,ew(p+L+1:p+L+p),'b:','LineWidth',2);
    xpp=['Time in Samples; fs=',num2str(fs),' samples/second'];
    xlabel(xpp),ylabel('Value'),grid on, axis tight, legend('LPC Frame Error Signal');
end