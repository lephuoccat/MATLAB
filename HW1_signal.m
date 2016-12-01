%% Problem 1
n = 100;
nArray = 1:n;
prevPnot = 1;
for N = 1:n
    Pnot     = prevPnot*(365-N+1)/365;
    P(N)    = 1-Pnot; 
    prevPnot = Pnot;
end
plot(nArray, P, '.-')
title('Probability that at least two people share a birthday')
xlabel('Number of people, n')
ylabel('P(at least 2 people share a birthday)')
grid on

%% Problem 3
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

%% Problem 4
clear
rng(123)
N = 10^4;
S = unidrnd(6,[1,N]);

AB = 0;
A = 0;
B = 0;
for i = 1:N
    if S(i)==2 || S(i)==4
        AB = AB+1;
    end
    if S(i)==2 || S(i)==4 || S(i)==6
        A = A+1;
    end
    if S(i)<5
        B = B+1;
    end
end

PA = A/N
PB = B/N
PAB = AB/N

%% Problem 5
clear
rng(116)
lamda = 5;
N = 10^4;
U = rand(1,N);
X = -1/lamda*log(U);
histogram(X,'Normalization','pdf')
