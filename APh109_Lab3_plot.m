A = textread('Schottky_I_V_Run4.txt','%f');
l = length(A);
B = A(1:2:l);
C = A(2:2:l);
plot(B,C,'Linewidth',2)
title('LED I-V Curve')
xlabel('Voltage (V)')
ylabel('Current I')
grid on
axis([0 7 -0.01 0.06])