function lpc_error_GUI25
% Modifiable runGUI file
clc;
clear all;

%USER - ENTER FILENAME
fileName = 'lpc_error.mat';    
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
Callbacks_lpc_error_GUI25(f,temp);    
%panelAndButtonEdit(f, temp);       % Easy access to Edit Mode

% Note comment PanelandBUttonCallbacks(f,temp) if panelAndButtonEdit is to
% be uncommented and used
end

% GUI Lite 2.5 for lpc error spectra
% 2 Panels
%   #1 - data/parameters
%   #2 - graphics
% 4 Graphics Panels
%   #1 - lpc frame
%   #2 - lpc error signal
%   #3 - lpc log magnitude spectrum and STFT spectrum
%   #4 - lpc error log magnitude spectrum
% 1 TitleBox
% 8 Buttons
%   #1 - pushbutton - Speech Directory
%   #2 - popupmenu - Speech Files
%   #3 - popupmenu - lpc analysis type
%   #4 - popupmenu - window type
%   #5 - editable button - Lm: frame length in msec
%   #6 - editable button - p: lpc system order
%   #7 - pushbutton - Run LPC Error Spectra
%   #8 - pushbutton - Close GUI