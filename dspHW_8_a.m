% Michael Feinstein by Gary

% Digital Speech Processing

% PS 8 problem 4
clear 
clc 
close all

x = zeros(26,1);
x(6:14) = 20;
delta_vec = [2];
code_vec = [0];
delta_min = 2;
delta_max = 30;
P = 2;
x_hat = [delta_vec(1)/2];

for k = 2:length(x)  
    
deltNext = nextDelta(delta_vec(end),delta_min,delta_max,P, code_vec(end));
delta_vec = [delta_vec; deltNext];
    if x(k) < -delta_vec(k)
        x_hat(k) = -3*delta_vec(k)/2;
        code_vec(k) = 3;
    elseif (x(k) > -delta_vec(k)) && (x(k) <= 0)
        x_hat(k) = -delta_vec(k)/2;
        code_vec(k) = 2;
    elseif (x(k) > 0)&& (x(k) <= delta_vec(k))
        x_hat(k) = delta_vec(k)/2;
        code_vec(k) = 0;
    else
        x_hat(k) = 3*delta_vec(k)/2;

        code_vec(k) = 1;
    end
end

plot(0:25,x,'kx',0:25,x_hat,'ro')
x = x'
delta_vec = delta_vec'
formatSpec = '%4.1f    %4.1f   %4.1f    %4.1f \n';
fprintf(formatSpec,code_vec,delta_vec,x,x_hat)