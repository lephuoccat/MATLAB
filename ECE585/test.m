clc
clear

D = [1,2,4,16];
m = [1,10];
x = [-1000:1:1000];

for a = 1:length(m)
    M = m(a);
    figure()
    for index = 1:length(D)
        d1 = D(index);
        pdf_ske0 = lognpdf(x,-d1/2,sqrt(d1));
        pdf_ske1 = lognpdf(x,d1/2,sqrt(d1));
        
        % H0 and H1 pdf
        pdf_h0 = pdf_ske0;
        pdf_h1 = pdf_ske1;
        for i = 1:(M-1)
            pdf_h0 = conv(pdf_ske0, pdf_h0, 'same');
            pdf_h1 = conv(pdf_ske0, pdf_h1, 'same');
        end
        pdf_h0 = pdf_h0(1:M:length(pdf_h0))*M;
        pdf_h1 = pdf_h1(1:M:length(pdf_h1))*M;
        
        % P_d, P_f
        W = 1:length(pdf_h1);
        P_d = zeros(length(W),1);                   % prob of detection
        P_f = zeros(length(W),1);                   % prob of false alarm
        XX = zeros(length(W),1);                    % prob of detection
        YY = zeros(length(W),1);

        for j = 1:1:length(W)
            P_d(j) = 1 - sum(pdf_h1(1:j));
            P_f(j) = 1 - sum(pdf_h0(1:j));
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
