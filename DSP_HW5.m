%% i
[x1,fs1] = audioread('Cardinal.wav');
[x2,fs2] = audioread('Crow.wav');
sound(x1,fs1);
sound(x2,fs2);
%% ii
N = 65536;

figure
X1DFT = fft(x1,N);
stem(abs(X1DFT))
title('Stem Plot of Cardinal');
xlabel('DFT index, k');
ylabel('|Cardinal(\omega)|');
grid on

figure
X2DFT = fft(x2,N);
stem(abs(X2DFT))
title('Stem Plot of Crow');
xlabel('DFT index, k');
ylabel('|Crow(\omega)|');
grid on

%% iii
N = 65536;
w = linspace(-pi,pi,N);

figure
X1DFT_S = fftshift(X1DFT);
plot(w/pi,abs(X1DFT_S))
title('Spectra of Carninal');
xlabel('\omega/\pi');
ylabel('Magnitude');
grid on

figure
X2DFT_S = fftshift(X2DFT);
plot(w/pi,abs(X2DFT_S))
title('Spectra of Crow');
xlabel('\omega/\pi');
ylabel('Magnitude');
grid on
