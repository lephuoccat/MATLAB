function VQ_GUI25
% Modifiable runGUI file
clc;
clear all;
addpath(genpath(strcat(pwd,filesep,'cepstral coefficients')));
% USER - ENTER FILENAME
fileName = 'VQ.mat';    
fileData=load(fileName);
temp=fileData(1).temp;

f = figure('Visible','on',...
'Units','normalized',...
'Position',[0,0,1,1],...
'MenuBar','none',...
'NumberTitle','off');

% USER - ENTER PROPER CALLBACK FILE
Callbacks_VQ_GUI25(f,temp);    
%panelAndButtonEdit(f, temp);       % Easy access to Edit Mode

% Note comment PanelandBUttonCallbacks(f,temp) if panelAndButtonEdit is to
% be uncommented and used
end

% GUI Lite 2.5 for VQ design
% 2 Panels
%   #1 - input parameters
%   #2 - graphics displays
% 1 Graphic Panel
%   #1 - average distance versus number of vq cells
% 1 TitleBox
% 10 Buttons
%   #1 - editable button - vqsize: maximum size of vq (power of 2)
%   #2 - editable button - Lm: size of cepstral coefficients vector
%   #3 - editable button - epsilon: splitting factor on vq cells
%   #4 - editable button - thresh: threshold on change to terminate run
%   #5 - editable button - cc: prefix for cepstral analysis files
%   #6 - editable button - tidig_: data set prefix
%   #7 - editable button - nrun: number of digits to run
%   #8 - popupmenu - verbose/non-verbose switch
%   #9 - pushbutton - Run VQ Design
%   #10 - pushbutton - Close GUI