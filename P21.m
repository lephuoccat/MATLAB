a=input('Enter your number: ')
k=0;
for i = 2:(a-1)
    if mod(a,i) == 0
       disp('this is composite number')
       k=1;
       break
    end
end
if k == 0
disp('this is a prime number')
end