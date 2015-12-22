A=input('Enter your number: ');
x=[0:1:length(A)];
y=2.^x;
D=sum(A.*y);
disp(D)