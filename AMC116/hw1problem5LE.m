clear
rng(116)
lambda = 5;
N = 10^4;
U = rand(1,N);
X = -1/lambda*log(U);
histogram(X,'Normalization','pdf')

figure
x = 0:0.01:2.5;
pdf = exppdf(x,0.2);
plot(x,pdf)
title('Probability Density Function of Exponential Distribution \lambda = 5')
