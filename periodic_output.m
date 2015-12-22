function [ s_out,H ] = periodic_output( b,a,s )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    N = length(s);
    w = (0:1:N-1)*2*pi/N;
    S = fft(s,N);
    H = freqz(b,a,w);
    S_out = H.*S;
    s_out = ifft(S_out,N);
end

