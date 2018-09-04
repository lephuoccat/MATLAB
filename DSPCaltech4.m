clear
wp = 0.25*pi;
ws = 0.28*pi;
d_ratio = 10;
N1 = 4;
N2 = 8;
N3 = 26;

Fremez = [0 wp/pi ws/pi 1];
Desired = [1 1 0 0];
Weight = [1 d_ratio];
hFIR1 = firpm(N1, Fremez, Desired, Weight);
hFIR2 = firpm(N2, Fremez, Desired, Weight);
hFIR3 = firpm(N3, Fremez, Desired, Weight);

% Manitude Response Plots
figure
[h1,w1] = freqz(hFIR1,1);
plot(w1/pi,db(h1))
title('Magnitude Response of H_1(e^j^\omega)');
grid on
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')

figure
[h2,w2] = freqz(hFIR2,1);
plot(w2/pi,db(h2))
title('Magnitude Response of H_2(e^j^\omega)');
grid on
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')

figure
[h3,w3] = freqz(hFIR3,1);
plot(w3/pi,db(h3))
title('Magnitude Response of H_3(e^j^\omega)');
grid on
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')

% Impulse Response Plots
figure
stem(0:(length(hFIR1)-1),hFIR1)
title('Impulse Response of h_1(n)');
xlabel('n')
ylabel('h_1(n)')
axis([-1 5 -0.01 0.1])

figure
stem(0:(length(hFIR2)-1),hFIR2)
title('Impulse Response of h_2(n)');
xlabel('n')
ylabel('h_2(n)')
axis([-2 10 -0.05 0.3])

figure
stem(0:(length(hFIR3)-1),hFIR3)
title('Impulse Response of h_3(n)');
xlabel('n')
ylabel('h_3(n)')
axis([-5 30 -0.1 0.3])

% Generate an Input Signal
n = 0:1:499;
A1 = 1;
A2 = 0.05;
w1 = 0.15*pi;
w2 = 0.1*pi;

noise = 0.1*randn(1,500);
noisehigh = zeros(1,500);
noisehigh(1) = 0;
for ntime = 2:500
    noisehigh(ntime) = 0.5*(noise(ntime)-noise(ntime-1));
end

W1=zeros(1,500);
for i=1:500
    if (i >= 50 && i <=80)
        W1(i)=1;
    end
end

W2=zeros(1,500);
for i=1:500
    if (i >= 81 && i <=170)
        W2(i)=1;
    end
end

x0 = A1*sin(w1.*n).*W1 + A2*sin(w2.*n).*W2;
x = x0 + noisehigh;

% Noise-free signal
figure
plot(n,x0)
title('The Noise-free Signal');
xlabel('n')
ylabel('A_1sin(\omega_1n)W_1(n) + A_2sin(\omega_2n)W_2(n)')
axis([0 500 -1.2 1.2])

% The Noisy Input x(n)
figure
plot(n,x)
title('The Noisy Input');
xlabel('n')
ylabel('x(n)')
axis([0 500 -1.2 1.2])

% Filtered Signals
y1 = conv(hFIR1,x);
figure
plot(n,y1(1:500))
title('Filtered Signal y_1(n)')
xlabel('n')
ylabel('y_1(n)')

y2 = conv(hFIR2,x);
figure
plot(n,y2(1:500))
title('Filtered Signal y_2(n)')
xlabel('n')
ylabel('y_2(n)')

y3 = conv(hFIR3,x);
figure
plot(n,y3(1:500))
title('Filtered Signal y_3(n)')
xlabel('n')
ylabel('y_3(n)')
