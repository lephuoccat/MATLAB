mile=input('Enter miles driven: \n');
gallon=input('Enter gallon of gasoline: \n');
n=length(mile);
i=1;
while i<=n
    milegal(i)=mile(i)/gallon(i);
    i=i+1;
end
avg=mean(milegal);
disp('Miles per gallon of each tankful: ')
milegal
disp('Miles per gallon for all tankful: ')
avg    