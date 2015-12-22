function VQ_Cells_GUI25
% Modifiable runGUI file
clc;
clear all;
addpath(genpath(strcat('..',filesep)));
% USER - ENTER FILENAME
fileName = 'VQ_Cells.mat';    
fileData=load(fileName);
temp=fileData(1).temp;

f = figure('Visible','on',...
'Units','normalized',...
'Position',[0,0,1,1],...
'MenuBar','none',...
'NumberTitle','off');

% USER - ENTER PROPER CALLBACK FILE
Callbacks_VQ_Cells_GUI25(f,temp);    
%panelAndButtonEdit(f, temp);       % Easy access to Edit Mode

% Note comment PanelandBUttonCallbacks(f,temp) if panelAndButtonEdit is to
% be uncommented and used
end

% GUI Lite 2.5 for VQ Cells
% 2 Panels
%   #1 - data/parameters
%   #2 - graphics
% 1 Graphics Panel
%   #1 - VQ Cells and Boundaries
% 1 TitleBox
% 5 Buttons
%   #1 - editable button - vqsize: size of vq for plotting
%   #2 - editable button - idigit: digit for vq cell analysis
%   #3 - editable button - Lm: size of cepstral vector
%   #4 - pushbutton - Run VQ Cells
%   #5 - pushbutton - Close VQ