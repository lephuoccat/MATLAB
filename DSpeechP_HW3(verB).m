fileID = fopen('filelist.txt');         % load text file (.txt)
C = textscan(fileID,'%s');              % scan loaded file
fclose(fileID);                         % close text file
[a,b] = size(C{1});                     % number of lines
for i = 1:a
    str{i} = C{1}{i};                   % audio file i
    [x{i},fs{i}] = audioread(str{i});
end

for i = 1:(a-1)
    [a,b] = size(x{i});
    delay{i} = a./fs{i};                % duration of audio file i
end
delay{a} = 0;

for i = 1:a
    sound(x{i},fs{i});                  % play audio file i
    pause(delay{i});                    % and wait until it finishes
end
