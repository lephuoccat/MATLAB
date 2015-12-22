% plot_window_time_response
function plot_window_time_response(wno,np,win1,win2,win3,win4,win5,win6)

% Inputs:
%   wno: window type
%   np: sample index for plotting
%   win1: rectangular window
%   win2: triangular winodw
%   win3: Hann window
%   win4: Hamming window
%   win5: Modified Hamming window
%   win6: Blackman window
%   win7: all windows

% rectangular window
    if (wno == 1)
        plot(np,win1,'b','LineWidth',2);
        
% triangular window
    elseif (wno == 2)
        plot(np,win2,'g','LineWidth',2);
        
% Hann window
    elseif (wno == 3)
        plot(np,win3,'r','LineWidth',2);
        
% Hamming window
    elseif (wno == 4)
        plot(np,win4,'c','LineWidth',2);
        
% modified Hamming window
    elseif (wno == 5)
        plot(np,win5,'m','LineWidth',2);
        
% Blackman window
    elseif (wno == 6)
        plot(np,win6,'k','LineWidth',2);
        
% plot all 6 windows on common plot
    elseif (wno == 7)
        plot(np,win1,'b','LineWidth',2);
        plot(np,win2,'g','LineWidth',2);
        plot(np,win3,'r','LineWidth',2);
        plot(np,win4,'c','LineWidth',2);
        plot(np,win5,'m','LineWidth',2);
        plot(np,win6,'k','LineWidth',2);
    end
end