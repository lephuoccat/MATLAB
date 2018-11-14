function A = positive_definite_mat(n,cluster_index)
% Generate a dense n x n symmetric, positive definite matrix
A = rand(n,n); % generate a random n x n matrix

% construct a symmetric matrix using either
A = 0.5*(A+A');

% since A(i,j) < 1 by construction and a symmetric diagonally dominant matrix
%   is symmetric positive definite, which can be ensured by adding nI
A = A + randi([3,10],1,n).*eye(n);

% clustering matrix: 5 clusters
m = cluster_index;
M = max(size(cluster_index));
for i = 1:(M-1)
    A(1:m(i), (m(i)+1):m(i+1)) = 0;
    A((m(i)+1):m(i+1), 1:m(i)) = 0;
end
A(1:m(M), (m(M)+1):n) = 0;
A((m(M)+1):n, 1:m(M)) = 0;

end
