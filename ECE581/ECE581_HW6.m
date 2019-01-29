%%
% Signal with energy = 1
clear
% Define the image size
rows = 1024;                    
cols = 1024;
S = eye(rows, cols);            % create 1024x1024 diagonal matrix of 1
energy = 1;
alpha = sqrt(energy/1024);      % value of diagonal element to get E = 1
A = alpha.*S;                   % create image matrix A
E = sum(sum(A.^2));             % check the energy of the image
fprintf("Total signal energy: %f\n", E);

l0 = zeros(500,1);
l1 = zeros(500,1);
for i = 1:1:500
noise = normrnd(0,1,[rows,cols]);
A_noise = A + noise;            % add noise to the signal A

l0(i) = sum(sum(noise.*A)) - E/2;
l1(i) = sum(sum(A_noise.*A)) -E/2;
end

figure, histfit(l0,20)
title('Histogram ln \lambda | H0');
xlabel('ln \lambda');
figure, histfit(l1,20)
title('Histogram ln \lambda | H1');
xlabel('ln \lambda');

P_d = zeros(19,1);
P_f = zeros(19,1);
beta = [-2:0.25:2];
for i = 1:1:17
P_d(i+1) = sum(l1 > beta(i))/500;
P_f(i+1) = sum(l0 > beta(i))/500;
end
P_d(1) = 1;
P_f(1) = 1;

figure, plot(P_f, P_d)
title('ROC Curve for E_s = 1');
xlabel('P_f');
ylabel('P_d');
hold on
plot([0,1],[0,1])

%%
% Signal with energy = 2
clear
% Define the image size
rows = 1024;                    
cols = 1024;
S = eye(rows, cols);            % create 1024x1024 diagonal matrix of 1
energy = 2;
alpha = sqrt(energy/1024);      % value of diagonal element to get E = 2
A = alpha.*S;                   % create image matrix A
E = sum(sum(A.^2));             % check the energy of the image
fprintf("Total signal energy: %f\n", E);

l0 = zeros(500,1);
l1 = zeros(500,1);
for i = 1:1:500
noise = normrnd(0,1,[rows,cols]);
A_noise = A + noise;            % add noise to the signal A

l0(i) = sum(sum(noise.*A)) - E/2;
l1(i) = sum(sum(A_noise.*A)) -E/2;
end

figure, histfit(l0,20)
title('Histogram ln \lambda | H0');
xlabel('ln \lambda');
figure, histfit(l1,20)
title('Histogram ln \lambda | H1');
xlabel('ln \lambda');

P_d = zeros(19,1);
P_f = zeros(19,1);
beta = [-2:0.25:2];
for i = 1:1:17
P_d(i+1) = sum(l1 > beta(i))/500;
P_f(i+1) = sum(l0 > beta(i))/500;
end
P_d(1) = 1;
P_f(1) = 1;

figure, plot(P_f, P_d)
title('ROC Curve for E_s = 2');
xlabel('P_f');
ylabel('P_d');
hold on
plot([0,1],[0,1])

%%
% Signal with energy = 4
clear
% Define the image size
rows = 1024;                    
cols = 1024;
S = eye(rows, cols);            % create 1024x1024 diagonal matrix of 1
energy = 4;
alpha = sqrt(energy/1024);      % value of diagonal element to get E = 4
A = alpha.*S;                   % create image matrix A
E = sum(sum(A.^2));             % check the energy of the image
fprintf("Total signal energy: %f\n", E);

l0 = zeros(500,1);
l1 = zeros(500,1);
for i = 1:1:500
noise = normrnd(0,1,[rows,cols]);
A_noise = A + noise;            % add noise to the signal A

l0(i) = sum(sum(noise.*A)) - E/2;
l1(i) = sum(sum(A_noise.*A)) -E/2;
end

figure, histfit(l0,20)
title('Histogram ln \lambda | H0');
xlabel('ln \lambda');
figure, histfit(l1,20)
title('Histogram ln \lambda | H1');
xlabel('ln \lambda');

P_d = zeros(19,1);
P_f = zeros(19,1);
beta = [-2:0.25:2];
for i = 1:1:17
P_d(i+1) = sum(l1 > beta(i))/500;
P_f(i+1) = sum(l0 > beta(i))/500;
end
P_d(1) = 1;
P_f(1) = 1;

figure, plot(P_f, P_d,'LineWidth',2)
title('ROC Curve for E_s = 4');
xlabel('P_f');
ylabel('P_d');
hold on
plot([0,1],[0,1])

%%
% Signal with energy = 16
clear
% Define the image size
rows = 1024;                    
cols = 1024;
S = eye(rows, cols);            % create 1024x1024 diagonal matrix of 1
energy = 16;
alpha = sqrt(energy/1024);      % value of diagonal element to get E = 16
A = alpha.*S;                   % create image matrix A
E = sum(sum(A.^2));             % check the energy of the image
fprintf("Total signal energy: %.2f\n", E);

l0 = zeros(500,1);
l1 = zeros(500,1);
for i = 1:1:500
noise = normrnd(0,1,[rows,cols]);
A_noise = A + noise;            % add noise to the signal A

l0(i) = sum(sum(noise.*A)) - E/2;
l1(i) = sum(sum(A_noise.*A)) -E/2;
end

figure, histfit(l0,20)
title('Histogram ln \lambda | H0');
xlabel('ln \lambda');
figure, histfit(l1,20)
title('Histogram ln \lambda | H1');
xlabel('ln \lambda');

P_d = zeros(19,1);
P_f = zeros(19,1);
beta = [-2:0.25:2];
for i = 1:1:17
P_d(i+1) = sum(l1 > beta(i))/500;
P_f(i+1) = sum(l0 > beta(i))/500;
end
P_d(1) = 1;
P_f(1) = 1;

figure, plot(P_f, P_d)
title('ROC Curve for d^2 = 16','FontSize',14);
xlabel('Probability of False Alarm (P_f)','FontSize',14);
ylabel('Probability of Detection (P_d)','FontSize',14);
hold on
plot([0,1],[0,1])

%% Theoretical Approach E = 1
clear
close all
E = 1;
P_d = zeros(19,1);
P_f = zeros(19,1);
beta = [-2:0.25:2];
for i = 1:1:17
P_f(i+1) = normspec([beta(i),inf],-E/2,sqrt(E));
P_d(i+1) = normspec([beta(i),inf],E/2,sqrt(E));
end
P_d(1) = 1;
P_f(1) = 1;

figure, plot(P_f, P_d)
title('ROC Curve for E_s = 1');
xlabel('P_f');
ylabel('P_d');
hold on
plot([0,1],[0,1])

%% Theoretical Approach E = 2
clear
close all
E = 2;
P_d = zeros(19,1);
P_f = zeros(19,1);
beta = [-2:0.25:2];
for i = 1:1:17
P_f(i+1) = normspec([beta(i),inf],-E/2,sqrt(E));
P_d(i+1) = normspec([beta(i),inf],E/2,sqrt(E));
end
P_d(1) = 1;
P_f(1) = 1;

figure, plot(P_f, P_d)
title('ROC Curve for E_s = 2');
xlabel('P_f');
ylabel('P_d');
hold on
plot([0,1],[0,1])

%% Theoretical Approach E = 4
clear
close all
E = 4;
P_d = zeros(19,1);
P_f = zeros(19,1);
beta = [-2:0.25:2];
for i = 1:1:17
P_f(i+1) = normspec([beta(i),inf],-E/2,sqrt(E));
P_d(i+1) = normspec([beta(i),inf],E/2,sqrt(E));
end
P_d(1) = 1;
P_f(1) = 1;

figure, plot(P_f, P_d)
title('ROC Curve for E_s = 4');
xlabel('P_f');
ylabel('P_d');
hold on
plot([0,1],[0,1])

%% Theoretical Approach E = 16
clear
close all
E = 16;
P_d = zeros(19,1);
P_f = zeros(19,1);
beta = [-2:0.25:2];
for i = 1:1:17
P_f(i+1) = normspec([beta(i),inf],-E/2,sqrt(E));
P_d(i+1) = normspec([beta(i),inf],E/2,sqrt(E));
end
P_d(1) = 1;
P_f(1) = 1;

figure, plot(P_f, P_d)
title('ROC Curve for E_s = 16');
xlabel('P_f');
ylabel('P_d');
hold on
plot([0,1],[0,1])

