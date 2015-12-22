t=[0:pi/50:10*pi];
plot3(exp(-0.05*t).*sin(t),exp(-0.05*t).*cos(t),t)
xlabel('x'), ylabel('y'), zlabel('z')
grid on