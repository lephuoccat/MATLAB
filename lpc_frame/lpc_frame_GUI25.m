function lpc_frame_GUI25
clc;
clear all;

% USER - ENTER FILENAME
fileName = 'lpc_frame.mat';    
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
% % find speech files directory by going up one level and down one level
% % on the directory chain; as follows:
%     dir_cur=pwd; % this is the current Matlab exercise directory path 
%     s=regexp(dir_cur,char); % find the last '\' for the current directory
%     s1=s(length(s)); % find last '\' character; this marks upper level directory
%     dir_fin=strcat(dir_cur(1:s1),'speech_files'); % create new directory
%     start_path=dir_fin; % save new directory for speech files location

% USER - ENTER PROPER CALLBACK FILE
Callbacks_lpc_frame_GUI25(f,temp);    
%panelAndButtonEdit(f, temp);       % Easy access to Edit Mode

% Note comment PanelandBUttonCallbacks(f,temp) if panelAndButtonEdit is to
% be uncommented and used
end

% GUI Lite 2.5 for LPC Frame solution
% 2 Panels
%   #1 - data/parameters
%   #2 - graphics
% 3 Graphics Panels
%   #1 - expanded waveform
%   #2 - frame for analysis
%   #3 - LPC solution log magnitude responses and STFT 
% 1 TitleBox
% 7 Buttons
%   #1 - pushbutton - Speech Directory
%   #2 - popupmenu - Speech Files
%   #3 - editable button - Lm: frame length in msec
%   #4 - editable button - p: lpc system order
%   #5 - popupmenu - window type
%   #6 - pushbutton - Run LPC Analysis
%   #7 - pushbutton - Close GUI