x1=[-10:0.1:-5];
x2=[-5:0.1:5];
x3=[5:0.1:15];
x4=[15:0.1:25];
x5=[25:0.1:30];
plot(x1,10*x1+100,x2,50,x3,-10*x3+100,x4,-50,x5,10*x5-300);
axis([-10 30 -80 80])
xlabel('\bft(s)'), ylabel('\bff(t)'), title('\bfThe Graph of f(t)');
grid on