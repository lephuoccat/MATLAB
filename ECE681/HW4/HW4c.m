%% Distance Likelihood Ratio Test
%% Problem 6
clc
clear
close all
m_class0 = [2;1];
m_class1 = [5;6];
cov_class0 = [2 1; 1 4];
cov_class1 = [2 -1; -1 3];
data0 = mvnrnd(m_class0, cov_class0, 300);
data1 = mvnrnd(m_class1, cov_class1, 300);
coor_train = [data0; data1];

scatter(data0(:,1), data0(:,2), 'b', 'filled');
grid on, hold on
scatter(data1(:,1), data1(:,2), 'r', 'filled');
title('2-D Dataset')
xlabel('Feature 1')
ylabel('Feature 2')
legend('Class 0', 'Class 1')
axis([-4 12 -4 12])

% Distance Likelihood Ratio Test
% Create a grid of points spanning the entire space
x1Range = max(coor_train(:,1)) - min(coor_train(:,1));
x2Range = max(coor_train(:,2)) - min(coor_train(:,2));
x1 = linspace(min(coor_train(:,1)) - 0.2*x1Range, max(coor_train(:,1)) + 0.2*x1Range, 251);
x2 = linspace(min(coor_train(:,2)) - 0.2*x2Range, max(coor_train(:,2)) + 0.2*x2Range, 251);
[xTest1, xTest2] = meshgrid(x1,x2);
xTest = [xTest1(:) xTest2(:)];

[score,lambda] = dlrt_func(5,data0,data1,xTest);
dsTest = reshape(score, length(x2), length(x1));

% Plot the decision statistic surface
figure()
set(gcf, 'Position',  [350, 0, 800, 600])
hold on, imagesc(x1([1 end]), x2([1 end]), dsTest);
colorbar
axis([-4 10 -4 12])
title('Distance Likelihood Ratio Test')

hold on, plot(data0(:,1),data0(:,2),'k*','LineWidth',3);
hold on, plot(data1(:,1),data1(:,2),'r*','LineWidth',3);


%% Problem 7
close all 
clc, clear
% Import training data from dataSetHorseshoes.csv file
filename = "dataSetHorseshoes.csv";
data = csvread(filename);
coor_train = data(:,2:3);
label = data(:,1);
data0 = data(label==0,:);
data0 = data0(:,2:3);
data1 = data(label==1,:);
data1 = data1(:,2:3);

% Distance Likelihood Ratio Test
% Create a grid of points spanning the entire space
x1Range = max(coor_train(:,1)) - min(coor_train(:,1));
x2Range = max(coor_train(:,2)) - min(coor_train(:,2));
x1 = linspace(min(coor_train(:,1)) - 0.2*x1Range, max(coor_train(:,1)) + 0.2*x1Range, 251);
x2 = linspace(min(coor_train(:,2)) - 0.2*x2Range, max(coor_train(:,2)) + 0.2*x2Range, 251);
[xTest1, xTest2] = meshgrid(x1,x2);
xTest = [xTest1(:) xTest2(:)];

k = 18;
[score,lambda] = dlrt_func(k,data0,data1,xTest);
dsTest = reshape(score, length(x2), length(x1));

% Plot the decision statistic surface
figure()
set(gcf, 'Position',  [350, 0, 800, 600])
hold on, imagesc(x1([1 end]), x2([1 end]), dsTest,'HandleVisibility','off');
colorbar
axis([-2 2 -2 2])
title('Distance Likelihood Ratio Test with k = 18')

hold on, plot(data0(:,1),data0(:,2),'k*','LineWidth',3,'HandleVisibility','off');
hold on, plot(data1(:,1),data1(:,2),'r*','LineWidth',3,'HandleVisibility','off');

% KNN Model
% Training the KNN Classifier
KNN = fitcknn(coor_train,label,'NumNeighbors',k,'Distance','euclidean');
[decision_knn,score_knn,cost_knn] = predict(KNN,xTest);
boundary_knn = reshape(decision_knn, length(x2), length(x1));
% plot the majority rule boundary of KNN
hold on, contour(x1, x2, boundary_knn,'k','LineWidth',2);
legend('KNN Majority Rule Boundary')

%% Problem 7d
close all 
clc, clear
% Import training data from dataSetHorseshoes.csv file
filename = "dataSetHorseshoes.csv";
data = csvread(filename);
Z = zeros(size(data,1),1);
data = [Z,data];
label = data(:,2);
data0 = data(label==0,:);
data1 = data(label==1,:);
data0 = data0(randperm(size(data0,1)),:);
data1 = data1(randperm(size(data1,1)),:);

% Divide data into folds
M = 10;
L = length(data0)/M;
for i = 1:M
    data0(L*(i-1)+1 : L*i) = i;
    data1(L*(i-1)+1 : L*i) = i;
end
data = [data0; data1];
fold = data(:,1);

% Define Pd and Pf
threshold_s = size(data,1)/M + 2;
P_d_knn = zeros(threshold_s,M);
P_f_knn = zeros(threshold_s,M);
P_d = zeros(threshold_s,M);
P_f = zeros(threshold_s,M);

for m = 1:M
    % Train data
    data_train = data(fold~=m,:);
    label_train = data_train(:,2);                  % the label
    coor_train = data_train(:,3:4);                 % x and y coordinates
    data0_train = data_train(label_train==0,:);
    data1_train = data_train(label_train==1,:);
    data0_train = data0_train(:,3:4);
    data1_train = data1_train(:,3:4);

    % Test data
    data_test = data(fold==m,:);
    label_test = data_test(:,2);
    coor_test = data_test(:,3:4);  
    
    % KNN Classifier
    k_knn = 6;
    KNN = fitcknn(coor_train,label_train,'NumNeighbors',k_knn,'Distance','euclidean');
    % ROC for testing data
    [decision_test,score_test,cost_test] = predict(KNN,coor_test);
    [P_f_knn(:,m),P_d_knn(:,m)] = ROC_curve(label_test,score_test(:,2),"all");

    % DLRT
    k = 3;
    [score,lambda] = dlrt_func(k,data0_train,data1_train,coor_test);
    % ROC for testing data
    [P_f(:,m),P_d(:,m)] = ROC_curve(label_test,lambda,"all"); 
end

Pf_ave = mean(P_f_knn');
Pd_ave = mean(P_d_knn');
figure(1)
plot(Pf_ave,Pd_ave,'LineWidth',2)
grid on
xlabel('Probability of False Alarm (P_F)','FontSize',14) 
ylabel('Probability of Detection (P_D)','FontSize',14)
title(['10-Fold Cross-Validatd Average ROC Curve with KNN k = 6'],'FontSize',14)

Pf = mean(P_f');
Pd = mean(P_d');
figure(2)
plot(Pf,Pd,'LineWidth',2)
grid on
xlabel('Probability of False Alarm (P_F)','FontSize',14) 
ylabel('Probability of Detection (P_D)','FontSize',14)
title(['10-Fold Cross-Validatd Average ROC Curve with DLRT k = 3'],'FontSize',14)

% -------------------
% ROC Curve Function
% -------------------
function [X,Y] = ROC_curve(label_trains,statistics,threshold)
N = length(statistics);                         % length of the dataset
label_train_1 = sum(label_trains);              % number of H1 decision
label_train_0 = N - label_train_1;              % number of H0 decision
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
    lambda_h0 = zeros(label_train_0,1);         % decision statistics with label_train H0   
    index = 1;
    for i = 1:1:N
        if label_trains(i) == 0
            lambda_h0(index) = statistics(i);
            index = index + 1;
        end
    end
    
    if threshold == "H0"                        % every H0 decision statistics as threshold
        fprintf("Case (4): H0\t\t");
        T = [-Inf; sort(lambda_h0); Inf];
        
    elseif threshold == "interval"              % linearly sample P_f at interval 0.01
        fprintf("Case (5): interval\t");
        h0_sorted = sort(lambda_h0);
        if label_train_0 >= 100
            n = floor(label_train_0*0.01);
        else
            n = 1;
        end
        T = [h0_sorted(1:n:label_train_0); Inf];
    end
end
% fprintf("length of threshold: %d\n", length(T));

% Calculate prob of detection (Y) and
% prob of false alarm (X)
X = zeros(length(T),1);                         % x coor_traindinate or P_f
Y = zeros(length(T),1);                         % y coor_traindinate or P_d
for i = 1:1:length(T)
    count_d = 0;
    count_f = 0;
    for j = 1:1:N
        if statistics(j) >= T(i)                % if decision statistic > threshold
            if label_trains(j) == 1
                count_d = count_d + 1;          % add 1 to the H1 decision statistic
            else
                count_f = count_f + 1;          % add 1 to the H0 decision statistic
            end
        end
    end
    X(i) = count_f/label_train_0;               % Pf = (#H0 decision stats>threshold)/total H0 decision stats
    Y(i) = count_d/label_train_1;               % Pd = (#H1 decision stats>threshold)/total H1 decision stats
end    
end
