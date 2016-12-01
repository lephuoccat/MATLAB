clear
rng(116)
M = 10^5;
lambda = 5;
p = 0.1;
n = 10;

failure = 1+geornd(p,[M,1]);
m = length(failure);
l = 0;
for i = 1:m
    if isequal(failure(i),10) == 1
        l = l+1;
    end
end
T = 0;
for i = 1:l
    A = exprnd(1/lambda,[n,1]);
    T(i) = sum(A);
end

T_average = mean(T)