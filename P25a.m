ID=input('Enter account numbers: \n');
balanceO=input('Enter the beginning balance: \n');
charged=input('Enter items charged: \n');
credit=input('Enter credits applied: \n');
lim=input('Enter allowed limit: \n');
n=length(ID);
i=1;
while i<=n
     A(i)=balanceO(i)+charged(i)-credit(i);
     if A(i)>lim(i)
        disp('ID: ')
        disp(ID(i))
        disp('New balance: ')
        disp(A(i))
        disp('Limit: ')
        disp(lim(i))
        disp('==> Credit limit exceeded')
     end
     i=i+1;
end