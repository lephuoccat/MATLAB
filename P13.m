L=input('Enter literature score: ');
M=input('Enter math score: ');
P=input('Enter physics score: ');
C=input('Enter chemistry score: ');
B=input('Enter biology score: ');
E=input('Enter english score: ');
g=input('Enter your group(A=1,B=2,C/D=3): ');
if g==1
    GPA=(2*(M+P+C)+L+E+B)/9
elseif g==2
    GPA=(2*(B+P+C)+M+L+E)/9
else
    GPA=(2*(M+L+E)+P+C+B)/9
end