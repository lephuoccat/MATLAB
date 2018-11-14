function vectors = low_rank_approx_dense(A, p, k, eps)
[S,c] = sample_rows_dense(A, p);
[W, c] = sample_columns_dense(S, p);

[vectors, vector_count] = filter_svd(W, S, k, eps, c);
vectors=vectors(:,1:vector_count);
end
