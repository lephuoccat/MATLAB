% plot_window_limited_frequency_response
function plot_window_limited_frequency_response(wno,w,win1lm,win2lm,...
    win3lm,win4lm,win5lm,win6lm)

% plot log magnitude over partial frequency range for rectangular window
    if (wno == 1)
        plot(w,win1lm(1:length(w)),'b','LineWidth',2); 
        
% plot log magnitude over partial frequency range for triangular window
    elseif (wno == 2)
        plot(w,win2lm(1:length(w)),'g','LineWidth',2);
        
% plot log magnitude over partial frequency range for Hann window
    elseif (wno == 3)
        plot(w,win3lm(1:length(w)),'r','LineWidth',2);
        
% plot log magnitude over partial frequency range for Hamming window
    elseif (wno == 4)
        plot(w,win4lm(1:length(w)),'c','LineWidth',2);
        
% plot log magnitude over partial frequency range for modified Hamming window
    elseif (wno == 5)
        plot(w,win5lm(1:length(w)),'m','LineWidth',2);
        
% plot log magnitude over partial frequency range for Blackman window
    elseif (wno == 6)
        plot(w,win6lm(1:length(w)),'k','LineWidth',2);
        
% plot log magnitude over partial frequency range for all 6 windows
    elseif (wno == 7)
        plot(w,win1lm(1:length(w)),'b','LineWidth',2);   
        plot(w,win2lm(1:length(w)),'g','LineWidth',2);
        plot(w,win3lm(1:length(w)),'r','LineWidth',2);
        plot(w,win4lm(1:length(w)),'c','LineWidth',2);
        plot(w,win5lm(1:length(w)),'m','LineWidth',2);
        plot(w,win6lm(1:length(w)),'m','LineWidth',2);
    end
end