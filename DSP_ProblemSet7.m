%% DSP Problem Set 7
% Andrea Penafiel
%% Problem 5
% Fricative
[x1,fs1,bits1,fmt1] = loadwav('test_16k');
xf = x1(3000:1:3299);
% Vowel steady state
[x2,fs2,bits2,fmt2] = loadwav('ah');
xv = x2(3000:1:3299);

% Finding the normal spectrum
L1 = 160; R1 = 40; L2 = 100; R2 = 25;
yf = stft(xf, L1, R1);
yv = stft(xv, L2, R2); 

% Using the autocorrelation method
p = 12; l = 300;
[A_af G_af a_af r_af] = autolpc(xf, p);
[A_av G_av a_av r_av] = autolpc(xv, p);

[h_af, w_af] = freqz(G_af, A_af, 1024, 'whole', fs1);
[h_av, w_av] = freqz(G_av, A_av, 1024, 'whole', fs2);

% Using the lattice method
% Must extend by p samples
xf_ext = x1(2988:1:3299); xv_ext = x2(2988:1:3299);
[E_lf a_lf G_lf k_lf] = lattice(xf_ext, l, p);
[E_lv a_lv G_lv k_lv] = lattice(xv_ext, l, p);

[h_lf, w_lf] = freqz(G_lf, k_lf, 1024, 'whole', fs1);
[h_lv, w_lv] = freqz(G_lv, k_lv, 1024, 'whole', fs2);

% Using the covariance method
% Must also be extended by p samples
a_cf = arcov(xf_ext, p);
a_cv = arcov(xv_ext, p);

[h_cf, w_cf] = freqz(1, a_cf, 1024, 'whole', fs1);
[h_cv, w_cv] = freqz(1, a_cv, 1024, 'whole', fs2);

% Plotting normal spectra and LPC response
xfreq_v =(fs2/1024)*(0:1023);
xfreq_f =(fs1/1024)*(0:1023);

figure(1);
plot(xfreq_f, yf(:,1), xfreq_f, 20*log10(abs(h_af)/max(abs(h_af))),...
    xfreq_f, 20*log10(abs(h_lf)/max(abs(h_lf))),....
    xfreq_f, 20*log10(abs(h_cf)/max(abs(h_cf))));
title('Fricative'); legend('normal spectra', 'autocorrelation',...
    'lattice','covariance')
xlabel('Frequency (Hz)');
ylabel('Log Magnitude (dB)');

figure(2);
plot(xfreq_v, yv(:,1), xfreq_v, 20*log10(abs(h_av)/max(abs(h_av))),...
    xfreq_v, 20*log10(abs(h_lv)/max(abs(h_lv))),....
    xfreq_v, 20*log10(abs(h_cv)/max(abs(h_cv))));
title('Fricative'); legend('normal spectra', 'autocorrelation',...
    'lattice','covariance')
title('Vowel Steady State');
xlabel('Frequency (Hz)');
ylabel('Log Magnitude (dB)');