function play_files(N,filelist)
%
% MATLAB function to play sequentially the N files in filelist
%
% inputs:
%   N: number of files to be played
%   filelist: list of N filenames
%
    
% load each of the N files and play them out sequentially
    for index=1:N
        fname=filelist{index};
        [xinn,fs]=loadwav(fname);
        soundsc(xinn,fs);
    end
end