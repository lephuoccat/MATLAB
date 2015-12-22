[x,y]=meshgrid(-5:0.1:5);
z=(x-2).^2+2*x*y+y.^2;
subplot(2,2,1), mesh(x,y,z)
xlabel('\bf\itx'), ylabel('\bf\ity'), zlabel('z'), title('\bfSurface Mesh plot of z=(x-2)^{2}+2xy+y^{2}')
subplot(2,2,2), contour(x,y,z)
xlabel('\bf\itx'), ylabel('\bf\ity'), zlabel('z'), title('\bfContour plot of z=(x-2)^{2}+2xy+y^{2}')

t=[0:0.1:10];
v=10*exp((-0.2+i*pi).*t);
subplot(2,2,3), plot(t,real(v),'cd',t,imag(v),'k--')
xlabel('\bf\itt'), ylabel('\bf\itreal & imaginary'), title('\bfGraph of complex function')
legend('real part','imaginary part'), grid on
subplot(2,2,4), polar(angle(v),abs(v))
title('\bfPlot of complex function'), grid on