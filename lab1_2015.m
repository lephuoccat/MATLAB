%% part_1a
L=200;
K=50;
n=0:L-1;
x=double(rem(n,K)<K/2);
h = (1/15)*ones(1,15);
y=conv(h,x);
subplot(221)
plot (n,x,'r--',0:213,y)
axis([-1,200,-0.5,1.1])
xlabel('n');
ylabel('y(n)');
title('intergrator-like a filter');
grid;
legend('x','y');

%part_1b
n0=0:14;
h = 0.25*(0.75).^n0;
y=conv(h,x);
subplot(222)
plot (n,x,'r--',0:213,y)
axis([-1,200,-0.5,1.1])
xlabel('n');
ylabel('y(n)');
title('RC filter');
grid;
legend('x','y');

%part_1c
n0=0:24;
h=(0.95).^n0;
n=0:120;
d=@(n) double(n==0);
x=d(n)+(2*d(n-40))+(2*d(n-70))+d(n-80);
y=conv(h,x);
subplot(223)
plot (n,x,'r--',0:144,y)
axis([-1,121,-0.5,3])
xlabel('n');
ylabel('y(n)');
title('LTI property');
grid;
legend('x','y');

%% part_2a
id=161002319;
n=0:5;
d=@(n)double(n==0);
x=d(n);
h1=syst(x,id)

%part_2b
id=161002319;
n=0:5;
d=@(n)double(n==0);
% delayed impulse
x=d(n-2);
h2=syst(x,id);
%multiplied delayed impulse
x=3*d(n)+2*d(n-2);
h3=syst(x,id);

%part_2c
id=161002319
x1=[1,1,1,1,1,1,1,1,1,1];
x2=[1,-1,1,-1,1,-1,1,-1,1,-1];
%using syst
y1=syst(x1,id)
y2=syst(x2,id)
%using conv
y3=conv(h1,x1)
y4=conv(h1,x2)


%% part_3a
%rectangular pulse
n=-5:45;
L=40;
w=linspace(-pi,pi,1001);
w0=0;
p=@(n) double(n>=0 & n<=L-1);
subplot(221);
stem(n,p(n),'r')
axis([-6,46,-0.1,1.1])
xlabel('n');
ylabel('p(n)');
title('rectangular pulse signal');
grid;
%DTFT of rectangular pulse
P = @(w) L*exp(w.*-1j.*((L-1)./2)).*(sinc(w.*L)./(2*pi))./(sinc((w)./(2*pi)))
F=abs(P(w)/P(w0));
subplot(222)
plot(w,F)
axis([-1,1,-0.01,1.1])
xlabel('w/pi');
ylabel('|(P1(w)/P1(w0))|');
title('DTFT of rectangular pulse');
grid;

%% part_3b
%single sinusoid
L=40;
w=linspace(-pi,pi,1001);
w0=0.2*pi;
n=0:40;
s=@(n) sin(w0*n)
subplot(221);
stem(n,s(n),'r')
axis([-5,45,-1.1,1.1])
grid
xlabel('n')
ylabel('s(n)')
title('single sinusoid')
%normalized spectrum
S1= @(w) L*((sinc((w-w0)*L/(2*pi))./sinc((w-w0)/(2*pi))).*exp(-1i*(w-w0)*(L-1)/2));
S2= @(w) L*((sinc((w+w0)*L/(2*pi))./sinc((w+w0)/(2*pi))).*exp(-1i*(w+w0)*(L-1)/2));
S= @(w)(S1(w)-S2(w))*(1/2j)
A=abs(S(w)/S(w0));
subplot(222)
plot(w/pi,A)
axis([-1,1,0,1.1])
grid;
xlabel('w/pi')
ylabel('|(S(w)/S(w0))|')
title('normalized spectrum,w0=2*pi')
%% part_3c
%sum of sinusoid
L=40;
w=linspace(-pi,pi,1001);
w1=0.2*pi;
w2=0.4*pi;
n=-5:45;
s=@(n)sin(w1*n)+0.8*sin(w2*n)
subplot(221)
stem(n,s(n),'r')
axis([-5,45,-1.5,1.5])
xlabel('n');
ylabel('s(n)');
title('sum of sinusoid');
grid;
%spectrum normalized
S1= @(w) L*((sinc((w-w1)*L/(2*pi))./sinc((w-w1)/(2*pi))).*exp(-1i*(w-w1)*(L-1)/2));
S2= @(w) L*((sinc((w+w1)*L/(2*pi))./sinc((w+w1)/(2*pi))).*exp(-1i*(w+w1)*(L-1)/2));
S= @(w) (S1(w)-S2(w))*(1/2j);
T1= @(w) 0.8*L*((sinc((w-w2)*L/(2*pi))./sinc((w-w2)/(2*pi))).*exp(-1i*(w-w2)*(L-1)/2));
T2= @(w) 0.8*L*((sinc((w+w2)*L/(2*pi))./sinc((w+w2)/(2*pi))).*exp(-1i*(w+w2)*(L-1)/2));
T= @(w) (T1(w)-T2(w))*(1/2j);
U= @(w) S(w)+T(w);
A=abs(U(w)/U(w1));
subplot(222)
plot(w/pi,A)
axis([-1,1,-0.1,1.5])
xlabel('w/pi');
ylabel('|(S(w)/S(w1))|');
title('spectrum normalized, w1=0.2*pi');
grid;