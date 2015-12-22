A=input('Enter vector A: ')
B=input('Enter vector B: ')

a=length(A);
b=length(B);

A((a+1):(a+b))=0;
B((b+1):(a+b))=0;
C=ones(1,2*(a+b));

C(1:2:2*(a+b))=A(1:1:(a+b));
C(2:2:2*(a+b))=B(1:1:(a+b));
C(C==0) = [];

C