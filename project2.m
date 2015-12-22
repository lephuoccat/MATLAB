%%
clf;
c=-(1/12)+(pi/6)*i;
K=2;
n=0:40;
x=K*exp(c*n)

subplot(2,1,1);
stem(n,real(x));
xlabel('Time index n');
ylabel('Amplitude');
title('Real part');

subplot(2,1,2);
stem(n,imag(x));
xlabel('Time index n');
ylabel('Amplitude');
title('Imaginary part');

%%
clf;
n=0:35;
a=1.2;
K=0.2;
x=K*a.^+n;
stem(n,x);
xlabel('Time index n');
ylabel('Amplitude');
