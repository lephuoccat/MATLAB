clear
rng(123)
N = 10^4;
S = unidrnd(6,[1,N]);
 
AB = 0;
A = 0;
B = 0;
for i = 1:N
    if S(i)==2 || S(i)==4
        AB = AB+1;
    end
    if S(i)==2 || S(i)==4 || S(i)==6
        A = A+1;
    end
    if S(i)<5
        B = B+1;
    end
end
 
PA = A/N
PB = B/N
PAB = AB/N