function compute_cepstrum_GUI25
% Modifiable runGUI file
clc;
clear all;

% USER - ENTER FILENAME
fileName = 'compute_cepstrum.mat';    
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
% 
% % find speech files directory by going up one level and down one level
% % on the directory chain; as follows:
%     dir_cur=pwd; % this is the current Matlab exercise directory path 
%     s=regexp(dir_cur,char); % find the last '\' for the current directory
%     s1=s(length(s)); % find last '\' character; this marks upper level directory
%     dir_fin=strcat(dir_cur(1:s1),'speech_files'); % create new directory
%     start_path=dir_fin; % save new directory for speech files location

Callbacks_compute_cepstrum_GUI25(f,temp);    %USER - ENTER PROPER CALLBACK FILE
%panelAndButtonEdit(f, temp);       % Easy access to Edit Mode

% Note comment PanelandBUttonCallbacks(f,temp) if panelAndButtonEdit is to
% be uncommented and used
end

% GUI 2.5 for compute cepstrum Matlab exercise
% 2 Panels 
%   #1 - data/parameters
%   #2 - graphics
% 4 Graphics Panels
%   #1 - speech waveform
%   #2 - expanded speech waveform
%   #3 - real cepstrums, rceps and analytic method
%   #4 - complex cepstrums, cceps and analytic method
% 1 TitleBox
% 7 Buttons
%   #1 - pushbutton - Speech Directory
%   #2 - popupmenu - Speech Files
%   #3 - editable button - Lmsec: frame length in msec
%   #4 - editable button - cepl: cepstrum length in samples
%   #5 - editable button - nfft: fft size for computation
%   #6 - pushbutton - Compute Cepstrums
%   #7 - pushbutton - Close GUI