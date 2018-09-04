w=linspace(-pi,pi,1000);
sigma = pi/10;

p1=[];
for i=1:1000
    if w(i)<=sigma && w(i)>=-sigma
        p1(i)=1;
    else
        p1(i)=0;
    end
end

R = (100./sinc(pi*w./(200*sigma)).^2).*p1;
plot(w/pi,R)
