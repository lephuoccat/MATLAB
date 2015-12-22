function [nonBGsig, melCoeffs] = SpeechAnalysisScript(signal,Fs)
% work with frame based analysis

% load filter coefficients variable
load('HP_filterCoeffs.mat')

% nBits = 16;
% nChannels = 1;
% Fs = 11025;
% recLen = 2;
% recorder = audiorecorder(Fs,nBits,nChannels);
% fprintf('Start\n')
% recordblocking(recorder,recLen)
% fprintf('Stop\n')
% signal = getaudiodata(recorder);

% [signal,Fs] = loadwav('s5.wav');
% signal = signal/max(signal);
sound(signal,Fs)
signal_HP = filter(filNum,1,signal);

% pre-emphisize the speech
preEmphFilter = [1,-0.97];


signal_HP = filter(preEmphFilter,1,signal_HP);

n = 0:(length(signal_HP)-1);
% Window Length
L = 100;
w = window(@hamming,L);
eps = 1e-5;

% overlap
overlap = 10;

% buffer the signal
inBuffer = buffer(signal_HP,L,overlap,'nodelay');
% buffer the indices to relate window 


% convert window to a matrix to do elementwise multiplication
winMat = repmat(w,1,size(inBuffer,2));
Buffer_windowed = inBuffer.*winMat;
% short time energy to do silence background
% E = 10*log10(eps + sum(Buffer_windowed.^2,1)./L);


ZeroCross = STzeroCrossing(Buffer_windowed,L);
E = STenergy(Buffer_windowed);
AutoCorrCoeff_1 = STfirstAutoCorrCoeff(Buffer_windowed,L);
keptFrameLog = trimSilence(E,ZeroCross,AutoCorrCoeff_1);
nonBG = inBuffer(:,keptFrameLog);

% unbuffer the nonBG speech
first = nonBG(:,1);
rest = nonBG((overlap):L,2:end);
rest = reshape(rest,1,[]);
nonBGsig = [first' rest];
melCoeffs = mfccFunc(nonBG,Fs,12);

sound(nonBGsig,Fs)


end