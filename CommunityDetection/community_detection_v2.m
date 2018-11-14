clc
clear
% Import the folowing files:
% -----------------------
% positive_definite_mat.m
% clustering.m
% inverse_mat.m
% swap_mat.m
% -----------------------

% Input data
n = 100;
num_cluster = 5;
const = n/num_cluster;
Index = const*ones(1,num_cluster-1);
for i = 2:(num_cluster-1)
    Index(i) = Index(i-1)+const;
end
% Create the random covariance matrix with 5 clusters
A = positive_definite_mat(n,Index); 
% Add random noise to some index
A(1,16) = 0.01;
A(16,1) = 0.01;
origin_A = A;
lmax = max(eig(origin_A)); 
A = (lmax+1)*eye(n) - origin_A;
% Randomly swap rows and columns
for i=1:1000
    r = randi([1,n],1,2);
    A = swap_mat(A, r(1), r(2));
end
mix_A = A;

%
% Community Detection Algorithm
count = 0;              % iteration count
flag = 1;               % flag for the while loop
correct_flag = 0;
while flag == 1
    [m,n] = size(A);
    % A_old: previous A with 1 community being clustered
    % A: the clustered community is taken out of A_old
    % flag: stop he while loop when size o clustering matrix is 1
    [A_old, A, flag, flag2] = clustering(A, n, const);
    count = count + 1;
    correct_flag = correct_flag + flag2;
    A_old;
end
fprintf("Number of cluster: %d\n", count-1);
if (count-1 == num_cluster && correct_flag == num_cluster)
    fprintf("\nCorrect number of clusters & elements\n");
else
    fprintf("\nIncorrect number of clusters/elements\n");
end
