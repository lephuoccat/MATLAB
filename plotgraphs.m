x=[-1:0.1:6];
y1=sin(x);
y2=sin(x+0.5);
y3=(-0.3)*x+1;
plot(x,y1,'r.',x,y2,'go',x,y3)
line(x,y1)
line(x,y2)
axis([-1 6 -1.5 1.5])
grid on
xlabel('x')
ylabel('y')
title('Plot 3 graphs')
