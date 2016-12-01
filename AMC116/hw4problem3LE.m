clear
rng(116)
n = 10;
e = 0.03;
X = normrnd(0,1,2,n);
G = [1 2 ; 3 4];
W = normrnd(0,e.^2,2,n);
Y = G*X+W;
C_x = cov(X');
X_estimated = C_x*G'*(G*C_x*G'+[e^2 0 ; 0 e^2])^(-1)*Y
X
for i = 1:20
    stem(i,X(i),'r*')
    hold on
    stem(i,X_estimated(i),'bo')
    hold on
end
grid on
legend('X estimated','X')
xlabel('n')
ylabel('X')