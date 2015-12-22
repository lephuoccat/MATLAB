%% Part 1
%% 1(a)

n=0:1:100;
w1=0.05*pi;
w2=0.1*pi;
w3=0.2*pi;
y=[0; 1; 0];                            % output's coefficients
%matrix of coefficients of B
B=[2*cos(2*w1), 2*cos(w1), 1; 2*cos(2*w2), 2*cos(w2), 1; 2*cos(2*w3), 2*cos(w3), 1];
b = inv(B)*y;                           % matrix property: solution = invert(B)*y
fprintf('b1 = %f\nb2 = %f\nb3 = %f\n',b(1),b(2),b(3));

%% 1(b)

w = [0:0.01*pi:0.25*pi];
% H(w)=exp(-2jw)*B(w)=exp(-2jw)*[2b(1)cos(2w)+2b(2)cos(2)+b(3)]
H = (exp(-2*i*w)).*(2*b(1)*cos(2*w)+2*b(2)*cos(w)+b(3));
% plot abs(H) vs w/pi to get the x-axis corresponding to w/pi
plot(w/pi,abs(H),0.05,0,'r*',0.1,1,'r*',0.2,0,'r*','LineWidth',2)
title('FIR Notch Filter');
xlabel('\omega/pi');
ylabel('magnitude');
legend('|H(\omega)|','\omega_1,\omega_2,\omega_3');
axis([0 0.25 0 4]);
grid on

%% 1(c)

n=0:1:100;
w1=0.05*pi;
w2=0.1*pi;
w3=0.2*pi;
s = @(n) sin(w2*n);                     % input: s(n)=sin(w2n)
v = @(n) sin(w1*n)+sin(w3*n);           % noise: v(v)=sin(w1n)+sin(w3n)
x = @(n) s(n)+v(n);                     % x(n)=s(n)+v(n)
h = [b(1), b(2), b(3), b(2), b(1)];     % h=[b1,b2,b3,b2,b1]
y = @(n) filter(h, 1, x(n));            % output of the filter y(n)
plot(n,x(n),'g--', n,s(n),'b', n,y(n),'r','LineWidth',2)
title('Input and Output Signals');
xlabel('Time Samples, n');
ylabel('Magnitude');
legend('x(n)','s(n)','y(n)');
axis([0 100 -3 3]);
grid on

s2 = @(n) abs(sin(w2*(n-2)).*(n>=2));        % delayed input s(n-2)
y_v = @(n) filter(h, 1, v(n));          % noise output y_v(n)
fprintf('\n n\t   s(n)\t\t  s(n-2)\t   y(n)\t\t   v(n)\t\t  y_v(n)\n');
fprintf('-------------------------------------------------------------\n');
fprintf(' %d\t%8.4f\t%8.4f\t%8.4f\t%8.4f\t%8.4f\t\n',[(0:9)' s((0:9)') s2((0:9)') y((0:9)') v((0:9)') y_v((0:9)')]');


%% 1(d)

% Plot of FIR Notch Filter
w = [0:0.01*pi:pi];
H = (exp(-2*i*w)).*(2*b(1)*cos(2*w)+2*b(2)*cos(w)+b(3));
plot(w/pi,abs(H),0.05,0,'r*',0.1,1,'r*',0.2,0,'r*','LineWidth',2)
title('FIR Notch Filter');
xlabel('\omega/\pi');
ylabel('Magnitude');
legend('|H(\omega)|','\omega_1,\omega_2,\omega_3');
axis([0 1 0 800]);
grid on

% Plot of Cascade of IIR Notch Filters
figure
b = [0.984011, -3.535954, 5.113142, -3.535954, 0.984011];   % numerator coefficients
a = [1, -3.557832, 5.093644, -3.487380, 0.960788];          % denominator coefficients
Hmag = abs(freqz(b,a,w));
plot(w/pi,Hmag,0.05,0,'r*',0.1,1,'r*',0.2,0,'r*','LineWidth',2)
title('Cascade of IIR Notch Filters');
xlabel('\omega/\pi');
ylabel('Magnitude');
legend('|H(\omega)|','\omega_1,\omega_2,\omega_3');
axis([0 1 0 2]);
grid on

% Plot of Input and Output
figure
n = 0:600;
w1 = 0.05*pi;
w2 = 0.1*pi;
w3 = 0.2*pi;
s = sin(w2*n);
v = sin(w1*n)+sin(w3*n);
x = s+v;
y = filter(b, a, x);
plot(n,x,'g--', n,s,'b', n,y,'r','LineWidth',2)
title('Input and Output Singnals');
xlabel('Time Samples, n') ;
ylabel('Magnitude');
legend('x(n)','s(n)','y(n)');
axis([0 300 -3 3]);
grid on

% Plot of Filtered Interference
figure
h = impz(b, a, 601);
y_v = filter(h, 1, v);                                      % output of noise
plot(n,v,'g--', n,y_v,'r','LineWidth',2)
title('Filtered Interference');
xlabel('samples, n');
ylabel('Magnitude');
legend('v(n)','y_v(n)');
axis([0 600 -3 3]);

n40 = log(0.01)/log(max(abs(roots(a))))                     % 40-dB constant of filter

%% Part 2
%% 2(a)

w0 = 0.2*pi;
B = 0.1;
w1 = 0.05*pi;                                       % w1=0.05pi
w = linspace(0,pi,1001);
% Frequency reponse H(w)
H = @(w) (j*B.*sin(w))./(cos(w)-cos(w0)+j*B.*sin(w));
% Left 3-dB frequency
w_left = (cos(w0)+B*sqrt(B^2+(sin(w0)).^2))./(1+B^2);
% Right 3-dB frequency
w_right = (cos(w0)-B*sqrt(B^2+(sin(w0)).^2))./(1+B^2);
left = acos(w_left);
right = acos(w_right);
peak = abs(H(w0));              % peak at w0
side = abs(H(w1));              % side at w1
plot(w/pi,abs(H(w)), w0/pi,peak,'ro', w1/pi,side,'rs', [left/pi,right/pi],abs([H(left) H(right)]),'r-*','LineWidth',2,'MarkerSize',10)
title('Peak Filter, \omega_1=0.05\pi');
xlabel('\omega/\pi');
ylabel('Magnitude');
legend('|H(\omega)|','peak','side','3-dB width');
axis([0,1,0,1.1]);
grid on

%% 2(b)

w0 = 0.2*pi;
w1 = 0.05*pi;
% Phase Delay
td = @(w) -(1./w).*atan((cos(w)-cos(w0))./(B*sin(w)));
peak = abs(td(w0));              % peak at w0
side = (td(w1));                 % side at w1
plot(w/pi,td(w), w0/pi,peak,'ro', w1/pi,side,'rs','LineWidth',2,'MarkerSize',10)
title('Phase Delay, \tau(\omega)=-arg(H(\omega))/\omega');
xlabel('w/pi');
ylabel('\tau(\omega)');
legend('\tau(\omega)','peak','side');
axis([0 1 -12 4]);
grid on

%% 2(c)

w0 = 0.2*pi;
B = 0.1;
w1 = 0.05*pi;
a = [1, -(2*cos(w0))/(1+B), (1-B)/(1+B)];           % denominator coefficients
b = B/(1+B)*[1, 0, -1];                             % numerator coefficients
n = [0:1:100];
x = sin(w1*n);                                      % x[n]=sin(w1n)
y = filter(b,a,x);                                  % output of the peaking filter
stem(n,x,'marker','none','LineWidth',2)             % discrete plot of x[n]
hold on
stem(n,y,'r','marker','none','LineWidth',2)         % discrete plot of y[n]
title('input and output signals');
xlabel('Time Samples, n');
ylabel('Magnitude');
legend('x(n)','y(n)');
axis([0 100 -1.1 1.1]);

figure
plot(n,x,n,y,'r','LineWidth',2)                     % continuous plot of x[n], y[n]
title('Input and Output Signals');
xlabel('Time Samples, n');
ylabel('Magnitude');
legend('x(n)','y(n)')
axis([0 100 -1.1 1.1]);
grid on

%% 2(d)

%(a)
w0 = 0.2*pi;
B = 0.1;
w1 = 0.3*pi;                                        % w1=0.3pi
w = linspace(0,pi,1001);
% Frequency reponse H(w)
H = @(w) (j*B.*sin(w))./(cos(w)-cos(w0)+j*B.*sin(w));
% Left 3-dB frequency
w_left = (cos(w0)+B*sqrt(B^2+(sin(w0)).^2))./(1+B^2);
% Right 3-dB frequency
w_right = (cos(w0)-B*sqrt(B^2+(sin(w0)).^2))./(1+B^2);
left = acos(w_left);
right = acos(w_right);
peak = abs(H(w0));              % peak at w0
side = abs(H(w1));              % side at w1
plot(w/pi,abs(H(w)), w0/pi,peak,'ro', w1/pi,side,'rs', [left/pi,right/pi],abs([H(left) H(right)]),'r-*','LineWidth',2,'MarkerSize',10)
title('Peak Filter, \omega_1=0.3\pi');
xlabel('\omega/\pi');
ylabel('Magnitude');
legend('|H(\omega)|','peak','side','3-dB width');
axis([0,1,0,1.1]);
grid on

%(b)
figure
% Phase Delay
td = @(w) -(1./w).*atan((cos(w)-cos(w0))./(B*sin(w)));
peak = abs(td(w0));              % peak at w0
side = (td(w1));                 % side at w1
plot(w/pi,td(w), w0/pi,peak,'ro', w1/pi,side,'rs','LineWidth',2,'MarkerSize',10)
title('Phase Delay, \tau(\omega)=-arg(H(\omega))/\omega');
xlabel('w/pi');
ylabel('\tau(\omega)');
legend('\tau(\omega)','peak','side');
axis([0 1 -12 4]);
grid on

%(c)
figure
a = [1, -(2*cos(w0))/(1+B), (1-B)/(1+B)];           % denominator coefficients
b = B/(1+B)*[1, 0, -1];                             % numerator coefficients
n = [0:1:100];
x = sin(w1*n);                                      % x[n]=sin(w1n)
y = filter(b,a,x);                                  % output of the peaking filter
stem(n,x,'marker','none','LineWidth',2)             % discrete plot of x[n]
hold on
stem(n,y,'r','marker','none','LineWidth',2)         % discrete plot of y[n]
title('input and output signals');
xlabel('Time Samples, n');
ylabel('Magnitude');
legend('x(n)','y(n)');
axis([0 100 -1.1 1.1]);

figure
plot(n,x,n,y,'r','LineWidth',2)                     % continuous plot of x[n], y[n]
title('Input and Output Signals');
xlabel('Time Samples, n');
ylabel('Magnitude');
legend('x(n)','y(n)');
axis([0 100 -1.1 1.1]);
grid on

%% Part 3
%% 3(a)
fs = 5;                                     % sampling frequency 5Hz
T = 1/fs;                                   % sampling period
n = [0:10]*T;
t = [0:0.01:2];
% Original input x(t)
x = @(t) cos(2.*pi*t)+cos(8.*pi*t)+cos(12.*pi*t);
% Sampled version of input
x_a = 3*cos(2*pi*t);
plot(t,x(t),'r--', t,x_a,'b', n, x(n), 'ko','LineWidth',2,'MarkerSize',8)
title('f_s=5 kHz');
xlabel('t (msec)');
ylabel('x(t), x_a(t)');
legend('original','aliased','samples');
axis([0 2 -4 4]);
grid on

%% 3(b)
fs = 10;                                    % sampling frequency 10Hz
T = 1/fs;                                   % sampling period
n = [0:20]*T;
t = [0:0.01:2];
% Original input x(t)
x = @(t) cos(2.*pi*t)+cos(8.*pi*t)+cos(12.*pi*t);
% Sampled version of input
x_a = cos(2*pi*t)+2*cos(8*pi*t);
plot(t,x(t),'r--', t,x_a,'b', n, x(n), 'ko','LineWidth',2,'MarkerSize',8)
title('f_s=10 kHz');
xlabel('t (msec)');
ylabel('x(t), x_a(t)');
legend('original','aliased','samples');
axis([0 2 -4 4]);
grid on
