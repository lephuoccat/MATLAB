% --------------
% Name: Cat Le
% ECE 681 - HW2
% --------------
close all 
clc, clear
% Problem 2
% Import data from dataSetHorseshoes.csv file
filename = "dataSetHorseshoes.csv";
fprintf("Filename: %s\n", filename)
data = csvread(filename);                       % read data file
label = data(:,1);                              % the label
coor = data(:,2:3);                             % x and y coordinates

x_class0 = coor(label==0,1);                    % x coordinates of H0
y_class0 = coor(label==0,2);                    % y coordinates of H0
x_class1 = coor(label==1,1);                    % x coordinates of H1
y_class1 = coor(label==1,2);                    % y coordinates of H1

N = length(label);
N0 = length(x_class0);
N1 = N - N0;

% plot data points as class 0 and class 1
figure(), set(gcf, 'Position',  [350, 0, 600, 600])
plot(x_class0,y_class0,'k*','LineWidth',3)
hold on, plot(x_class1,y_class1,'r*','LineWidth',3)
title("Horseshoes Data",'FontSize',14)
xlabel("Feature 1",'FontSize',14)
ylabel("Feature 2",'FontSize',14)
legend({"Class 0", "Class 1"},'FontSize',14)
axis([-1.75 1.75 -1.75 1.75])

k = [1,5,31,91,(N/2-2),(N-1)];
% k = [1,5,31,91];
for index = 1:length(k)
    fprintf("\nKNN with k = %d\n", k(index));
    % Training the KNN Classifier
    KNN = fitcknn(coor,label,'NumNeighbors',k(index),'Distance','euclidean');

    % Create a grid of points spanning the entire space
    x1Range = max(coor(:,1)) - min(coor(:,1));
    x2Range = max(coor(:,2)) - min(coor(:,2));
    x1 = linspace(min(coor(:,1)) - 0.2*x1Range, max(coor(:,1)) + 0.2*x1Range, 251);
    x2 = linspace(min(coor(:,2)) - 0.2*x2Range, max(coor(:,2)) + 0.2*x2Range, 251);
    [xTest1, xTest2] = meshgrid(x1,x2);
    xTest = [xTest1(:) xTest2(:)];

    % prediction
    [decision,score,cost] = predict(KNN,xTest);
    dsTest = reshape(score(:,2), length(x2), length(x1));
    boundary = reshape(decision, length(x2), length(x1));

    % Plot the decision statistic surface
    figure(), set(gcf, 'Position',  [350, 0, 600, 600])
    plot(x_class0,y_class0,'k*','LineWidth',3)
    hold on, imagesc(x1([1 end]), x2([1 end]), dsTest)
    hold on, plot(x_class0,y_class0,'k*','LineWidth',3)
    hold on, plot(x_class1,y_class1,'r*','LineWidth',3)
    hold on, contour(x1, x2, boundary,'w')
    colorbar
    title(['KNN Classifier (k = ', num2str(k(index)), ')'],'FontSize',14)
    xlabel("Feature 1",'FontSize',14)
    ylabel("Feature 2",'FontSize',14)

    % plot decision region using gscatter()
    % figure(), gscatter(xTest1(:), xTest2(:), decision,'rgb');
    
    % ROC for training data
    [decision_train,score_train,cost_train] = predict(KNN,coor);

    [P_f,P_d] = ROC_curve(label,score_train(:,2),"all");
    figure(), set(gcf, 'Position',  [400, 0, 600, 600])
    plot(P_f,P_d,'LineWidth',3)
    hold on, grid on
    plot([0,1],[0,1])                                   % plot chance diagonal
    xlabel('Probability of False Alarm (P_F)','FontSize',14) 
    ylabel('Probability of Detection (P_D)','FontSize',14)
    title(['ROC Curve (k=', num2str(k(index)), ')'],'FontSize',14)
    hold on
    
    P_cd = 0;
    P_H0 = N0/N;
    P_H1 = 1 - P_H0;
    for i = 1:1:length(P_f)
        % P_cd1 when P(H0)=P(H1)=1/2
        if (P_H0*(1-P_f(i))+P_H1*P_d(i)) > P_cd
            P_cd = P_H0*(1-P_f(i))+P_H1*P_d(i);         % find max P_cd
            x_optimum = P_f(i);                         % and store coordinates (Pf, Pd)
            y_optimum = P_d(i);
        end
    end
    plot(x_optimum,y_optimum,'*','LineWidth',3)
    fprintf("P_cd = %0.4f, at Pf = %0.4f, Pd = %0.4f \n",P_cd,x_optimum,y_optimum)
    
end











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
%     fprintf("Case (1): all\t\t");
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
% fprintf("length of threshold: %d\n", length(T));

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

