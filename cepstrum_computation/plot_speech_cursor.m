function [ss]=plot_speech_cursor(x,ss,curr_file,istart,graphicPanel,win,L,fs);

% function to plot the entire speech waveform and, using a graphics cursor,
% choose a starting sample; the region around the starting sample is then
% displayed and a second graphics cursor is used to choose the actual
% starting sample of the speech frame.

% Inputs:
%   x: speech array
%   ss: starting sample in speech array for frame analysis
%   curr_file: speech array as read in from speech file
%   istart: binary switch between first time with speech file, and
%       iteration of multiple frames
%   graphicPanel: graphic panel for display of speech waveforms and
%       cursors
%   win: speech analysis window
%   L: analysis window length in samples
%   fs: speech sampling rate (samples/second)
%
% Output:
%   ss: new starting sample of speech array

% display entire speech file in top graphics panel;
% use cursor to delineate region of signal; expand signal display to +/- 1000
% samples around selected starting sample; re-display speech in top
% graphics panel; use cursor to determine actual starting sample
    reset(graphicPanel);
    axes(graphicPanel);
    cla;
    
% plot entire speech file    
    plot(0:length(curr_file)-1,curr_file,'k','LineWidth',2); hold on;
    xpp=['Time in Samples; fs=',num2str(fs),' samples/second'];
    xlabel(xpp);ylabel('Amplitude');grid on;axis tight;
    
% use graphics cursor to select region of speech for cepstral computation
    [xd,yd]=ginput(1);
    ss=round(xd+1);
    
% demark beginning and end of frame
    plot([ss-1 ss-1],[min(curr_file) max(curr_file)],'r','LineWidth',2);
    
% expand region of ss to make finer decision as to speech region for
% cepstral computation
    reset(graphicPanel);
    axes(graphicPanel);
    cla;
    s1=max(ss-2*L,0);
    s2=min(ss+2*L,length(x)-1);
    plot(s1:s2,curr_file(s1+1:s2+1),'k','LineWidth',2);
    xlabel(xpp);ylabel('Amplitude'); hold on;
    grid on;axis tight;
        
% use cursor to refine center of speech frame
    if (istart == 1) 
        [xd,yd]=ginput(1);
        ss=round(xd+1);
    end
    
% plot region of 2*L around ss (both below and above)
    reset(graphicPanel);
    axes(graphicPanel);
    cla;
    s1=max(ss-2*L,0);
    s2=min(ss+3*L,length(x)-1);
    plot(s1:s2,curr_file(s1+1:s2+1),'k','LineWidth',2);
    xlabel(xpp);ylabel('Amplitude'); hold on;
    grid on;axis tight;
    
% superimpose analysis window on speech frame
    xm=max(curr_file(ss:ss+L-1))*0.8;
    plot(ss:ss+L-1,win(1:L)*xm,'r','LineWidth',2);
end