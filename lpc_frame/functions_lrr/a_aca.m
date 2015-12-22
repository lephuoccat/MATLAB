function Ra=a_aca(A,p)
%
% function to convert lpc vector, A, to autocorrelation of lpc vector
%
% Inputs:
%   A=vector of lpc coefficient, [1 -a1 -a2 ... -ap]
%   p=size of lpc analysis
%
% Output:
%   Ra=autocorrelation of A, defined for 0,1,...,p

    Ac=A;    
    for i=0:p
        Ra(i+1)=sum(Ac(1+i:p+1).*A(1+i:p+1));
        Ac(2:p+1)=Ac(1:p);
        Ac(1)=0;
    end
end
        