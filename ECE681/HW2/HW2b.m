% ---------------
% Name: Cat Le
% ECE 681 - HW2-b
% Problem 5
% ---------------
close all 
clc, clear
% Problem 2-4
% Import training data from dataSetHorseshoes.csv file
filename = "knn3DecisionStatistics.csv";
data = csvread(filename);               % read data file
label = data(:,1);                      % the label
score = data(:,2);                      % decision statistics
H0 = data(label==0,:);
H1 = data(label==1,:);

N = length(score);
lambda = sort(score);
T = [-Inf;0;0.3;0.6;1;Inf];
% prob of false alarm (X)
X = zeros(length(T),1);                     % x coordinate or P_f
Y = zeros(length(T),1);                     % y coordinate or P_d
for i = 1:1:length(T)
    count_d = 0;
    count_f = 0;
    for j = 1:1:N
        if score(j) >= T(i)                 % if decision statistic > threshold
            if label(j) == 1
                count_d = count_d + 1;      % add 1 to the H1 decision statistic
            else
                count_f = count_f + 1;      % add 1 to the H0 decision statistic
            end
        end
    end
    X(i) = count_f/100;                 % Pf = (#H0 decision stats>threshold)/total H0 decision stats
    Y(i) = count_d/100;                 % Pd = (#H1 decision stats>threshold)/total H1 decision stats
end

% Find operating point P_d = 0.95
T = 0.3;
simulation = 100;
X_op = zeros(simulation,1);
Y_op = zeros(simulation,1); 
for i = 1:1:simulation
    count_d = 0;
    count_f = 0;
    for j = 1:1:N
        if score(j) >= T                        % probabilistic decision rule
            if label(j) == 1
                count_d = count_d + 1;    
            elseif label(j) == 0
                count_f = count_f + 1;
            end
        else
            coef = rand;
            if rand <= 0.75                     % choosing H1 for 75% when statistics<threshold
                if label(j) == 1
                    count_d = count_d + 1;    
                elseif label(j) == 0
                    count_f = count_f + 1;
                end
            end
        end
    end
    X_op(i) = count_f/100;
    Y_op(i) = count_d/100;
end

% kernel density of P_f
[f1,x1] = ksdensity(X_op);
P_f_ave = mean(X_op)
figure(), plot(x1,f1,'LineWidth',2)
title('Kernel density estimation of P_f','FontSize',14)
xlabel('Probability of False Alarm (P_F)','FontSize',14) 

% kernel density of P_d
[f2,x2] = ksdensity(Y_op);
P_d_ave = mean(Y_op)
figure(), plot(x2,f2,'LineWidth',2)
title('Kernel density estimation of P_d','FontSize',14)
xlabel('Probability of Detection (P_D)','FontSize',14)

% Plot ROC with operating point @ P_d = 0.95
figure(), plot(X,Y,'LineWidth',2)
hold on, grid on
plot(P_f_ave,P_d_ave,'*','LineWidth',3)
hold on, plot([0,1],[0,1])                       
xlabel('Probability of False Alarm (P_F)','FontSize',14) 
ylabel('Probability of Detection (P_D)','FontSize',14)
title('ROC curve from knn3DecisionStatistics.csv')
legend({'ROC','(\mu_{P_F}, \mu_{P_D}) @ P_D=0.95','chance diagonal'},'FontSize',14)
