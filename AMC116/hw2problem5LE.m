clear
rng(116)
N = 100;
x = rand(1,N);
I_1 = sum(x.^3)/100

alpha = 4;
beta = 1;
X = betarnd(alpha,beta);
Y = betapdf(X,alpha,beta);
I_2 = X^3/Y

