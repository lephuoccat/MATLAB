function [B,F,T] = spectrogram(xx,Nfft,fs,window,Noverlap )% spectrogram -- compute the spectrogram of a signal vector%%  [B,F,T] = spectrogram(xx,Nfft,fs,window,Noverlap )%% Outputs:%  B = spectrogram values%  F = analysis frequencies from FFT (in Hz)%  T = window position times (in sec)%% Inputs%      xx = input signal vector.%    Nfft = length of FFT%      fs = sampling frequency%  window = window values. If a scalar is given it is%           taken to be the window length.%  Noverlap = number of samples points common to consecutive sections%             Thus, the shift between sections is:  Nfft-Noverlap    fprintf('Nfft: %d, fs: %d, Noverlap:%d \n',Nfft,fs,Noverlap);% compute Hamming window using length L=length(window)    L = length(window);    if L <= 1        L = window;        window = 0.5 * (1-cos(2*pi*(1:L)'/(L+1)));    end    % convert speech array, xx, to column vector (if necessary)    if size(xx,1)==1        xx = xx(:);    end    % determine frame shift in samples    shift = L-Noverlap;% Nfft2 is half size of FFT +1; fft input is real    Nfft2 = floor(Nfft/2) + 1;    NB = Nfft2;	COMPLEX = 0;% determine number of frames -- num_segs    Lx = length(xx);    num_segs = 1 + fix( (Lx-L)/shift );    % pre-allocate the matrix for B    B = zeros( NB, num_segs );    % print out values    fprintf('L:%d, shift:%d, num_segs:%d \n',L,shift,num_segs);    % frame counter is iseg; initialize to 0    iseg = 0;    % loop through all frames in speech segment    while( iseg < num_segs )         nstart = 1 + iseg*shift;        xsegw = window .* xx( nstart:nstart+L-1);        XX = fft( xsegw, Nfft );        iseg = iseg + 1;        B(:,iseg) = XX(1:NB);        end    % create time markers in seconds, frequency markers in Hz    T = (L/2 + shift*(0:num_segs-1) ) / fs;	F = (0:(NB-1))/Nfft * fs;end