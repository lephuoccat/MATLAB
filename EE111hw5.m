% (a)
clear
N = 2^12;
w = 0.003*pi;
n = -2:1:(N-1);
y1(n==-2) = cos(w);
y1(n==-1) = cos(2*w);
for k = 0:(N-1)
    y1(n==k) = 2*cos(w).*y1(n==k-1)-y1(n==k-2);
end
plot(n,y1)
grid on
title('y(n) = 2cos(\omega_0) y(n-1) - y(n-2),       y(-1)=cos(\omega_0),       y(-2)=cos(2\omega_0)');
xlabel('n');
ylabel('y(n)');

% (b)
e1 = rand(N+2,1);
e = 0.02*(e1-mean(e1));
y2(n==-2) = cos(w);
y2(n==-1) = cos(2*w);
for k = 0:(N-1)
    y2(n==k) = 2*cos(w).*y2(n==k-1)-y2(n==k-2)+e(n==k);
end
figure
plot(n,y2)
grid on
title('y(n) = 2cos(\omega_0) y(n-1) - y(n-2) + e(n),       y(-1)=cos(\omega_0),       y(-2)=cos(2\omega_0)');
xlabel('n');
ylabel('y(n)');

% (c)
figure
plot(n,y1,n,e)
grid on
legend('pure y(n)','e(n)')
title('The pure cosine y(n) and the noise source e(n)');
xlabel('n');
ylabel('y(n)');
