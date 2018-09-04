%% 1(d)
clear
l = 0.1:0.0001:0.2;
a = 0.002;
k = 2*pi/0.24;
RVI = (k^4.*l.^6)./(1.9*(log(4*l./a)-1).^2+k^4.*l.^6);
plot(l,RVI)
title('The Radar Vegetation Index (RVI)')
xlabel('cylinder length l (m)')
ylabel('RVI')

%% 1(e)
clear
a = 0.002;
l = 0.1:0.0001:0.2;
k = 2*pi/0.24;
c = ((k^2.*l.^3)./(6*(log(4*l./a)-1))).^2;
e1 = c/4;
e2 = 0.0625*(0.4212+6*c-(0.17732+1.248*c+4*c.^2).^0.5);
e3 = 0.0625*(0.4212+6*c+(0.17732+1.248*c+4*c.^2).^0.5);
plot(l,e1,l,e2,l,e3)
title('The Eigenvalues of Combined Covariance Matrix')
legend('\lambda1','\lambda2','\lambda3')
xlabel('cylinder length l (m)')
ylabel('eigenvalues (\lambda)')
axis([0.1 0.2 0 0.08])
