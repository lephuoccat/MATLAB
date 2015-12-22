% signal [array]: received LTE signal amplitude
% noise  [array]: estimated noise of received signal
% SNR    [array]: estimated SNR of received signal

signal_power = mean(sum(abs(signal)));
noise_power  = mean(sum(signal^2));
SNR          = signal_power/noise_power;
printf('The estimated SNR of received LTE signal: %.2f',SNR);