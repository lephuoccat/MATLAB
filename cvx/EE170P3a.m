n = 20;
r = 3;

%G = normrnd(0,1,[n,n]);
G = rand(n,n);
for i=1:1:20
    for j=1:1:20
        if G(i,j) < 0.5
            G(i,j) = -1;
        else
            G(i,j) = 1;
        end
    end
end

idx = zeros(400,2);
for i = 1:20
    for j = 1:20
        idx((i-1)*20+j,:) = [i,j];
    end
end

[U,S,V] = svd(G);
count = zeros(10,1);
X = U(:,1:r)*S(1:r,1:r)*V(:,1:r)';

count = zeros(10,1);
itr = 1;
for k = [141,142];
    for m = 1:1:30
        l = randperm(400,k);
        var = idx(l,:);
        cvx_begin
            variable u(n,n);
            minimize(norm_nuc(u));
            subject to 
                for i=1:1:k
                    u(var(i,1),var(i,2)) == X(var(i,1),var(i,2));
                end
        cvx_end
        norm(u-X)^2/(norm(u)*norm(X))
        if norm(u-X)^2/(norm(u)*norm(X)) < 0.1
            count(itr) = count(itr) + 1;
        end
    end
    itr = itr+1;
end
count