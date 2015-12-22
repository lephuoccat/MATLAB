clear
sum=0;
for k=0:50000;
    sum = sum+ 4*((-1)^k)/(2*k+1);
end
pi_approximation = sum
pi_exact = pi