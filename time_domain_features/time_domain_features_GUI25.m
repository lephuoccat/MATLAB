function time_domain_features_GUI25
% Modifiable runGUI file
clc;
clear all;
fileName = 'time_domain_features.mat';    %USER - ENTER FILENAME
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

% % find speech files directory by going up one level and down one level
% % on the directory chain; as follows:
%     dir_cur=pwd; % this is the current Matlab exercise directory path 
%     s=regexp(dir_cur,char); % find the last '\' for the current directory
%     s1=s(length(s)); % find last '\' character; this marks upper level directory
%     dir_fin=strcat(dir_cur(1:s1),'speech_files'); % create new directory
%     start_path=dir_fin; % save new directory for speech files location

Callbacks_time_domain_features_GUI25(f,temp);    %USER - ENTER PROPER CALLBACK FILE
%panelAndButtonEdit(f, temp);       % Easy access to Edit Mode

% Note comment PanelandBUttonCallbacks(f,temp) if panelAndButtonEdit is to
% be uncommented and used
end

% time_domain_features_gui25 design
% 2 Panels
%   #1 - input parameters
%   #2 - graphics displays
% 4 Graphic Panels
%   #1 - original waveform
%   #2 - log energy plot
%   #3 - log magnitude plot
%   #4 - zero crossing rate plot
% 1 TitleBox
% 10 Buttons
%   #1 - pushbutton - Speech Directory
%   #2 - popupmenu - Speech Files
%   #3 - editable button - L: frame length in msec
%   #4 - editable button - R: frame shift in msec
%   #5 - editable button - number of runs with different values for L, R
%   #6 - editable button - fs: sampling rate of processing
%   #7 - popupmenu - log/linear display
%   #8 - popupmenu - Hamming/rectangular window
%   #9 - pushbutton - Run time domain features
%   #10 - pushbutton - Close GUI