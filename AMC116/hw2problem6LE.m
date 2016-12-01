%% n = 10
clear
rng(116)
n = 10;
N = 10^3;
r = (rand(1,N*n)<0.5)*2 - 1;               % Rademacher distribution
Y = 0;
for i = 1:N
    Xn(i) = 1/n*sum(r((1+n*(i-1)):(n+n*(i-1))));
    Y(i) = sqrt(n)*Xn(i);
end
[f,x1] = ecdf(Y)
plot(x1,f,'blue')
hold on
fplot(@(x) normcdf(x),[-4,4],'red')
legend('F_Y(x)','\phi(x)')
title('Empirical CDF F_Y(x) and Standard Normal CDF \phi(x), n=10')
xlabel('x')

%% n = 10^2
clear
rng(116)
n = 10^2;
N = 10^3;
r = (rand(1,N*n)<0.5)*2 - 1;               % Rademacher distribution
Y = 0;
for i = 1:N
    Xn(i) = 1/n*sum(r((1+n*(i-1)):(n+n*(i-1))));
    Y(i) = sqrt(n)*Xn(i);
end
[f,x1] = ecdf(Y)
plot(x1,f,'blue')
hold on
fplot(@(x) normcdf(x),[-4,4],'red')
title('Empirical CDF F_Y(x) and Standard Normal CDF \phi(x), n=10^2')
xlabel('x')

%% n = 10^3
clear
rng(116)
n = 10^3;
N = 10^3;
r = (rand(1,N*n)<0.5)*2 - 1;               % Rademacher distribution
Y = 0;
for i = 1:N
    Xn(i) = 1/n*sum(r((1+n*(i-1)):(n+n*(i-1))));
    Y(i) = sqrt(n)*Xn(i);
end
[f,x1] = ecdf(Y)
plot(x1,f,'blue')
hold on
fplot(@(x) normcdf(x),[-4,4],'red')
legend('F_Y(x)','\phi(x)')
title('Empirical CDF F_Y(x) and Standard Normal CDF \phi(x), n=10^3')
xlabel('x')

%% n = 10^4
clear
rng(116)
n = 10^4;
N = 10^3;
r = (rand(1,N*n)<0.5)*2 - 1;               % Rademacher distribution
Y = 0;
for i = 1:N
    Xn(i) = 1/n*sum(r((1+n*(i-1)):(n+n*(i-1))));
    Y(i) = sqrt(n)*Xn(i);
end
[f,x1] = ecdf(Y)
plot(x1,f,'blue')
hold on
fplot(@(x) normcdf(x),[-4,4],'red')
legend('F_Y(x)','\phi(x)')
title('Empirical CDF F_Y(x) and Standard Normal CDF \phi(x), n=10^4')
xlabel('x')
