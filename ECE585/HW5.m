% M = 10, d1 = 1, k = 50
clc
clear
M = 10;
d = 1;
K = 50;
x = linspace(0,2*pi,K);
s = zeros(M,K);
for theta = 1:M
    s(theta,:) = sin(theta.*x);
end
E = sum(s(1,:)'.^2);
s = s./sqrt(E/d);

lambda_H0 = zeros(1,K+1);
lambda_H1 = zeros(1,K+1);
P_s_X0 = zeros(M,K+1);
P_s_X0(:,1) = 1/M;
P_s_X1 = zeros(M,K+1);
P_s_X1(:,1) = 1/M;
% brute-force simulate n trials
trials = 1;
for count = 1:trials
    for k = 1:K
        lambda_SKE0 = zeros(M,1);                 % lambda|H0
        lambda_SKE1 = zeros(M,1);                 % lambda|H1
        for m = 1:M
            noise = normrnd(0,1,[1,k]);
            lambda_SKE0(m) = exp(sum(noise' .* s(m,1:k)') - d/2);
            lambda_SKE1(m) = exp(sum((s(m,1:k) + noise)' .* s(m,1:k)') - d/2);
        end
        l0 = sum(lambda_SKE0 .* P_s_X0(m,k));
        l1 = sum(lambda_SKE1 .* P_s_X1(m,k));

        % update P_s_X0
        for m = 1:M
            P_s_X0(m,k+1) = P_s_X0(m,k) .* (lambda_SKE0(m) ./ l0);
            P_s_X1(m,k+1) = P_s_X1(m,k) .* (lambda_SKE1(m) ./ l1);
        end
        
        % update lambda
        lambda_H0(1,k+1) = lambda_H0(1,k) + log(l0);
        lambda_H1(1,k+1) = lambda_H1(1,k) + log(l1);
    end
    
    % plot ln(lambda)
    subplot(1,2,1)
    plot([0:K],lambda_H0,'b')
    hold on
    plot([0:K],lambda_H1,'r')
    
    % plot P(s|X)
    for index = 1:1
        subplot(1,2,index+1)
        plot([0:K],P_s_X0(index,:),'b')
        hold on
        plot([0:K],P_s_X1(index,:),'r')
    end
    
    fprintf('iteration = %d\n',count);
end