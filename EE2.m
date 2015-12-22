w=[0:1:200000];
plot(w,4000*w./sqrt((4*10^8-w.^2).^2+(4000*w).^2))
axis([0 50000 0 1.02])
xlabel('w'), ylabel('|H(jw)|'), title('Frequency response plot for RLC filter')
grid on