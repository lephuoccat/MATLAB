%% part 1
%% c
N = 256;
n = 0:1:N-1;
h = @(n) 0.136*sinc(0.136*n);
hf = h(n);
stem(n,hf);
t = title('FIR filter h_f[n], with N = 256');
set(t, 'FontSize', 12)
xlabel('n (sample)');
ylabel('Magnitude');
axis([0 256 -0.05 0.15]);
%%
plot(20*log10(abs(fft(hf,1024))))
%% d
fvtool (hf, 1);
%% e
[X,Fs] = wavread('HeyBrother.wav');
Y(:,1)=conv(X(:,1),hf);
Y(:,2)=conv(X(:,2),hf);
wavwrite(Y,Fs,'HeyBrother_LPF.wav');

%% part 2
%% c
N = 256;
n = 0:1:N-1;
h = @(n) 0.272*sinc(0.272*n);
d = [1 zeros(1,255)];
hf = d-h(n);
stem(n,hf);
t = title('FIR filter h_f[n], with N = 256');
set(t, 'FontSize', 12)
xlabel('n (sample)');
ylabel('Magnitude');
axis([0 256 -0.3 0.8]);
%% d
fvtool (hf, 1);
%% e
[X,Fs] = wavread('HeyBrother.wav');
Y(:,1)=conv(X(:,1),hf);
Y(:,2)=conv(X(:,2),hf);
wavwrite(Y,Fs,'HeyBrother_HPF.wav');

%% Part 3
%% c
N = 256;
n = 0:1:N-1;
h = @(n) 0.3628*cos(0.7256*pi*n).*sinc(0.1814*n);
hf = h(n);
stem(n,hf);
t = title('FIR filter h_f[n], with N = 256');
set(t, 'FontSize', 12)
xlabel('n (sample)');
ylabel('Magnitude');
axis([0 256 -0.3 0.4]);
%% d
fvtool (hf, 1);
%% e
[X,Fs] = wavread('HeyBrother.wav');
Y(:,1)=conv(X(:,1),hf);
Y(:,2)=conv(X(:,2),hf);
wavwrite(Y,Fs,'HeyBrother_BPF.wav');
