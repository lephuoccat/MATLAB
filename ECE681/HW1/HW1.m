% --------------
% Name: Cat Le
% ECE 681 - HW1
% --------------
close all 
clc, clear
% Problem 5-8
% Import data from 4 .csv files
filename = ["moderateData.csv", "bigData.csv", "smallData.csv", "logNormalData.csv"];
for index = 1:1:4
    fprintf("Filename: %s\n", filename(index))
    data = csvread(filename(index));                % read data file
    label = data(:,1);                              % the label
    score = data(:,2);                              % the decision statistics

    % Plot ROC with perfcurve
    [X,Y,T] = perfcurve(label,score,1);             % obtain ROC using built-in func
    figure()
    set(gcf, 'Position',  [400, 0, 600, 600])       % display graph as a square window
    plot(X,Y,'LineWidth',2)                         % plot ROC curve
    hold on,grid on
    plot([0,1],[0,1])                               % plot chance diagonal
    xlabel('Probability of False Alarm (P_F)','FontSize',14) 
    ylabel('Probability of Detection (P_D)','FontSize',14)
    title('ROC Curve using perfcurve function from ' + filename(index),'FontSize',14)

    % Using ROC_curve function (located at the bottom of the code)
    % (1) Plot ROC with thresholds are all decision statistics
    [X1,Y1] = ROC_curve(label,score,"all");
    figure()
    set(gcf, 'Position',  [400, 0, 600, 600])
    plot(X1,Y1,'LineWidth',3)
    hold on
    % (2) Plot ROC with thresholds are linear samples from the range of decision statistics
    [X2,Y2] = ROC_curve(label,score,"linear");
    plot(X2,Y2,'-.','LineWidth',2)
    hold on
    % (3) Plot ROC with thresholds are sample every nth desicion statistics
    [X3,Y3] = ROC_curve(label,score,"sample");
    plot(X3,Y3,'LineWidth',1)
    hold on
    % (4) Plot ROC with thresholds are every H0 desicion statistics
    [X4,Y4] = ROC_curve(label,score,"H0");
    plot(X4,Y4,'-.','LineWidth',2)
    hold on
    % (5) Plot ROC with P_F is linearly sampled from 0 to 1
    [X5,Y5] = ROC_curve(label,score,"interval");
    plot(X5,Y5,'LineWidth',1)
    hold on, grid on
    plot([0,1],[0,1])                               % plot chance didagonal
    legend({"Case(1): all", "Case(2): linear", "Case(3): sample",...
        "Case(4): H0", "Case(5): interval", "Chance Diagonal"},'FontSize',14)
    xlabel('Probability of False Alarm (P_F)','FontSize',14) 
    ylabel('Probability of Detection (P_D)','FontSize',14)
    title('ROC Curve from ' + filename(index),'FontSize',14)
    fprintf("\n")
end


% Problem 12
% Import data
clear
filename = "rocData.csv";                       % declare filename
fprintf("Filename: %s\n", filename)
data = csvread(filename);                       % read data
P_f = data(:,1);                                % prob of false alarm
P_d = data(:,2);                                % prob of detection

% (a) Plot ROC Curve
figure()
set(gcf, 'Position',  [400, 0, 600, 600])       % display graph as a square window
plot(P_f,P_d,'LineWidth',2)                     % plot ROC curve from data
hold on, grid on
plot([0,1],[0,1])                               % plot chance diagonal
xlabel('Probability of False Alarm (P_F)','FontSize',14) 
ylabel('Probability of Detection (P_D)','FontSize',14)
title('ROC Curve from ' + filename,'FontSize',14)
hold on

% part 2-4
P_cd1 = 0;                          % prob of correct detection at P(H0)=P(H1)
P_cd2 = 0;                          % prob of correct detection at 2P(H0)=P(H1)
P_cd3 = 0;                          % prob of correct detection at P(H0)=2P(H1)
for i = 1:1:length(P_f)
    % P_cd1 when P(H0)=P(H1)=1/2
    if (0.5*(1-P_f(i)+P_d(i))) > P_cd1
        P_cd1 = 0.5*(1-P_f(i)+P_d(i));      % find max P_cd
        x1 = P_f(i);                        % and store coordinates (Pf, Pd)
        y1 = P_d(i);
    end
    % P_cd2 when 2P(H0)=P(H1)
    % P(H0)=1/3, P(H1)=2/3
    if (1/3*(1-P_f(i))+2/3*P_d(i)) > P_cd2
        P_cd2 = 1/3*(1-P_f(i)) + 2/3*P_d(i);
        x2 = P_f(i);
        y2 = P_d(i);
    end
    % P_cd3 when P(H0)=2P(H1)
    % P(H0)=2/3, P(H1)=1/3
    if (2/3*(1-P_f(i))+1/3*P_d(i)) > P_cd3
        P_cd3 = 2/3*(1-P_f(i))+1/3*P_d(i);
        x3 = P_f(i);
        y3 = P_d(i);
    end
end
fprintf("(1) P_cd = %0.4f, at Pf = %0.4f, Pd = %0.4f \n",P_cd1,x1,y1)
fprintf("(2) P_cd = %0.4f, at Pf = %0.4f, Pd = %0.4f \n",P_cd2,x2,y2)
fprintf("(3) P_cd = %0.4f, at Pf = %0.4f, Pd = %0.4f \n",P_cd3,x3,y3)

plot(x1,y1,'*',x2,y2,'*',x3,y3,'*','LineWidth',5)
legend({"ROC with AUC = 0.9166","Chance Diagonal","P(H_0) = P(H_1):   P_c_d = 0.8450",...
    "2P(H_0) = P(H_1): P_c_d = 0.8400","P(H_0) = 2P(H_1): P_c_d = 0.8683"},'FontSize',16)

% (b) Area under curve
AUC = trapz(P_f,P_d);
fprintf("The area under curve: AUC = %0.4f \n",AUC)


% -------------------
% ROC Curve Function
% -------------------
function [X,Y] = ROC_curve(labels,statistics,threshold)
N = length(statistics);                         % length of the dataset
label_1 = sum(labels);                          % number of H1 decision
label_0 = N - label_1;                          % number of H0 decision
lambda = sort(statistics);                      % sort the decision statistics

% Choose the threshold criteria
if threshold == "all"                           % all decision staticstic as threshold
    fprintf("Case (1): all\t\t");
    T = [-Inf; lambda; Inf];
    
elseif threshold == "linear"                    % linear sample threshold
    fprintf("Case (2): linear\t");
    min = lambda(1);
    max = lambda(N);
    T = [-Inf, linspace(min,max,99), Inf];
 
    
elseif threshold == "sample"                    % every nth sample threshold
    fprintf("Case (3): sample\t");
    if N >= 99
        n = floor(N/99);
        T = [-Inf; lambda(1:n:99*n,1); Inf];
    else
        n = 1;
        T = [-Inf; lambda(1:n:N,1); Inf];
    end
    
else
    lambda_h0 = zeros(label_0,1);               % decision statistics with label H0   
    index = 1;
    for i = 1:1:N
        if labels(i) == 0
            lambda_h0(index) = statistics(i);
            index = index + 1;
        end
    end
    
    if threshold == "H0"                            % every H0 decision statistics as threshold
        fprintf("Case (4): H0\t\t");
        T = [-Inf; sort(lambda_h0); Inf];
        
    elseif threshold == "interval"                  % linearly sample P_f at interval 0.01
        fprintf("Case (5): interval\t");
        h0_sorted = sort(lambda_h0);
        if label_0 >= 100
            n = floor(label_0*0.01);
        else
            n = 1;
        end
        T = [h0_sorted(1:n:label_0); Inf];
    end
end
fprintf("length of threshold: %d\n", length(T));

% Calculate prob of detection (Y) and
% prob of false alarm (X)
X = zeros(length(T),1);                     % x coordinate or P_f
Y = zeros(length(T),1);                     % y coordinate or P_d
for i = 1:1:length(T)
    count_d = 0;
    count_f = 0;
    for j = 1:1:N
        if statistics(j) >= T(i)            % if decision statistic > threshold
            if labels(j) == 1
                count_d = count_d + 1;      % add 1 to the H1 decision statistic
            else
                count_f = count_f + 1;      % add 1 to the H0 decision statistic
            end
        end
    end
    X(i) = count_f/label_0;                 % Pf = (#H0 decision stats>threshold)/total H0 decision stats
    Y(i) = count_d/label_1;                 % Pd = (#H1 decision stats>threshold)/total H1 decision stats
end    
end
