x=[0:0.1:52];
y=0.4*(1.8*x).^(0.5);
plot(x,y), xlabel('Distance (miles)'), ylabel('Height (miles)')
title('Rocket height as a finction of Downrange Distance')
grid on
axis([0 52 0 5]);