N=9;
w=-15:0.01 :15;
y=abs((1-exp(-i.*w.*(N+1)))./(1-exp(-i.*w)));
y1=sqrt(((1-cos(w*(N+1))).^2+sin(w*(N+1))).^2)/((1-cos(w)).^2+sin(w).^2);
plot(w,y)
title('DTFT for N=9');
xlabel('Frequency');
ylabel('Amplitude');
grid on
%%
figure
N=20;
w=[-15:0.01 :15];
y=abs(exp(-i.*w.*N./2).*sin(w.*(N+1)./2)./sin(w./2));
y2=sin(w.*(N+1)./2)/sin(w./2);
plot(w,y)
title('DTFT for N=20');
xlabel('Frequency');
ylabel('Amplitude');
grid on