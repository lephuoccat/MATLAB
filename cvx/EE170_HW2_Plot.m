%% P1a
mu = [9,16,17,25,27,28,32,33,34,37,40,41,45,47,46,49,50,53,54,56];
ml = [2,4,6,10,11,12,13,17,18,19,22,23,25,26,27,28,30,30,30,31];
k = 1:1:20;
figure
plot(k,mu,'b-o')
hold on
grid on
plot(k,ml,'r-o')
legend('m_u(k)','m_l(k)');
title('Plot for Problem 1(a): A ~ N(0,1)');
xlabel('k sparse');
ylabel('number of measurements m');

%% P1b
mu = [13,16,20,25,27,28,31,35,36,39,39,41,42,44,45,47,49,50,51,52];
ml = [6,8,10,11,11,14,15,18,18,19,21,20,22,23,25,26,27,27,28,29];
k = 1:1:20;
figure
plot(k,mu,'b-o')
hold on
grid on
plot(k,ml,'r-o')
legend('m_u(k)','m_l(k)');
title('Plot for Problem 1(b): A ~ Rademacher Distribution');
xlabel('k sparse');
ylabel('number of measurements m');

%% P1c
mu = [5,7,8,14,15,16,17,21,20,22,23,25,28,28,31,32,32,33,34,37];
ml = [1,1,3,4,6,8,8,10,11,11,13,14,16,16,17,18,18,21,22,23];
k = 1:1:20;
figure
plot(k,mu,'b-o')
hold on
grid on
plot(k,ml,'r-o')
legend('m_u(k)','m_l(k)');
title('Plot for Problem 1(c): A ~ DFT Matrix');
xlabel('k sparse');
ylabel('number of measurements m');

%% P3a
mu = [150,173,230,250,283];
ml = [65,110,150,170,225];
k = 1:1:5;
figure
plot(k,mu,'b-o')
hold on
grid on
plot(k,ml,'r-o')
legend('m_u(k)','m_l(k)');
title('Plot for Problem 3(a): G ~ N(0,1)');
xlabel('k sparse');
ylabel('number of measurements m');
%% P3b
mu = [140,150,200,235,255];
ml = [50,100,141,166,210];
k = 1:1:5;
figure
plot(k,mu,'b-o')
hold on
grid on
plot(k,ml,'r-o')
legend('m_u(k)','m_l(k)');
title('Plot for Problem 3(b): G ~ Radematcher Distribution');
xlabel('k sparse');
ylabel('number of measurements m');