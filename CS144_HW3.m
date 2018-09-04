%% Normal Distribution
clear
normalRV = normrnd(1,1,[1,10000]);

%(a)
S1_normal = zeros(1,20);
for i = 1:20
    S1_normal(i) = sum(normalRV(1:i));
end
figure
plot(1:20,S1_normal)
title('Normal Distribution S_n, n = [1,20]')
xlabel('n')
ylabel('S_n')

S2_normal = zeros(1,10000);
for j = 1:10000
    S2_normal(j) = sum(normalRV(1:j));
end
figure
plot(1:10000,S2_normal)
title('Normal Distribution S_n, n = [1,10000]')
xlabel('n')
ylabel('S_n')

% (b)
L_normal = zeros(1,10000);
for l = 1:10000
    L_normal(l) = (sum(normalRV(1:l)) - l*1) ./ sqrt(l);
end
figure
plot(1:10000,L_normal)
title('Normal Distribution ( S_n - nE[X] ) / n^-^2')
xlabel('n')
ylabel('( S_n - nE[X] ) / n^-^2')

% (d)
figure
histfit(normalRV)

%% Weibull Distribution
clear
alpha1 = 0.3;
[M,V] = wblstat(1,alpha1);
beta1 = 1/M;
weibullRV = wblrnd(beta1,alpha1,[1,10000]);

S1_weibull = zeros(1,20);
for i = 1:20
    S1_weibull(i) = sum(weibullRV(1:i));
end
figure
plot(1:20,S1_weibull)
title('Weibull Distribution S_n, n = [1,20]')
xlabel('n')
ylabel('S_n')

S2_weibull = zeros(1,10000);
for j = 1:10000
    S2_weibull(j) = sum(weibullRV(1:j));
end
figure
plot(1:10000,S2_weibull)
title('Weibull Distribution S_n, n = [1,10000]')
xlabel('n')
ylabel('S_n')

% (b)
L_weibull = zeros(1,10000);
for l = 1:10000
    L_weibull(l) = (sum(weibullRV(1:l)) - l*1) ./ sqrt(l);
end
figure
plot(1:10000,L_weibull)
title('Weibull Distribution ( S_n - nE[X] ) / n^-^2')
xlabel('n')
ylabel('( S_n - nE[X] ) / n^-^2')

% (c)
sorted_weibull = sort(weibullRV,'descend');
f_weibull = zeros(1,20);
total_weibull = S2_weibull(10000);
for n = 1:20
    f_weibull(n) = 100 * sum(sorted_weibull(1:n*100)) / total_weibull;
end
plot(1:20,f_weibull,'-o')
title('Weibull Distribution Fraction of Income by Wealthiest r%')
xlabel('r')
ylabel('f(r)')

% (d)
figure
histfit(weibullRV,1000,'weibull')

%% Pareto Distribution
clear
alpha2 = 1.5;
k1 = 1/(alpha2/(alpha2-1));
paretoRV1 = gprnd(1/alpha2,k1,0,[1,10000]);

S1_pareto1 = zeros(1,20);
for i = 1:20
    S1_pareto1(i) = sum(paretoRV1(1:i));
end
figure
plot(1:20,S1_pareto1)
title('Weibull Distribution S_n, n = [1,20]')
xlabel('n')
ylabel('S_n')

S2_pareto1 = zeros(1,10000);
for j = 1:10000
    S2_pareto1(j) = sum(paretoRV1(1:j));
end
figure
plot(1:10000,S2_pareto1)
title('Weibull Distribution S_n, n = [1,10000]')
xlabel('n')
ylabel('S_n')

% (b)
L_pareto = zeros(1,10000);
for l = 1:10000
    L_pareto(l) = (sum(paretoRV1(1:l)) - l*1) ./ sqrt(l);
end
figure
plot(1:10000,L_pareto)
title('Pareto Distribution ( S_n - nE[X] ) / n^-^2')
xlabel('n')
ylabel('( S_n - nE[X] ) / n^-^2')

% (c)
sorted_pareto1 = sort(paretoRV1,'descend');
f_pareto1 = zeros(1,20);
total_pareto1 = S2_pareto1(10000);
for n = 1:20
    f_pareto1(n) = 100 * sum(sorted_pareto1(1:n*100)) / total_pareto1;
end
plot(1:20,f_pareto1,'-o')
title('Pareto Distribution Fraction of Income by Wealthiest r%')
xlabel('r')
ylabel('f(r)')

% (d)
figure
histfit(paretoRV1,1000,'gp')

%% Pareto Distribution with scale parameter
clear
alpha3 = 0.5;
xL = 1/3;
paretoRV2 = gprnd(1/alpha3,xL,0,[1,10000]);

S1_pareto2 = zeros(1,20);
for i = 1:20
    S1_pareto2(i) = sum(paretoRV2(1:i));
end
figure
plot(1:20,S1_pareto2)
title('Pareto Distribution with Scale Parameter S_n, n = [1,20]')
xlabel('n')
ylabel('S_n')

S2_pareto2 = zeros(1,10000);
for j = 1:10000
    S2_pareto2(j) = sum(paretoRV2(1:j));
end
figure
plot(1:10000,S2_pareto2)
title('Pareto Distribution with Scale Parameter S_n, n = [1,10000]')
xlabel('n')
ylabel('S_n')

% (c)
sorted_pareto2 = sort(paretoRV2,'descend');
f_pareto2 = zeros(1,20);
total_pareto2 = S2_pareto2(10000);
for n = 1:20
    f_pareto2(n) = 100 * sum(sorted_pareto2(1:n*100)) / total_pareto2;
end
plot(1:20,f_pareto2,'-o')
title('Pareto Distribution with Scale Parameter Fraction of Income by Wealthiest r%')
xlabel('r')
ylabel('f(r)')

% (d)
figure
histfit(paretoRV2,30,'gp')
