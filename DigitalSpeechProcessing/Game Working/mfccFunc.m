function melCoeffs = mfccFunc(filterSignalBuffered,Fs,numCoeffs)
 % input is a buffered speech signal
% mfcc: dft weighting for mel frequency bands


Fs = Fs;
N = 4096; % hard coded for a N = 4096 point dft;

% center freqs corresponding to the mel spectrum 
Fc = [150:100:450 570 700 840 1000 1170 1370 1600 1850 2150 2500 2900 3400,...
    4000];

BW = 25 + 75*(1 + 1.4*(Fc./1000).^2).^(0.69);

k = 0:(N-1);
k_Fc = floor(Fc*N/Fs);
FreqBins = k*Fs/N;

% window is zero at Fc +- BW
L_f = (Fc-BW);
U_f = (Fc+BW);
Points = floor([L_f' Fc' U_f']*N/Fs);

mfccFilterBank = zeros(N, length(Fc));
winEnergy = zeros(1,length(Fc));
for kk = 1:length(Fc)

    startZeroLen = (Points(kk,1) - 1) - 1+ 1;
    endZeroLen = N - (Points(kk,3)+ 1) + 1;
    startZeros = zeros(1,startZeroLen);
    endZeros = zeros(1,endZeroLen);
    leftLen = Points(kk,2) - Points(kk,1) + 1;
    RightLen = Points(kk,3) - (Points(kk,2)+1) + 1;
    leftPiece = linspace(0,1,leftLen);
    rightPiece = linspace(1,0,leftLen);
    win = [startZeros leftPiece rightPiece endZeros];
    win = win(1:N);
    win = win + fliplr(win);
    winScale = sum(abs(win).^2);
    winEnergy(kk) = winScale;
    mfccFilterBank(:,kk) = win;
end
% take dft of each frame
bigFFTSig = fft(filterSignalBuffered,N);


numCols = size(filterSignalBuffered,2);
temp = zeros(length(Fc),numCols);

for r = 1:length(Fc) % the number of filter banks
    repFilterBank = repmat(mfccFilterBank(:,r),1,numCols);
    temp(r,:) = sum(abs(bigFFTSig.*repFilterBank).^2,1)/winEnergy(r);
end
temp = log10(temp);
melCoeffs = zeros(numCoeffs,numCols);
for m = 1:numCols
    for k = 1:numCoeffs;
        temp2 = zeros(length(Fc),1);
        for r = 1:length(Fc);
            temp2(r) = temp(r,m).*cos(2*pi/length(Fc)*(r + .5).*k);
        end
        temp2 = sum(temp2)/length(Fc);
        melCoeffs(k,m) = temp2;
    end
end
    
   
end