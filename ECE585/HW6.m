%% Rapidly-varying phase ROC
clear
clc
D = [1,2,4,16];
M = 20;
phi = linspace(0,1,M);
x = linspace(0,3,30);

for d = 1:length(D)
    s = zeros(1,30*M);
    for m = 1:M
        s(1+30*(m-1):30+30*(m-1)) = cos(2*pi*x + phi(m));
        E = sum(s(1+30*(m-1):30+30*(m-1)).^2);
        A = sqrt(D(d)/(M*E));
        s(1+30*(m-1):30+30*(m-1)) = s(1+30*(m-1):30+30*(m-1)) * A;
    end

    trials = 1000;
    lambda_0 = ones(trials,1);                 % lambda|H0
    lambda_1 = ones(trials,1);                 % lambda|H1
    for i = 1:1:trials
        noise = normrnd(0,1,[1,length(s)]);
        x0 = noise;
        x1 = s + noise;
        for m = 1:M
            r0 = sqrt((sum(x0(1+30*(m-1):30+30*(m-1)).*A.*cos(2*pi*x))).^2 + ...
                (sum(x0(1+30*(m-1):30+30*(m-1)).*A.*sin(2*pi*x))).^2);
            lambda_0(i) = lambda_0(i) * exp(-D(d)/M) * besseli(0,r0);

            r1 = sqrt((sum(x1(1+30*(m-1):30+30*(m-1)).*A.*cos(2*pi*x))).^2 + ...
                (sum(x1(1+30*(m-1):30+30*(m-1)).*A.*sin(2*pi*x))).^2);
            lambda_1(i) = lambda_1(i) * exp(-D(d)/M) * besseli(0,r1);
        end
    end

    beta = sort(lambda_0)';
    W = [-Inf beta Inf];                        % threshold
    P_d = zeros(length(W),1);                   % prob of detection
    P_f = zeros(length(W),1);                   % prob of false alarm
    
    % Calculuate P_d and P_f
    for i = 1:1:length(W)
        P_d(i) = sum(lambda_1 > W(i))/trials;
        P_f(i) = sum(lambda_0 > W(i))/trials;
    end
    figure(1), plot(P_f, P_d,'LineWidth',2)
    hold on
    
    normal_x = norminv(P_f,0,1);
    normal_y = norminv(P_d,0,1);
    figure(2), plot(normal_x,normal_y,'LineWidth',2)
    hold on
end

figure(1), plot([0,1],[0,1],'b')
grid on
title(['ROC for Rapidly-Varying Phase Case M = ' num2str(M)],'FontSize',14)
legend({"d^2 = 1","d^2 = 2","d^2 = 4","d^2 = 16"},'FontSize',14)
xlabel('Probability of False Alarm (P_f)','FontSize',14)
ylabel('Probability of Detection (P_d)','FontSize',14)

figure(2)
Pd = [0.0001 0.01 0.2 0.5 0.8 0.99 0.9999];
Pf = [0.0001 0.01 0.2 0.5 0.8 0.99 0.9999];
xtest = norminv(Pf,0,1);
ytest = norminv(Pd,0,1);
set(gca,'XTick',xtest)
set(gca,'XTickLabel',Pf)
set(gca,'YTick',ytest)
set(gca,'YTickLabel',Pd)
axis([-3.7 3.7 -3.7 3.7])
grid on
title(['ROC for Rapidly-Varying Phase Case M = ' num2str(M)],'FontSize',14)
xlabel('Probability of False Alarm (P_f)','FontSize',14)
ylabel('Probability of Detection (P_d)','FontSize',14)
legend({"d^2 = 1","d^2 = 2","d^2 = 4","d^2 = 16"},'FontSize',14)

%% Compare rapidly-varying phase vs SKEP
clear
clc
D = [1,2,4,16];
M = 20;
phi = linspace(0,1,M);
phi_skep = zeros(1,M);
x = linspace(0,3,30);

for d = 1:length(D)
    s = zeros(1,30*M);
    s_skep = zeros(1,30*M);
    A = zeros(1,M);
    for m = 1:M
        s(1+30*(m-1):30+30*(m-1)) = cos(2*pi*x + phi(m));
        E = sum(s(1+30*(m-1):30+30*(m-1)).^2);
        A(m) = sqrt(D(d)/(M*E));
        s(1+30*(m-1):30+30*(m-1)) = s(1+30*(m-1):30+30*(m-1)) * A(m);
        
        s_skep(1+30*(m-1):30+30*(m-1)) = cos(2*pi*x + phi(m));
        E = sum(s_skep(1+30*(m-1):30+30*(m-1)).^2);
        s_skep(1+30*(m-1):30+30*(m-1)) = s_skep(1+30*(m-1):30+30*(m-1)) * sqrt(D(d)/(M*E));
    end

    trials = 1000;
    lambda_0 = ones(trials,1);                 % lambda|H0
    lambda_1 = ones(trials,1);                 % lambda|H1
    lambda_0_skep = ones(trials,1);                 
    lambda_1_skep = ones(trials,1);         
    for i = 1:1:trials
        noise = normrnd(0,1,[1,length(s)]);
        x0 = noise;
        x1 = s + noise;
        x0_skep = noise;
        x1_skep = s_skep + noise;
        
        r0_cos = 0;
        r0_sin = 0;
        r1_cos = 0;
        r1_sin = 0;
        for m = 1:M
            r0 = sqrt((sum(x0(1+30*(m-1):30+30*(m-1)).*A(m).*cos(2*pi*x))).^2 + ...
                (sum(x0(1+30*(m-1):30+30*(m-1)).*A(m).*sin(2*pi*x))).^2);
            lambda_0(i) = lambda_0(i) * exp(-D(d)/M) * besseli(0,r0);

            r1 = sqrt((sum(x1(1+30*(m-1):30+30*(m-1)).*A(m).*cos(2*pi*x))).^2 + ...
                (sum(x1(1+30*(m-1):30+30*(m-1)).*A(m).*sin(2*pi*x))).^2);
            lambda_1(i) = lambda_1(i) * exp(-D(d)/M) * besseli(0,r1);
            
            
            r0_cos = r0_cos + sum(x0(1+30*(m-1):30+30*(m-1)).*A(m).*cos(2*pi*x));
            r0_sin = r0_sin + sum(x0(1+30*(m-1):30+30*(m-1)).*A(m).*sin(2*pi*x));
            r1_cos = r1_cos + sum(x1(1+30*(m-1):30+30*(m-1)).*A(m).*cos(2*pi*x));
            r1_sin = r1_sin + sum(x1(1+30*(m-1):30+30*(m-1)).*A(m).*sin(2*pi*x));
        end
        r0_skep = sqrt(r0_cos.^2 + r0_sin.^2);
        r1_skep = sqrt(r1_cos.^2 + r1_sin.^2);        
        lambda_0_skep(i) = exp(-D(d)) * besseli(0,r0_skep);
        lambda_1_skep(i) = exp(-D(d)) * besseli(0,r1_skep);
    end

    beta = sort([lambda_0;lambda_0_skep])';
    W = [-Inf beta Inf];                        % threshold
    P_d = zeros(length(W),1);                   % prob of detection
    P_f = zeros(length(W),1);                   % prob of false alarm
    P_d_skep = zeros(length(W),1);                   % prob of detection
    P_f_skep = zeros(length(W),1);                   % prob of false alarm
    % Calculuate P_d and P_f
    for i = 1:1:length(W)
        P_d(i) = sum(lambda_1 > W(i))/trials;
        P_f(i) = sum(lambda_0 > W(i))/trials;
        P_d_skep(i) = sum(lambda_1_skep > W(i))/trials;
        P_f_skep(i) = sum(lambda_0_skep > W(i))/trials;
    end
    figure(1), plot(P_f, P_d,'b',P_f_skep, P_d_skep,'r','LineWidth',2)
    hold on
    
    normal_x = norminv(P_f,0,1);
    normal_y = norminv(P_d,0,1);
    normal_x_skep = norminv(P_f_skep,0,1);
    normal_y_skep = norminv(P_d_skep,0,1);
    figure(2), plot(normal_x,normal_y,'b',normal_x_skep,normal_y_skep,'r','LineWidth',2)
    hold on
end

figure(1)
grid on
title(['ROC for Rapidly-Varying Phase Case M = ' num2str(M)],'FontSize',14)
legend({"rapidly-varying phase","SKEP"},'FontSize',14)
xlabel('Probability of False Alarm (P_f)','FontSize',14)
ylabel('Probability of Detection (P_d)','FontSize',14)

figure(2)
Pd = [0.0001 0.01 0.2 0.5 0.8 0.99 0.9999];
Pf = [0.0001 0.01 0.2 0.5 0.8 0.99 0.9999];
xtest = norminv(Pf,0,1);
ytest = norminv(Pd,0,1);
set(gca,'XTick',xtest)
set(gca,'XTickLabel',Pf)
set(gca,'YTick',ytest)
set(gca,'YTickLabel',Pd)
axis([-3.7 3.7 -3.7 3.7])
grid on
title(['ROC for Rapidly-Varying Phase Case M = ' num2str(M)],'FontSize',14)
xlabel('Probability of False Alarm (P_f)','FontSize',14)
ylabel('Probability of Detection (P_d)','FontSize',14)
legend({"rapidly-varying phase","SKEP"},'FontSize',14)

%% SKEP algorithm with rapidly-varying phase data
clear
clc
D = [1,2,4,16];
M = 20;
phi = linspace(0,1,M);
x = linspace(0,3,30);

for d = 1:length(D)
    s = zeros(1,30*M);
    A = zeros(1,M);
    for m = 1:M
        s(1+30*(m-1):30+30*(m-1)) = cos(2*pi*x + phi(m));
        E = sum(s(1+30*(m-1):30+30*(m-1)).^2);
        A(m) = sqrt(D(d)/(M*E));
        s(1+30*(m-1):30+30*(m-1)) = s(1+30*(m-1):30+30*(m-1)) * A(m);
    end

    trials = 1000;
    lambda_0 = ones(trials,1);                 % lambda|H0
    lambda_1 = ones(trials,1);                 % lambda|H1
    for i = 1:1:trials
        noise = normrnd(0,1,[1,length(s)]);
        x0 = noise;
        x1 = s + noise;
        
        xx = [x,x,x,x,x, x,x,x,x,x, x,x,x,x,x, x,x,x,x,x];
        
        r0 = sqrt(sum((x0.*cos(2*pi*xx)).^2 + (x0.*sin(2*pi*xx)).^2));
        lambda_0(i) = exp(-D(d)) * besseli(0,r0);
 
        r1 = sqrt(sum((x1.*cos(2*pi*xx)).^2 + (x1.*sin(2*pi*xx)).^2));
        lambda_1(i) = exp(-D(d)) * besseli(0,r1);
    end

    beta = sort(lambda_0)';
    W = [-Inf beta Inf];                        % threshold
    P_d = zeros(length(W),1);                   % prob of detection
    P_f = zeros(length(W),1);                   % prob of false alarm
    
    % Calculuate P_d and P_f
    for i = 1:1:length(W)
        P_d(i) = sum(lambda_1 > W(i))/trials;
        P_f(i) = sum(lambda_0 > W(i))/trials;
    end
    figure(1), plot(P_f, P_d,'LineWidth',2)
    hold on
    
    normal_x = norminv(P_f,0,1);
    normal_y = norminv(P_d,0,1);
    figure(2), plot(normal_x,normal_y,'LineWidth',2)
    hold on
end

figure(1)
grid on
title(['ROC for Rapidly-Varying Phase Case M = ' num2str(M)],'FontSize',14)
legend({"d^2 = 1","d^2 = 2","d^2 = 4","d^2 = 16"},'FontSize',14)
xlabel('Probability of False Alarm (P_f)','FontSize',14)
ylabel('Probability of Detection (P_d)','FontSize',14)

figure(2)
Pd = [0.0001 0.01 0.2 0.5 0.8 0.99 0.9999];
Pf = [0.0001 0.01 0.2 0.5 0.8 0.99 0.9999];
xtest = norminv(Pf,0,1);
ytest = norminv(Pd,0,1);
set(gca,'XTick',xtest)
set(gca,'XTickLabel',Pf)
set(gca,'YTick',ytest)
set(gca,'YTickLabel',Pd)
axis([-3.7 3.7 -3.7 3.7])
grid on
title(['ROC for Rapidly-Varying Phase Case M = ' num2str(M)],'FontSize',14)
xlabel('Probability of False Alarm (P_f)','FontSize',14)
ylabel('Probability of Detection (P_d)','FontSize',14)
legend({"d^2 = 1","d^2 = 2","d^2 = 4","d^2 = 16"},'FontSize',14)

%% Rapidly-varying phase algorithm with SKEP data
clear
clc
D = [1,2,4,16];
M = 20;
phi = zeros(1,M);
x = linspace(0,3,30);

for d = 1:length(D)
    s = zeros(1,30*M);
    A = zeros(1,M);
    for m = 1:M
        s(1+30*(m-1):30+30*(m-1)) = cos(2*pi*x + phi(m));
        E = sum(s(1+30*(m-1):30+30*(m-1)).^2);
        A(m) = sqrt(D(d)/(M*E));
        s(1+30*(m-1):30+30*(m-1)) = s(1+30*(m-1):30+30*(m-1)) * A(m);
    end

    trials = 1000;
    lambda_0 = ones(trials,1);                 % lambda|H0
    lambda_1 = ones(trials,1);                 % lambda|H1
    for i = 1:1:trials
        noise = normrnd(0,1,[1,length(s)]);
        x0 = noise;
        x1 = s + noise;
        for m = 1:M
            r0 = sqrt((sum(x0(1+30*(m-1):30+30*(m-1)).*A(m).*cos(2*pi*x))).^2 +...
                (sum(x0(1+30*(m-1):30+30*(m-1)).*A(m).*sin(2*pi*x))).^2);
            lambda_0(i) = lambda_0(i) * exp(-D(d)/M) * besseli(0,r0);

            r1 = sqrt((sum(x1(1+30*(m-1):30+30*(m-1)).*A(m).*cos(2*pi*x))).^2 +...
                (sum(x1(1+30*(m-1):30+30*(m-1)).*A(m).*sin(2*pi*x))).^2);
            lambda_1(i) = lambda_1(i) * exp(-D(d)/M) * besseli(0,r1);
        end
    end

    beta = sort(lambda_0)';
    W = [-Inf beta Inf];                        % threshold
    P_d = zeros(length(W),1);                   % prob of detection
    P_f = zeros(length(W),1);                   % prob of false alarm
    
    % Calculuate P_d and P_f
    for i = 1:1:length(W)
        P_d(i) = sum(lambda_1 > W(i))/trials;
        P_f(i) = sum(lambda_0 > W(i))/trials;
    end
    figure(1), plot(P_f, P_d,'LineWidth',2)
    hold on
    
    normal_x = norminv(P_f,0,1);
    normal_y = norminv(P_d,0,1);
    figure(2), plot(normal_x,normal_y,'LineWidth',2)
    hold on
end

figure(1)
grid on
title(['ROC for Rapidly-Varying Phase Case M = ' num2str(M)],'FontSize',14)
legend({"d^2 = 1","d^2 = 2","d^2 = 4","d^2 = 16"},'FontSize',14)
xlabel('Probability of False Alarm (P_f)','FontSize',14)
ylabel('Probability of Detection (P_d)','FontSize',14)

figure(2)
Pd = [0.0001 0.01 0.2 0.5 0.8 0.99 0.9999];
Pf = [0.0001 0.01 0.2 0.5 0.8 0.99 0.9999];
xtest = norminv(Pf,0,1);
ytest = norminv(Pd,0,1);
set(gca,'XTick',xtest)
set(gca,'XTickLabel',Pf)
set(gca,'YTick',ytest)
set(gca,'YTickLabel',Pd)
axis([-3.7 3.7 -3.7 3.7])
grid on
title(['ROC for Rapidly-Varying Phase Case M = ' num2str(M)],'FontSize',14)
xlabel('Probability of False Alarm (P_f)','FontSize',14)
ylabel('Probability of Detection (P_d)','FontSize',14)
legend({"d^2 = 1","d^2 = 2","d^2 = 4","d^2 = 16"},'FontSize',14)
