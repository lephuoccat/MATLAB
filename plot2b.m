x=[0:0.1:3.14];
y1=sinh(x);
y2=cosh(x);
y3=tanh(x);
plot(x,y1,'rp',x,y2,'cs',x,y3,'kd',x,y1,x,y2,x,y3)
xlabel('Gradient'), ylabel('y'), title('Graph of sinh(x), cosh(x), tanh(x)')
legend('sinh(x)','cosh(x)','tanh(x)')
grid on