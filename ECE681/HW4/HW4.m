% --------------
% Name: Cat Le
% ECE 681 - HW4
% --------------
%% Problem 1
close all 
clc, clear
% Import data from dataSetCrossValWithKeys.csv file
filename = "dataSetCrossValWithKeys.csv";
data = csvread(filename);                       % read data file
fold = data(:,1);
label_data = data(:,2);

M = 2;
for m = 1:M
    % Testdata
    data_test = data(fold==m,:);
    label_test = data_test(:,2);
    coor_test = data_test(:,3:4);  
    N_test = length(label_test);
    N1_test = sum(label_test);
    N0_test = N_test - N1_test;

    % Import training data from dataSetCrossValWithKeys.csv file
    data_train = data(fold~=m,:);
    label_train = data_train(:,2);                  % the label
    coor_train = data_train(:,3:4);                 % x and y coordinates

    x_class0 = coor_train(label_train==0,1);        % x coordinates of H0
    y_class0 = coor_train(label_train==0,2);        % y coordinates of H0
    x_class1 = coor_train(label_train==1,1);        % x coordinates of H1
    y_class1 = coor_train(label_train==1,2);        % y coordinates of H1
    N_train = length(label_train);
    N1_train = sum(label_train);
    N0_train = N_train - N1_train;

    % KNN Classifier
    k = 5;
    % Training the KNN Classifier
    KNN = fitcknn(coor_train,label_train,'NumNeighbors',k,'Distance','euclidean');

    % Create a grid of points spanning the entire space
    x1Range = max(coor_train(:,1)) - min(coor_train(:,1));
    x2Range = max(coor_train(:,2)) - min(coor_train(:,2));
    x1 = linspace(min(coor_train(:,1)) - 0.2*x1Range, max(coor_train(:,1)) + 0.2*x1Range, 251);
    x2 = linspace(min(coor_train(:,2)) - 0.2*x2Range, max(coor_train(:,2)) + 0.2*x2Range, 251);
    [xTest1, xTest2] = meshgrid(x1,x2);
    xTest = [xTest1(:) xTest2(:)];

    % prediction
    [decision,score,cost] = predict(KNN,xTest);
    dsTest = reshape(score(:,2), length(x2), length(x1));
    boundary = reshape(decision, length(x2), length(x1));

    % ROC for testing data
    [decision_test,score_test,cost_test] = predict(KNN,coor_test);
    [P_f(:,m),P_d(:,m)] = ROC_curve(label_test,score_test(:,2),"all");
    figure(1), set(gcf, 'Position',  [400, 0, 600, 600])
    hold on, plot(P_f,P_d,'LineWidth',2)
    hold on, grid on
    xlabel('Probability of False Alarm (P_F)','FontSize',14) 
    ylabel('Probability of Detection (P_D)','FontSize',14)
    title(['ROC Curve with testing data KNN k = 5'],'FontSize',14) 
end
figure(1)
legend('Fold 1 as test data','Fold 2 as test data')

Pf_ave = mean(P_f');
Pd_ave = mean(P_d');
figure(2)
plot(Pf_ave,Pd_ave,'LineWidth',2)
grid on
xlabel('Probability of False Alarm (P_F)','FontSize',14) 
ylabel('Probability of Detection (P_D)','FontSize',14)
title(['Average ROC Curve with testing data'],'FontSize',14)

%% 1c
close all 
clc, clear
% Import data from dataSetCrossValWithKeys.csv file
filename = "dataSetCrossValWithKeys.csv";
data = csvread(filename);                       % read data file
label_data = data(:,2);
data0 = data(label_data==0,:);
data1 = data(label_data==1,:);
data0 = data0(randperm(size(data0, 1)), :);
data1 = data1(randperm(size(data1, 1)), :);

M = 2;
L = length(data0)/M;
for i = 1:M
    data0(L*(i-1)+1 : L*i) = i;
    data1(L*(i-1)+1 : L*i) = i;
end

data = [data0; data1];
fold = data(:,1);

% Define Pd and Pf
P_d = zeros(102,M);
P_f = zeros(102,M);

for m = 1:M
    % Testdata
    data_test = data(fold==m,:);
    label_test = data_test(:,2);
    coor_test = data_test(:,3:4);  
    N_test = length(label_test);
    N1_test = sum(label_test);
    N0_test = N_test - N1_test;

    % Import training data from dataSetCrossValWithKeys.csv file
    data_train = data(fold~=m,:);
    label_train = data_train(:,2);                  % the label
    coor_train = data_train(:,3:4);                 % x and y coordinates

    x_class0 = coor_train(label_train==0,1);        % x coordinates of H0
    y_class0 = coor_train(label_train==0,2);        % y coordinates of H0
    x_class1 = coor_train(label_train==1,1);        % x coordinates of H1
    y_class1 = coor_train(label_train==1,2);        % y coordinates of H1
    N_train = length(label_train);
    N1_train = sum(label_train);
    N0_train = N_train - N1_train;

    % KNN Classifier
    k = 5;
    % Training the KNN Classifier
    KNN = fitcknn(coor_train,label_train,'NumNeighbors',k,'Distance','euclidean');

    % Create a grid of points spanning the entire space
    x1Range = max(coor_train(:,1)) - min(coor_train(:,1));
    x2Range = max(coor_train(:,2)) - min(coor_train(:,2));
    x1 = linspace(min(coor_train(:,1)) - 0.2*x1Range, max(coor_train(:,1)) + 0.2*x1Range, 251);
    x2 = linspace(min(coor_train(:,2)) - 0.2*x2Range, max(coor_train(:,2)) + 0.2*x2Range, 251);
    [xTest1, xTest2] = meshgrid(x1,x2);
    xTest = [xTest1(:) xTest2(:)];

    % prediction
    [decision,score,cost] = predict(KNN,xTest);
    dsTest = reshape(score(:,2), length(x2), length(x1));
    boundary = reshape(decision, length(x2), length(x1));

    % ROC for testing data
    [decision_test,score_test,cost_test] = predict(KNN,coor_test);
    [P_f(:,m),P_d(:,m)] = ROC_curve(label_test,score_test(:,2),"all");
    figure(1), set(gcf, 'Position',  [400, 0, 600, 600])
    hold on, plot(P_f,P_d,'LineWidth',2)
    hold on, grid on
    xlabel('Probability of False Alarm (P_F)','FontSize',14) 
    ylabel('Probability of Detection (P_D)','FontSize',14)
    title(['ROC Curve with testing data KNN with k = 5'],'FontSize',14)
end

Pf_ave = mean(P_f');
Pd_ave = mean(P_d');
figure(2)
plot(Pf_ave,Pd_ave,'LineWidth',2)
grid on
xlabel('Probability of False Alarm (P_F)','FontSize',14) 
ylabel('Probability of Detection (P_D)','FontSize',14)
title(['Average ROC Curve with testing data'],'FontSize',14)


%% Problem 2
close all 
clc, clear
% Import training data from dataSetHorseshoes.csv file
filename = "dataSetHorseshoes.csv";
data = csvread(filename);                       % read data file
Z = zeros(400,1);
data = [Z, data];
label_data = data(:,2);
data0 = data(label_data==0,:);
data1 = data(label_data==1,:);
data0 = data0(randperm(size(data0, 1)), :);
data1 = data1(randperm(size(data1, 1)), :);

M = 10;
L = length(data0)/M;
for i = 1:M
    data0(L*(i-1)+1 : L*i) = i;
    data1(L*(i-1)+1 : L*i) = i;
end

data = [data0; data1];
fold = data(:,1);

for m = 1:1
    % Testdata
    data_test = data(fold==m,:);
    label_test = data_test(:,2);
    coor_test = data_test(:,3:4);  
    N_test = length(label_test);
    N1_test = sum(label_test);
    N0_test = N_test - N1_test;

    % Import training data from dataSetCrossValWithKeys.csv file
    data_train = data(fold~=m,:);
    label_train = data_train(:,2);                  % the label
    coor_train = data_train(:,3:4);                 % x and y coordinates

    x_class0 = coor_train(label_train==0,1);        % x coordinates of H0
    y_class0 = coor_train(label_train==0,2);        % y coordinates of H0
    x_class1 = coor_train(label_train==1,1);        % x coordinates of H1
    y_class1 = coor_train(label_train==1,2);        % y coordinates of H1
    N_train = length(label_train);
    N1_train = sum(label_train);
    N0_train = N_train - N1_train;

    % KNN Classifier
    k = [1:1:359];
    P_e_train = zeros(length(k),1);
    P_e_test = zeros(length(k),1);
    for index = 1:length(k)
        fprintf("\nKNN with k = %d\n", k(index));
        % Training the KNN Classifier
        KNN = fitcknn(coor_train,label_train,'NumNeighbors',k(index),'Distance','euclidean');

        % ROC for training data
        [decision_train,score_train,cost_train] = predict(KNN,coor_train);
        [P_f,P_d] = ROC_curve(label_train,score_train(:,2),"all");

        % Probability of correct detection for training data
        [P_cd_train,x_opt_train,y_opt_train] = max_Pcd(P_f,P_d,N_train,N0_train);
        P_e_train(index) = 1 - P_cd_train;
        fprintf("Training data: P_cd = %0.4f, at Pf = %0.4f, Pd = %0.4f \n",P_cd_train,x_opt_train,y_opt_train)

        % ROC for testing data
        [decision_test,score_test,cost_test] = predict(KNN,coor_test);
        [P_f,P_d] = ROC_curve(label_test,score_test(:,2),"all");

        % Probability of correct detection for testing data
        [P_cd_test,x_opt_test,y_opt_test] = max_Pcd(P_f,P_d,N_test,N0_test);
        P_e_test(index) = 1 - P_cd_test;
        fprintf("Testing data: P_cd = %0.4f, at Pf = %0.4f, Pd = %0.4f \n",P_cd_test,x_opt_test,y_opt_test)
    end

    dataMinPe = csvread('dataMinPe_full.csv');
    x = dataMinPe(:,1);
    y1 = dataMinPe(:,2);
    y2 = dataMinPe(:,3);
    
    figure(1), plot(N_train./k,P_e_train,'b','LineWidth',2)
    hold on, grid on
    plot(N_train./k,P_e_test,'r','LineWidth',2)
    
    plot(x,y1,'g','LineWidth',1)
    hold on
    plot(x,y2,'k','LineWidth',1)
    
    xlabel('N/k','FontSize',14)
    ylabel('Minimum probability of error (P_e)','FontSize',14)
    title('minP_e vs N/k','FontSize',14)
    legend({'training minP_e with 10-folds','testing minP_e with 10-folds'...
        'training minP_e','testing minP_e'},'FontSize',14)

end





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

% -------------
% Maximum P_cd
% -------------
function [P_cd,x_optimum,y_optimum] = max_Pcd(P_f,P_d,N,N0)
P_cd = 0;
P_H0 = N0/N;
P_H1 = 1 - P_H0;
for i = 1:1:length(P_f)
    if (P_H0*(1-P_f(i))+P_H1*P_d(i)) > P_cd
        P_cd = P_H0*(1-P_f(i))+P_H1*P_d(i);         % find max P_cd
        x_optimum = P_f(i);                         % and store coor_traindinates (Pf,Pd)
        y_optimum = P_d(i);
    end
end
    plot(x_optimum,y_optimum,'k*','LineWidth',3,'HandleVisibility','off')
end