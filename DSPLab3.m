%% Part 1
%% 1(a)
clf
id = 160009862;
y = dtmfsig(id);                    % generate 3-digit DTMF signal
t = linspace(0,0.9,7200);           % create 7200 sample for 0.9 sec
plot(t,y)                           % plot of the signal
title('DTMF time signal');
xlabel('t (sec)');
ylabel('y(t)');
axis([0 0.9 -3 3]);

%% 1(b)
id = 160009862;
y = dtmfsig(id);                    % dtmfsig function
fs = 8000;                          % sampling frequency

y1 = [y(1:2400)];                   % first segment (from sample 1 to 2400)
y2 = [y(2401:4800)];                % second segment (from sample 2401 to 4800)
y3 = [y(4801:7200)];                % third segment (from sample 4801 to 7200)

fL = [697 770 852 941];             % frequency low
fH = [1209 1336 1477];              % frequency high

% First Digit
Y1_L = freqz(y1,1,fL/fs*2*pi);      % DTFT of first segment
for n=1:4                           % find fL correspond to max DTFT
    if max(Y1_L)==Y1_L(n)           % if DTFT at fi is max
        freq1_low = fL(n);          % fL = fi
    end
end
Y1_H = freqz(y1,1,fH/fs*2*pi);
for n=1:3                           % find fH correspond to max DTFT
    if max(Y1_H)==Y1_H(n)           % if DTFT at fi is max
        freq1_high = fH(n);         % fH = fi
    end
end

% Second Digit
Y2_L = freqz(y2,1,fL/fs*2*pi);      % DTFT of second segment
for n=1:4                           % find fH correspond to max DTFT
    if max(Y2_L)==Y2_L(n)           % if DTFT at fi is max
        freq2_low = fL(n);          % fL = fi
    end
end
Y2_H = freqz(y2,1,fH/fs*2*pi);
for n=1:3                           % find fH correspond to max DTFT
    if max(Y2_H)==Y2_H(n)           % if DTFT at fi is max
        freq2_high = fH(n);         % fH = fi
    end
end

% Third Digit
Y3_L = freqz(y3,1,fL/fs*2*pi);      % DTFT of third segment
for n=1:4                           % find fH correspond to max DTFT
    if max(Y3_L)==Y3_L(n)           % if DTFT at fi is max
        freq3_low = fL(n);          % fL = fi
    end
end
Y3_H = freqz(y3,1,fH/fs*2*pi);
for n=1:3                           % find fH correspond to max DTFT
    if max(Y3_H)==Y3_H(n)           % if DTFT at fi is max
        freq3_high = fH(n);         % fH = fi
    end
end

fprintf('First digit: fL = %d, fH = %d\n',freq1_low,freq1_high)
fprintf('Second digit: fL = %d, fH = %d\n',freq2_low,freq2_high)
fprintf('Third digit: fL = %d, fH = %d\n',freq3_low,freq3_high)

%% 1(c)
id = 160009862;
y = dtmfsig(id);                            % dtmfsig function
fs = 8000;                                  % samplign frequency
f = [600:1600];                             % frequency range
f_kb = [697 770 852 941 1209 1336 1477];    % DTMF frequency
y1 = [y(1:2400)];                           % first segment
y2 = [y(2401:4800)];                        % second segment
y3 = [y(4801:7200)];                        % third segment

figure
Y1 = freqz(y1,1,f./fs.*2.*pi);              % DTFT of first segment
Y1_nor = abs(Y1/max(Y1));                   % normalized DTFT
Y1_point = freqz(y1,1,f_kb./fs.*2.*pi);     % DTFT of first segment at DTMF frequency
Y1_point_nor = abs(Y1_point/max(Y1_point)); % normalized DTFT of first segment at DTMF frequency

plot(f, Y1_nor,'blue','LineWidth',1);
hold on
plot(f_kb,Y1_point_nor,'.r','MarkerSize',25);
title('Normalized Spectrum of Decode Key 5');
set(gca,'xTick',[770 1336]);                % label xtick of x-axis only at 770, 1336
xlabel('Frequency   (Hz)');
ylabel('Magnitude');
legend('DTFT','key = 5');
axis([600 1600 0 1.2]);


figure
Y2 = freqz(y2,1,f./fs.*2.*pi);              % DTFT of second segment
Y2_nor = abs(Y2/max(Y1));                   % normalized DTFT
Y2_point = freqz(y2,1,f_kb./fs.*2.*pi);     % DTFT of second segment at DTMF frequency
Y2_point_nor = abs(Y2_point/max(Y2_point)); % normalized DTFT of second segment at DTMF frequency

plot(f, Y2_nor,'blue','LineWidth',1);
hold on
plot(f_kb,Y2_point_nor,'.r','MarkerSize',25);
title('Normalized Spectrum of Decode Key 3');
set(gca,'xTick',[697 1477]);                % label xtick of x-axis only at 697, 1477
xlabel('Frequency   (Hz)');
ylabel('Magnitude');
legend('DTFT','key = 3');
axis([600 1600 0 1.2]);


figure
Y3 = freqz(y3,1,f./fs.*2.*pi);              % DTFT of third segment
Y3_nor = abs(Y3/max(Y1));                   % normalized DTFT
Y3_point = freqz(y3,1,f_kb./fs.*2.*pi);     % DTFT of third segment at DTMF frequency
Y3_point_nor = abs(Y3_point/max(Y1_point)); % normalized DTFT of third segment at DTMF frequency

plot(f, Y3_nor,'blue');
hold on
plot(f_kb,Y3_point_nor,'.r','MarkerSize',25)
title('Normalized Spectrum of Decode Key 8');
set(gca,'xTick',[852 1336]);                % label xtick of x-axis only at 852, 1336
xlabel('Frequency   (Hz)');
ylabel('Magnitude');
legend('DTFT','key = 8');
axis([600 1600 0 1.2]);

%% 1(d)
fprintf('\n   f  |\t key 5\t key 3\t key 8\n');
fprintf('------|------------------------\n');
fprintf(' %4d |\t %4.3f\t %4.3f\t %4.3f\n',[f_kb' Y1_point_nor' Y2_point_nor' Y3_point_nor']');

%% Part 2
%% 2(a)
f0 = 0.125;                 % frequency f0=0.125kHz
fs = 1;                     % sampling frequency fs
T = 1/fs;                   % sampling period
M = 20;
m = [-20:20];               % m = [-M;M]
t = [0:0.01:20];

xa = cos(2*pi*f0.*t);                                               % x_a
xp = ((sin(pi*f0*T))./(pi*f0*T)).*cos(2*pi*f0*t-pi*f0*T);           % x_p

[tt,mm] = meshgrid(t,m);    % meshgrid to create an array of mm corresponding to tt                                              
fm = f0+mm.*fs;
xr = sum(((sin(pi*fm*T))./(pi*fm*T)).*cos(2*pi*fm.*tt-pi*fm*T));    % x_r

wm = 0.54+0.46*cos((pi*mm)./M);                                     % w_m                              
xh = sum(wm.*((sin(pi*fm*T))./(pi*fm*T)).*cos(2*pi*fm.*tt-pi*fm*T));% x_h

figure
plot(t,xr,'b',t,xp,'r',t,xa,'g','LineWidth',2)
title('Rectangular Weights, f_0 = 0.125 kHz')
xlabel('t (msec)') 
legend('x_r(t)','x_p(t)','x_a(t)');
axis([0 20 -2 2]);

figure
plot(t,xh,'b',t,xp,'r',t,xa,'g','LineWidth',2)
title('Hamming Weights, f_0 = 0.125 kHz');
xlabel('t (msec)');
legend('x_h(t)','x_p(t)','x_a(t)');
axis([0 20 -2 2]);

% Exact Attenuation and Phase Delay from Theory
attenuation_theory = (sin(pi*f0*T))./(pi*f0*T)
phase_deplay_theory_msec = (pi*f0*T)/(2*pi)*(1/f0)
phase_delay_theory_rad = pi*f0*T

% Estimated Attenuation and Phase Delay from Graph
[y1,t1] = max(xa(800:1000));
[y2,t2] = max(xp(800:1000));
attenuation_graph = y2/y1
phase_deplay_graph_msec = 0.01*(t2-t1)
phase_delay_graph_rad = (0.01*(t2-t1))/(1/f0)*(2*pi)

%% 2(b)
f3dB=fs/2;
[b,a] = butter(6,2*pi*f3dB,'s');        % 6th order Butterworth analog low-pass filter
xf = lsim(b,a,xh,t);                    % output using lsim function

figure
plot(t,xf,'k',t,xp,'r',t,xh,'b',t,xa,'g','LineWidth',2)
title('Postfilter Output, f_0=0.125kHz');
xlabel('t (msec)');
legend('x_f(t)','x_p(t)','x_h(t)','x_a(t)');
axis([0 20 -2 2]);
grid on

% Estimated Time Delay from the difference of peak xf and peak of xp
[y1,t1] = max(xp(800:1000));
[y2,t2] = max(xf(800:1000));
t1_estimated = 0.01*(t2-t1)

% Exact Time Delay from the Phase-delay of Butterworth filter
Hpost = @(f) polyval(b,2*pi*1j*f0)./polyval(a,2*pi*1j*f0);
t1_exact = -(angle (Hpost(f0))./(2*pi.*f0))

%% 2(c)
f = 0:0.01:4;
m = [0,1,2,3];
fm1 = f0+m.*fs;

G = @(f) (sin(pi*f.*T))./(pi*f.*T);                         % funstion of G(f)
Hpost = @(f) polyval(b,2*pi*1j*f)./polyval(a,2*pi*1j*f);    % post filter

G1 = abs(G(fm1));                                           % absolute of G(fm)
GH1 = abs(G(fm1).*Hpost(fm1));                              % absolute of G(fm)Hpost(fm)

figure
stem(fm1,G1,'.','MarkerSize',25);
hold on
plot(f,abs(G(f)),'g',f,abs(Hpost(f)),'k',f,abs(G(f).*Hpost(f)),'r','LineWidth',2);
title('Reconstruction Stages, f_0 = 0.125 kHz');
xlabel('f (kHz)');
ylabel('Magnitude');
ld = legend('staircase output','|H_{stair}(f)|','|H_{post}(f)|','|H_{stair}(f).H_{post}(f)|');
set(ld,'FontSize',12);                                      % set the size of the legend box
axis([0 4 0 1.1]);
grid on

figure
stem(fm1,GH1,'.r','MarkerSize',25);
hold on
plot(f,abs(G(f)),'g',f,abs(Hpost(f)),'k',f,abs(G(f).*Hpost(f)),'r','LineWidth',2);
title('Reconstruction Stages , f_0 = 0.125 kHz');
xlabel('f (kHz)');
ylabel('magnitude');
ld = legend('postfilter output','|H_{stair}(f)|','|H_{post}(f)|','|H_{stair}(f)|.|H_{post}(f)|');
set(ld,'FontSize',12);                                      % set the size of the legend box
axis([0 4 0 1.1]);
grid on

%% 2(d)
% (a)
f0 = 0.25;             % frequency f0=0.25kHz
fs = 1;                % sampling frequency fs
T = 1/fs;              % sampling period
M = 20;
m = [-20:20];          % m = [-M;M]
t = [0:0.01:20];

xa = cos(2*pi*f0.*t);
xp = ((sin(pi*f0*T))./(pi*f0*T)).*cos(2*pi*f0*t-pi*f0*T);

[tt,mm] = meshgrid(t,m);
fm = f0+mm.*fs;
xr = sum(((sin(pi*fm*T))./(pi*fm*T)).*cos(2*pi*fm.*tt-pi*fm*T));

wm = 0.54+0.46*cos((pi*mm)./M);
xh = sum(wm.*((sin(pi*fm*T))./(pi*fm*T)).*cos(2*pi*fm.*tt-pi*fm*T));

figure
plot(t,xr,'b',t,xp,'r',t,xa,'g','LineWidth',2)
title('Rectangular Weights, f_0 = 0.25 kHz')
xlabel('t (msec)')
legend('x_r(t)','x_p(t)','x_a(t)');
axis([0 20 -2 2]);

figure
plot(t,xh,'b',t,xp,'r',t,xa,'g','LineWidth',2)
title('Hamming Weights, f_0 = 0.25 kHz');
xlabel('t (msec)');
legend('x_h(t)','x_p(t)','x_a(t)');
axis([0 20 -2 2]);

% Exact Attenuation and Phase Delay from Theory
attenuation_theory = (sin(pi*f0*T))./(pi*f0*T)
phase_deplay_theory_msec = (pi*f0*T)/(2*pi)*(1/f0)
phase_delay_theory_rad = pi*f0*T

% Estimated Attenuation and Phase Delay from Graph
[y1,t1] = max(xa(800:1000));
[y2,t2] = max(xp(800:1000));
attenuation_graph = y2/y1
phase_deplay_graph_msec = 0.01*(t2-t1)
phase_delay_graph_rad = (0.01*(t2-t1))/(1/f0)*(2*pi)


% (b)
f3dB=fs/2;
[b,a] = butter(6,2*pi*f3dB,'s');
xf = lsim(b,a,xh,t);

figure
plot(t,xf,'k',t,xp,'r',t,xh,'b',t,xa,'g','LineWidth',2)
title('Postfilter Output, f_0=0.25kHz');
xlabel('t (msec)');
legend('x_f(t)','x_p(t)','x_h(t)','x_a(t)');
axis([0 20 -2 2]);

% Time delay of the peak xf, relative to peak of xp
[y1,t1] = max(xp(800:1000));
[y2,t2] = max(xf(800:1000));
t2_estimated = 0.01*(t2-t1)
% Exact time delay from the Phase-delay of Butterworth filter
H_post = polyval(b, 2*pi*1j*f0)./polyval(a,2*pi*1j*f0);
t2_exact = -(angle (H_post)./(2*pi.*f0))


% (c)
f = 0:0.01:4;
m = [0,1,2,3];
fm2 = f0+m.*fs;

G = @(f) (sin(pi*f.*T))./(pi*f.*T);
Hpost = @(f) polyval(b,2*pi*1j*f)./polyval(a,2*pi*1j*f);

G2 = abs(G(fm2));
GH2 = abs(G(fm2).*Hpost(fm2));

figure
stem(fm2,G2,'.','MarkerSize',25);
hold on
plot(f,abs(G(f)),'g',f,abs(Hpost(f)),'k',f,abs(G(f).*Hpost(f)),'r','LineWidth',2);

title('Reconstruction Stages , f_0 = 0.25 kHz');
xlabel('f (kHz)');
ylabel('Magnitude');
ld = legend('staircase output','|H_{stair}(f)|','|H_{post}(f)|','|H_{stair} (f)|.|H_{post}(f)|');
set(ld,'FontSize',12);
axis([0 4 0 1.1]);
grid on

figure
stem(fm2,GH2,'.r','MarkerSize',25);
hold on
plot(f,abs(G(f)),'g',f,abs(Hpost(f)),'k',f,abs(G(f).*Hpost(f)),'r','LineWidth',2);
title('Reconstruction Stages , f_0 = 0.25 kHz');
xlabel('f (kHz)');
ylabel('Magnitude');
ld = legend('postfilter output','|H_{stair}(f)|','|H_{post}(f)|','|H_{stair} (f)|.|H_{post}(f)|');
set(ld,'FontSize',12);
axis([0 4 0 1.1]);
grid on

%% 2(e)
fprintf('\nfm = f0 + m*fs  |        |G(fm)|        |    |G(fm)Hpost(fm)|\n');
fprintf('--------------------------------------------------------------\n');
fprintf('%1.4f\t%1.4f\t|  %1.6f\t %1.6f   |  %1.6f\t %1.6f\n',[fm1' fm2' G1' G2' GH1' GH2']');

%% 2(f)
f = 0:0.01:4;
Hpost = polyval(b,2*pi*1j*f)./polyval(a,2*pi*1j*f);     % post filter
delay = -(angle (Hpost)./(2*pi.*f));                    % phase delay of post filter

figure
plot(f,delay,0.125,t1_estimated,'.r',0.125,t1_exact,'.k',0.250,t2_estimated,'.r',0.250,t2_exact,'.k','MarkerSize',20);
title('Postfilter Phase Delay');
xlabel('f (kHz)');
ylabel('\tau(f) (msec)');
legend('phase delay','estimated','exact');
axis([0 4 -1.6 1.6]);
grid on

fprintf('\n phase delay\texact\t estimated\n');
fprintf('-----------------------------------\n');
fprintf(' f0 = %1.3f  |  %1.3f  |  %1.3f\n',[[0.125 0.25]' [t1_exact t2_exact]' [t1_estimated t2_estimated]']');

%% Part 3
%% 3(a)
a = 1;
f0 = 0.5;
fs1 = 1;        % sampling frequency 1
T1 = 1/fs1;     % sampling period 1
fs2 = 2;        % sampling fequency 2
T2 = 1/fs2;     % sampling period 2

t = [0:0.01:8];
x = t.*exp(-a.*t).*exp(1j*2*pi*f0.*t);                      % function x(t)
n = [0:1:20];   % samples range
X1 = (T1.*n).*exp(-a.*(T1.*n)).*exp(1j*2*pi*f0.*(T1.*n));   % function x[nT1]
X2 = (T2.*n).*exp(-a.*(T2.*n)).*exp(1j*2*pi*f0.*(T2.*n));   % function x[nT2]

figure
plot(t,real(x),n*T1,real(X1),'.r','MarkerSize',25,'LineWidth',2);
title('x(t) = t e^{-at} cos(\omega_0t) , f_s = 1');
xlabel('t (sec)');
ylabel('x(t)');
legend('analog','samples');
axis([0 8 -0.4 0.3]);

figure
plot(t,real(x),n*T2,real(X2),'.r','MarkerSize',25,'LineWidth',2);
title('x(t) = t e^{-at} cos(\omega_0t) , f_s = 2');
xlabel('t (sec)');
ylabel('x(t)');
legend('analog','samples');
axis([0 8 -0.4 0.3]);

%% 3(b)
a = 1;
f0 = 0.5;
f = [0:0.001:4];

Xa = 1./((a+1j.*(2*pi.*f-2*pi*f0)).^2);         % X(W)in analog
Xa_nor = abs(Xa./max(Xa));                      % normalized X(W)

% fs = 0.5, M = 1
fs = 0.5;
T = 1/fs;
m = [-1:1];                                     % M = 1
T_Xd = (T^2*exp(-a*T).*exp(-1j.*(2*pi.*f-2*pi*f0)*T))./((1-exp(-a*T).*exp(-1j.*(2*pi.*f-2*pi*f0)*T)).^2);   % X(W) in digital
[ff,mm] = meshgrid(f,m);                                        % meshgrid to create an array mm correspoding to ff
T_XM = sum(1./((a+1j.*(2*pi.*ff-2*pi*f0-2*pi*fs.*mm)).^2));     % replicas of X(W) in digital (estimated)

figure
plot(f,Xa_nor,'g',f,abs(T_Xd),'r',f,abs(T_XM),'b','LineWidth',2);
title('f_s = 0.5 , M = 1');
xlabel('f (Hz)');
ylabel('|X(f)|');
legend('analog','digital','replicas');
axis([0 4 0 1.1]);

% fs = 0.5, M = 2
m = [-2:2];
T_Xd = (T^2*exp(-a*T).*exp(-1j.*(2*pi.*f-2*pi*f0)*T))./((1-exp(-a*T).*exp(-1j.*(2*pi.*f-2*pi*f0)*T)).^2);
[ff,mm] = meshgrid(f,m);
T_XM = sum(1./((a+1j.*(2*pi.*ff-2*pi*f0-2*pi*fs.*mm)).^2));

figure
plot(f,Xa_nor,'g',f,abs(T_Xd),'r',f,abs(T_XM),'b','LineWidth',2);
title('f_s = 0.5 , M = 2');
xlabel('f (Hz)');
ylabel('|X(f)|');
legend('analog','digital','replicas');
axis([0 4 0 1.1]);

% fs = 1, M = 1
fs = 1;
T = 1/fs;
m = [-1:1];
T_Xd = (T^2*exp(-a*T).*exp(-1j.*(2*pi.*f-2*pi*f0)*T))./((1-exp(-a*T).*exp(-1j.*(2*pi.*f-2*pi*f0)*T)).^2);
[ff,mm] = meshgrid(f,m);
T_XM = sum(1./((a+1j.*(2*pi.*ff-2*pi*f0-2*pi*fs.*mm)).^2));

figure
plot(f,Xa_nor,'g',f,abs(T_Xd),'r',f,abs(T_XM),'b','LineWidth',2);
title('f_s = 1 , M = 1');
xlabel('f (Hz)');
ylabel('|X(f)|');
legend('analog','digital','replicas');
axis([0 4 0 1.1]);

% fs = 1, M = 2
m = [-2:2];
T_Xd = (T^2*exp(-a*T).*exp(-1j.*(2*pi.*f-2*pi*f0)*T))./((1-exp(-a*T).*exp(-1j.*(2*pi.*f-2*pi*f0)*T)).^2);
[ff,mm] = meshgrid(f,m);
T_XM = sum(1./((a+1j.*(2*pi.*ff-2*pi*f0-2*pi*fs.*mm)).^2));

figure
plot(f,Xa_nor,'g',f,abs(T_Xd),'r',f,abs(T_XM),'b','LineWidth',2);
title('f_s = 1 , M = 2');
xlabel('f (Hz)');
ylabel('|X(f)|');
legend('analog','digital','replicas');
axis([0 4 0 1.1]);

% fs = 2, M = 1
fs = 2;
T = 1/fs;
m = [-1:1];
T_Xd = (T^2*exp(-a*T).*exp(-1j.*(2*pi.*f-2*pi*f0)*T))./((1-exp(-a*T).*exp(-1j.*(2*pi.*f-2*pi*f0)*T)).^2);
[ff,mm] = meshgrid(f,m);
T_XM = sum(1./((a+1j.*(2*pi.*ff-2*pi*f0-2*pi*fs.*mm)).^2));

figure
plot(f,Xa_nor,'g',f,abs(T_Xd),'r',f,abs(T_XM),'b','LineWidth',2);
title('f_s = 2 , M = 1');
xlabel('f (Hz)');
ylabel('|X(f)|');
legend('analog','digital','replicas');
axis([0 4 0 1.1]);

% fs = 2, M = 2
m = [-2:2];
T_Xd = (T^2*exp(-a*T).*exp(-1j.*(2*pi.*f-2*pi*f0)*T))./((1-exp(-a*T).*exp(-1j.*(2*pi.*f-2*pi*f0)*T)).^2);
[ff,mm] = meshgrid(f,m);
T_XM = sum(1./((a+1j.*(2*pi.*ff-2*pi*f0-2*pi*fs.*mm)).^2));

figure
plot(f,Xa_nor,'g',f,abs(T_Xd),'r',f,abs(T_XM),'b','LineWidth',2);
title('f_s = 2 , M = 2');
xlabel('f (Hz)');
ylabel('|X(f)|');
legend('analog','digital','replicas');
axis([0 4 0 1.1]);
