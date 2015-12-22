t=[0:pi/20:4*pi];
y=exp(-0.2*t).*(cos(t)+i*sin(t));
plot(t,real(y),'co','Linewidth',3)
hold on
plot(t,imag(y),'r--','Linewidth',3)
title('\bf\itPlot of complex number')
xlabel('\bf\itt'), ylabel('\bf\ity(t)')
legend('real','imaginary')
grid on