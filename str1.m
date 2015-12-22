str=input('Enter the string: ');
c=input('Enter specific character: ');
if ~ischar(str)
    error('Enter string ONLY!!!');
else
    similar=(c==str);
    a=sum(similar);
end
fprintf('The times character %c appears in the string:%3d  \n\n',c,a)