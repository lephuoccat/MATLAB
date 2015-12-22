A=input('Enter vector A: ');
B=input('Enter vector B: ');
a=length(A);
b=length(B);
m=min(a,b);
n=max(a,b);
A(a+1:n)=0;
B(b+1:n)=0;
C(1:2:2*m)=A(1:1:m);
C(2:2:2*m)=B(1:1:m);
C(2*m+1:a+b)=A(m+1:n)+B(m+1:n);
disp(C)