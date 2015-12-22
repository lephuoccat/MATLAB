function Spectrogram_GUI25
% Modifiable runGUI file
clc;
clear all;
addpath(genpath(strcat(pwd,filesep,'functions_lrr')));
fileName = 'Spectrogram.mat';    %USER - ENTER FILENAME
fileData=load(fileName);
temp=fileData(1).temp;

f = figure('Visible','on',...
'Units','normalized',...
'Position',[0,0,1,1],...
'MenuBar','none',...
'NumberTitle','off');

% %SENSE COMPUTER AND SET FILE DELIMITER
% switch(computer)				
%     case 'MACI64',		char= '/';
%     case 'GLNX86',  char='/';
%     case 'PCWIN',	char= '\';
%     case 'PCWIN64', char='\';
%     case 'GLNXA64', char='/';
% end
% 
% % start_path='c:\data\matlab_gui\speech_files';
%     
% % find speech files directory by going up one level and down one level
% % on the directory chain; as follows:
%     dir_cur=pwd; % this is the current Matlab exercise directory path 
%     s=regexp(dir_cur,char); % find the last '\' for the current directory
%     s1=s(length(s)); % find last '\' character; this marks upper level directory
%     dir_fin=strcat(dir_cur(1:s1),'speech_files'); % create new directory
%     start_path=dir_fin; % save new directory for speech files location

%USER - ENTER PROPER CALLBACK FILE
Callbacks_Spectrogram_GUI25(f,temp);    
%panelAndButtonEdit(f, temp);       % Easy access to Edit Mode

% Note comment PanelandBUttonCallbacks(f,temp) if panelAndButtonEdit is to
% be uncommented and used
end

% 2 Panels -- one for speech processing parameters, one for graphics
% 3 Graphics Panels -- one for waveform, one for wideband spectrogram, one
% for narrowband spectrogram
% 1 Text Box
% 21 Buttons
%   #1 - pushbutton - Get Speech Directory (speech_files)
%   #2 - popuplist - array of speech files from directory speech_file
%   #3 - pushbutton - Play Speech File
%   #4 - editable button - nsec, number of seconds of recording
%   #5 - editable button - fs, speech recording sampling rate
%   #6 - editable button - output file
%   #7 - pushbutton - save recorded speech
%   #8 - pushbutton - Record Speech
%   #9 - editable button - wideband window length
%   #10 - editable button - narrowband window length
%   #11 - editable button - wideband FFT length
%   #12 - editable button - narrowband FFT length
%   #13 - editable button - percentage window overlap
%   #14 - editable button - sampling frequency
%   #15 - editable button - dynamic range for log frequency scale
%   #16 - editable button - scale factor for linear frequency scale
%   #17 - popullist - log/linear processing in frequency domain
%   #18 - popuplist - window type
%   #19 - popuplist - gray/color spectrogram
%   #20 - pushbutton - Create Spectrogram
%   #21 - pushbutton - Close GUI