%%
t=linspace(-10,10,1000);
u=[];
for i=1:1000
    if t(i)>=0
        u(i)=1;
    else
        u(i)=0;
    end
end

plot(t,u,'LineWidth',6)
grid on
axis([-5 5 0 2])

%%
t=linspace(-10,10,1000);
p=[];
for i=1:1000
    if t(i)>=-1 && t(i)<=1
        p(i)=1;
    else
        p(i)=0;
    end
end

plot(t,p,'LineWidth',6)
grid on
axis([-5 5 0 2])

%%
t=linspace(-10,10,1000)
d=[];
for i=1:1000
    if t(i)>=-1 && t(i)<=0
        d(i)=1+2*t(i)/2;
    elseif t(i)>=0 && t(i)<=1 
        d(i)=1-2*t(i)/2;
    else
        d(i)=0;
    end
end

plot(t,d,'LineWidth',6)
grid on
axis([-5 5 0 2])