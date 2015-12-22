X= input('Enter X second: ');
hour= round(X/3600);
minute= round(mod(X,3600)/60);
second= mod(mod(X,3600),60);
[hour minute second]