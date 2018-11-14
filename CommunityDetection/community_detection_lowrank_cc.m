clc
clear
rng default
% Import the folowing files:
% -----------------------
% positive_definite_mat.m
% clustering.m
% inverse_mat.m
% swap_mat.m
% -----------------------

% Input data
n = 5000;
num_cluster = 5;
const = n/num_cluster;
Index = const*ones(1,num_cluster-1);
index_vector = 1:n;
index_vector = diag(index_vector);

for i = 2:(num_cluster-1)
    Index(i) = Index(i-1)+const;
end
% Create the random covariance matrix with 5 clusters
A = positive_definite_mat(n,Index);
% Add random noise to some index
A(1,20) = 0.01;
A(20,1) = 0.01;
A(2,17) = 0.01;
A(17,2) = 0.01;
origin_A = A;
% Randomly swap rows and columns
swapper = zeros(size(A));
ending_indicies = 1:n;
for i=1:3000
    r = randi([1,n],1,2);
    temp = ending_indicies(r(1));
    ending_indicies(r(1)) = ending_indicies(r(2));
    ending_indicies(r(2)) = temp;
end
for i=1:n
    swapper(ending_indicies(i), i) = 1;
end
A = swapper' * A * swapper;
index_vector = swapper' * index_vector * swapper;
mix_A = A;

low_rank_vectors =  low_rank_approx_dense(A, 50, 15, 0.01);
[num_rows, num_columns] = size(low_rank_vectors);
for i=1:num_columns
    low_rank_vectors(:,i) = low_rank_vectors(:,i)/sum(low_rank_vectors(:,i));
end

svd_cov = low_rank_vectors' * A * low_rank_vectors;
svd_cov_clust = svd_cov;
svd_indicies = 1:length(svd_cov);
svd_indicies = diag(svd_indicies);
%%
% Community Detection Algorithm
count = 0;              % iteration count
flag = 1;               % flag for the while loop
clusters = {};
while flag == 1
    [m,n] = size(svd_cov_clust);
    % A_old: previous A with 1 community being clustered
    % A: the clustered community is taken out of A_old
    % flag: stop he while loop when size o clustering matrix is 1
    
    [svd_cov_old, svd_cov_clust, cluster_indicies, svd_indicies, flag] = clustering(svd_cov_clust, n, svd_indicies);
    if flag == 1
        clusters =  [clusters, sum(cluster_indicies)];
    end
    count = count + 1;
    svd_cov_old;
end
clusters{:};
low_rank_vectors;
cluster_covariance(svd_cov, clusters)

individual_clusters = cluster_assignment(A, low_rank_vectors, clusters);
individual_clusters{:};
cluster_covariance(A, individual_clusters)
fprintf("Number of cluster: %d\n", count-1);

