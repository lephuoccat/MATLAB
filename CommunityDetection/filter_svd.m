function [vectors, vector_count] = filter_svd(W,S, k, eps, c)
[num_rows, num_columns] = size(S);

[U, D, V] = svd(W);
columns = U(:, 1:k);
vector_count = 0;
vectors = zeros(num_columns, k);
Wnorm = norm(W, 'fro')^2;
gamma = c * eps / (8 * k);
for i=1:k
    column = W' * columns(:, i);
    column_norm = column' * column;
    if column_norm > gamma * Wnorm
        vector_count = vector_count + 1;
        vectors(:, vector_count) = S' * columns(:, i) / sqrt(column_norm);
    end
end
end