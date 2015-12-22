t=[0:pi/20:4*pi];
y=exp(-0.2*t).*(cos(t)+i*sin(t));
plot(y,'b--','linewidth',3)
title('\bf\itPlot of complex number')
xlabel('\bf\itreal part'), ylabel('\bf\itimaginary part')
grid on