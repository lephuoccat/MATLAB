function [s_n_r,e]=snr(xh,x);
%
%   function for computing signal-to-noise ratio of two signals
%
% Inputs:
%	xh: quantized signal
%	x: unquantized signal
%
% Outputs:
%	s_n_r: resulting snr in db
%	e: quantization error signal

% compute snr using standard methods
    s_n_r=10*log10(sum(x.*x)/sum((x-xh).*(x-xh)));
    
% compute error signal as difference of unquantized and quantized signals
    e=xh-x;
end