[x,y]=meshgrid(-2:0.1:2);
z=x.*exp(-((x-y.^2).^2+y.^2));
subplot(1,3,1), mesh(x,y,z) 
xlabel('x'), ylabel('y'), zlabel('z'), title('Surface Mesh plot')
subplot(1,3,2), contour(x,y,z) 
xlabel('x'), ylabel('y'), zlabel('z'), title('Contour plot')
subplot(1,3,3), plot3(x,y,z), grid on