%%
[x1,fs1,bits1,fmt1] = loadwav('test_16k');
x11 = x1(3000:1:3299);
[x2,fs2,bits2,fmt2] = loadwav('ah');
x22 = x2(3000:1:3299);
xfreq_v =(fs2/1024)*(0:1023);
xfreq_f =(fs1/1024)*(0:1023);
L1 = 160; R1 = 40;
[y1 f1 t1] = stft(x11, L1,R1);
L2 = 100; R2 = 25;
[y2 f2 t2] = stft(x22, L2,R2); 
% Autocorrelation
p = 12;
l = 300;
[A_af G_af a_af r_af] = autolpc(x11, p);
[A_av G_av a_av r_av] = autolpc(x12, p);
[h_af, w_af] = freqz(G_af,A_af,1024,'whole',fs1);
[h_av, w_av] = freqz(G_av,A_av,1024,'whole',fs2);
% Lattice
x1_ext = x1(2988:1:3299); 
x2_ext = x2(2988:1:3299);                       % extend by p samples
[E_lf a_lf G_lf k_lf] = lattice(x1_ext, l, p);
[E_lv a_lv G_lv k_lv] = lattice(x2_ext, l, p);
[h_lf, w_lf] = freqz(G_lf,k_lf,1024,'whole',fs1);
[h_lv, w_lv] = freqz(G_lv,k_lv,1024,'whole',fs2);
% Covariance
a_cf = cholesky(xf_ext, p);                        % extend by p samples
a_cv = cholesky(xv_ext, p);
% a_cf = cholesky(xf_ext, p);
% a_cv = cholesky(xv_ext, p);
[h_cf, w_cf] = freqz(1,a_cf,1024,'whole',fs1);
[h_cv, w_cv] = freqz(1,a_cv,1024,'whole',fs2);

plot(xfreq_f, yf(:,1), xfreq_f, 20*log10(abs(h_af)/max(abs(h_af))),xfreq_f, 20*log10(abs(h_lf)/max(abs(h_lf))),xfreq_f, 20*log10(abs(h_cf)/max(abs(h_cf))));
title('Fricative'); legend('normal spectra', 'autocorrelation','lattice','covariance')
figure
plot(xfreq_v, yv(:,1), xfreq_v, 20*log10(abs(h_av)/max(abs(h_av))),xfreq_v, 20*log10(abs(h_lv)/max(abs(h_lv))),xfreq_v, 20*log10(abs(h_cv)/max(abs(h_cv))));
title('Fricative'); legend('normal spectra', 'autocorrelation','lattice','covariance')
title('Vowel Steady State');
