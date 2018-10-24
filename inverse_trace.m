n = 1000;
k = 1000;
%real_covariance = rand(n, n);
%real_covariance = 0.5*(real_covariance + real_covariance');
%real_covariance = real_covariance + n*eye(n);
real_covariance = eye(n);
for i=1:n-1
    real_covariance(i+ 1,i) = 0.05;
    real_covariance(i,i + 1) = 0.05;
end
real_mean = zeros([1, n]);
rng default;
samples = mvnrnd(real_mean,real_covariance,k);

real_inverse = inv(real_covariance);
real_inverse_trace = trace(real_inverse)

[sampled_inverse_trace, sampled_inverse] = inverse_trace_independent(samples);
sampled_inverse_trace

sampled_covariance_inverse_trace = trace(inv(cov(samples)))

function [inverse_trace, inverse] = inverse_trace_independent(sample_data)
[k,n] = size(sample_data);
sample_mean = mean(sample_data);
sample_variance = var(sample_data);
current_guess = eye(n);
for i=1:n
    current_guess(i,i)=1.0/sample_variance(i);
end
initial_guess = current_guess;
for i=1:2
    sample_point = sample_data(i, :) - sample_mean;
    current_guess = current_guess - (current_guess * (sample_point.' * sample_point) * current_guess)/(1.0 + (sample_point * (current_guess * sample_point.')));
end
for i=3:k
    sample_point = sample_data(i, :) - sample_mean;
    current_guess = current_guess * (i - 1)/(i  - 2);
    current_guess = current_guess - (current_guess * (sample_point.' * sample_point) * current_guess)/((i - 1) + (sample_point * (current_guess * sample_point.')));
end
inverse = current_guess;
inverse_trace = trace(inverse);
end