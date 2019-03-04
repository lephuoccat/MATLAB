%% M = 10, d1 = [1, 16], k = 50
clc
clear
close all
M = 10;
d = 16;
K = 50;
x = linspace(0,pi/2,K);
s = zeros(M,K);
for theta = 1:M
    s(theta,:) = sin(2*theta.*x);
end
E = sum(s(1,:)'.^2);
s = s./sqrt(E/d);
data = s;
data(2:M,:) = 0;

trials = 100;
lambda_H0 = zeros(trials,K+1);
lambda_H1 = zeros(trials,K+1);
P_s_X0 = zeros(M,K+1);
P_s_X0(:,1) = 1/M;
P_s_X1 = zeros(M,K+1);
P_s_X1(:,1) = 1/M;

% brute-force simulate n trials
for count = 1:trials
    for k = 1:K
        lambda_SKE0 = zeros(M,1);
        lambda_SKE1 = zeros(M,1);
        l0 = 0;
        l1 = 0;
        for m = 1:M
            noise = normrnd(0,1,[1,k]);
            lambda_SKE0(m) = exp(sum(noise' .* s(m,1:k)') - d/2);
            lambda_SKE1(m) = exp(sum((data(m,1:k) + noise)' .* s(m,1:k)') - d/2);
            
            l0 = l0 + lambda_SKE0(m) .* P_s_X0(m,k);
            l1 = l1 + lambda_SKE1(m) .* P_s_X1(m,k);
        end
        
        % update P_s_X0
        for m = 1:M
            P_s_X0(m,k+1) = (lambda_SKE0(m) .* P_s_X0(m,k)) ./ l0;
            P_s_X1(m,k+1) = (lambda_SKE1(m) .* P_s_X1(m,k)) ./ l1;
        end
        
        % update lambda
        lambda_H0(count,k+1) = lambda_H0(count,k) + log(l0);
        lambda_H1(count,k+1) = lambda_H1(count,k) + log(l1);
    end
    
    % plot ln(lambda)
    plot_index = floor((count-1)/10)+1;
    
    figure(plot_index)
    subplot(10,11,1 + 11*(rem(count-10*(plot_index-1),11)-1))
    plot([0:K],lambda_H0(count,:),'b')
    hold on
    plot([0:K],lambda_H1(count,:),'r','LineWidth',2)
    
    % plot P(s|X)
    for index = 1:M
        subplot(10,11,1 + index + 11*(rem(count-10*(plot_index-1),11)-1))
        plot([0:K],P_s_X0(index,:),'b')
        hold on
        plot([0:K],P_s_X1(index,:),'r','LineWidth',2)
    end
    
    fprintf('Current iteration: %d\n',count);
end

%% ROC plot
figure()
trials = 100;
for index = 25
    %9:7:51
    current_lambda0 = lambda_H0(:,index);
    current_lambda1 = lambda_H1(:,index);
    beta = [current_lambda0' current_lambda1'];
    W = [-Inf sort(beta) Inf];                        % threshold
    P_d = zeros(length(W),1);                   % prob of detection
    P_f = zeros(length(W),1);                   % prob of false alarm
    x = zeros(length(W),1);                     % prob of detection
    y = zeros(length(W),1);                     % prob of false alarm

    % Calculuate P_d and P_f
    for i = 1:1:length(W)
        P_d(i) = sum(current_lambda1 > W(i))/(trials);
        P_f(i) = sum(current_lambda0 > W(i))/(trials);
        x(i) = norminv(P_f(i),0,1);
        y(i) = norminv(P_d(i),0,1);
    end        

    plot(P_f,P_d,'LineWidth',2)
    % plot(x,y,'LineWidth',2)
    hold on
end
plot([0,1],[0,1])
hold on
plot([1,0],[0,1])
grid on
title('ROC with M = 10, d^2 = 16','FontSize',14)
xlabel('P_f','FontSize',14)
ylabel('P_d','FontSize',14)
% legend({'k = 8','k = 15','k = 22','k = 29','k = 36','k = 43','k = 50'},'FontSize',14)

%% SNR vs k
k1 = [5:5:50];
d1 = [0 0 0 0.05 0.4 2 4 10 11 16];
figure()
plot(k1,d1,'LineWidth',2)
grid on
title('Corresponding SKE d^2 for d^2 = 1','FontSize',14)
xlabel('k','FontSize',14)
ylabel('SKE d^2','FontSize',14)

k2 = [5 10 15 16 17 18 19 20 21 22 23 24 25 50];
d2 = [0 0.01 0.5 1 2 4 6 10 16 21.5 21.5 21.5 50 50];
figure()
plot(k2,d2,'LineWidth',2)
grid on
title('Corresponding SKE d^2 for d^2 = 16','FontSize',14)
xlabel('k','FontSize',14)
ylabel('SKE d^2','FontSize',14)
