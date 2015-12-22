%% Part 1
%% a
w = [0:0.001:2]*pi;
S = (1-exp(-5*1j.*w)).^2./(1-exp(-1j.*w));      % DTFT of s[n]
S(1)=0;                                         % for w=0, S(jw)=0
plot(w/pi,abs(S),'LineWidth',2)
title('DTFT');
xlabel('\omega/\pi');
set(gca,'yTick',[0 2 4 6 8]);
ylabel('|S(\omega)|');
grid on

%% b
k = 1:1:9;
K = 0:1:9;
S0 = 0;                                         % S[k] for k=0
S1 = 2*(1-(-1).^k)./(1-exp(-1j*pi./5.*k));      % S[k] for k=1,2,...9
Sk = [S0 S1];                                   % S[k] for k=0,1,...9
plot(K,abs(Sk),'.r','MarkerSize',25)            % 10-point DFT of s[n]
title('DFT');
xlabel('DFT index, k');
set(gca,'yTick',[0 2 4 6 8]);
ylabel('|S(\omega)|');
axis([-0.001 9 0 8]);
grid on

%% c
wk = 2*pi*K./10;
% Inverse DFT using theory
for n=0:1:9
    s(n+1) = 1/10*sum(Sk.*exp(1j.*wk.*n));      % Inverse DFT formula           
end
fprintf('\n\nReal part of s(n):\n');
fprintf('%0.2f\t',real(s));
fprintf('\n\nImaginary part of s(n):\n');
fprintf('%0.2f\t',imag(s));

% Inverse DFT using specific terms of sinusoids
for n=0:1:9
    s(n+1) = (0.4/sin(wk(2)/2)).*sin(wk(2).*n+wk(2)/2)+(0.4/sin(wk(4)/2)).*sin(wk(4).*n+wk(4)/2)+0.2*cos(wk(6).*n);
end
fprintf('\n\nS(n):\n');
fprintf('%0.2f\t',s);

%% d
w = [0:0.001:2]*pi;
S = (1-exp(-5*1j.*w)).^2./(1-exp(-1j.*w));      % DTFT of s[n]
S(1)=0;                                         % for w=0, S(jw)=0

k = 1:1:9;
K = 0:1:9;
wk = 2*pi*K./10;
S0 = 0;
S1 = 2*(1-(-1).^k)./(1-exp(-1j*pi./5.*k));
Sk = [S0 S1];                                   % DFT of s[n]

% Plot of DTFT and DFT in inverval 0<w<2pi
figure
plot(w/pi,abs(S),'LineWidth',2)   
hold on 
plot(wk/pi,abs(Sk),'.r','MarkerSize',25)
title('DTFT and DFT');
xlabel('\omega/\pi');
set(gca,'yTick',[0 2 4 6 8]);
ylabel('|S(\omega)|');
legend('DTFT','DFT','Location','best');
grid on

% Plot of DTFT and DFT versus the DFT index, k
figure
plot((w*10)/(2*pi),abs(S),'LineWidth',2)
hold on 
plot(K,abs(Sk),'.r','MarkerSize',25)
title('DTFT and DFT');
xlabel('DFT index, k');
set(gca,'yTick',[0 2 4 6 8]);
ylabel('|S(\omega)|');
legend('DTFT','DFT','Location','best');
grid on

%% e
s = [1 1 1 1 1 -1 -1 -1 -1 -1];
w = [0:0.001:2]*pi;
S_function = freqz(s,1,w);                      % DTFT using function freqz
Sk_function = fft(s);                           % DFT using function fft

difference_S = norm(S_function-S)               % difference between theory and function freqz
difference_Sk = norm(Sk_function-Sk)            % difference between theory and function fft
epsilon = eps                                   % epsilon constant in MATLAB

%% Part 2
%% a
clf
k = 0:1:127;                    % number of element in X is 128
load X                          % load X function
stem(k,abs(X))                  % stem plot of absolute of X
title('DFT of X');
xlabel('DTFT index, k');
ylabel('|X(\omega)|');
axis([0 130 0 70]);
grid on

[B,I] = sort(abs(X(1:64)));     % last 2 indices corresponding to 2 maximum values
k1 = I(64)-1;                   % MATLAB indices shifted by 1
k2 = I(63)-1;                   % MATLAB indices shifted by 1
f1 = k1/128*10;                 % divide by N, multiply by 10kHz
f2 = k2/128*10;
fprintf('Frequencies corresponding to 2 peaks in positive half of X:\n');
fprintf('f1 = %0.4f kHz \tf2 = %0.4f kHz\n',f1,f2);

[B,I] = sort(abs(X(65:128)));   % last 2 indices corresponding to 2 maximum values
k1_o = I(64)+64-1;              % MATLAB indices shifted by 1
k2_o = I(63)+64-1;              % MATLAB indices shifted by 1
f1_o = (k1_o/128-1)*10;         % (divide by N, then minus 2pi), (multiply by 10kHz, then divide by 2pi)
f2_o = (k2_o/128-1)*10;
fprintf('Frequencies corresponding to 2 peaks in negative half of X:\n');
fprintf('-f1 = %0.4f kHz \t-f2 = %0.4f kHz\n',f1_o,f2_o);

%% b
n = 0:1:127;
x = ifft(X);                            % Inverse DFT of all X
% estimated X contains frequency components at f1, f2, -f1, -f2, and zero-padding for the rest
X_estimated = [zeros(1,k1) X(k1+1) zeros(1,k2-k1-1) X(k2+1) zeros(1, k2_o-k2-1) X(k2_o+1) zeros(1, k1_o-k2_o-1) X(k1_o+1) zeros(1,128-k1_o-1)];
x_estimated = ifft(X_estimated);        % Inverse DFT of estimated X

plot(n,x_estimated,'LineWidth',1.2)
hold on
plot(n,x,':r')
title('Reconstructed Signal');
set(gca,'xTick',[0 32 64 96 128]);
xlabel('time samples, n');
ylabel('x(n)');
legend('estimated','true');
axis([0 128 -3 3]);

%% Part 3
%% a
% NxN matrix
dftmat = @(N) exp(-2*pi*1j/N.*repmat(0:1:N-1,N,1).*(repmat(0:1:N-1,N,1))');
dftmat(4)                           % test for single-line function dftmat
error = norm(dftmat(4)-dftmtx(4))   % difference between dftmat and built-in function dftmtx
epsilon = eps                       % epsilon constant in MATLAB

%% b
N = [512,1024,2048,4096];
%i Generate length-N column vector x of normally-distributed random number
x1 = randn(512,1);
x2 = randn(1024,1);
x3 = randn(2048,1);
x4 = randn(4096,1);
%ii Generate DFT matrix A, and save the computation time
tic, A1 = dftmat(512); toc;
Tmat(1) = toc;
tic, A2 = dftmat(1024); toc;
Tmat(2) = toc;
tic, A3 = dftmat(2048); toc;
Tmat(3) = toc;
tic, A4 = dftmat(4096); toc;
Tmat(4) = toc;
%iii Compute X=Ax, and save the computation time
tic, X1 = A1*x1; toc;
Tdft(1) = toc;
tic, X2 = A2*x2; toc;
Tdft(2) = toc;
tic, X3 = A3*x3; toc;
Tdft(3) = toc;
tic, X4 = A4*x4; toc;
Tdft(4) = toc;
%iv Compute X using fft function, and save the computation time
tic, F1 = fft(x1); toc;
Tfft(1) = toc;
tic, F2 = fft(x2); toc;
Tfft(2) = toc;
tic, F3 = fft(x3); toc;
Tfft(3) = toc;
tic, F4 = fft(x4); toc;
Tfft(4) = toc;
%v Compute the error between using matrix A and function fft
E(1) = norm(X1-F1);
E(2) = norm(X2-F2);
E(3) = norm(X3-F3);
E(4) = norm(X4-F4);

fprintf('  N        Tmat         Tdft       Tfft         Error\n');
fprintf('---------------------------------------------------------\n');
fprintf('%4d     %1.6f    %3.6f    %3.6f    %3.6e\n',[(N)' (Tmat)' (Tdft)' (Tfft)' (E)']');

%% Part 4
%% a
                                % example to test function periodic_output(b,a,s)
b = [2,1];                      % the numerator of H
a = [1,0,0,0.5];                % the denominator of H
s = [3,6,3];                    % input s[n]
s_out = periodic_output(b,a,s)  % output s_out[n] after filtering

%% b
s = [1,1,1,1,-1,-1,-1,-1];      % input s[n]
a = [1,0,0,0,0.5];              % the denominator of H
b = 0.3*[1 1 1];                % the numerator of H
s_out = periodic_output(b,a,s)  % output s_out[n] after filtering

%% c
a = [1,0,0,0,0.5];              % the denominator of H
b = 0.3*[1 1 1];                % the numerator of H
n = 0:1:39;
s = [1,1,1,1,-1,-1,-1,-1];      % s[n]
x = [s s s s s];                % x[n] consists of 5 s[n]
y = filter(b,a,x);              % output y after filtering x

figure
stem(n,x,'.','MarkerSize',0)
title('Input');
set(gca,'xTick',[0 8 16 24 32 40]);
xlabel('time samples, n');
ylabel('x(n)');
axis([-1 40 -1.5 1.5]);

figure
stem(n,y,'.','MarkerSize',0)
title('Output');
set(gca,'xTick',[0 8 16 24 32 40]);
xlabel('time samples, n');
ylabel('y(n)');
axis([-1 40 -2 2]);
