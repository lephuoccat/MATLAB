S=input('Enter the strings: ');
n=length(S);
for i=1:n-1
    M=double(S(i));
    t=i;
    for j=i+1:n
        if M>double(S(j))
            M=double(S(j));
            t=j;
        end
    end
    X=S(t);
    S(t)=S(i);
    S(i)=X;
end
disp(S)
    