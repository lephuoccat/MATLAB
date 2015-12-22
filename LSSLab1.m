%% NAME: CAT PHUOC LE
%% PART 1
%% 1. Unit Step Signal
t=linspace(-10,10,1000);
u1=[];
for i=1:1000
    if t(i)<0
        u1(i)=0;
    else
        u1(i)=1;
    end
end
plot(t,u1,'LineWidth',6);
title('Unit Step Signal'); xlabel('Time'); ylabel('Amplitude'); legend('u(t)');
axis([-10 10 -0.5 1.5]); grid on;

%% 1.(continued) Shifted Step Signal
t=linspace(-10,10,1000);
u2=[];
for i=1:1000
    if t(i)<3
        u2(i)=0;
    else
        u2(i)=1;
    end
end
u3=[];
for i=1:1000
    if t(i)<5
        u3(i)=0;
    else
        u3(i)=1;
    end
end
subplot(2,1,1), plot(t,u2,'LineWidth',6);
title('Step Signal'); xlabel('Time'); ylabel('Amplitude'); legend('u(t-3)');
axis([-10 10 -0.5 1.5]); grid on;
subplot(2,1,2), plot(t,u3,'LineWidth',6);
title('Step Signal'); xlabel('Time'); ylabel('Amplitude'); legend('u(t-5)')
axis([-10 10 -0.5 1.5]); grid on;

%% 2. Unit Rectangular Pulse
t=linspace(-10,10,1000);
p1=[];
for i=1:1000
    if t(i)<=3 && t(i)>=-3
        p1(i)=1;
    else
        p1(i)=0;
    end
end
clf
plot(t,p1,'LineWidth',6);
title('Unit Rectangular Pulse'); xlabel('Time'); ylabel('Amplitude'); legend('p(t)');
axis([-10 10 -0.5 1.5]); grid on;

%% 2.(continued) Shifted Rectangular Pulse
t=linspace(-10,10,1000);
p2=[];
for i=1:1000
    if t(i)<=3+3 && t(i)>=-3+3
        p2(i)=1;
    else
        p2(i)=0;
    end
end
p3=[];
for i=1:1000
    if t(i)<=3-5 && t(i)>=-3-5
        p3(i)=1;
    else
        p3(i)=0;
    end
end
subplot(2,1,1), plot(t,p2,'LineWidth',6);
title('Rectangular Pulse'); xlabel('Time'); ylabel('Amplitude'); legend('p(t-3)');
axis([-10 10 -0.5 1.5]); grid on;
subplot(2,1,2), plot(t,p3,'LineWidth',6);
title('Rectangular Pulse'); xlabel('Time'); ylabel('Amplitude'); legend('p(t+5)');
axis([-10 10 -1 2]); grid on;
%% 3. Unit Ramp Signal
t=linspace(-10,10,1000);
r1=[];
for i=1:1000
    if t(i)<0
        r1(i)=0;
    else
        r1(i)=t(i);
    end
end
clf
plot(t,r1,'LineWidth',6);
title('Unit Ramp Signal'); xlabel('Time'); ylabel('Amplitude'); legend('r(t)');
axis([-10 10 -2 10]); grid on;

%% 3.(continued) Shifted Ramp Signal
t=linspace(-10,10,1000);
r2=[];
for i=1:1000
    if t(i)<3
        r2(i)=0;
    else
        r2(i)=t(i)-3;
    end
end
r3=[];
for i=1:1000
    if t(i)<-5
        r3(i)=0;
    else
        r3(i)=t(i)+5;
    end
end
subplot(2,1,1), plot(t,r2,'LineWidth',6);
title('Unit Ramp Signal'); xlabel('Time'); ylabel('Amplitude'); legend('r(t-3)');
axis([-10 10 -2 10]); grid on;
subplot(2,1,2), plot(t,r3,'LineWidth',6);
title('Unit Ramp Signal'); xlabel('Time'); ylabel('Amplitude'); legend('r(t+5)');
axis([-10 10 -2 10]); grid on;
%% 4. Unit Triangle Pulse
t=linspace(-10,10,1000);
d1=[];
for i=1:1000
    if t(i)>=-2 && t(i)<=0
        d1(i)=2+t(i);
    elseif t(i)>0 && t(i)<=2
        d1(i)=2-t(i);
    else
        d1(i)=0;
    end
end
clf
plot(t,d1,'LineWidth',6);
title('Unit Triangle Pulse'); xlabel('Time'); ylabel('Amplitude'); legend('d(t)');
axis([-10 10 -0.5 2.5]); grid on;
%% 4.(continued) Shifted Triangle Pulse
t=linspace(-10,10,1000);
d2=[];
for i=1:1000
    if t(i)>=-2+3 && t(i)<=0+3
        d2(i)=2+t(i)-3;
    elseif t(i)>0+3 && t(i)<=2+3
        d2(i)=2-t(i)+3;
    else
        d2(i)=0;
    end
end
d3=[];
for i=1:1000
    if t(i)>=-2-5 && t(i)<=0-5
        d3(i)=2+t(i)+5;
    elseif t(i)>0-5 && t(i)<=2-5
        d3(i)=2-t(i)-5;
    else
        d3(i)=0;
    end
end
subplot(2,1,1), plot(t,d2,'LineWidth',6);
title('Triangle Pulse'); xlabel('Time'); ylabel('Amplitude'); legend('d(t-3)');
axis([-10 10 -0.5 2.5]); grid on;
subplot(2,1,2), plot(t,d3,'LineWidth',6);
title('Triangle Pulse'); xlabel('Time'); ylabel('Amplitude'); legend('d(t+5)');
axis([-10 10 -0.5 2.5]); grid on;
%% PART 2
%% 5/ Impulse Delta Signal
t=linspace(-10,10,1000);
x=[];
for i=1:1000
    if t(i)<=0.3 && t(i)>=-0.3
        x(i)=1/0.3;
    else
        x(i)=0;
    end
end
y=[];
for i=1:1000
    if t(i)<=0.2 && t(i)>=-0.2
        y(i)=1/0.2;
    else
        y(i)=0;
    end
end
z=[];
for i=1:1000
    if t(i)<=0.1 && t(i)>=-0.1
        z(i)=1/0.1;
    else
        z(i)=0;
    end
end
clf
plot(t,x,'red',t,y,'green',t,z,'blue','LineWidth',3);
title('Impulse Delta Signal'); xlabel('Time'); ylabel('Amplitude');
legend('tau=0.3','tau=0.2','tau=0.1');
axis([-2 2 -1 10]); grid on;
%% 6/ sinc(t) Fuction
t1=-5:0.1:5; t2=-15:0.1:15; t3=-30:0.1:30;
y1=sin(pi*t1)./(pi*t1);
y2=sin(pi*t2)./(pi*t2);
y3=sin(pi*t3)./(pi*t3);
subplot(3,1,1), plot(t1,y1);
title('Graph of sinc(t), -5<t<5'); xlabel('Time'); ylabel('Amplitude');
subplot(3,1,2), plot(t2,y2);
title('Graph of sinc(t), -15<t<15'); xlabel('Time'); ylabel('Amplitude');
subplot(3,1,3), plot(t3,y3);
title('Graph of sinc(t), -30<t<30'); xlabel('Time'); ylabel('Amplitude');
%% PART 3
%% 7/ sin(t) Function
t=[0:0.1:6.28];
y1=sin(t);
y2=sin(2*t);
y3=sin(5*t);
clf
plot(t,y1,'o',t,y2,'--',t,y3);
title('sin(t) Function'); xlabel('Time'); ylabel('Amplitude');
legend('sin(t)','sin(2t)','sin(3t)'); grid on;
%% 8/ Scaled sin(t) Function
t=[0:0.1:6.28];
y1=sin(4*(t-1));
y2=sin(2*t-3);
plot(t,y1,'o',t,y2);
title('Scaled sin(t) Function'); xlabel('Time'); ylabel('Amplitude');
legend('sin(4(t-1))','sin(2t-3)'); grid on;
%% 9/ Exponential Funtion
t=[0:0.1:6.28];
y1=exp(-0.5*t).*sin(0.5*t);
y2=exp(-t).*sin(t);
y3=exp(-5*t).*sin(5*t);
plot(t,y1,'o',t,y2,'--',t,y3)
title('Graph of e^(^-^a^t^)sin(at)'); xlabel('Time'); ylabel('Amplitude');
legend('a=0.5','a=1','a=5'); grid on;
%% PART 4
%% 10/ Combination of Unit Step Signal & Unit Ramped Signal
t=linspace(-10,10,1000);
u=[];
for i=1:1000
    if t(i)<0
        u(i)=0;
    else
        u(i)=1;
    end
end
r=[];
for i=1:1000
    if t(i)<0
        r(i)=0;
    else
        r(i)=t(i);
    end
end
y=[];
for i=1:1000
    y(i)=u(i)+r(i);
end
plot(t,y,'LineWidth',6);
title('Graph of u(t)+r(t)'); xlabel('Time'); ylabel('Amplitude');
axis([-10 10 -1 10]);
grid on;
%% 11/ Combination of Rectangular Pulse & Triangle Pulse
t=linspace(-10,10,1000);
p2=[];
for i=1:1000
    if t(i)<=1 && t(i)>=-1
        p2(i)=1;
    else
        p2(i)=0;
    end
end
d3=[];
for i=1:1000
    if t(i)>=-1.5 && t(i)<=0
        d3(i)=1.5+t(i);
    elseif t(i)>0 && t(i)<=1.5
        d3(i)=1.5-t(i);
    else
        d3(i)=0;
    end
end
y=[];
for i=1:1000
    y(i)=p2(i)+d3(i);
end
plot(t,y,'LineWidth',6);
title('Graph of p2(t)+d3(t)'); xlabel('Time'); ylabel('Amplitude');
axis([-6 6 -1 6]);
grid on;
%% PART 5
%% 13/ Discrete-time Signal
t1=linspace(-10,10,40);
y=[];
for i=1:40
    if t1(i)<0
        y(i)=0;
    else
        y(i)=1;
    end
end
t2=linspace(-10,10,40);
z=[];
for i=1:40
    if t2(i)<-2
        z(i)=0;
    else
        z(i)=t2(i)+2;
    end
end
plot(t1,y,'o',t2,z,'o','LineWidth',3);
title('Discrete-time Signal'); xlabel('Time'); ylabel('Amplitude');
legend('u[k-1]','r[k+2]');
axis([-10 10 -0.5 5]);
grid on;