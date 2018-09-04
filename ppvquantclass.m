function [xquantRound, xquantMagtrunc] = ppvquantclass(x,Nb)

%---------------------------------------------------------

% This program takes a real number x and works on the absolute value and 
% puts back the sign. It scales abs(x)  so that it is in the range 1/2 to 1. 
% This is converted to Nb bit binary xbin binary string with fixed point at 
% the left and with 2^-1 bit always unity. So it is like floating point quantization.

%---------------------------------------------------------

if x==0 
	xquantfinal=0;
    xquantRound=0;
    xquantMagtrunc=0;
	for i=1:Nb
	xbin(i)=0;
end
end

if x~=0
	


xscaled=abs(x);
scalefac=1;

if abs(x)>=1
while xscaled>=1
	xscaled=xscaled/2;
	scalefac=scalefac*2;
end
end

if abs(x)<1
while xscaled<0.5
	xscaled=xscaled*2;
	scalefac=scalefac/2;
end
end

% Convert it into Nb bit binary:

xtemp=xscaled; 
for i=1:Nb
	xbin(i)=0;
if xtemp >=0.5 
	xbin(i)=1;
	xtemp=xtemp-0.5;
end
xtemp=xtemp*2;
end

%compute quantized number from binary format:
xquant=0;
for i=1:Nb
xquant=xquant+xbin(i)*2^(-i);
end
xquantTwo=xquant+2^(-Nb);
%xquant is a magnitude truncation. 
%if you pick the best of xquant and xquantTwo, it is like ROUNDING. ;

xquantfinal=xquant*scalefac*sign(x);

error=xquantfinal - x ;
percenterror = error*100/abs(x);

xquantTwofinal=xquantTwo*scalefac*sign(x);
errorTwo=xquantTwofinal - x ;
percenterrorTwo = errorTwo*100/abs(x);

%For rounding, pick the best:
xquantMagtrunc=xquantfinal; 
xquantRound=xquantfinal;
if abs(errorTwo)  < abs(error)
	xquantRound=xquantTwofinal;
end

x;
Nb;
scalefac;
xquantMagtrunc;
xquantRound;
truncerror=xquantMagtrunc-x;
rounderror=xquantRound-x;

end





