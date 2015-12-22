function    [A,G,a,r]=autolpc(x,p)
%AUTOLPC					[rws 3/2003]
%       [A,G,a,r]=autolpc(x,p)
%		x=vector of input samples
%		p=lpc model order
%		a=vector of lpc coefficients
%		r=vector of autocorrelation coefficients
%               G=rms prediction error
%               A=prediction error filter
%         see also ATOK, KTOA, RTOA
L=length(x);
r=[];
for i=0:p
	r=[r; sum(x(1:L-i).*x(1+i:L))];
end
R=toeplitz(r(1:p));
a=inv(R)*r(2:p+1);
A=[1; -a];
G=sqrt(sum(A.*r));
end