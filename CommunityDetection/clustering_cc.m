function [A, A_new, cluster_indicies, index_vector_new, flag] = clustering(A,n, index_vector)
size = 1;
increment = 0;
A_new = 0;
cluster_indicies = 0;
index_vector_new = 0;

% when size of input A is 0x0, stop the loop
if n == 0
    flag = 0;
    
else
    % continue loop
    flag = 1;
    % initial inverse
    X = 1/A(1,1);

    for i=(size+1):n
        if size == 1 && increment == 0
            % initial case: when size=1
            Y = 1/A(i,i);
            Z = inv(A([1,i],[1,i]));
        elseif size > 1 && increment == 1
            % when size>1 and size=size++ in previous iteration
            X = Z;
            Y = 1/A(i,i);
            Z = inverse_mat(X, A([1:size,i],i));
        elseif size > 1 && increment == 0
            % when size>1 and size=size in previous iteration
            Y = 1/A(i,i);
            Z = inverse_mat(X, A([1:size,i],i));
        end
        % If trace(inverse of combining matrix) strictly greater than 
        % trace(inverse of individual matrices)
        if trace(Z) > (trace(X) + Y)
            %fprintf("Success!!! At index: %d, size = %d\n", i, size);
            size = size + 1;
            increment = 1;
            % add this element (swap to the next element) to the cluster 
            A = swap_mat(A, size, i);
            index_vector = swap_mat(index_vector, size, i);
        else
            increment = 0;
        end
    end

    % A_new = A of un-clustered elements
    A_new = A(size+1:n, size+1:n);
    index_vector_new = index_vector(size+1:n, size+1:n);
    cluster_indicies = index_vector(1:size, 1:size);
    fprintf("Size of this cluster: %d\n", size);

end
end