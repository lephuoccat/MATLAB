subplot(1,2,1)
x=[0:0.01:5];
y=exp(-1.2*x).*sin(10*x+5);
plot(x,y), xlabel('x'), ylabel('y'), title('Graph of function e^{-1.2x}sin(10x+5)')
grid on
subplot(1,2,2)
x=[-6:0.01:6];
y=abs(x.^3-100);
plot(x,y), xlabel('x'), ylabel('y'), title('Graph of function |x^{3}-100|')
grid on
