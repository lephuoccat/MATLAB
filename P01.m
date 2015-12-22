n=input('Enter number n: ');
A=ones(n);
for r=2:n
    for c=2:n
        s=A(r-1,c)+A(r,c-1);
        if r>1 & c>1
            A(r,c)=s;
        else
            A(r,c)= max(A(r-1,c),A(r,c-1)),
        end
    end
end
A