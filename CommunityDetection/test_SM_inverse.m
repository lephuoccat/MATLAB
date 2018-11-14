clear
clc

n = 5;
rng default;
real_covariance = rand(n, n);
real_covariance = 0.5*(real_covariance + real_covariance');
real_covariance = real_covariance + n*eye(n);

real_covariance;
test = real_covariance(:,n);
known_matrix = real_covariance(1:(n-1), 1:(n-1));
known_inverse = inv(known_matrix);
altering = known_inverse .* test(1:(n-1));

known_inverse
test
inverse_mat(known_inverse, test)
inv(real_covariance)
