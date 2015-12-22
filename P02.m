r=input('Enter row number: ');
c=input('Enter collume number: ');
A=ones(r,c);
A(1,1)=4;
for i=2:r
    A(i,1)=A(i-1)+6;
    for j=2:c
        A(1,j)=A(1,j-1)+4;
        A(i,j)=A(i,j-1)+4;
    end
end
A