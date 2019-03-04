function [score,lambda] = dlrt_func(k,data0,data1,dataTest)

%initialization
score = zeros(size(dataTest,1),1);
lambda = zeros(size(dataTest,1),1);

dist0_list = zeros(size(data0,1),1);
dist1_list = zeros(size(data1,1),1);

%calc euclidean distances between each testing data point and the training
%data samples
for test_point = 1:size(dataTest,1)
    
    for train_point0 = 1:size(data0,1)
        dist0_list(train_point0) = sqrt(...
            sum((dataTest(test_point,:)-data0(train_point0,:)).^2));
    end
    
    for train_point1 = 1:size(data1,1)
        dist1_list(train_point1) = sqrt(...
            sum((dataTest(test_point,:)-data1(train_point1,:)).^2));
    end
    
    list0 = sort(dist0_list);
    list1 = sort(dist1_list);
    
    lambda(test_point) = 2 * (log(list0(k)) - log(list1(k)));
    score(test_point) = lambda(test_point) >= 0;
    
end




