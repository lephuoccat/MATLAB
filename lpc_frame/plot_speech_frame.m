function plot_speech_frame(x,ss,L,fs,graphicPanel,wtype);
%
% function to plot current speech frame using designated window

% Inputs:
%   x: current speech file, sampling rate: fsd
%   ss: starting sample in speech file for display of frame
%   L: duration of speech frame
%   fs: speech file sampling rate
%   graphicPanel3: graphic panel in which speech frame plot to be shown
%   wtype: window type (1:Hamming, 2:Rectangular)

% create frame of speech, weight using hamming window, normalize frame
% so that the initial value of the frame is 1.0
    if (wtype == 1)
        x1=x(ss:ss+L-1).*hamming(L);
    else
        x1=x(ss:ss+L-1);
    end
    
% plot frame of speech using Hamming window in graphicPanel3
    reset(graphicPanel);
    axes(graphicPanel);
    cla;
    plot(0:L-1,x1,'k','LineWidth',2);
    xpp=['Time in Samples; fs=',num2str(fs),' samples/second'];
    xlabel(xpp);ylabel('Amplitude'); 
    grid on;axis tight;
end