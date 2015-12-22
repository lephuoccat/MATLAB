% plot_window_frequency_response
function plot_window_frequency_response(w,wno,win1lm,win2lm,win3lm,win4lm,win5lm,win6lm,nfft)

% Inputs:
%   w: frequency axis for display
%   wno: window number for plotting
%   win1lm: log magnitude for window1
%   win2lm: log magnitude for window2
%   win3lm: log magnitude for window3
%   win4lm: log magnitude for window4
%   win5lm: log magnitude for window5
%   win6lm: log magnitude for window6
%   nfft: size of fft for DTFT response

% plot log magnitude response of rectangular window
    if (wno == 1)
        plot(w,win1lm(1:nfft/2+1),'b','LineWidth',2);
        
% plot log magnitude response of triangular window
    elseif (wno == 2)
        plot(w,win2lm(1:nfft/2+1),'g','LineWidth',2);
        
% plot log magnitude response of Hann window
    elseif (wno == 3)
        plot(w,win3lm(1:nfft/2+1),'r','LineWidth',2);
        
% plot log magnitude response of Hamming window
    elseif (wno == 4)
        plot(w,win4lm(1:nfft/2+1),'c','LineWidth',2);
        
% plot log magnitude response of modified Hamming window
    elseif (wno == 5)
        plot(w,win5lm(1:nfft/2+1),'m','LineWidth',2);
        
% plot log magnitude response of Blackman window
    elseif (wno == 6)
        plot(w,win6lm(1:nfft/2+1),'k','LineWidth',2);
        
% plot log magnitude responses of all 6 windows
    elseif (wno == 7)
        plot(w,win1lm(1:nfft/2+1),'b','LineWidth',2);
        plot(w,win2lm(1:nfft/2+1),'g','LineWidth',2);
        plot(w,win3lm(1:nfft/2+1),'r','LineWidth',2);
        plot(w,win4lm(1:nfft/2+1),'c','LineWidth',2);
        plot(w,win5lm(1:nfft/2+1),'m','LineWidth',2);
        plot(w,win6lm(1:nfft/2+1),'m','LineWidth',2);
    end
end