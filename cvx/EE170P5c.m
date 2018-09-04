n = 100;

x = zeros(1,n);
for i = 1:1:n
    x(i) = 1/i;
end

e = zeros(n,n);
e(1,1) = 1;

cvx_begin
    variable h(n,1);
    variable M(n,n) symmetric;
    maximize(x*h);
    subject to
        [[1,h'];[h,e - M]] == semidefinite(n+1);  
        for k = 0:n-1
            sum(diag(M,k)) == 0;
        end
cvx_end

x*h