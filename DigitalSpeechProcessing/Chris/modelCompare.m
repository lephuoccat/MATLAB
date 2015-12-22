clear all
close all

load('CodeWord_1_GMM.mat');
model_1 = model;
clear model;
load('CodeWord_2_GMM.mat');
model_2 = model;
clear model;
load('CodeWord_3_GMM.mat');
model_3 = model;
clear model;
load('CodeWord_A_GMM.mat');
model_A = model;
clear model;
load('CodeWord_B_GMM.mat');
model_B = model;
clear model;
load('CodeWord_C_GMM.mat');
model_C = model;
clear model;

words = {'1','2','3','A','B','C'};

models = {model_1,model_2,model_3,model_A,model_B,model_C};    
nBits = 16;
nChannels = 1;
Fs = 11025;
recLen = 2;
recorder = audiorecorder(Fs,nBits,nChannels);
fprintf('Start\n')
recordblocking(recorder,recLen)
fprintf('Stop\n')
signal = getaudiodata(recorder);

[nonBGsig, melCoeffs] = SpeechAnalysisScript(signal,Fs);


log_likeHood = zeros(1,6);
for k = 1:6;
    [P,nlog_like] = posterior(models{k},melCoeffs.');
    log_likeHood(k) = abs(nlog_like);
end

OUT = words{max(log_likeHood) == log_likeHood};
log_likeHood
fprintf('The Code Word Said was %s\n',OUT)

% plot(0:11,sampleX(11,:))
% figure
% stem(1:numFrames,n);
% % figure
% % hist(n,6)
% % xlim([0,8])
% shg
