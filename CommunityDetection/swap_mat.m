function [S] = swap_mat(A, a, b)
% swap row
S = A;
temp = S(a,:);
S(a,:) = S(b,:);
S(b,:) = temp;
% swap column
temp = S(:,a);
S(:,a) = S(:,b);
S(:,b) = temp;
end

