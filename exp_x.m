clear
for k=0:50
    x(k+1)=.1*k;
    sum=0;
    for m=0:100
        sum=sum+(x(k+1)^m/gamma(m+1));
    end
    e(k+1) = sum;
end
plot(x,e)
title('Approximation of e^x for x between 0 and 5')
xlabel('x')
ylabel('e^x')