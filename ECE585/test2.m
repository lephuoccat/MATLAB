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


