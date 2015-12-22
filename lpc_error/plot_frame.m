function plot_frame(x,ss,L,p,fs,ilpc,iwin,graphicPanel);
%
% function to plot current speech frame using designated window and lpc
% type

% Inputs:
%   x: current speech file, sampling rate: fsd
%   ss: starting sample in speech file for display of frame
%   L: duration of speech frame
%   p: lpc system order
%   fs: speech file sampling rate
%   ilpc: lpc analysis type (1:autocorrelation, 2:covariance)
%   iwin: window type (1:Hamming, 2:Rectangular)
%   graphicPanel: graphic panel in which speech frame plot to be shown

% create extended frame of speech
    if (ilpc == 1)
        if (iwin == 1)
            xw=x(ss:ss+L-1).*hamming(L);
        else
            xw=x(ss:ss+L-1);
        end
        xe=[zeros(1,p), xw', zeros(1,p)];
        xl=ss-p:ss+L-1+p;
    else
        xw=x(ss-p:ss+L-1);
        xe=[xw', zeros(1,p)];
        xl=ss-p:ss+L-1+p;
    end
    
% clear graphics panel
    reset(graphicPanel);
    axes(graphicPanel);
    
% plot input signal over three regions
    plot(ss-p:ss-1,xe(1:p),'r:','LineWidth',2);hold on;
    
% plot heavy line for covariance frame (ilpc == 2)
    if (ilpc == 2) plot(ss-p:ss-1,xe(1:p),'r','LineWidth',2); end
    
    plot(ss:ss+L-1,xe(p+1:p+L),'r','LineWidth',2);
    plot(ss+L:ss+L+p-1,xe(p+L+1:p+L+p),'r:','LineWidth',2);
    xpp=['Time in Samples; fs=',num2str(fs),' samples/second'];
    xlabel(xpp),ylabel('Value'),grid on, axis tight, legend('original speech frame');
end