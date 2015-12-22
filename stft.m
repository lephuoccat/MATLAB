function y = stft(x, L, R)
file_length = length(x);
fft_length = 1024;

n_hat = 1:R:(file_length - L);
n = 0:(file_length - 1);
n_hat_length = length(n_hat);

window_name = hamming(L - 1)';

% Initialize empty matrix to hold each succesive computation of the dft
y = [];
slot = 1; % Index the slot to insert the computed dft
for r = n_hat 
    lower = r;
    upper = r + L - 1;
    temp = x(lower:upper)*window_name;
    DFTtemp = fft(temp,fft_length);
    y(:,slot) = 20*log10((abs(DFTtemp)/max(abs(DFTtemp))));
    slot = slot + 1;
end
