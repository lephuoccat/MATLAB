function windows_GUI25
% Modifiable runGUI file
clc;
clear all;
fileName = 'windows.mat';    %USER - ENTER FILENAME
fileData=load(fileName);
temp=fileData(1).temp;

f = figure('Visible','on',...
'Units','normalized',...
'Position',[0,0,1,1],...
'MenuBar','none',...
'NumberTitle','off');

Callbacks_windows_GUI25(f,temp);    %USER - ENTER PROPER CALLBACK FILE
%panelAndButtonEdit(f, temp);       % Easy access to Edit Mode

% Note comment PanelandBUttonCallbacks(f,temp) if panelAndButtonEdit is to
% be uncommented and used
end

% windows_gui25 design
% 2 Panels
%   #1 - input parameters
%   #2 - graphics displays
% 3 Graphic Panels
%   #1 - window(s) time response
%   #2 - window(s) frequency response
%   #3 - window(s) expanded frequency response
% 1 TitleBox
% 5 Buttons
%   #1 - editable button - L: window duration in samples
%   #2 - editable button - fs: sampling rate of processing
%   #3 - popupmenu - single window (or all windows)
%   #4 - pushbutton - Run windows
%   #5 - pushbutton - Close GUI