%% Cepstrum
[x, fs] = wavread('CodeWord_C_1_Le.wav'); x = x(1000:1480);
c = spCepstrum(x, fs, 'hamming', 'plot');
%% Pitch Detection with Cepstrum
[x, fs] = wavread('CodeWord_1_1_Le.wav'); x = x(1000:1480);
c = spCepstrum(x, fs, 'hamming', 'plot');
[f0,f1] = spPitchCepstrum(c, fs)
%% Pitch Tracking in Short-Time Frames
[x, fs] = wavread('CodeWord_1_1_Le.wav');
[F0, T, C] = spPitchTrackCepstrum(x, fs, 30, 20, 'hamming', 'plot');
%% Auto-correlation
[x, fs] = wavread('CodeWord_1_1_Le.wav'); x = x(1000:1480);
r = spCorr(x, fs, [], 'plot');
%% Pitch Detection with Auto-correlation
[x, fs] = wavread('CodeWord_1_1_Le.wav'); x = x(1000:1480);
r = spCorr(x, fs, [], 'plot');
f0 = spPitchCorr(r, fs)
%% Pitch Tracking in Short-Time Frames
[x, fs] = wavread('CodeWord_1_1_Le.wav');
[F0, T, R] = spPitchTrackCorr(x, fs, 30, 20, [], 'plot');
%% LPC
[x, fs] = wavread('CodeWord_1_1_Le.wav');
a = spLpc(x, fs, [], 'plot');
%% Formants Tracking in Short-Time Frames
[x, fs] = wavread('CodeWord_C_1_Le.wav');
[F, T] = spFormantsTrackLpc(x, fs, [], 30, 20, 'hamming', 'plot');
