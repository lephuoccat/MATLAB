function [A, A_new, flag, correct_flag] = clustering(A,n,num_element,penalty)
size = 1;
increment = 0;
A_new = 0;

% when size of input A is 0x0, stop the loop
if n == 0
    flag = 0;
    correct_flag = 0;
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
        if trace(Z) > (trace(X) + Y + penalty)
            %fprintf("Success!!! At index: %d, size = %d\n", i, size);
            size = size + 1;
            increment = 1;
            % add this element (swap to the next element) to the cluster 
            A = swap_mat(A, size, i);
        else
            increment = 0;
        end
    end

    % A_new = A of un-clustered elements
    A_new = A(size+1:n, size+1:n);
    % fprintf("Size of this cluster: %d --- ", size);
    if (size ~= num_element)
        % fprintf("Wrong\n");
        correct_flag = 0;
    else
        correct_flag = 1;
        % fprintf("Correct\n");
    end
end
end