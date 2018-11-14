function cov = cluster_covariance(origin_A,cluster_list)
average_vectors = zeros(size(origin_A, 1), length(cluster_list));
for i=1:length(cluster_list)
    for j=1:length(cluster_list{i})
        average_vectors(cluster_list{i}(j),i) = 1.0/length(cluster_list{i});
    end
end
cov = average_vectors' * origin_A * average_vectors;
end