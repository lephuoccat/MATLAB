clc,clear, close all
n = 1:512;
test = 0


r1 = 2*rand(1,1)-1;
r2 = rand(1,1);
r3 = 2*rand(1,1)-1;
r4 = 2*rand(1,1)-1;
r5 = 2*rand(1,1)-1;

for i = 1:1:119
    s9a(i) = 0.1*r1*(i+1)+7;
end
for i = 120:1:170
    s9a(i) = -.1*r2*(i-120)+s9a(119);
end
for i = 171:1:250
    s9a(i) = .1*r3*(i-171)+s9a(170);
end
for i = 251:1:400
    s9a(i) = .1*r4*(i-251)+s9a(250);
end
for i = 401:1:512
    s9a(i) = -.01*r5*(i-401)+s9a(400);
end

pop = round(100 + 300*rand(5,1))

s9(pop(1)) = s9a(pop(1)) + 5*rand(1,1);
s9(pop(2)) = s9a(pop(2)) + 5*rand(1,1);
s9(pop(3)) = s9a(pop(3)) + 5*rand(1,1);
s9(pop(4)) = s9a(pop(4)) + 5*rand(1,1);
s9(pop(4)) = s9a(pop(4)) + 5*rand(1,1);


s9 = s9a + .4*randn(1,512);

figure
plot(n,s9,'b-',n,s9a,'r-')
%axis([0 550 -1.5 1.5])
title('Signal with Pops and Static')
legend('Signal','origin')
test = test + 1;


% fs = 512;
% Y = fft(s9,1024);
% Pyy = Y.*conj(Y)/1024;
% f = fs/1024*(0:1023);
% plot(f,Pyy(1:1024))
% figure
% title('Power spectral density')
% xlabel('Frequency (Hz)')
