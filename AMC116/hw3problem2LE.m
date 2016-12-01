clear
alpha = 2;
beta = 6;
gamma = 2;

rng(116)
n = 10^4;
X = betarnd(alpha,beta,[1,n]);
fY = X.^gamma;
fX_Y = (X.^gamma.*X)/sum(fY);
E = sum(fX_Y)