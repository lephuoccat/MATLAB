clear all
x = [1,1/3,1/5,1/7,1/9];

p = 0.1
P1 = log10(1-(1-p)^4)
P3 = log10(1-((1-p)^3+3*p*(1-p)^2)^4)
P5 = log10(1-((1-p)^5+5*p*(1-p)^4+10*p^2*(1-p)^3)^4)
P7 = log10(1-((1-p)^7+7*p*(1-p)^6+21*p^2*(1-p)^5+35*p^3*(1-p)^4)^4)
P9 = log10(1-((1-p)^9+9*p*(1-p)^8+36*p^2*(1-p)^7+84*p^3*(1-p)^6+126*p^4*(1-p)^5)^4)

y = [P1,P3,P5,P7,P9];
plot(x,y,'blue')

P1b = log10(1-(1-p)^8)
P3b = log10(1-((1-p)^3+3*p*(1-p)^2)^8)
P5b = log10(1-((1-p)^5+5*p*(1-p)^4+10*p^2*(1-p)^3)^8)
P7b = log10(1-((1-p)^7+7*p*(1-p)^6+21*p^2*(1-p)^5+35*p^3*(1-p)^4)^8)
P9b = log10(1-((1-p)^9+9*p*(1-p)^8+36*p^2*(1-p)^7+84*p^3*(1-p)^6+126*p^4*(1-p)^5)^8)

hold on
yb = [P1b,P3b,P5b,P7b,P9b];
plot(x,yb,'red')

title('Efficiency vs. Error Probability of Repetition Code')
xlabel('Efficient rate')
ylabel('log_1_0P_e')
legend('M=16, p=0.10','M=256, p=0.10')

hold on
scatter(x,y,'blue')
hold on
scatter(x,yb,'red')