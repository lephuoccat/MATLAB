function [a P e] = spLpc(x, fs, ncoef)
 if ~exist('ncoef', 'var') || isempty(ncoef)
     ncoef = 2 + round(fs / 1000); % rule of thumb for human speech
 end
 [a P] = lpc(x, ncoef);
 if nargout > 2,
    est_x = filter([0 -a(2:end)],1,x);    % Estimated signal
    e = x - est_x;                        % Residual signal
 end 
end