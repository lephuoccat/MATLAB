clear
% Import data from dataSetCrossValWithKeys.csv file
filename = "dataSetCrossValWithKeys.csv";
data = csvread(filename);                       % read data file
fold = data(:,1);

train_data = data(fold==1,:);
label_train = train_data(:,2);
train0 = train_data(label_train==0,:);
train1 = train_data(label_train==1,:);
figure(1), plot(train0(:,3),train0(:,4),'r*')
hold on, plot(train1(:,3),train1(:,4),'b*')
title('dataSetCrossValWithKeys.csv Fold 1')
legend('Class 0', 'Class 1');

test_data = data(fold==2,:);
label_test = test_data(:,2);
test0 = test_data(label_test==0,:);
test1 = test_data(label_test==1,:);
figure(2), plot(test0(:,3),test0(:,4),'r*')
hold on, plot(test1(:,3),test1(:,4),'b*')
title('dataSetCrossValWithKeys.csv Fold 2')
legend('Class 0', 'Class 1');
