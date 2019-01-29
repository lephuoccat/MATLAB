%% (2b) Theoretical Approach
close all
clc, clear

figure(), plot([0,1],[0,1])
grid on, hold on

D = [1 2 4 16];                             % list of parameters 
for index = 1:1:length(D)
    d = D(index);                           % d = E_s/var(n)^2
    beta = [-5:0.1:5];
    W = [-Inf beta Inf];                    % threshold
    P_d = zeros(length(W),1);               % prob of detection
    P_f = zeros(length(W),1);               % prob of false alarm
    % Calculuate P_d and P_f
    for i = 1:1:length(W)
        P_f(i) = 1-normcdf(W(i),-d/2,sqrt(d));
        P_d(i) = 1-normcdf(W(i),d/2,sqrt(d));
    end
    
    plot(P_f, P_d,'LineWidth',2)
    hold on
end

title('ROC Curves for the SKE Case with Theoretical Approach','FontSize',14)
legend({"Chance Diagonal","d^2 = 1","d^2 = 2","d^2 = 4","d^2 = 16"},'FontSize',14)
xlabel('Probability of False Alarm (P_f)','FontSize',14)
ylabel('Probability of Detection (P_d)','FontSize',14)

%% (2c) Simulation
close all
clc, clear

figure(), plot([0,1],[0,1])
grid on, hold on

D = [1 2 4 16];                                 % list of parameters
noise_var = 1;                                  % noise variance
noise_mean = 0;                                 % noise mean

for index = 1:1:length(D)
    d = D(index);                               % d = E_s/var(n)^2
    % Define the signal
    k = 500;                                    % length of signal
    A = ones(k,1);                              % create k-vector of 1
    alpha = sqrt(d/k);                          % value of elements to get d = D(i)
    S = alpha.*A;                               % the known signal S
    E = sum(S.^2);                              % check the energy of S
    fprintf("Total signal energy: %.2f\n", E);

    % brute-force simulate n trials
    trials = 1000;
    lambda_0 = zeros(trials,1);                 % lambda|H0
    lambda_1 = zeros(trials,1);                 % lambda|H1
    for i = 1:1:trials
        noise = normrnd(noise_mean,noise_var,[k,1]);
        lambda_0(i) = (sum(noise.*S) - E/2)./noise_var;
        lambda_1(i) = (sum((S + noise).*S) - E/2)./noise_var;
    end

    beta = [-5:0.1:5];
    W = [-Inf beta Inf];                        % threshold
    P_d = zeros(length(W),1);                   % prob of detection
    P_f = zeros(length(W),1);                   % prob of false alarm
    % Calculuate P_d and P_f
    for i = 1:1:length(W)
        P_d(i) = sum(lambda_1 > W(i))/trials;
        P_f(i) = sum(lambda_0 > W(i))/trials;
    end

    plot(P_f, P_d,'LineWidth',2)
    hold on
end

title('ROC Curves for the SKE Case from Simulation','FontSize',14)
legend({"Chance Diagonal","d^2 = 1","d^2 = 2","d^2 = 4","d^2 = 16"},'FontSize',14)
xlabel('Probability of False Alarm (P_f)','FontSize',14)
ylabel('Probability of Detection (P_d)','FontSize',14)
