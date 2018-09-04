clear
%a
Wp = 0.1;
Ws = 0.22;
d1 = 0.01;
As = 60;
Ap = -20*log10(1-2*d1);
[n,Wp] = cheb1ord(Wp,Ws,Ap,As);
[b,a] = cheby1(n,Ap,Wp);

%b
pole = roots(a)
pole_abs = abs(pole)

%c
a_quant1 = zeros(1,n+1);
for i=1:1:n+1
    a_quant1(i) = ppvquantclass(a(i),16);
end
pole_quant1 = roots(a_quant1)
pole_quant1_abs = abs(roots(a_quant1))

%d
a_quant2 = zeros(1,n+1);
for i=1:1:n+1
    a_quant2(i) = ppvquantclass(a(i),19);
end
pole_quant2 = roots(a_quant2)
pole_quant2_abs = abs(roots(a_quant2))

%e
a_quant3 = zeros(1,n+1);
for i=1:n+1
    a_quant3(i) = ppvquantclass(a(i),26);
end
pole_quant3 = roots(a_quant3)
pole_quant3_abs = abs(roots(a_quant3))

figure
[h1,w1] = freqz(b,a_quant3);
subplot(2,1,1)
plot(w1/pi,db(h1))
grid on
title('Magnitude Response of Quantized Filter |H_q(e^j^\omega)| with b = 26 bits')
ylabel('Magnitude (dB)')

subplot(2,1,2)
plot(w1/pi,abs(h1))
grid on
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude')
axis([0 1 0 1.1])

figure
plot(w1/pi,abs(h1))
grid on
title('Magnitude Response of Quantized Filter |H_q(e^j^\omega)| with b = 26 bits')
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude')
axis([0 0.1 0.96 1.02])

%f
a_quant4 = zeros(1,n+1);
for i=1:n+1
    a_quant4(i) = ppvquantclass(a(i),32);
end
pole_quant4 = roots(a_quant4)
pole_quant4_abs = abs(roots(a_quant4))

figure
[h2,w2] = freqz(b,a_quant4);
subplot(2,1,1)
plot(w2/pi,db(h2))
grid on
title('Magnitude Response of Quantized Filter |H_q(e^j^\omega)| with b = 32 bits')
ylabel('Magnitude (dB)')

subplot(2,1,2)
plot(w2/pi,abs(h2))
grid on
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude')
axis([0 1 0 1.1])

figure
plot(w2/pi,abs(h2))
grid on
title('Magnitude Response of Quantized Filter |H_q(e^j^\omega)| with b = 32 bits')
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude')
axis([0 0.1 0.96 1.02])

