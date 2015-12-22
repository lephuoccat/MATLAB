%%
clf;
n=0:40;
f=0.1;
phase=0;
A=1.5;
arg=2*pi*f*n-phase;
x=A*cos(arg);
stem(n,x);
axis([0 40 -2 2]);
grid on
title('Sinusoidal Sequence');
xlabel('Time index n');
ylabel('Amplitude');
axis;

%%
x1=rand(1,10);
x2=randn(2,5);
y1=4*rand(1,15)-2;

%%
A=4*rand(1,5);
psi=2*pi*rand(1,5);
x=A.*cos(psi)

