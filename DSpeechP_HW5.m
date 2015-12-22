% read in speech filename, play out file, create spectrogram and plot
filename=input('enter speech filename:','s');
narrowbw=input('enter bandwidth for narrowband spectrogram:');
widebw=input('enter bandwidth for wideband spectrogram:');
sw=input('enter dynamic range switch (1 for increased range, 0 for standard range):');
[x,fs]=wavread(filename);
xinn=x/max(max(x) -min(x));
sound(xinn,fs);

% resample down to 8 kHz if fs=16 kHz
if (fs == 16000)
y=decimate(x,2);
fs=8000;
end
subplot(3,1,1);
spectrogram(y,fs,narrowbw,sw);
stitle1=sprintf('file: %s, fs:%d, nsamp: %d, NB BW:%d, WB BW:%d',...
filename,fs,length(x),narrowbw,widebw);
title(stitle1);
subplot(3,1,2);
spectrogram(y,fs,widebw,sw);
subplot(3,1,3);
plot(y),ylabel(' amplitude');
xlabel('Time (s)');

% Plot grayscale spectrogram with variable sampling rate and bandwidth
% x is input speech
% fs is sampling frequency (Hz)
% bw is the bandwidth of the filter used in the spectral analysis
% sw is a switch on spectrogram dynamic range--sw=0 for male, isw=1 for
% female => increases dynamic range of spectrum for display)
% Set minimum FFT length
fftmin = 256;
% Set 2*fs/bw variable window length for good resolution (long block length
% will provide higher frequency resolution as main-lobe of the window
% function will be narrow and short block length will provide higher time
% resolution as less averaging across samples is performed for each
% STFT value
winlen = floor(2*fs/bw);

% Get FFT length
fftlen = max([winlen fftmin]);
% Create window (Hamming for favorable sidelobe attenuation) and zero pad accordingly
win = [hamming(winlen) ; zeros(fftlen-winlen,1)];
win = win/sum(win);
windel = (0:(length(win)-1)) * win;
% Set overlap (Effects expansion of spectrogram display as no overlap plots
% fftlen data points and maximum overlap gives 1 data point)
ntime = 500; % Choose based on trial-and-error for best looking plot
overlap = floor(max(fftlen/2, (ntime*fftlen-length(x))/(ntime-1)));
ntime = floor((length(x)-overlap)/(fftlen-overlap));

% Create arrays
c1=(1:fftlen)';
r1=(0:ntime-1)*(fftlen-overlap);
% Take FFT of real data
b = fft(x(c1(:,ones(1,ntime))+r1(ones(fftlen,1),:)).*win(:,ones(1,ntime)));
if size(b,1) == 1
m = length(b,1);
b(floor((m+4)/2):m) = [];
else
m=size(b,1);
b(floor((m+4)/2):m,:) = [];
end
b = b.*conj(b);
% Setup pixel locations for plot on frequency axis and time axis
f=(0:fftlen/2)*fs/fftlen;
t = (r1+windel)/fs;
% Set limit for dB scale--this eliminates low level spectral info
lim = max(b(:))*0.0001;
if (sw == 1)
lim=lim/10;
end
% Set dB scale
b=10*log10(max(b,lim));
% Plot
imh = imagesc(t,f/1000,b);
% Set up axis and labels for plot
axis('xy');
% title('Spectrogram');
% xlabel('Time (s)');
ylabel('Frequency (kHz)');
% Set and apply grayscale levels
colormap(gray);
map2 = colormap;
map2 = 1 - map2;
colormap(map2);
% colorbar;
orient landscape;

%% Problem 7
% read in speech filename, play out file, create spectrogram and plot
filename=input('enter speech filename:','s');
narrowbw=input('enter bandwidth for narrowband spectrogram:');
widebw=input('enter bandwidth for wideband spectrogram:');
sw=input('enter dynamic range switch (1 for increased range, 0 for standard range):');
[x,fs]=wavread(filename);
xinn=x/max(max(x) -min(x));
sound(xinn,fs); pause;
x2 = stft(x', 512, 512, 256);
x3 = speechrate(x2,2);
y=istft(x3,512,512,256);
ysav=y*30000/max(max(y) -min(y));
savewav(ysav,'temp_speedup_2.wav',fs);
xinn=y/max(y); sound(xinn,fs);
figure(1);
stitle=sprintf('Original file: %s, number of samples in file: %d',filename,length(x));
subplot(2,1,1), plot(x), title(stitle);
xlabel('Sample number'), ylabel('Amplitude');
subplot(2,1,2),plot(y),title('Speeded up speech signal');
xlabel('Sample number'),ylabel('Amplitude');
figure(2);
subplot(2,1,1);
spectrogram(x,fs,narrowbw,sw);
stitle=sprintf('Narrowband Spectrogram (%d Hz), Original file: %s',narrowbw,filename);
title(stitle);
subplot(2,1,2);
spectrogram(y,fs,narrowbw,sw);
title('Speeded up by 2-1 speech signal');
figure(3);
subplot(2,1,1);
spectrogram(x,fs,widebw,sw);
stitle=sprintf('Wideband Spectrogram (%d Hz), Original file: %s',widebw,filename);
title(stitle);
subplot(2,1,2);
spectrogram(y,fs,widebw,sw);
title('Speeded up by 2-1 speech signal');
y = speechrate(x,rate)
% Takes STFT data in x and removes frames according to
% (1:rate) to speed up speech (rate) times.
% RATE must be integer!
s = size(x);
cols = s(2);
y = x(:,1:rate:cols);
x = istft(d, ftsize, w, h)
% X = istft(D, F, W, H) Inverse short-time Fourier transform.
% Performs overlap-add resynthesis from the short-time Fourier transform
% data in D. Each column of D is taken as the result of an F-point
% fft and each successive frame is offset by H points. Data is rect
% windowed at W pts. Also has option to use Hamming window.
s = size(d);
cols = s(2);
xlen = ftsize + cols * (h);
x = zeros(1,xlen);
if rem(w, 2) == 0 % force window to be odd-len
w = w + 1;
end
win = zeros(1, ftsize);
halff = ftsize/2; % midpoint of win
halflen = (w-1)/2;
acthalflen = min(halff, halflen);
%halfwin = 0.5 * ( 1 + cos( pi * (0:halflen)/halflen)); % Hamming window
halfwin = boxcar(halflen); % Rect window
win((halff+1):(halff+acthalflen)) = halfwin(1:acthalflen);
win((halff+1):-1:(halff-acthalflen+2)) = halfwin(1:acthalflen);
for b = 0:h:(h*(cols-1)) % Perform inverse transform
ft = d(:,1+b/h)';
ft = [ft, conj(ft([((ftsize/2)):-1:2]))];
px = real(ifft(ft));
x((b+1):(b+ftsize)) = x((b+1):(b+ftsize))+px.*win;
end;