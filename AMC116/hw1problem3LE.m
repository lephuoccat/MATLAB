clear
rng(2016);
r = binornd(10^2,0.3,[1,10^3]);
average = sum(r)/10^3
 
n = (1:1:10^3);
A = 0.*n + average;
plot(n,A,'blue','LineWidth',2)
hold on
scatter(n,r,'red','.')
title('Realization of X and E[X]')
xlabel('r realization')
legend('E[X]','Realization of X')

figure
plot(n,A,'blue','LineWidth',2)
hold on
plot(n,r,'red')
title('Realization of X and E[X]')
xlabel('r realization')
legend('E[X]','Realization of X')
