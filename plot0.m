X = csvread('output0.csv');
figure(1)
plot(X(:,1),X(:,2))
xlabel('time')
ylabel('window size')
xlim([0,50])

figure(2)
plot(X(:,1),X(:,3))
xlabel('time')
ylabel('packet delay')
xlim([0,50])

figure(3)
plot(X(:,1),X(:,4))
xlabel('time')
ylabel('flow rate')
xlim([0,50])

figure(4)
plot(X(:,1),X(:,5))
xlabel('time')
ylabel('Link Rate')
xlim([0,50])

figure(5)
plot(X(:,1),X(:,6))
xlabel('time')
ylabel('packet drop')
xlim([0,50])

figure(6)
plot(X(:,1),X(:,7)./1000)
xlabel('time')
ylabel('buffer occupancy (in kB)')
xlim([0,50])

