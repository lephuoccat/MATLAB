[x,Fs,bits,fmt] = loadwav('test_16k.wav');
x_scaled = x/max(x);
sound(x_scaled,Fs); 
fprintf('The sampling frequency: %.2f\n',Fs);

%% FIR LP-filter (cutoff 5.5kHz)
N = 256;
n = 0:1:N-1;
h1 = @(n) 0.6875*sinc(0.6875*n);                 % IIR filter function
hf1 = h1(n);                                      % FIR filter function
stem(n,hf1);                                     % FIR Stem Plot
t = title('FIR filter h_f[n], with N = 256');
set(t,'FontSize', 12)
xlabel('n (sample)');
ylabel('Magnitude');
axis([0 256 -0.2 0.7]);
fvtool(hf1,1);
Y1 = conv(x_scaled,hf1);
sound(Y1,Fs);
wavwrite(Y1,Fs,'LPF1.wav');

%% FIR LP-filter (cutoff 4kHz)
N = 256;
n = 0:1:N-1;
h2 = @(n) 0.5*sinc(0.5*n);                       % IIR filter function
hf2 = h2(n);                                      % FIR filter function
stem(n,hf2);                                     % FIR Stem Plot
t = title('FIR filter h_f[n], with N = 256');
set(t,'FontSize', 12)
xlabel('n (sample)');
ylabel('Magnitude');
axis([0 256 -0.15 0.5]);
fvtool(hf2,1);
Y2 = conv(x_scaled,hf2);
sound(Y2,Fs);
wavwrite(Y2,Fs,'LPF2.wav');

%% FIR LP-filter (cutoff 3.2kHz)
N = 256;
n = 0:1:N-1;
h3 = @(n) 0.4*sinc(0.4*n);                       % IIR filter function
hf3 = h3(n);                                      % FIR filter function
stem(n,hf3);                                     % FIR Stem Plot
t = title('FIR filter h_f[n], with N = 256');
set(t,'FontSize', 12)
xlabel('n (sample)');
ylabel('Magnitude');
fvtool(hf3,1);
Y3 = conv(x_scaled,hf3);
sound(Y3,Fs);
wavwrite(Y3,Fs,'LPF3.wav');
