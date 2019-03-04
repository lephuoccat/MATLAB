%% Bayes Classifier
%% Problem 3
clc
clear
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

%% Problem 4
%(a)
m_class0 = mean(data0)';
m_class1 = mean(data1)';
cov_class0 = cov(data0);
cov_class1 = cov(data1);
% Create a grid of points spanning the entire space
x1Range = max(coor_train(:,1)) - min(coor_train(:,1));
x2Range = max(coor_train(:,2)) - min(coor_train(:,2));
x1 = linspace(min(coor_train(:,1)) - 0.2*x1Range, max(coor_train(:,1)) + 0.2*x1Range, 251);
x2 = linspace(min(coor_train(:,2)) - 0.2*x2Range, max(coor_train(:,2)) + 0.2*x2Range, 251);
[xTest1, xTest2] = meshgrid(x1,x2);
xTest = [xTest1(:) xTest2(:)]';

% The general Bayes model
g0 = zeros(1,length(xTest));
g1 = zeros(1,length(xTest));
score = zeros(1,length(xTest));
C0 = inv(cov_class0);
C1 = inv(cov_class1);

for i = 1:length(xTest)
    g0(i) = xTest(:,i)'*(-0.5.*C0)*xTest(:,i) + (C0*m_class0)' * xTest(:,i) + ...
        (-0.5.*m_class0'*C0*m_class0 - log(det(cov_class0)) + log(0.5));
    g1(i) = xTest(:,i)'*(-0.5.*C1)*xTest(:,i) + (C1*m_class1)' * xTest(:,i) + ...
        (-0.5.*m_class1'*C1*m_class1 - log(det(cov_class1)) + log(0.5));
    score(i) = (g1(i) >= g0(i));
end
dsTest = reshape(score, length(x2), length(x1));

% Plot the decision statistic surface
figure()
set(gcf, 'Position',  [350, 0, 800, 600])
hold on, imagesc(x1([1 end]), x2([1 end]), dsTest);
colorbar
axis([-4 10 -4 12])
title('General Bayes Classifier')

hold on, plot(data0(:,1),data0(:,2),'k*','LineWidth',3);
hold on, plot(data1(:,1),data1(:,2),'r*','LineWidth',3);

%% (b)
m_class0 = mean(data0)';
m_class1 = mean(data1)';
cov_class0 = cov(data0);
cov_class0(1,2) = 0;
cov_class0(2,1) = 0;
cov_class1 = cov(data1);
cov_class1(1,2) = 0;
cov_class1(2,1) = 0;
% Create a grid of points spanning the entire space
x1Range = max(coor_train(:,1)) - min(coor_train(:,1));
x2Range = max(coor_train(:,2)) - min(coor_train(:,2));
x1 = linspace(min(coor_train(:,1)) - 0.2*x1Range, max(coor_train(:,1)) + 0.2*x1Range, 251);
x2 = linspace(min(coor_train(:,2)) - 0.2*x2Range, max(coor_train(:,2)) + 0.2*x2Range, 251);
[xTest1, xTest2] = meshgrid(x1,x2);
xTest = [xTest1(:) xTest2(:)]';

% The general Bayes model
g0 = zeros(1,length(xTest));
g1 = zeros(1,length(xTest));
score = zeros(1,length(xTest));
C0 = inv(cov_class0);
C1 = inv(cov_class1);

for i = 1:length(xTest)
    g0(i) = xTest(:,i)'*(-0.5.*C0)*xTest(:,i) + (C0*m_class0)' * xTest(:,i) + ...
        (-0.5.*m_class0'*C0*m_class0 - log(det(cov_class0)) + log(0.5));
    g1(i) = xTest(:,i)'*(-0.5.*C1)*xTest(:,i) + (C1*m_class1)' * xTest(:,i) + ...
        (-0.5.*m_class1'*C1*m_class1 - log(det(cov_class1)) + log(0.5));
    score(i) = (g1(i) >= g0(i));
end
dsTest = reshape(score, length(x2), length(x1));

% Plot the decision statistic surface
figure()
set(gcf, 'Position',  [350, 0, 800, 600])
hold on, imagesc(x1([1 end]), x2([1 end]), dsTest);
colorbar
axis([-4 10 -4 12])
title('Bayes Classifier with independent features')

hold on, plot(data0(:,1),data0(:,2),'k*','LineWidth',3);
hold on, plot(data1(:,1),data1(:,2),'r*','LineWidth',3);


%% (c)
m_class0 = mean(data0)';
m_class1 = mean(data1)';
data = [data0; data1];
cov_class0 = cov(data);
cov_class1 = cov_class0;
% Create a grid of points spanning the entire space
x1Range = max(coor_train(:,1)) - min(coor_train(:,1));
x2Range = max(coor_train(:,2)) - min(coor_train(:,2));
x1 = linspace(min(coor_train(:,1)) - 0.2*x1Range, max(coor_train(:,1)) + 0.2*x1Range, 251);
x2 = linspace(min(coor_train(:,2)) - 0.2*x2Range, max(coor_train(:,2)) + 0.2*x2Range, 251);
[xTest1, xTest2] = meshgrid(x1,x2);
xTest = [xTest1(:) xTest2(:)]';

% The general Bayes model
g0 = zeros(1,length(xTest));
g1 = zeros(1,length(xTest));
score = zeros(1,length(xTest));
C0 = inv(cov_class0);
C1 = inv(cov_class1);

for i = 1:length(xTest)
    g0(i) = xTest(:,i)'*(-0.5.*C0)*xTest(:,i) + (C0*m_class0)' * xTest(:,i) + ...
        (-0.5.*m_class0'*C0*m_class0 - log(det(cov_class0)) + log(0.5));
    g1(i) = xTest(:,i)'*(-0.5.*C1)*xTest(:,i) + (C1*m_class1)' * xTest(:,i) + ...
        (-0.5.*m_class1'*C1*m_class1 - log(det(cov_class1)) + log(0.5));
    score(i) = (g1(i) >= g0(i));
end
dsTest = reshape(score, length(x2), length(x1));

% Plot the decision statistic surface
figure()
set(gcf, 'Position',  [350, 0, 800, 600])
hold on, imagesc(x1([1 end]), x2([1 end]), dsTest);
colorbar
axis([-4 10 -4 12])
title('Bayes Classifier with same covariance matrix')

hold on, plot(data0(:,1),data0(:,2),'k*','LineWidth',3);
hold on, plot(data1(:,1),data1(:,2),'r*','LineWidth',3);

%% (d)
m_class0 = mean(data0)';
m_class1 = mean(data1)';
data = [data0; data1];
cov_class0 = cov(data);
cov_class0(1,2) = 0;
cov_class0(2,1) = 0;
cov_class1 = cov_class0;
cov_class1(1,2) = 0;
cov_class1(2,1) = 0;
% Create a grid of points spanning the entire space
x1Range = max(coor_train(:,1)) - min(coor_train(:,1));
x2Range = max(coor_train(:,2)) - min(coor_train(:,2));
x1 = linspace(min(coor_train(:,1)) - 0.2*x1Range, max(coor_train(:,1)) + 0.2*x1Range, 251);
x2 = linspace(min(coor_train(:,2)) - 0.2*x2Range, max(coor_train(:,2)) + 0.2*x2Range, 251);
[xTest1, xTest2] = meshgrid(x1,x2);
xTest = [xTest1(:) xTest2(:)]';

% The general Bayes model
g0 = zeros(1,length(xTest));
g1 = zeros(1,length(xTest));
score = zeros(1,length(xTest));
C0 = inv(cov_class0);
C1 = inv(cov_class1);

for i = 1:length(xTest)
    g0(i) = xTest(:,i)'*(-0.5.*C0)*xTest(:,i) + (C0*m_class0)' * xTest(:,i) + ...
        (-0.5.*m_class0'*C0*m_class0 - log(det(cov_class0)) + log(0.5));
    g1(i) = xTest(:,i)'*(-0.5.*C1)*xTest(:,i) + (C1*m_class1)' * xTest(:,i) + ...
        (-0.5.*m_class1'*C1*m_class1 - log(det(cov_class1)) + log(0.5));
    score(i) = (g1(i) >= g0(i));
end
dsTest = reshape(score, length(x2), length(x1));

% Plot the decision statistic surface
figure()
set(gcf, 'Position',  [350, 0, 800, 600])
hold on, imagesc(x1([1 end]), x2([1 end]), dsTest);
colorbar
axis([-4 10 -4 12])
title('Bayes Classifier with same covariance matrix and independent features')

hold on, plot(data0(:,1),data0(:,2),'k*','LineWidth',3);
hold on, plot(data1(:,1),data1(:,2),'r*','LineWidth',3);
