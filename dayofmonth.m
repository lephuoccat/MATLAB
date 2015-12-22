clear 
month = input('Give month number (1-12): ' ); 

if month==1 || month==3 || month ==5 || month==7 || month==8 || month==10 || month==12
disp('Your month has 31 days');
elseif month==2 
disp('Your month has 28 days');
elseif month==4 || month==6 || month==9 || month==11
disp('Your month has 30 days');
else
    error;
end