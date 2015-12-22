%%
clf;
n=-10:20;
u=[zeros(1,10) 1 zeros(1,20)];
stem(n,u);
xlabel('Time index n');
ylabel('Amplitude');
title('Unit Sample Sequence');
axis([-10 20 0 1.2]);

%%
clf;
n=-10:20;
ud=[zeros(1,21) 1 zeros(1,9)];
stem(n,ud);
xlabel('Time index n');
ylabel('Amplitude');
title('Unit Sample Sequence with delay of 11 samples');
axis([-10 20 0 1.2]);

%%
clf;
n=-10:20;
s=[zeros(1,10) ones(1,21)];
stem(n,s);
xlabel('Time index n');
ylabel('Amplitude');
title('Unit Step Sequence');
axis([-10 20 0 1.2]);

%%
clf;
n=-10:20;
sd=[zeros(1,17) ones(1,14)];
stem(n,sd);
xlabel('Time index n');
ylabel('Amplitude');
title('Unit Step Sequence with delay of 7 samples');
axis([-10 20 0 1.2]);
