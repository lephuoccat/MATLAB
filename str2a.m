str=input('Enter a string: \n');
n=length(str);
for i=1:n-1
    for j=1:n-i
        if str(j)>str(j+1)
            temp=str(j);
            str(j)=str(j+1);
            str(j+1)=temp;
        end
    end
end
disp(str);
            