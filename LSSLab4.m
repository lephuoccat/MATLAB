%% Part 1

t = 0:0.01:10;
num = [1 1];
den = [1 5 6];
subplot(2,2,1); impulse(num,den,t); grid on
subplot(2,2,2); step(num, den, t); grid on
f1 = sin(2*t);
y1 = lsim(num, den, f1, t);
subplot(2,2,3); plot(t,y1); grid on
f2 = exp(-t);
y2 = lsim(num, den, f2, t);
subplot(2,2,4); plot(t,y2); grid on

%% Part 2

t = 0:0.01:10;
num = [2 0 1 -3 1 4];
den = [5 2 -1 -3 5 2 -4 2 -1];
[z,p,k] = tf2zp(num,den)

[R,P,K] = residue(num,den)
y1 = 2*abs(R(1)).*exp(real(P(1).*t)).*cos(imag(P(1).*t+angle(R(1))));
y2 = R(2).*exp(P(2).*t);
y3 = 2*abs(R(4)).*exp(real(P(4).*t)).*cos(imag(P(4).*t+angle(R(4))));
y4 = R(6).*exp(P(6).*t);
y5 = 2*abs(R(7)).*exp(real(P(7).*t)).*cos(imag(P(7).*t+angle(R(7))));

y = y1+y2+y3+y4+y5;
figure
plot(t,y)
xlabel('Time');
ylabel('Amplitude');
title('System Impulse Response');
grid on

%% Part 3

t = 0:0.01:10;
num = [1];
den = [1 5 4];
y_step = step(num, den, t);
y_shiftstep = step(tf(num, den, 'InputDelay', 3), t);
y_ramp = lsim(num, den, t, t);
y_shiftramp = lsim(tf(num, den, 'InputDelay', 2), t, t);
y_zs = y_step - y_ramp + y_shiftstep + y_shiftramp;
figure
plot(t, y_zs);
xlabel('Time');
ylabel('Amplitude');
title('System Zero-State Response');
grid on

%% Part 4

t = 0:0.01:10000;
I = [1 0.996];
D = [1 0.996 463 97.8 12131 8.11 0];
figure
impulse(I,D,t)
title('System Zero-Input Response');
grid on
