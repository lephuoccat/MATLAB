clear
theta = linspace(1.6,4.6,50);
tandata = tan(theta);
plot(theta,tan(theta));
xlabel('\theta(radian)');
ylabel('tan(\theta)')
title('Graph of tan(\theta)');
grid on;
axis([min(theta) max(theta) -5 5]);