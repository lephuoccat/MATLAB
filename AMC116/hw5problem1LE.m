clear
rng(116)
N = 10^4;
mean = 30;
n = 10;
T = exprnd(mean,[n,N]);

W = 0;
T2 = 0;
S = 0;

for i=1:n
    for j=1:N
        if T(i,j)<=30
            T2(i,j)=30;
        else
            T2(i,j)=T(i,j);
        end
        A = 0;
        for k = 1:i
            A = A+T2(k,j);
        end
        S(i,j) = A;
    end
end

for i=2:n
    for j=1:N
        W(i,j) = S(i-1,j)-30*(i-1);
    end
end

for i=1:n
    meanW(i) = sum(W(i,:))/N;
end

meanW
stem(1:n,meanW)
hold on
stem(2,30*exp(-1),'r*')
legend('Estimated W[n]','Calculated W[2]')
xlabel('n')
ylabel('W[n]')
title('Waiting time, mean=30, n=10')