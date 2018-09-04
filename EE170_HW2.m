n = 100;
x = normrnd(0,1,[100,1]);
Mmin = zeros(20,1);
Mmax = zeros(20,1);
count = 0;
i = 1;

for k=1:3:20a
    x0 = x;
    l = randperm(n,n-k);
    x0(l) = 0;
    
    minDone = 0;
    maxDone = 0;
    
    for m = k:5:4*k
        A = normrnd(0,1,[k,100]);
        y = A*x;
        count = 0;
        for iter=1:1:100
            cvx_begin
                variable u(n);
                minimize(norm(u,1));
                subject to 
                    A*u == y;
            cvx_end
            if norm(x0-u)/(norm(x0)*norm(u)) < 0.2
                count = count + 1;
            end
        end
        if (minDone == 0) && (count >= 5)
            Mmin(i) = m;
            minDone = 1;
        end
        if count >= 95
            Mmax(i) = m;
            maxDone = 1;
            break;
        end
    end
    if maxDone == 0
        Mmax(i) = 4*k;
    end
    i = i+1;
end