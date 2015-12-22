%% Part1
%% 1(a)
clf
L=200;                              % length of square wave signal x
K=50;                               % period of 50 samples
n = 0:L-1;                          % n=[0,L-1]
x = double(rem(n,K) < K/2);         % create the square wave
                                    % if remainder(n,K)<(K/2), then x[n]=1
h = [1/15*ones(1,15)];              % impulse response: h=1 for n=0~14
y = conv(h,x);                      % convolution function: y[n]=x[n]*h[n]
a = 0:(length(y)-1);                % length of the convulution
plot(n,x,'red--',a,y,'LineWidth',2) % plot input and output of the system
title('Accumulator Filter');
xlabel('n');
ylabel('y(n)');
legend('input','output');
axis([0 200 -0.5 1.5]);
grid on

%% 1(b)
clf
L=200;
K=50;
n = 0:L-1;
x = double(rem(n,K) < K/2);         % square wave: (n%K)<(K/2), then x=1
h=[];                               % define h[n]
for m=0:14
    h(m+1) = 0.25*(0.75).^m;        % h[n]=0.25*(0.75).^n for n=[0,14]
end
y = conv(h,x);                      % convolution function: y[n]=x[n]*h[n]
a = 0:(length(y)-1);                % length of the convulution
plot(n,x,'red--',a,y,'LineWidth',2) % plot input and output of the system
title('RC-type Integrator');
xlabel('n');
ylabel('y(n)');
legend('input','output');
axis([0 200 -0.5 1.5]);
grid on

%% 1(c)
clf
n = 0:120;                          % n=[0,120]
d = @(n) double(n==0);              % impulse delta function 
                                    % if n==0, then d[n]=1
x = d(n)+2*d(n-40)+2*d(n-70)+d(n-80);   % x[n]=d[n]+2d[n-40]+2d[n-70]+d[n-80]
h=[];                                   % define impulse response h[n]
for m=0:24                              
    h(m+1) = (0.95).^m;                 % h[n]=(0.95).^n for n=[0,24]
end
y = conv(h,x);                          % convolution function: y[n]=x[n]*h[n]
b = 0:(length(y)-1);                    % length of the convulution
plot(n,x,'red--',b,y,'LineWidth',2)     % plot input and output of the system
title('RC-type Integrator');
xlabel('n');
ylabel('y(n)');
legend('input','output');
axis([0 120 -0.5 3]);
grid on

%% Part 2
%% (a)
id = 160009862;                 % RUID
n = 0:10;
d = @(n) double(n==0);          % impulse delta function
h = syst(d(n),id)               % system impulse response h[n]

% (b)
x1 = d(n-2);                    % x1[n] = d[n-2]
y1 = syst(x1,id)                % system response of input x1[1]
x2 = 3*d(n)+2*d(n-2);           % x2[n] = 3d[n]+2d[n-2]
y2 = syst(x2,id)                % system response of input x2[n]

% (c)
x3 = [1,1,1,1,1,1,1,1,1,1];
y3a = syst(x3,id)               % system response of input x3[n] using syst function
y3b = conv(x3,h)                % system response using convolution: y[n]=x3[n]*h[n]
x4 = [1,-1,1,-1,1,-1,1,-1,1,-1];
y4a = syst(x4,id)               % system response of input x4[n] using syst function
y4b = conv(x4,h)                % system response using convolution: y[n]=x4[n]*h[n]

%% Part 3
%% 3(a)
clf
L = 40;
n = [-5:1:45];
p = @(n) double(n>=0 & n<L-1);          % pulse signal function: p[n]=1 for n=[0,L-1]
stem(n,p(n),'red','LineWidth',2)        % discrete plot pulse signal p[n]
xlabel('time samples, n');
ylabel('p(n)');
title('Rectangular Pulse Signal, L=40');
axis([-5 45 0 1.5]);
grid on

w0 = 0;
w = linspace(-1,1,1001);                % w/pi ranges from [-1,1]
% DTFT function of p[n]
Pw = @(w) L*exp((w.*pi).*(-j).*((L-1)/2)).*sinc(((w.*pi).*L)./(2*pi))./(sinc((w.*pi)./(2*pi)));
Fm = abs(Pw(w)/Pw(w0));                 % Normalized magnitude of DTFT 
figure
plot(w, Fm,'blue','LineWidth',2)        % plot of DTFT
xlabel('\omega/\pi');
ylabel('|P(\omega)/P(0)|');
title('DTFT of Rectangular Pulse, L=40');
axis([-1 1 0 1.1]);
grid on

X = freqz(p(n),1,w*pi);                 % DTFT using freqz buildt-in function
delta = mean(abs(X)-abs(Pw(w)));        % Average difference between freqz function and theory
fprintf('The difference between freqz function and theory function: %f \n',delta)

%% 3(b)
clf
L = 40;
w0 = 0.2*pi;                            % w0 = 0.2pi
n = 0:L-1;
s = @(n) sin(w0*n);                     % s[n] = sin(w0n) for n=[0,L-1]
stem(n,s(n),'red','LineWidth',2)        % discrete plot s[n]
xlabel('time samples, n');
ylabel('s(n)')
title('Single Sinusoid, \omega_0=0.2\pi');
axis([-5,45,-1.5,1.5]);
grid on

w0 = 0.2;                               % w0/pi = 0.2
w = linspace(-1,1,1001);                % w/pi ranges from [-1,1]
% function DTFT P(w-w0)
Pw1 = @(w) L*exp(((w-w0).*pi).*(-j).*((L-1)/2)).*sinc((((w-w0).*pi).*L)./(2*pi))./(sinc(((w-w0).*pi)./(2*pi)));
% function DTFT P(w+w0)
Pw2 = @(w) L*exp(((w+w0).*pi).*(-j).*((L-1)/2)).*sinc((((w+w0).*pi).*L)./(2*pi))./(sinc(((w+w0).*pi)./(2*pi)));
S = @(w)(1/2j)*(Pw1(w)-Pw2(w));         % DTFT function of s[n]
Fm = abs(S(w)/S(w0));                   % Normalized magnitude of DTFT 
figure
plot(w,Fm,'LineWidth',2)                % plot of DTFT 
xlabel('\omega/\pi')
ylabel('|(S(\omega)/S(\omega_0))|')
title('Normalized Spectrum,\omega_0=2\pi')
axis([-1 1 0 1.1]);
grid on

X = freqz(s(n),1,w*pi);                 % DTFT using freqz buildt-in function
delta = mean(abs(X)-abs(S(w)));         % Average difference between freqz function and theory
fprintf('The difference between freqz function and theory function: %f \n',delta)

% 3(d)
fw = @(w) -abs(S(w));                   % function make the DTFT negative
y0 = fminbnd(fw,0.15,0.25);             % function fminbdn to find min point (peak) 
fprintf('The actual spectral peak %f pi\n',y0);

%% 3(c)
clf
L = 40;
w1 = 0.2*pi;                            % w1 = 0.2pi
w2 = 0.4*pi;                            % w2 = 0.4pi
n = 0:L-1;
s1 = @(n) sin(w1*n);                    % s1[n] = sin(w1n) for n=[0,L-1]
s2 = @(n) sin(w2*n);                    % s2[n] = sin(w2n) for n=[0,L-1]
s = s1(n)+0.8*s2(n);                    % s[n] = s1[n]+0.8*s2[n]
stem(n,s,'red','LineWidth',2)           % discrete plot s[n]
xlabel('time samples, n');
ylabel('s(n)')
title('Single Sinusoid, \omega_0=0.2\pi');
axis([-5,45,-1.5,1.5]);
grid on

w1 = 0.2;                               % w1/pi = 0.2
w2 = 0.4;                               % w2/pi = 0.4
w = linspace(-1,1,1001);                % w/pi ranges from [-1,1]
% function DTFT P(w-w1)
P1w1 = @(w) L*exp(((w-w1).*pi).*(-j).*((L-1)/2)).*sinc((((w-w1).*pi).*L)./(2*pi))./(sinc(((w-w1).*pi)./(2*pi)));
% function DTFT P(w+w1)
P1w2 = @(w) L*exp(((w+w1).*pi).*(-j).*((L-1)/2)).*sinc((((w+w1).*pi).*L)./(2*pi))./(sinc(((w+w1).*pi)./(2*pi)));
S1 = @(w)(1/2j)*(P1w1(w)-P1w2(w));      % function DTFT S1(w) = (1/2j)*(P(w-w1)-P(w+w1))
% function DTFT P(w-w2)
P2w1 = @(w) L*exp(((w-w2).*pi).*(-j).*((L-1)/2)).*sinc((((w-w2).*pi).*L)./(2*pi))./(sinc(((w-w2).*pi)./(2*pi)));
% function DTFT P(w+w2)
P2w2 = @(w) L*exp(((w+w2).*pi).*(-j).*((L-1)/2)).*sinc((((w+w2).*pi).*L)./(2*pi))./(sinc(((w+w2).*pi)./(2*pi)));
S2 = @(w)(1/2j)*(P2w1(w)-P2w2(w));      % function DTFT S2(w) = (1/2j)*(P(w-w2)-P(w+w2))
S = @(w)(S1(w)+0.8*S2(w));              % S(w) = S1(w)+0.8*S2(w)
Fm = abs(S(w)/S(w1));                   % Normalized magnitude of DTFT
figure
plot(w,Fm,'LineWidth',1)                % plot of DTFT
xlabel('\omega/\pi')
ylabel('|(S(\omega)/S(\omega_0))|')
title('Normalized Spectrum,\omega_0=2\pi')
axis([-1 1 0 1.1]);
grid on

X = freqz(s,1,w*pi);                    % DTFT using freqz buildt-in function
delta = mean(abs(X)-abs(S(w)));         % Average difference between freqz function and theory
fprintf('The difference between freqz function and theory function: %f \n',delta)

% 3(d)
fw = @(w) -abs(S(w));                   % function make the DTFT negative
y1 = fminbnd(fw,0.15,0.25);             % function fminbdn to find min point (peak)
fprintf('The actual spectral peak near %s %f pi\n',' \omega1 ',y1);
y2 = fminbnd(fw,0.35,0.45);             % function fminbdn to find min point (peak)
fprintf('The actual spectral peak near %s %f pi\n',' \omega2 ',y2);
