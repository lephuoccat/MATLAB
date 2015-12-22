n=input('Enter product numbers: ');
q=input('Enter quatity sold for 1 day: ');
for i=1:length(n);
    switch n(i)
        case 1
            price=2.98;
        case 2
            price=4.50;
        case 3
            price=9.98;
        case 4
            price=4.49;
        case 5
            price=6.87;
        otherwise
            price=0;
    end
    retailweek(i)=(price*q(i))*7;
end
retailweek
total=sum(retailweek)
            