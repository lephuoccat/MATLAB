%% Problem 1
% (a) D=1, P=1, Q=1
clc, clear
fprintf('D=1:\n')
n = 100000;             % The number of evaluations
P1 = rand(n,1) >= 0.5;
Q1 = rand(n,1) >= 0.5;
prob1 = sum(P1~=Q1)/n;
fprintf('P = 1, Q = 1, Pr[class separability] = %0.4f\n', prob1);

% (b) D=1, P=1, Q=2
Q2 = rand(n,1) >= 0.5;
prob2 = sum((P1~=Q1) & (P1~=Q2))/n;
fprintf('P = 1, Q = 2, Pr[class separability] = %0.4f\n', prob2);

% (c) D=1, P=1, Q=3,4,5
Q3 = rand(n,1) >= 0.5;
Q4 = rand(n,1) >= 0.5;
Q5 = rand(n,1) >= 0.5;
prob3 = sum((P1~=Q1) & (P1~=Q2) & (P1~=Q3))/n;
prob4 = sum((P1~=Q1) & (P1~=Q2) & (P1~=Q3) & (P1~=Q4))/n;
prob5 = sum((P1~=Q1) & (P1~=Q2) & (P1~=Q3) & (P1~=Q4) & (P1~=Q5))/n;
fprintf('P = 1, Q = 3, Pr[class separability] = %0.4f\n', prob3);
fprintf('P = 1, Q = 4, Pr[class separability] = %0.4f\n', prob4);
fprintf('P = 1, Q = 5, Pr[class separability] = %0.4f\n\n', prob5);

% (d) D=1, P=2, Q=1,2,3,4,5
P2 = rand(n,1) >= 0.5;
prob_d1 = sum((P1~=Q1)&(P2~=Q1))/n;
prob_d2 = sum((P1~=Q1)&(P2~=Q1) & (P1~=Q2)&(P2~=Q2))/n;
prob_d3 = sum((P1~=Q1)&(P2~=Q1) & (P1~=Q2)&(P2~=Q2) & (P1~=Q3)&(P2~=Q3))/n;
prob_d4 = sum((P1~=Q1)&(P2~=Q1) & (P1~=Q2)&(P2~=Q2) & (P1~=Q3)&(P2~=Q3) & (P1~=Q4)&(P2~=Q4))/n;
prob_d5 = sum((P1~=Q1)&(P2~=Q1) & (P1~=Q2)&(P2~=Q2) & (P1~=Q3)&(P2~=Q3) & (P1~=Q4)&(P2~=Q4) & (P1~=Q5)&(P2~=Q5))/n;
fprintf('P = 2, Q = 1, Pr[class separability] = %0.4f\n', prob_d1);
fprintf('P = 2, Q = 2, Pr[class separability] = %0.4f\n', prob_d2);
fprintf('P = 2, Q = 3, Pr[class separability] = %0.4f\n', prob_d3);
fprintf('P = 2, Q = 4, Pr[class separability] = %0.4f\n', prob_d4);
fprintf('P = 2, Q = 5, Pr[class separability] = %0.4f\n\n', prob_d5);

% (e) D=1, P=3, Q=1,2,3,4,5
P3 = rand(n,1) >= 0.5;
prob_d1 = sum((P1~=Q1)&(P2~=Q1)&(P3~=Q1))/n;
prob_d2 = sum((P1~=Q1)&(P2~=Q1)&(P3~=Q1) & (P1~=Q2)&(P2~=Q2)&(P3~=Q2))/n;
prob_d3 = sum((P1~=Q1)&(P2~=Q1)&(P3~=Q1) & (P1~=Q2)&(P2~=Q2)&(P3~=Q2) & (P1~=Q3)&(P2~=Q3)&(P3~=Q3))/n;
prob_d4 = sum((P1~=Q1)&(P2~=Q1)&(P3~=Q1) & (P1~=Q2)&(P2~=Q2)&(P3~=Q2) & (P1~=Q3)&(P2~=Q3)&(P3~=Q3) & (P1~=Q4)&(P2~=Q4)&(P3~=Q4))/n;
prob_d5 = sum((P1~=Q1)&(P2~=Q1)&(P3~=Q1) & (P1~=Q2)&(P2~=Q2)&(P3~=Q2) & (P1~=Q3)&(P2~=Q3)&(P3~=Q3) & (P1~=Q4)&(P2~=Q4)&(P3~=Q4) & (P1~=Q5)&(P2~=Q5)&(P3~=Q5))/n;
fprintf('P = 3, Q = 1, Pr[class separability] = %0.4f\n', prob_d1);
fprintf('P = 3, Q = 2, Pr[class separability] = %0.4f\n', prob_d2);
fprintf('P = 3, Q = 3, Pr[class separability] = %0.4f\n', prob_d3);
fprintf('P = 3, Q = 4, Pr[class separability] = %0.4f\n', prob_d4);
fprintf('P = 3, Q = 5, Pr[class separability] = %0.4f\n\n', prob_d5);

%% Problem 2
% (a) D=2, P=1, Q=1
clc, clear
fprintf('D=2:\n')
n = 100000;             % The number of evaluations
P1 = rand(n,2) >= 0.5;
Q1 = rand(n,2) >= 0.5;
T1 = P1~=Q1; T1 = sum(T1')' > 0;
prob1 = sum(T1)/n;
fprintf('P = 1, Q = 1, Pr[class separability] = %0.4f\n', prob1);

% (b) D=2, P=1, Q=2
Q2 = rand(n,2) >= 0.5;
T2 = P1~=Q2; T2 = sum(T2')' > 0 & T1;
prob2 = sum(T2)/n;
fprintf('P = 1, Q = 2, Pr[class separability] = %0.4f\n', prob2);

% (b) D=2, P=1, Q=3,4,5
Q3 = rand(n,2) >= 0.5;
Q4 = rand(n,2) >= 0.5;
Q5 = rand(n,2) >= 0.5;
T3 = P1~=Q3; T3 = sum(T3')' > 0 & T2;
T4 = P1~=Q4; T4 = sum(T4')' > 0 & T3;
T5 = P1~=Q5; T5 = sum(T5')' > 0 & T4;
prob3 = sum(T3)/n;
prob4 = sum(T4)/n;
prob5 = sum(T5)/n;
fprintf('P = 1, Q = 3, Pr[class separability] = %0.4f\n', prob3);
fprintf('P = 1, Q = 4, Pr[class separability] = %0.4f\n', prob4);
fprintf('P = 1, Q = 5, Pr[class separability] = %0.4f\n', prob5);

%% Problem 4 (b)
% D = 5, P = Q = 5
clc, clear
fprintf('D=5:\n')
n = 100000;             % The number of evaluations
P1 = rand(n,5) >= 0.5;
P2 = rand(n,5) >= 0.5;
P3 = rand(n,5) >= 0.5;
P4 = rand(n,5) >= 0.5;
P5 = rand(n,5) >= 0.5;

Q1 = rand(n,5) >= 0.5;
Q2 = rand(n,5) >= 0.5;
Q3 = rand(n,5) >= 0.5;
Q4 = rand(n,5) >= 0.5;
Q5 = rand(n,5) >= 0.5;

T1_1 = P1~=Q1; T1_1 = sum(T1_1')' > 0;
T1_2 = P1~=Q2; T1_2 = sum(T1_2')' > 0;
T1_3 = P1~=Q3; T1_3 = sum(T1_3')' > 0;
T1_4 = P1~=Q4; T1_4 = sum(T1_4')' > 0;
T1_5 = P1~=Q5; T1_5 = sum(T1_5')' > 0;
T1 = T1_1 & T1_2 & T1_3 & T1_4 & T1_5;

T2_1 = P2~=Q1; T2_1 = sum(T2_1')' > 0;
T2_2 = P2~=Q2; T2_2 = sum(T2_2')' > 0;
T2_3 = P2~=Q3; T2_3 = sum(T2_3')' > 0;
T2_4 = P2~=Q4; T2_4 = sum(T2_4')' > 0;
T2_5 = P2~=Q5; T2_5 = sum(T2_5')' > 0;
T2 = T2_1 & T2_2 & T2_3 & T2_4 & T2_5;

T3_1 = P3~=Q1; T3_1 = sum(T3_1')' > 0;
T3_2 = P3~=Q2; T3_2 = sum(T3_2')' > 0;
T3_3 = P3~=Q3; T3_3 = sum(T3_3')' > 0;
T3_4 = P3~=Q4; T3_4 = sum(T3_4')' > 0;
T3_5 = P3~=Q5; T3_5 = sum(T3_5')' > 0;
T3 = T3_1 & T3_2 & T3_3 & T3_4 & T3_5;

T4_1 = P4~=Q1; T4_1 = sum(T4_1')' > 0;
T4_2 = P4~=Q2; T4_2 = sum(T4_2')' > 0;
T4_3 = P4~=Q3; T4_3 = sum(T4_3')' > 0;
T4_4 = P4~=Q4; T4_4 = sum(T4_4')' > 0;
T4_5 = P4~=Q5; T4_5 = sum(T4_5')' > 0;
T4 = T4_1 & T4_2 & T4_3 & T4_4 & T4_5;

T5_1 = P5~=Q1; T5_1 = sum(T5_1')' > 0;
T5_2 = P5~=Q2; T5_2 = sum(T5_2')' > 0;
T5_3 = P5~=Q3; T5_3 = sum(T5_3')' > 0;
T5_4 = P5~=Q4; T5_4 = sum(T5_4')' > 0;
T5_5 = P5~=Q5; T5_5 = sum(T5_5')' > 0;
T5 = T5_1 & T5_2 & T5_3 & T5_4 & T5_5;

T = T1 ;
prob = sum(T)/n;
fprintf('P = 5, Q = 5, Pr[class separability] = %0.4f\n', prob)