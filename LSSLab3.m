%% Part 1
t=-1.5:0.01:1.5;
wo=2*pi, E=1; 
% approximation with 5 harmonics
N=5;
xN=0.5;
for n=1:N
    an=(E/(n*pi))*(sin(n*pi/2)-sin(n*3*pi/2))
    xN=xN+an.*cos(n*wo*t);
end
% .* indicates the pointwise multiplication
subplot(231); plot(t,xN)
xlabel('time')
ylabel('approximation x5')
axis([-2 2 0 1.5])
hold
% approximation with 10 harmonics
N=10;
xN=0.5;
for n=1:N
    an=(E/(n*pi))*(sin(n*pi/2)-sin(n*3*pi/2))
    xN=xN+an.*cos(n*wo*t);
end
subplot(232); plot(t,xN)
xlabel('time')
ylabel('approximation x10')
axis([-2 2 0 1.5])
% approximation with 20 harmonics
N=20;
xN=0.5;
for n=1:N
    an=(E/(n*pi))*(sin(n*pi/2)-sin(n*3*pi/2))
    xN=xN+an.*cos(n*wo*t);
end
subplot(233); plot(t,xN)
xlabel('time')
ylabel('approximation x20')
axis([-2 2 0 1.5])
% approximation with 30 harmonics
N=30;
xN=0.5;
for n=1:N
    an=(E/(n*pi))*(sin(n*pi/2)-sin(n*3*pi/2))
    xN=xN+an.*cos(n*wo*t);
end
subplot(234); plot(t,xN)
xlabel('time')
ylabel('approximation x30')
axis([-2 2 0 1.5])
% approximation with 40 harmonics
N=40;
xN=0.5;
for n=1:N
    an=(E/(n*pi))*(sin(n*pi/2)-sin(n*3*pi/2))
    xN=xN+an.*cos(n*wo*t);
end
subplot(235); plot(t,xN)
xlabel('time')
ylabel('approximation x40')
axis([-2 2 0 1.5])
% approximation with 50 harmonics
N=50;
xN=0.5;
for n=1:N
    an=(E/(n*pi))*(sin(n*pi/2)-sin(n*3*pi/2))
    xN=xN+an.*cos(n*wo*t);
end
subplot(236); plot(t,xN)
xlabel('time')
ylabel('approximation x50')
axis([-2 2 0 1.5])

% Gibbs phenomenon: It is 9% more than 1 (0.9)

%% Part 2
E=1; 
% approximation with 10 harmonics
N=10;
bn=0;
amp=zeros(1,N+1);
amp(1,1)=0.5;
phase=zeros(1,N+1);

for n=1:N
    an=(E/(n*pi))*(sin(n*pi/2)-sin(n*3*pi/2));
    amp(1,n+1)=0.5.*abs(an);
    phase(1,n+1)=-atan(bn/an);
end

subplot(2,1,1); plot(amp,'o')
xlabel('n')
ylabel('Amplitude')

subplot(2,1,2); plot(phase,'o')
xlabel('n')
ylabel('Phase')

%% Part 3
num=[1];
den=[1 2 3];
freqs(num,den)

%% Part 4
t=0:0.01:4*pi;
E=5; w0=1;
% first approximation
N=1;
yN=0;
Xn=0.5;
for n=1:N
    an=(E/(n*pi))*(sin(n*pi/2)-sin(n*3*pi/2));
    Xn=Xn+an.*cos(n*w0*t);
end
for n=1:N
    Hm=1/sqrt((3-(n*w0)^2)^2+4*(n*w0)^2);
    Hp=-atan(2*n*w0/(3-(n*w0)^2));
    Xnm=abs(Xn(n));
    Xnp=angle(Xn(n));
    Ynm=Xnm*Hm;
    Ynp=Xnp+Hp;
    yN=yN+2*Ynm*cos(n*w0*t+Ynp);
end
plot(t,yN,':')
hold on
% third approximation
N=3;
yN=0;
Xn=0.5;
for n=1:N
    an=(E/(n*pi))*(sin(n*pi/2)-sin(n*3*pi/2));
    Xn=Xn+an.*cos(n*w0*t);
end

for n=1:N
    Hm=1/sqrt((3-(n*w0)^2)^2+4*(n*w0)^2);
    Hp=-atan(2*n*w0/(3-(n*w0)^2));
    Xnm=abs(Xn(n));
    Xnp=angle(Xn(n));
    Ynm=Xnm*Hm;
    Ynp=Xnp+Hp;
    yN=yN+2*Ynm*cos(n*w0*t+Ynp);
end
plot(t,yN,'r--')
hold on
% fifth approximation
N=5;
yN=0;
Xn=0.5;
for n=1:N
    an=(E/(n*pi))*(sin(n*pi/2)-sin(n*3*pi/2));
    Xn=Xn+an.*cos(n*w0*t);
end
for n=1:N
    Hm=1/sqrt((3-(n*w0)^2)^2+4*(n*w0)^2);
    Hp=-atan(2*n*w0/(3-(n*w0)^2));
    Xnm=abs(Xn(n));
    Xnp=angle(Xn(n));
    Ynm=Xnm*Hm;
    Ynp=Xnp+Hp;
    yN=yN+2*Ynm*cos(n*w0*t+Ynp);
end
plot(t,yN,'g-.')
hold on


