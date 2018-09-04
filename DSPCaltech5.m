clear
n = -20:1:20;
alpha = 0.75;

h = sinc(n-alpha);
stem(n,h)
title('Impulse Response for \alpha = 0.75')
xlabel('n')
ylabel('h(n)')