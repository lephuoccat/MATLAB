close all 
clc, clear
% Import data
data = csvread("moderateData.csv");
label = data(:,1);
score = data(:,2);

% Plot ROC with perfcurve
[X,Y,T] = perfcurve(label,score,1);
figure()
plot(X,Y)
hold on,grid on
plot([0,1],[0,1])
xlabel('Probability of False Alarm (P_F)') 
ylabel('Probability of Detection (P_D)')
title('ROC with perfcurve')

% Plot ROC with thresholds are all decision statistics
[X1,Y1] = generate_ROC(label,score,"all");
figure()
plot(X1,Y1)
hold on, grid on
plot([0,1],[0,1])
xlabel('Probability of False Alarm (P_F)') 
ylabel('Probability of Detection (P_D)')
title('1/ ROC with thresholds are all decision statistics')

% Plot ROC with thresholds are linear samples from the range of decision
% statistics
[X2,Y2] = generate_ROC(label,score,"linear");
figure()
plot(X2,Y2)
hold on, grid on
plot([0,1],[0,1])
xlabel('Probability of False Alarm (P_F)') 
ylabel('Probability of Detection (P_D)')
title('2/ ROC with thresholds are linear samples from the range of decision statistics')

% Plot ROC with thresholds are sample every nth desicion statistics
[X3,Y3] = generate_ROC(label,score,"sample");
figure()
plot(X3,Y3)
hold on, grid on
plot([0,1],[0,1])
xlabel('Probability of False Alarm (P_F)') 
ylabel('Probability of Detection (P_D)')
title('3/ ROC with thresholds are sample every n^t^h desicion statistics')

% Plot ROC with thresholds are every H0 desicion statistics
[X4,Y4] = generate_ROC(label,score,"H0");
figure()
plot(X4,Y4)
hold on, grid on
plot([0,1],[0,1])
xlabel('Probability of False Alarm (P_F)') 
ylabel('Probability of Detection (P_D)')
title('4/ ROC with thresholds are every H0 desicion statistics')

% Plot ROC with P_F is linearly sampled from 0 to 1
[X5,Y5] = generate_ROC(label,score,"interval");
figure()
plot(X5,Y5)
hold on, grid on
plot([0,1],[0,1])
xlabel('Probability of False Alarm (P_F)') 
ylabel('Probability of Detection (P_D)')
title('5/ ROC with P_F is linearly sampled from 0 to 1')
