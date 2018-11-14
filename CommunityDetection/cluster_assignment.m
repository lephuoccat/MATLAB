function clusters = cluster_assignment(A, low_rank_vectors, svd_clusters)
    cluster_inv = {};
    cluster_cov = {};
    [rows, columns] = size(low_rank_vectors);
    vector_assignments = zeros([1, columns]);
    for i=1:length(svd_clusters)
        for j=1:length(svd_clusters{i})
            vector_assignments(1, svd_clusters{i}(j)) = i;
        end

    end
    for i=1:columns
        cluster_cov = [cluster_cov, A * low_rank_vectors(:, i)];
        cluster_inv = [cluster_inv, inv(low_rank_vectors(:, i)' *cluster_cov{i})];
    end
    assignments = ones([1, length(A)]);
    for i=1:length(A)
        member_vector = zeros([length(A), 1]);
        member_vector(i, 1) = 1;
        Y = 1/A(i,i);
        assignment = 1;
        max_trace = 0;
        for j=1:columns
            cov_with_cluster = (member_vector' * cluster_cov{j})';
            B = zeros([length(cov_with_cluster) + 1, 1]);
            B(1:length(cov_with_cluster), 1) = cov_with_cluster;
            B(length(cov_with_cluster) + 1, 1) = A(i,i);
            Z = inverse_mat(cluster_inv{j}, B);
            if j==1
                max_trace = trace(Z);
            else
                if (trace(Z) > max_trace) && trace(Z) > (trace(cluster_inv{j}) + Y)
                    assignment = j;
                    max_trace = trace(Z);
                end
            end
        end
        assignments(i) = vector_assignments(1, assignment);
    end
    clusters = {};
    for i=1:length(svd_clusters)
        clusters = [clusters, find(assignments==i)];
    end
end