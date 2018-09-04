% create matrix ee'
ee = zeros(100,100);
ee(1,1) = 1;

% create matrix X
x = zeros(1,100);
for i = 1:1:100
    x(i) = 1/i;
end

cvx_begin
    variable M(100,100) symmetric;      % symmetric matrix M
    variable lambda(100,1);             % matrix lambda
    maximize(x*lambda);
    subject to
        [[1,lambda'];[lambda,ee - M]] == semidefinite(101);  
        for k = 0:1:100
            sum(diag(M,k)) == 0;
        end
cvx_end

X_atomic = x*lambda;
sprintf('The atomic norm of x: ||x|| = %f',X_atomic)
