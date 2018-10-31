function new_inverse = inverse_mat(known_inverse, covariance_vector)
altering_vector = known_inverse * covariance_vector(1:(length(covariance_vector)-1));
new_variance = covariance_vector(length(covariance_vector));
F_inv = (1/new_variance)* altering_vector.*altering_vector.' /(1 - (1/new_variance)*covariance_vector(1:(length(covariance_vector) - 1)).' * altering_vector);
F_inv = F_inv + known_inverse;
new_column = - (1/new_variance)* F_inv * covariance_vector(1:(length(covariance_vector) - 1));
new_inverse = zeros(length(covariance_vector));
new_inverse(1:(length(covariance_vector) - 1), 1:(length(covariance_vector) - 1)) = F_inv;
new_inverse(length(covariance_vector), 1:(length(covariance_vector) - 1)) = new_column;
new_inverse(1:(length(covariance_vector) - 1), length(covariance_vector)) = new_column.';
new_inverse(length(covariance_vector), length(covariance_vector)) = (1/new_variance) - (1/new_variance) * covariance_vector(1:(length(covariance_vector) - 1)).' * new_column;
end