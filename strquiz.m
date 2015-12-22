str=input('Enter the string: ');
a=isletter(str);
b=isspace(str);
c=~(a+b);
disp('The indices of the numbers, letters and blanks, respectively: ')
ind_num=find(c)
ind_let=find(a)
ind_blk=find(b)