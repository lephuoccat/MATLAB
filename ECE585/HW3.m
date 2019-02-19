% (1b)
% close all
clc, clear

figure()
grid on, hold on

D = [1 2 4 16 32 64];                             % list of parameters 
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
axis([-8 8 -8 8])
title('ROC Curves for the SKE Case with Normal-Normal Coordinates','FontSize',14)
xlabel('Probability of False Alarm (P_f)','FontSize',14)
ylabel('Probability of Detection (P_d)','FontSize',14)
legend({"d^2 = 1","d^2 = 2","d^2 = 4","d^2 = 16","d^2 = 32","d^2 = 64"},'FontSize',14)

% linear coordinate of SKE
figure()
for index = 1:length(D)
    plot(P_f_SKE(:,index),P_d_SKE(:,index),'LineWidth',2)
    hold on
end
grid on
title('ROC Curves for the SKE Case with Linear Coordinates','FontSize',14)
xlabel('Probability of False Alarm (P_f)','FontSize',14)
ylabel('Probability of Detection (P_d)','FontSize',14)
legend({"d^2 = 1","d^2 = 2","d^2 = 4","d^2 = 16","d^2 = 32","d^2 = 64"},'FontSize',14)

% (2a)
% linear coordinates for SKEP
figure()
W = [0:0.001:9];
P_d_SKEP = zeros(length(W),length(D));      % prob of detection
P_f_SKEP = zeros(length(W),length(D));      % prob of false alarm
x_SKEP = zeros(length(W),length(D));
y_SKEP = zeros(length(W),length(D));
for index = 1:length(D)
    d2 = D(index);                          % d2 = E_s/var(n)^2
    % Calculuate P_d and P_f
    for i = 1:1:length(W)
        P_f_SKEP(i,index) = exp(-W(i).^2./2);
        P_d_SKEP(i,index) = marcumq(sqrt(d2),sqrt(-2*log(P_f_SKEP(i,index))));
    end
    
    plot(P_f_SKEP(:,index), P_d_SKEP(:,index),'LineWidth',2)
    hold on
end
grid on
title('ROC Curves for the SKEP Case','FontSize',14)
legend({"d^2 = 1","d^2 = 2","d^2 = 4","d^2 = 16","d^2 = 32","d^2 = 64"},'FontSize',14)
xlabel('Probability of False Alarm (P_f)','FontSize',14)
ylabel('Probability of Detection (P_d)','FontSize',14)

% normal-normal coordinates for SKEP
figure()
grid on, hold on
for index = 1:length(D)
    x_SKEP(:,index) = norminv(P_f_SKEP(:,index),0,1);
    y_SKEP(:,index) = norminv(P_d_SKEP(:,index),0,1);
    plot(x_SKEP(:,index),y_SKEP(:,index),'LineWidth',2)
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
axis([-4 4 -4 4])
title('ROC Curves for the SKEP Case with Normal-Normal Coordinates','FontSize',14)
xlabel('Probability of False Alarm (P_f)','FontSize',14)
ylabel('Probability of Detection (P_d)','FontSize',14)
legend({"d^2 = 1","d^2 = 2","d^2 = 4","d^2 = 16","d^2 = 32","d^2 = 64"},'FontSize',14)
%%
% Compare
for index = 1:length(D)
    figure()
    subplot(1,2,1); 
    plot(P_f_SKE(:,index),P_d_SKE(:,index),'b',P_f_SKEP(:,index),P_d_SKEP(:,index),'r','LineWidth',2)
    grid on
    title(['Linear with d^2 = ',num2str(D(index))],'FontSize',14)
    xlabel('P_F','FontSize',14)
    ylabel('P_D','FontSize',14)
    legend({'SKE','SKEP'},'FontSize',14)
    
    subplot(1,2,2);
    plot(x_SKE(:,index),y_SKE(:,index),'b',x_SKEP(:,index),y_SKEP(:,index),'r','LineWidth',2)
    grid on
    title(['Normal with d^2 = ',num2str(D(index))],'FontSize',14)
    xlabel('P_F','FontSize',14)
    ylabel('P_D','FontSize',14)
    legend({'SKE','SKEP'},'FontSize',14)
    set(gca,'XTick',x)
    set(gca,'XTickLabel',Pf)
    set(gca,'YTick',y)
    set(gca,'YTickLabel',Pd)
    axis([-4 4 -4 4])
end



