function [win1lm,win2lm,win3lm,win4lm,win5lm,win6lm,smin] = ...
    logmag_window(WL,nfft,win1,win2,win3,win4,win5,win6)
%
% Inputs:
%   WL: window length in samples
%   nfft: fft size for transform
%   win1: rectangular window 
%   win2: triangular window 
%   win3: Hann window 
%   win4: Hamming window 
%   win5: modified Hamming window
%   win6: Blackman window 
%
% Outputs:
%   win1lm: rectangular window log magnitude response
%   win2lm: triangular window log magnitude response
%   win3lm: Hann window log magnitude response
%   win4lm: Hamming window log magnitude response
%   win5lm: modified Hamming window log magnitude response
%   win6lm: Blackman window log magnitude response
%   smin: minimum value of log magnitude response

% take transforms of window impulses responses and get log magnitude responses
% normalize log magnitude to 0 dB at frequency f=0 Hz
    win1e=[win1, zeros(1,nfft-WL)];
    win1lm=20*log10(abs(fft(win1e)));
    w0=win1lm(1);
    win1lm=win1lm-w0;
    win2e=[win2, zeros(1,nfft-WL)];
    win2lm=20*log10(abs(fft(win2e)));
    w0=win2lm(1);
    win2lm=win2lm-w0;
    win3e=[win3, zeros(1,nfft-WL)];
    win3lm=20*log10(abs(fft(win3e)));
    w0=win3lm(1);
    win3lm=win3lm-w0;
    win4e=[win4, zeros(1,nfft-WL)];
    win4lm=20*log10(abs(fft(win4e)));
    w0=win4lm(1);
    win4lm=win4lm-w0;
    win5e=[win5, zeros(1,nfft-WL)];
    win5lm=20*log10(abs(fft(win5e)));
    w0=win5lm(1);
    win5lm=win5lm-w0;
    win6e=[win6, zeros(1,nfft-WL)];
    win6lm=20*log10(abs(fft(win6e)));
    w0=win6lm(1);
    win6lm=win6lm-w0;
    smin=-140;

end

