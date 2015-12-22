subplot(1,2,1)
fplot('exp(-.5*t).*cos(20*t-6)',[0 8])
xlabel('t'), ylabel('z'), title('Graph of function e^{-0.5t}cos(20t-6)')
grid on
subplot(1,2,2)
fplot('6*log10(v.^2+20)',[-8 8])
xlabel('v'), ylabel('u'), title('Graph of function 6log(v^{2}+20)')
grid on