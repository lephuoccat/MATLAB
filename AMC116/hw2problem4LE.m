clear
rng(116)
lambda = 1;
n = 100;
m = 120;
x = poissrnd(lambda,[1,10^4]);
S = 0;
p = 0;
for i = 1:100
    S(i) = sum(x((1+n*(i-1)):(n+n*(i-1))));
    if S(i)>=m
        p = p+1;
    end
end
Pr = p/100