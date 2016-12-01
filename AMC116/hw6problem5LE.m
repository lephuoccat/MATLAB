clear
rng(116)
N = 10^3;
T = 10;
m = 4;
dt = 0.01;
n = T/dt;
P = 0;
Mat_A = tril(ones(n+1,n));
for i = 1:N
    Z = normrnd(0,1,[n,1]);
    B = sqrt(dt).*Mat_A*Z;
    if max(B) >= m
        P(i) = 1;
    end
end
P_estimated = mean(P)

% Theoretical Formula
P_theory = 2*(1-normcdf(m./sqrt(T),0,1))
