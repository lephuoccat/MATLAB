
clc,clear, close all
%% Price)
n = 1:512;
test = 0;
start_time = 225;
end_time = 425;
set = 150;
partition = round((end_time-start_time)*rand(set,1)+1)+start_time;
time = sort(partition);

r1 = 2*rand(1,1)-1;
r2 = -rand(1,1);
r3 = 2*rand(1,1)-1;
r4 = 2*rand(1,1)-1;
r5 = 2*rand(1,1)-1;

nr1 = -r1;
nr2 = -r2;
nr3 = -r3;
nr4 = -r4;
nr5 = -r5;

for i = 1:1:119
    v9a(i) = 0.05*r1*(i+1)+7;
end
for i = 120:1:170
    v9a(i) = -.05*r2*(i-120)+v9a(119);
end
for i = 171:1:250
    v9a(i) = .05*r3*(i-171)+v9a(170);
end
for i = 251:1:400
    v9a(i) = .05*r4*(i-251)+v9a(250);
end
for i = 401:1:512
    v9a(i) = -.05*r5*(i-401)+v9a(400);
end

[v9a,time] = DSP_Price(v9a,set,.000025,partition);
v9 = v9a + .1*randn(1,512);

figure
plot(n,v9,'b-',n,v9a,'g-')

test = test + 1;
hold on;

hn = (1/13).*ones(10,1);
out = filter(hn,0.75,v9);

plot(out, 'r','LineWidth', 1.5)
title('Price with Pops and Static')
xlabel('Time')
ylabel('Price')
legend('noise','Signal','filtered')
hold off;

detrend_pdata = detrend(out);
trend = out - detrend_pdata;
meanp = mean(detrend_pdata);

time;

figure
hold on
t = 1:512;
plot(t,v9,':r')
plot(t,trend,'b--');
plot(t,detrend_pdata,'m')
plot(t,meanp*ones(size(t)),':k')
title('Detrended Fluctuation Analysis of Price')
legend('Original Data','Trend','Detrended Data',...
       'Mean of Detrended Data')
xlabel('Unit of Time');
ylabel('Stock Price (dollars)');
hold off

Price = detrend_pdata;

%% Supply)

supply1 = 20;


for i = 1:1:119
    v9a(i) = supply1*nr1*(i+1)+100;
end
for i = 120:1:170
    v9a(i) = supply1*nr2*(i-120)+v9a(119);
end
for i = 171:1:250
    v9a(i) = supply1*nr3*(i-171)+v9a(170);
end
for i = 251:1:400
    v9a(i) = supply1*nr4*(i-251)+v9a(250);
end
for i = 401:1:512
    v9a(i) = -supply1*nr5*(i-401)+v9a(400);
end

[v9,time] = DSP_Volume(v9a,40,set,partition);

v9 = v9a + 10*randn(1,512);
vn = (1/13).*ones(10,1);
vout = filter(vn,0.75,v9);

detrend_vdata = detrend(vout);
vtrend = vout - detrend_vdata;
meanv = mean(detrend_vdata);

figure
plot(1:512,v9,'g-')
title('Supply with Pops and Static')
hold on
plot(vout,'r-')
plot(v9a,'b-')
xlabel('Time')
ylabel('Supply')
legend('noise','Signal','filtered')
hold off

figure
hold on
t = 1:512;
plot(t,v9,':r')
plot(t,vtrend,'b--');
plot(t,detrend_vdata,'m')
plot(t,meanp*ones(size(t)),':k')
title('Detrended Fluctuation Analysis of Price and Supply')
legend('Original Data','Trend','Detrended Data',...
       'Mean of Detrended Data')
xlabel('Unit of Time');
ylabel('Stock Price (dollars)');

figure
maxp = max(Price);
maxv = max(detrend_vdata);
plot(t,detrend_vdata/maxv,'b-',t,Price/maxp,'r-')
title('Detrended Fluctuation Analysis')
xlabel('Time')
ylabel('Detrended Data')
legend('Nomralized Supply','Normalized Price')
difference = abs(detrend_vdata/maxv - Price/maxp);

[v,i1] = min(difference);
difference(i1) = 10000;
[v,i2] = min(difference);
A1 = min(i1,i2);
A2 = max(i1,i2);



count = 0;
index = 1;

while(index < set)
    if(A1 < time(index) & time(index) < A2)
        count = count + 1;
    else
        
    end
    index = index + 1;
end
count

