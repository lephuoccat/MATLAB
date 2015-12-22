x=[-7:0.01:1];
a=[1 13 52 6];
f=polyval(a,x);
plot(x,f)
xlabel('x value')
ylabel('y value')
title('y = x^3 +13*x^2 +52*x +6 graph')