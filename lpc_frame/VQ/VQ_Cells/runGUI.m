function runGUI
clc;
clear all;

% Create New Figure
f = figure('Visible','on',...
'Units','normalized',...
'Position',[0,0,1,1],...
'MenuBar','none',...
'NumberTitle','off', 'Name', 'GUI Lite v2.5');

% Clear Figure
clf;

% Initial Values
currDirectory = pwd; % Sets working directory to current directory

% Menu Features (Buttons/Labels)
guiTitle = uicontrol('parent', f, 'Style', 'text',...
    'units', 'normalized', 'position', [.2 .8 .6 .175],...
    'String', 'GUI Lite v2.5', 'FontUnits', 'normalized',...
    'FontSize', .8, 'FontWeight', 'bold', 'FontAngle', 'oblique');

% Button to select working directory
directorySelect = uicontrol('parent', f, 'Style', 'pushbutton',...
    'units', 'normalized', 'position', [.35 .675 .3 .07],...
    'String', 'Select Workplace Directory', 'FontUnits', 'normalized',...
    'FontSize', .5, 'FontWeight', 'bold',...
    'Callback', {@directorySelectCallback});

% Text to show working directory
currentDirectory = uicontrol('parent', f, 'Style', 'text',...
    'units', 'normalized', 'position', [.25 .645 .5 .03],...
    'String', ['Current Workplace Directory: ', currDirectory],...
    'FontUnits', 'normalized', 'FontSize', .5);

% Create new GUI - Opens New GUI Editor in working directory
newGUIbutton = uicontrol('parent', f, 'Style', 'pushbutton',...
    'units', 'normalized', 'position', [.015 .3 .303 .303],...
    'String', 'New', 'FontUnits', 'normalized',...
    'FontSize', .5, 'FontWeight', 'bold',...
    'Callback', {@newGUICallback});

% Label for New GUI
newGUIlabel = uicontrol('parent', f, 'Style', 'text',...
    'units', 'normalized', 'position', [.0665 .255 .2 .04],...
    'String', 'Create New GUI', 'FontSize', 20, 'FontWeight', 'bold');

% Run GUI Method 1 - Run by opening a runGUI.m File
runGUIbutton1 = uicontrol('parent', f, 'Style', 'pushbutton',...
    'units', 'normalized', 'position', [.3485 .471 .303 .132],...
    'String', 'Run 1', 'FontUnits', 'normalized',...
    'FontSize', .5, 'FontWeight', 'bold',...
    'Callback', {@runGUI1Callback});

% Run GUI Method 1 label
runGUIlabel1 = uicontrol('parent', f, 'Style', 'text',...
    'units', 'normalized', 'position', [.35 .43 .3 .04],...
    'String', 'Run with runGUI.m File', 'FontSize', 18,...
    'FontWeight', 'bold');

% Run GUI Method 2 - Run by opening .mat file and associated callback file
runGUIbutton2 = uicontrol('parent', f, 'Style', 'pushbutton',...
    'units', 'normalized', 'position', [.3485 .296 .303 .132],...
    'String', 'Run 2', 'FontUnits', 'normalized',...
    'FontSize', .5, 'FontWeight', 'bold',...
    'Callback', {@runGUI2Callback});

% Run GUI Method 2 label
runGUIlabel2 = uicontrol('parent', f, 'Style', 'text',...
    'units', 'normalized', 'position', [.35 .255 .3 .04],...
    'String', 'Run w/ .mat & callBack.m Files', 'FontSize', 18,...
    'FontWeight', 'bold');

% Modify GUI - Opens Modify GUI Editor for user-selected GUI file
modGUIbutton = uicontrol('parent', f, 'Style', 'pushbutton',...
    'units', 'normalized', 'position', [.682 .3 .303 .303],...
    'String', 'Mod', 'FontUnits', 'normalized',...
    'FontSize', .5, 'FontWeight', 'bold',...
    'Callback', {@modGUICallback});

% Modify GUI label
modGUIlabel = uicontrol('parent', f, 'Style', 'text',...
    'units', 'normalized', 'position', [.7335 .255 .2 .04],...
    'String', 'Modify Existing GUI', 'FontSize', 20, 'FontWeight', 'bold');

% Close GUI Lite Welcome Screen
closeButton = uicontrol('parent', f, 'Style', 'pushbutton',...
    'units', 'normalized', 'position', [.425 .1 .15 .05],...
    'String', 'close', 'FontUnits', 'normalized',...
    'FontSize', .5, 'FontWeight', 'bold',...
    'Callback', @closeCallback);


function hideAll
% Hides All Menu Features
    set(guiTitle, 'visible', 'off');
    set(directorySelect, 'visible', 'off');
    set(currentDirectory, 'visible', 'off');
    set(newGUIbutton, 'visible', 'off');
    set(newGUIlabel, 'visible', 'off');
    set(runGUIbutton1, 'visible', 'off');
    set(runGUIlabel1, 'visible', 'off');
    set(runGUIbutton2, 'visible', 'off');
    set(runGUIlabel2, 'visible', 'off');
    set(modGUIbutton, 'visible', 'off');
    set(modGUIlabel, 'visible', 'off');
    set(closeButton, 'visible', 'off');  
end

function [temp] = modernize(fileName, t1)
% Modernize function takes pre-existing GUI .mat files and converts them
% so that they may be modified in the Modify Mode.

    temp = t1;    
    % Button Text Properties
    for (i = 1:t1{1,16}) %t1{1,16} = number of buttons
        temp{1,19}(i) = 12; % Sets default button text size as 12
        temp{1,20}(i) = 10; % Sets default label text size as 10
    end
    
    % Text Box Properties
    for (i = 1:t1{1,18}) %t1{1,18} = number of text boxes
        temp{1,21}(i) = {25}; % Sets default text box size as 25
        temp{1,22}(i) = {'This is a Text Box'};% Sets default text box string
        temp{1,23}(i) = {'normal'}; % Sets default text box font weight 
        temp{1,24}(i) = {'normal'}; % Sets default text box font slant
    end
    
    % Set Label Height
    for (i = 1:t1{1,16}) %t1{1,16} = number of buttons
        % If there is no button label...(t1{1,13} is button label string)
        if (strcmp(t1{1,13}(i), '...'))
            temp{1,25}(i) = 0; % Set Label Height equal to 0
        elseif (isempty(t1{1,13}{i}))
            temp{1,25}(i) = 0; % Set Label Height equal to 0
        else
            temp{1,25}(i) = .03; % Set Label Height equal to .04
        end
    end
      
    % Set button position
    x = []; % Initialize button x-axis array to empty
    y = []; % Initialize button y-axis array to empty
    for (i = 0:(t1{1,16}-1)) %t1{1,16} = number of buttons
        % If Statements: If, for whatever reason, button length and width
        % arrays are not equal to button length
        if (length(temp{1,9}) ~= temp{1,16})
            temp{1,9} = (temp{1,9}(1))*ones(1,temp{1,16});
        end
        if (length(temp{1,10}) ~= temp{1,16})
            temp{1,10} = (temp{1,10}(1))*ones(1,temp{1,16});
        end
        % Set x and y point arrays
        x = [x temp{1,7}(i+1) (temp{1,7}(i+1) + temp{1,9}(i+1))];
        y = [y temp{1,8}(i+1) (temp{1,8}(i+1) + temp{1,10}(i+1))];
    end
    temp{1,7} = x; % Set 2-point button positioning x array
    temp{1,8} = y; % Set 2-point button positioning y array
    temp{1,17} = .005; % Label Distance from Button is a Constant Value
    temp{1,26} = strtok(fileName', '.')'; % Set filename  
end


function directorySelectCallback(src, eventdata)
% Select Working Directory.  If no directory is selected, the current
% directory is the working directory
    currDirectory = uigetdir(pwd);
    if (currDirectory == 0)
        currDirectory = pwd;
    else
        set(currentDirectory, 'string',...
           ['Current Workplace Directory: ', currDirectory]);
    end
end

% Opens new GUI editor
function newGUICallback(src, eventdata)
% Opens new GUI editor in specified directory such that all saved data will
% be stored in selected working directory

    tempDir = pwd;
    % If current directory = working directory, open new GUI editor
    if strcmp(tempDir, currDirectory)
        hideAll;
        close(f);
        run PanelButtonSetup;

    % If current directory ~= working directory, ensure new GUI build
    % files are in new directory, set current directory to new directory
    % and run  new GUI editor
    else
        copyfile('PanelButtonSetup.m', currDirectory);
        cd(currDirectory);
        hideAll;
        close(f);
        run PanelButtonSetup;
    end
end

function runGUI1Callback(src, eventdata)
% Allows for user to run GUI by selecting proper 'runGUI.m' file.  Assumes
% .mat and callback data is in runGUI.m's directory.  
    cd(currDirectory);
    [tempFile, pathName] = uigetfile('*.m', 'Select Run File');
    if(tempFile ~= 0)
       hideAll;
       close(f);
       run(fullfile(pathName, tempFile));
    end
end

function runGUI2Callback(src, eventdata)
% Loads Callback data by allowing user to manually pick GUI .mat file and
% corresponding Callback scripts

    % Get .mat and Callback files
    filename = uigetfile('*.mat', 'Select .mat GUI Data File');
    [Fn, Path] = uigetfile('*.m','Select Corresponding Callback File');
  
    if (filename ~= 0)
        if (Fn ~= 0)
            currFile = load(filename, 'temp');   % Load .mat file
            % If GUI is from GUI Lite v2, convert to GUI Lite v2.5 format
            if (length(currFile.temp) ~= 26)
                currFile.temp = modernize(filename, currFile.temp);
            end
            addpath(Path);
            FnLength = length(Fn);
            Fn = Fn(1:(FnLength-2));  % Format function name to remove '.m'
            hnd = str2func(Fn);       % Set function name as handle
            hideAll;                  % Clear data from figure f
            hnd(f, currFile.temp);    % Run Callback using temp
                                      % data from .mat file
        end
    end
end

function modGUICallback(src, eventdata)
% Opens selected .mat file in the GUI Modification Editor.  Saves changes
% to the selected working directory
    
    % Change directory to working directory and open .mat file
    cd(currDirectory);
    [filename, path] = uigetfile('*.mat', 'Select .mat File to Modify');
    cd(path);
    if (filename ~= 0)
        currFile = load(filename, 'temp');
        % Check to see if .mat file is up to date - modernize and run GUI
        % Modify Editor if not
        if (length(currFile.temp) ~= 26)
            temp = modernize(filename, currFile.temp);
            hideAll;
            panelAndButtonEdit(f, temp)
        % Check to see if .mat file is up to date - run GUI Modify Editor if so
        else
            hideAll;
            panelAndButtonEdit(f, currFile.temp)
        end
    end
end
    

function closeCallback(src, eventdata)
% Close Figure f    
    hideAll;
    close(f);
end
end