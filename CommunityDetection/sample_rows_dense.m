function [S, c] = sample_rows_dense(A, p)
[rows, columns ] = size(A);
c = 1/(rows*columns);
S = zeros(p, columns);
chosen_rows = randi([1, rows], [1, p]);
for i=1:p
    S(i, :) = A(chosen_rows(i),:) / sqrt(p / rows); 
end
end
