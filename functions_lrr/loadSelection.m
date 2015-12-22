% function -- load selection from designated directory and selected speech/audio file
%
function [curr_file,fs]=loadSelection(directory_name,wav_file_names,...
    indexOfDrpDwnMenu);
%
% read in speech/audio file
% fin_path is the complete path of the .wav file that is selected
    fin_path=strcat(directory_name,'\',strvcat(wav_file_names(indexOfDrpDwnMenu)));
    
% clear speech/audio file
    clear curr_file;
    
% read in speech/audio signal into curr_file; sampling rate is fs 
    [curr_file,fs]=wavread(fin_path);
    
% scale speech signal to +/- 32768 range
    xin=curr_file*32768;
    
% create title information with filename (fname), sampling rate (fs), 
% number of samples in file (nsamp)
    fname=wav_file_names(indexOfDrpDwnMenu);
    FS=num2str(fs);
    nsamp=num2str(length(curr_file));
    file_info_string=strcat('  file: ',fname,', fs: ',FS,' Hz, nsamp:',nsamp);

% retrieve fname from cell array
    fname=wav_file_names{indexOfDrpDwnMenu};
    
% correct filename by changing underbar characters to space characters
    fname(find(fname(:)=='_'))=' ';
end