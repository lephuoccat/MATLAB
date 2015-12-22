function [ y, vout ] = tran( b,a,x,vin )
    [A,B] = size(x);
    n = max(A,B);
    if (nargin==3)
        v1(1) = 0;
        v2(1) = 0;
    elseif (nargin==4)
        v1(1) = vin(1);
        v2(1) = vin(2);
    else
        error('Input variables are incorrect')
    end
    for i = 1:1:n
        y(i) = b(1)*x(i)+v1(i);
        v1(i+1) = b(2)*x(i)-a(2)*y(i)+v2(i);
        v2(i+1) = b(3)*x(i)-a(3)*y(i);
    end
    vout = [v1;v2];
end