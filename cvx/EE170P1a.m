% problem1-a

n = 100;
k = 20;    %Sparsity of matrix

x = normrnd(0,1,[100,1]);

Mmin = zeros(20,1);
Mmax = zeros(20,1);

count = zeros(1,10);
i = 1;

 
for m = [30,31,32,33]
    
        A = normrnd(0,1,[m,100]);
        
        
        for iter=1:1:50
            x0 = x;
            l = randperm(n,n-k);
            x0(l) = 0;
            y = A*x0;
            
            cvx_begin
                variable u(n);
                minimize(norm(u,1));
                subject to 
                    A*u == y;
            cvx_end
            if norm(x0-u)/(norm(x0)*norm(u)) < 0.1
                count(i) = count(i) + 1;
            end
        end
        count
        m
        i = i+1;
end