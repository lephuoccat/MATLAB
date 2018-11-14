function [S] = append_mat(A, a, b)
% swap row
S = A;
% find upper index
if a>b
    t = b;
    b = a;
    a = t;
end
% append row
temp1 = S(b,:);
for i = b:-1:(a+1)
    S(i,:) = S(i-1,:);
end
S(a,:) = temp1;
% append column
temp2 = S(:,b);
for i = b:-1:(a+1)
    S(:,i) = S(:,i-1);
end
S(:,a) = temp2;
end

