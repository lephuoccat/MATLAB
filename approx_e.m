clear
sum=0;
for k=0:100
    sum = sum+1/gamma(k+1);
end
e_approximation = sum
e_exact = exp(1)