function [F] = spFormantsLpc(a, fs)
 r = roots(a);
 r = r(imag(r)>0.01);
 F = sort(atan2(imag(r),real(r))*fs/(2*pi));
end