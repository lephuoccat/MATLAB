function four_line_plot(fname,xinn,fs,smin,smax,n,ss,m)
% plot speech file using 4 lines/page plots
%   fname: file to be plotted
%   xinn: speech samples normalized to range of [-1 1]
%   fs: sampling rate in Hz
%   smin: minimum speech sample for unnormalized file
%   smax: maximum speech sample for unnormalized file
%   n: number of speech samples to plot
%   ss: starting sample in file for plot
%   m: number of samples to plot on each line
    
% clear graphics screen and plot waveform
    % clf;
    h1=figure;orient landscape;
    set(h1,'Position',[280 278 990 660]);
    
    [nrows ncol]=size(xinn);
        
% store speech to be plotted and plot at 4 lines per page
    xins(1:n)=xinn(ss:ss+n-1)';
    yminl=min(xinn(ss:ss+n-1));
    ymaxl=max(xinn(ss:ss+n-1));
    ymin=-1;
    ymax=1;
    
% append m zeros at end of file to fill out lines
    xins(n+1:n+m)=0;
    
% create vector of indices for each line
    ns=(ss:ss+n-1);
    
% append indices for appended zeros
    ns=[ns ss+n:ss+n+m-1];
    
% determine the number of lines to plot
    nlines=ceil(n/m);

% plot the speech data, 4 lines per page
    for i=0:nlines-1;
        subplot(4,1,mod(i,4)+1), plot(ns(i*m+1:(i+1)*m),xins(i*m+1:(i+1)*m));
        xlabel('Time in Samples'),ylabel('Amplitude');
        axis([ns(i*m+1) ns((i+1)*m) ymin ymax]);
        if (mod(i,4) == 0)
            stitle1=sprintf('file: %s, FS: %d, SS: %d, NS: %d, max/min: %d %d',...
            fname,fs,i*m+ss,n,smax,smin);
            title(stitle1);
        end
        if(mod(i,4) == 3)
            if (i ~= nlines-1)
                h2=figure;orient landscape;
                set(h2,'Position',[280 278 990 660]);
            end
        end
    end