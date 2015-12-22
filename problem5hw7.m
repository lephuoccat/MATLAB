%% Michael Feinstein Matlab HW 7 Problem 5
%Linear Predictive Coding of voiced vowel and unvoiced speech using the
%three methods

%% Autocorrelation Method with hamming 
clear
clc 
close all
N = 300;
p= 12;
w = window(@hamming,N);
[x1,fs] = loadwav('test_16k.wav');
x1_voiced = x1(3000:3299);
x1in = x1_voiced/(max(x1_voiced));
x1_lpc = x1in.*w;
[A,G,a,r]=autolpc(x1_lpc,p);
subplot(4,1,1)
plot(x1in)
title('test 16k.wav')
subplot(4,1,2)
stem(A)
title('test 16k.wav LPC Coefficients')
[x2,fs] = loadwav('ah.wav');
x2_voiced = x2(3000:3299);
x2in = x2_voiced/(max(x2_voiced)); 
x2_lpc = x2in.*w;
[A,G,a,r]=autolpc(x2_lpc,p);
subplot(4,1,3)
plot(x2in)
title('ah.wav')
subplot(4,1,4)
stem(A)
title('ah.wav LPC Coefficients')
    
%% Covariance Method




%% Lattice Filter Method
close all

[x1,fs] = loadwav('test_16k.wav');
[x2,fs] = loadwav('ah.wav');
[EL1,alphal,GL1,k1]=lattice(x1,N,p);
[EL2,alpha2,GL2,k2]=lattice(x2,N,p);
subplot(2,1,1)
stem(k1)
title('test 16k.wav LPC Coefficients')
subplot(2,1,2)
stem(k2)
title('ah.wav LPC Coefficients')
