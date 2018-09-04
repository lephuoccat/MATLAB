clear
y0 = 430.623;
y = (y0-10):0.1:(y0+10);
Re = 6380;
h = 600;
lambda = 6*10^(-5);
rho = ( (Re+h)^2 + Re^2 - (2*Re*(Re+h)).*cos(y./Re) ).^0.5;
theta = acos((rho.^2 + (Re+h)^2 - Re^2) ./ (2*(Re+h).*rho));
z = 10*exp(-(y-y0).^2/10).*10^(-5);
d_phi = (2*pi/lambda).*2*cos(theta).*z;
plot(y,d_phi)
title('The Expected Differential Phase')
xlabel('y (km)')
ylabel('\Delta\phi (radian)')
axis([420.623 440.623 0 20])