%% Part 1
k=1:1:10;
num=[1];
den=[1, -1/4, 1/8];

figure
y_impulse=dimpulse(num, den, k);
plot(k,y_impulse,'*')
title('System Impulse Response');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

figure
y_step=dstep(num, den, k);
plot(k,y_step,'*')
title('System Step Response');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

figure
f1=sin(4*k);
yzs1=dlsim(num, den, f1);
plot(k,yzs1,'*')
title('Zero-State Response due to f[k]=sin[4k]u[k]');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

figure
f2=(-1).^k;
yzs2=dlsim(num, den, f2);
plot(k,yzs2,'*')
title('Zero-State Response due to f[k]=(- 1)^k u[k]');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

%% Part 2
k=1:1:10;
num=[1 -3 5 7 0];
den=[2 0 5 -3 1 -2 3 -1];

[z,p,K]=tf2zp(num, den)

[C,P,K]=residue(num, den)
y1 = 2*abs(C(1)).*(abs(P(1)).^k).*cos(k.*angle(P(1))+angle(C(1)));
y2 = 2*abs(C(3)).*(abs(P(3)).^k).*cos(k.*angle(P(3))+angle(C(3)));
y3 = 2*abs(C(5)).*(abs(P(5)).^k).*cos(k.*angle(P(5))+angle(C(5)));
y4 = C(7).*(abs(P(7)).^k);

y = y1+y2+y3+y4;
figure
plot(k,y,'*')
title('System Impulse Response');
xlabel('Time');
ylabel('Amplitude');
grid on;


numstep=conv(num, [1 0])
denstep=conv(den, [1 -1])
[C,P,K]=residue(numstep, denstep)
y1 = 2*abs(C(1)).*(abs(P(1)).^k).*cos(k.*angle(P(1))+angle(C(1)));
y2 = C(3).*(abs(P(3)).^k);
y3 = 2*abs(C(4)).*(abs(P(4)).^k).*cos(k.*angle(P(4))+angle(C(4)));
y4 = 2*abs(C(6)).*(abs(P(6)).^k).*cos(k.*angle(P(6))+angle(C(6)));
y5 = C(8).*(abs(P(8)).^k);

y = y1+y2+y3+y4+y5;
figure
plot(k,y,'*')
title('System Step Response');
xlabel('Time');
ylabel('Amplitude');
grid on;

%% Part 3
k=1:1:10;
I=[1 -2 3 -1];
D=[2 0 5 -3 1 -2 3 -1];
figure
y=dimpulse(I,D,k);
plot(k,y,'*')
title('System Zero-Input Response');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;
