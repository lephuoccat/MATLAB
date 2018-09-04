clear
% (a)
d1 = 0.03;              % peak passband ripple
Rp = -20*log10(1-2*d1); % maximum passband attenuation
Rs = 30;                % minimum stopband attenuation
Wp = 0.1*pi;            % passband edge
Ws = 0.25*pi;           % stopband edge
% elliptic fillter
[N,Wp] = ellipord(Wp,Ws,Rp,Rs);
[b1,a1] = ellip(N,Rp,Rs,Wp);
disp('The coefficients of numerator B(z):');
disp(b1);
disp('The coefficients of denominator A(z):');
disp(a1);

% (b)
% Noise component
noise = randn(1,500);
b0 = [1,-1]/2;          % coefficients of highpassfilter
a0 = 1;
e = conv(b0,noise);

% (c)
% Input signal x(n)
n = 1:500;              % 500 points input
x0 = cos(0.05.*pi.*n);  % original signal x0(n)
x = x0 + e(1:500);             % practical x(n)
figure
plot(n,x)
title('Signal x(n) = cos(\omega_0 n) + e(n)')
xlabel('n')
ylabel('x(n)')

% Filtered signal y1(n)
y1 = zeros(1,500);
y1(1,1) = b1(1)*x(1,1);
y1(1,2) = b1(1)*x(1,2) + b1(2)*x(1,1) - a1(1)*y1(1,1);
state1 = y1(1,2);
state2 = y1(1,1);
for i = 3:500
    input = b1(1)*x(1,i) + b1(2)*x(1,i-1) + b1(3)*x(1,i-2);
    y_buffer = input - a1(2)*state1 - a1(3)*state2;
    state2 = state1;
    state1 = y_buffer;
    y1(1,i) = y_buffer;
end
figure
plot(n,y1)
title('Filtered Signal y_1(n)')
xlabel('n')
ylabel('y_1(n)')

% Filtered signal y2(n)
b2 = [1,3,3,3]/8;       % coefficients of filter 2
a2 = 1;
y2 = conv(b2,x);
figure
plot(n,y2(1:500))
title('Filtered Signal y_2(n)')
xlabel('n')
ylabel('y_2(n)')

% Filtered signal y3(n)
b3 = [ones(1,31)]/31;   % coefficients of filter 3
a3 = 1;
y3 = conv(b3,x);
figure
plot(n,y3(1:500))
title('Filtered Signal y_3(n)')
xlabel('n')
ylabel('y_3(n)')

% (c)
% Filter 1
figure
[h1,w1] = freqz(b1,a1);
subplot(2,1,1)
plot(w1/pi,abs(h1))
grid on
title('Magnitude Response of Filter 1 |H_1(e^j^\omega)|')
ylabel('Magnitude')
axis([0 1 0 1])

subplot(2,1,2)
plot(w1/pi,db(h1))
grid on
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')

% Filter 2
figure
[h2,w2] = freqz(b2,a2);
subplot(2,1,1)
plot(w2/pi,abs(h2))
grid on
title('Magnitude Response of Filter 2 |H_2(e^j^\omega)|')
ylabel('Magnitude')
axis([0 1 0 1.5])

subplot(2,1,2)
plot(w2/pi,db(h2))
grid on
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')

% Filter 3
figure
[h3,w3] = freqz(b3,a3);
subplot(2,1,1)
plot(w3/pi,abs(h3))
grid on
title('Magnitude Response of Filter 3 |H_3(e^j^\omega)|')
ylabel('Magnitude')
axis([0 1 0 1])

subplot(2,1,2)
plot(w3/pi,db(h3))
grid on
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')
