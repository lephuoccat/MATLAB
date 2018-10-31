clc
clear
% Input data
n = 10;
a1 = 6;
a2 = n;
a3 = n;
a4 = n;
A = positive_definite_mat(n,a1,a2,a3,a4);
A_original = A;
% Swap Randomly
for i=1:100
    r = randi([1,n],1,2);
    A = swap_mat(A, r(1), r(2));
end

A_mixed = A;

size = 1;
for i=(size+1):n
    fprintf(".....\n")
    A([1,i],[1,i])
    if trace(inv(A([1,i],[1,i]))) > (trace(inv(A(1,1))) + trace(inv(A(i,i))))
        fprintf("Success!!! index: %d\n", i);
        fprintf("Size: %d, i: %d\n\n", size, i);
        if (size+1-i) < 0
            A = append_mat(A, size+1, i);
        end
        size = size + 1;
    end
end
fprintf("-----------\n")
A





