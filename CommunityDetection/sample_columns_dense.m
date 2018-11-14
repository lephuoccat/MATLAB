function [W, c] = sample_columns_dense(S, p)
[rows, columns ] = size(S);
c = 1/(rows*columns);
W = zeros(p, p);
chosen_columns = randi([1, columns], [1, p]);
for i=1:p
    W(:, i) = S(:, chosen_columns(i)) / sqrt(p / columns); 
end
end