v=[0:0.0001:1];
i=10^(-15)*(exp(v/(1.38*10^(-23)*310.7778/(1.6*10^(-19))))-1)
plot(v,i);
grid on
axis([0.5 0.8 0 0.005])