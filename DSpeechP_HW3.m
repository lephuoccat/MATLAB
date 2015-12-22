%%
c = 35000;
f = [0:1:5000];
l1 = 17;
A1 = 6;
l2 = 0;
A2 = 6;
y0 = 0*f;
y = cos(2*pi.*f.*(l1+l2)/c)+(A2-A1)/(A2+A1)*cos(2*pi.*f.*(l2-l1)/c);
V = (2*(1+(A2-A1)/(A2+A1)).*exp(-1j*2*pi.*f.*(l1+l2)./c))./(1+(A2-A1)/(A2+A1).*exp(-1j*2*pi.*f.*2*l1/c)+(A2-A1)/(A2+A1).*exp(-1j*2*pi.*f.*2*l2./c)+exp(-1j*2*pi.*f.*2*(l1+l2)/c));

figure
plot(f,y,f,y0);
title('Vowel /A/ Formant Frequencies');
xlabel('Frequency (Hz)');

figure
plot(f,20*log(abs(V)));
title('l_1=17cm, A_1=6cm^2, l_2=0cm, A_2=6cm^2');
xlabel('Frequency (Hz)');
ylabel('Gain (dB)');

%%
fileID = fopen('filelist.txt');         % load text file (.txt)
C = textscan(fileID,'%s');              % scan loaded file
fclose(fileID);                         % close text file

str1 = C{1}{1};                         % audio file 1
str2 = C{1}{2};                         % audio file 2
str3 = C{1}{3};                         % audio file 3
str4 = C{1}{4};                         % audio file 4
str5 = C{1}{5};                         % audio file 5

[x1,fs1] = audioread(str1);             % read audio file 1
[x2,fs2] = audioread(str2);             % read audio file 2
[x3,fs3] = audioread(str3);             % read audio file 3
[x4,fs4] = audioread(str4);             % read audio file 4
[x5,fs5] = audioread(str5);             % read audio file 5

delay1 = size(x1)/fs1;                  % duration of audio file 1
delay2 = size(x2)/fs2;                  % duration of audio file 2
delay3 = size(x3)/fs3;                  % duration of audio file 3
delay4 = size(x4)/fs4;                  % duration of audio file 4

sound(x1,fs1); pause(delay1);           % play audio file 1, and wait
sound(x2,fs2); pause(delay2);           % play audio file 2 after finish audio file 1
sound(x3,fs3); pause(delay3);           % play audio file 2 after finish audio file 2
sound(x4,fs4); pause(delay4);           % play audio file 2 after finish audio file 3
sound(x5,fs5);                          % play audio file 2 after finish audio file 4
