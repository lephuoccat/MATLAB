function    [P,PF,Q,QF]=atolsp(A,fs)
%
% function to convert from prediction error filter to line spectral pair
% (LSP) and line spectral frequency (LSF) representations
%
%  [P,PF,Q,QF]=atolsp(A)
%
% Inputs:
%   A: (p+1) x 1 column vector of prediction error filter coefficients;
%       A=[1; -a1; -a2; ... ; -ap]
%   fs: sampling frequency
% Outputs:
%   P and Q: (p+2) x 1 column vectors of LSP polynomials;
%   PF and QF: (p+1) x 1 column vectors of LSFs

% Aflip is the upside down flipped A vector
    Aflip=flipud(A);
    
% P=A+Aflip; Q=A-Aflip;
    P=[A;0]+[0; Aflip];
    Q=[A;0]-[0;Aflip];
    
% PF are the roots of P on the unit circle; QF are the roots of Q on the
% unit circle
    PF=atan2(imag(roots(P)),real(roots(P)))*fs/(2*pi);
    QF=atan2(imag(roots(Q)),real(roots(Q)))*fs/(2*pi);
end