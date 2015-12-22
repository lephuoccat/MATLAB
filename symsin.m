function [ z ] = sinc( x )
%SINC  The symbolic sinc function
%      sin(x)/x
%      This function accepts a sym as the input argument
if x==0   
   z=1;
else
    z=sin(x)/x;
end

