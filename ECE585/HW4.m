%% (b)
close all
clc, clear

M = [1,10,100,1000];
for i = 1:length(M)
    m = M(i);
    d1 = [1,2,4,16];
    dM = log(1 - 1./m+ exp(d1)./m);

    figure()
    grid on, hold on

    D = dM;                                     % list of parameters 
    W = [-30:0.1:30];
    P_d_SKE = zeros(length(W),length(D));       % prob of detection
    P_f_SKE = zeros(length(W),length(D));       % prob of false alarm
    x_SKE = zeros(length(W),length(D));
    y_SKE = zeros(length(W),length(D));
    for index = 1:length(D)
        d = D(index);                           % d = E_s/var(n)^2    
        % Calculuate P_d and P_f
        for i = 1:1:length(W)
            P_f_SKE(i,index) = 1-normcdf(W(i),-d/2,sqrt(d));
            P_d_SKE(i,index) = 1-normcdf(W(i),d/2,sqrt(d));
        end

        x_SKE(:,index) = norminv(P_f_SKE(:,index),0,1);
        y_SKE(:,index) = norminv(P_d_SKE(:,index),0,1);

        plot(x_SKE(:,index),y_SKE(:,index),'LineWidth',2)
        hold on
    end

    Pd = [0.0001 0.01 0.2 0.5 0.8 0.99 0.9999];
    Pf = [0.0001 0.01 0.2 0.5 0.8 0.99 0.9999];
    x = norminv(Pf,0,1);
    y = norminv(Pd,0,1);
    set(gca,'XTick',x)
    set(gca,'XTickLabel',Pf)
    set(gca,'YTick',y)
    set(gca,'YTickLabel',Pd)
    axis([-3.7 3.7 -3.7 3.7])
    title(['ROC Curves for the M-Orthogonal Signal Case with M = ' num2str(m)],'FontSize',14)
    xlabel('Probability of False Alarm (P_f)','FontSize',14)
    ylabel('Probability of Detection (P_d)','FontSize',14)
    legend({['d_M^2 = ', num2str(dM(1))],['d_M^2 = ', num2str(dM(2))],['d_M^2 = ', num2str(dM(3))],['d_M^2 = ', num2str(dM(4))]})
end


%% (c)
close all
clc, clear

noise_var = 1;                                  % noise variance
noise_mean = 0;                                 % noise mean

M = [1,10,100,1000];
for j = 1:length(M)
    m = M(j);
    d1 = [1,2,4,16];
    
    figure()
    grid on, hold on
    
    for index = 1:1:length(d1)
        d = d1(index);                              % d = E_s/var(n)^2
        % Define the signal
        A = eye(m);                                 % create identity matrix of size MxM
        alpha = sqrt(d);                            % value of elements to get d = D(i)
        S = alpha.*A;                               % the known signal S
        data = S;
        data(2:m,:) = 0;

        % brute-force simulate n trials
        trials = 10000;
        lambda_0 = zeros(m,trials);                 % lambda|H0
        lambda_1 = zeros(m,trials);                 % lambda|H1
        
        for count = 1:1:trials
            noise = normrnd(noise_mean,noise_var,[m,m]);
            lambda_0(:,count) = exp(sum((noise.*S)') - d/2)/m;
            lambda_1(:,count) = exp(sum((data + noise).*S)' - d/2)/m;
        end
        
        if m==1
            l1 = lambda_1;
            l0 = lambda_0;
        else
            l1 = sum(lambda_1);
            l0 = sum(lambda_0);
        end
        
        beta = [-300:0.01:300];
        W = [-Inf beta Inf];                        % threshold
        P_d = zeros(length(W),1);                   % prob of detection
        P_f = zeros(length(W),1);                   % prob of false alarm
        x = zeros(length(W),1);                     % prob of detection
        y = zeros(length(W),1);                     % prob of false alarm
        
        % Calculuate P_d and P_f
        for i = 1:1:length(W)
            P_d(i) = sum(l1 > W(i))/(trials);
            P_f(i) = sum(l0 > W(i))/(trials);
            x(i) = norminv(P_f(i),0,1);
            y(i) = norminv(P_d(i),0,1);
        end        
        
        plot(x,y,'LineWidth',2)
        hold on
    end

    Pd = [0.00001 0.01 0.2 0.5 0.8 0.99 0.99999];
    Pf = [0.00001 0.01 0.2 0.5 0.8 0.99 0.99999];
    x = norminv(Pf,0,1);
    y = norminv(Pd,0,1);
    set(gca,'XTick',x)
    set(gca,'XTickLabel',Pf)
    set(gca,'YTick',y)
    set(gca,'YTickLabel',Pd)
    axis([-3.7 3.7 -3.7 3.7])
    title({['ROC for the M-Orthogonal Case with M = ', num2str(m)]},'FontSize',14)
    xlabel('Probability of False Alarm (P_f)','FontSize',14)
    ylabel('Probability of Detection (P_d)','FontSize',14)
    legend({['d_1^2 = ', num2str(d1(1))],['d_1^2 = ', num2str(d1(2))],['d_1^2 = ', num2str(d1(3))],['d_1^2 = ', num2str(d1(4))]})
end

%% (d)
clc
clear

D = [1,2,4,16];
m = [1,10,100,1000];
x = [-1000:1:1000];

for a = 1:length(m)
    M = m(a);
    figure()
    for index = 1:length(D)
        d = D(index);
        
        % P_d, P_f
        W = [-30:0.1:30];
        P_d = zeros(length(W),1);                   % prob of detection
        P_f = zeros(length(W),1);                   % prob of false alarm
        XX = zeros(length(W),1);                    % prob of detection
        YY = zeros(length(W),1);

        for j = 1:1:length(W)
            P_d(j) = 1 - normcdf(W(j)-sqrt(d),0,1) * (normcdf(W(j),0,1))^(M-1);
            P_f(j) = 1 - (normcdf(W(j),0,1))^M;
            XX(j) = norminv(P_f(j),0,1);
            YY(j) = norminv(P_d(j),0,1);
        end

        plot(XX,YY,'LineWidth',2)
        hold on
    end
    Pd = [0.00001 0.01 0.2 0.5 0.8 0.99 0.99999];
    Pf = [0.00001 0.01 0.2 0.5 0.8 0.99 0.99999];
    A = norminv(Pf,0,1);
    B = norminv(Pd,0,1);
    set(gca,'XTick',A)
    set(gca,'XTickLabel',Pf)
    set(gca,'YTick',B)
    set(gca,'YTickLabel',Pd)
    axis([-3.7 3.7 -3.7 3.7])
    grid on
    title({['ROC for the M-Orthogonal Case with M = ', num2str(M)]},'FontSize',14)
    xlabel('Probability of False Alarm (P_f)','FontSize',14)
    ylabel('Probability of Detection (P_d)','FontSize',14)
    legend({['d_1^2 = ', num2str(D(1))],['d_1^2 = ', num2str(D(2))],['d_1^2 = ', num2str(D(3))],['d_1^2 = ', num2str(D(4))]})
end

%% (e)
close all
clc, clear

M = [1,10,100,1000];
d1 = [0.5,1,2,4,16];
for index = 1:length(d1)
    d = d1(index);
    
    figure()
    grid on, hold on
    
    for i = 1:length(M)
        m = M(i);
        D = log(1 - 1./m+ exp(d)./m);
        
        W = [-30:0.1:30];
        P_d_SKE = zeros(length(W),length(D));       % prob of detection
        P_f_SKE = zeros(length(W),length(D));       % prob of false alarm
        x_SKE = zeros(length(W),length(D));
        y_SKE = zeros(length(W),length(D));

        P_d = zeros(length(W),1);                   % prob of detection
        P_f = zeros(length(W),1);                   % prob of false alarm
        XX = zeros(length(W),1);                    % prob of detection
        YY = zeros(length(W),1);

        % Calculuate P_d and P_f
        for j = 1:1:length(W)
            P_f_SKE(j,index) = 1-normcdf(W(j),-D/2,sqrt(D));
            P_d_SKE(j,index) = 1-normcdf(W(j),D/2,sqrt(D));
            P_d(j) = 1 - normcdf(W(j)-sqrt(d),0,1) * (normcdf(W(j),0,1))^(m-1);
            P_f(j) = 1 - (normcdf(W(j),0,1))^m;
            XX(j) = norminv(P_f(j),0,1);
            YY(j) = norminv(P_d(j),0,1);
        end
        x_SKE(:,index) = norminv(P_f_SKE(:,index),0,1);
        y_SKE(:,index) = norminv(P_d_SKE(:,index),0,1);
        
        plot(XX,YY,'LineWidth',3)
        hold on
        plot(x_SKE(:,index),y_SKE(:,index),'k-.','LineWidth',2,'HandleVisibility','off')
        hold on
    end

    Pd = [0.0001 0.01 0.2 0.5 0.8 0.99 0.9999];
    Pf = [0.0001 0.01 0.2 0.5 0.8 0.99 0.9999];
    x = norminv(Pf,0,1);
    y = norminv(Pd,0,1);
    set(gca,'XTick',x)
    set(gca,'XTickLabel',Pf)
    set(gca,'YTick',y)
    set(gca,'YTickLabel',Pd)
    axis([-3.7 3.7 -3.7 3.7])
    title(['ROC Curves for the M-Orthogonal Signal Case with d^2 = ' num2str(d)],'FontSize',14)
    xlabel('Probability of False Alarm (P_f)','FontSize',14)
    ylabel('Probability of Detection (P_d)','FontSize',14)
    legend({['M = ', num2str(M(1))],['M = ', num2str(M(2))],['M = ', num2str(M(3))],['M = ', num2str(M(4))]})
end
