x=[0:0.01:1];
y1=tan(x);
y2=sec(x);
plot(x,y1,'r--',x,y2,'kd')
title('\bfPlot of tan(x) and sec(x)'), xlabel('x'), ylabel('tan(x) and sec(x)')
grid on
text(0.3,1.2,'sec(x)'), gtext('tan(x)')
