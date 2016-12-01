clear
% Covariance Matrix
C = [1/12,1/12,1/12 ; 1/12 29/12 1/12 ; 1/12 1/12 13/12];

[Q,Lambda] = eig(C)
lambda = diag(Lambda);

X = rand(1,10)+1;
Y = exprnd(1./X);
Z = normrnd(X,1);
W = [X;Y;Z];
C = [1/12,1/12,1/12 ; 1/12 29/12 1/12 ; 1/12 1/12 13/12];
[Q,Lambda] = eig(C)
lambda = diag(Lambda);
Y = Q*W

W_actual = Q'*Y
W