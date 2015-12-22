n=input('Enter number n: ');
A=zeros(n);
A(1,1)=1;
for i=2:n
    A(i,1)=A(i-1,1)+2;
    A(1,i)=A(1,i-1)+2;
    A(i,i)=A(1,i)+A(i,1);
end
A