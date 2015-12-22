str=input('Enter the string: ');
if ~ischar(str)
    error('Enter string ONLY!!!');
else
    a=1;
    for i=0:length(str)-1
        if str(i+1)~=str(length(str)-i)
            a=0;
            break
        end
    end
end
if a==1
    disp('Symmetric string')
else
    disp('NOT symmetric string')
end