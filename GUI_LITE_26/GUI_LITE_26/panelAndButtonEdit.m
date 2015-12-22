function panelAndButtonEdit(f, temp)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=temp{1,1};
y=temp{1,2};
a=temp{1,3};
b=temp{1,4};
u=temp{1,5};
v=temp{1,6};
m=temp{1,7};
n=temp{1,8};
lengthbutton=temp{1,9};
widthbutton=temp{1,10};
enterType=temp{1,11};
enterString=temp{1,12};
enterLabel=temp{1,13};
noPanels=temp{1,14};
noGraphicPanels=temp{1,15};
noButtons=temp{1,16};
labelDist = temp{1,17}; %distance that the label is below the button
noTitles=temp{1,18};
buttonTextSize=temp{1,19};
labelTextSize=temp{1,20};
textboxFont=temp{1,21};
textboxString=temp{1,22};
textboxWeight=temp{1,23};
textboxAngle=temp{1,24};
labelHeight=temp{1,25};
fileName=temp{1,26};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Step 1: Reconstruct GUI %%%%%
% Set Up Figure
set(f, 'Name', ['Edit Gui: ', fileName, '.mat']);
set(f, 'Visible', 'on');
plotHandle = axes('parent', f,...
    'Units','Normalized',...
    'Position',[0 0 1 1]);
grid on;
hold on;

% Plot Panels
for i = 0:(noPanels-1)
        line([x(1+4*i) x(2+4*i) x(3+4*i) x(1+4*i) x(1+4*i)],...
           [y(1+4*i) y(2+4*i) y(3+4*i) y(3+4*i) y(1+4*i)],...
           'Color', 'k','linewidth', 2);
        hold on;
        xlim([0 1]);ylim([0 1]);
end


% Plot Graphic Panels
for i=0:(noGraphicPanels-1)
       line([a(1+4*i) a(2+4*i) a(3+4*i) a(1+4*i) a(1+4*i)],...
        [b(1+4*i) b(2+4*i) b(3+4*i) b(3+4*i) b(1+4*i)],...
        'Color', 'g','linewidth', 2); 
       hold on;
       xlim([0 1]);ylim([0 1]);
end

% Plot Title Boxes
for i=0:(noTitles-1)
        line([u(1+4*i) u(2+4*i) u(3+4*i) u(1+4*i) u(1+4*i)],...
         [v(1+4*i) v(2+4*i) v(3+4*i) v(3+4*i) v(1+4*i)],...
         'Color', 'm','linewidth', 2);
        hold on;
        xlim([0 1]);ylim([0 1]);
end

% Plot Buttons
for i=1:noButtons
    line([m(1+2*(i-1)), m(2+2*(i-1)), m(2+2*(i-1)), m(1+2*(i-1)),...
        m(1+2*(i-1))], [n(1+2*(i-1)), n(1+2*(i-1)), n(2+2*(i-1)),...
        n(2+2*(i-1)), n(1+2*(i-1))], 'Color', 'b', 'linewidth', 2);
    xlim([0 1]);ylim([0 1]);
    hold on;  
    if (labelHeight(i) ~= 0)    % Plot Label
        line([(m(1+2*(i-1))), (m(2+2*(i-1))), (m(2+2*(i-1))), ...
         (m(1+2*(i-1))), (m(1+2*(i-1)))],...
         [(n(1+2*(i-1))-labelDist-labelHeight(i)), ...
          (n(1+2*(i-1))-labelDist-labelHeight(i)), ...
          (n(1+2*(i-1))-labelDist), (n(1+2*(i-1))-labelDist), ...
          (n(1+2*(i-1))-labelDist-labelHeight(i))], 'Color', 'r');
    end
end

% Step 2: Select Option - Add, Delete, Move, Modify, Save, Save As, Quit
% Establish Menu/Menu Option Buttons
menuCol = uipanel('Parent', f,'Position', [.36 .55 .15 .45]);

% EditTextBox Dictates Menu Header Text
EDITTEXTBOX=uicontrol('Parent',menuCol,...
'Style', 'Text', 'String', 'Select Edit Option',...
'FontSize', 14, 'FontWeight', 'bold', 'FontAngle', 'Italic',...
'Units', 'Normalized', 'Position', [0 0.888 1 0.112]);

ADDBUTTON=uicontrol('Parent',menuCol,...
'Style','PushButton',...
'Units','Normalized',...
'String','Add Feature',...
'Position',[0 0.777 1 0.111],...
'Callback', {@addCallback, temp});

DELETEBUTTON=uicontrol('Parent',menuCol,...
'Style','PushButton',...
'Units','Normalized',...
'String','Delete Feature',...
'Position',[0 0.666 1 0.111],...
'Callback', {@deleteCallback, temp});

MOVEBUTTON=uicontrol('Parent',menuCol,...
'Style','PushButton',...
'Units','Normalized',...
'String','Move & Resize Feature',...
'Position',[0 0.555 1 0.111],...
'Callback', {@moveCallback, temp});

MODIFYBUTTON=uicontrol('Parent',menuCol,...
'Style','PushButton',...
'Units','Normalized',...
'String','Modify Feature',...
'Position',[0 0.444 1 0.111],...
'Callback', {@modifyCallback, temp});

INDEXBUTTON=uicontrol('Parent',menuCol,...
'Style','PushButton',...
'Units','Normalized',...
'String','Feature Index',...
'Position',[0 0.333 1 0.111],...
'Callback', {@indexCallback, temp});

SAVEBUTTON=uicontrol('Parent',menuCol,...
'Style','PushButton',...
'Units','Normalized',...
'String','Save GUI',...
'Position',[0 0.222 1 0.111],...
'Callback', {@saveCallback, temp});

SAVEASBUTTON=uicontrol('Parent',menuCol,...
'Style','PushButton',...
'Units','Normalized',...
'String','Save GUI As',...
'Position',[0 0.111 1 0.111],...
'Callback', {@saveAsCallback, temp});

QUITBUTTON=uicontrol('Parent',menuCol,...
'Style','PushButton',...
'Units','Normalized',...
'String','Quit',...
'Position',[0 0 1 0.111],...
'Callback', @quitCallback);



%%%%%%%%%%%%%%% Helper Functions %%%%%%%%%%%%%%%

% Hide Main Menu Buttons
function hideButtons()
set(EDITTEXTBOX, 'visible', 'off');
set(ADDBUTTON, 'visible', 'off');
set(DELETEBUTTON, 'visible', 'off');
set(MOVEBUTTON, 'visible', 'off');
set(MODIFYBUTTON, 'visible', 'off');
set(INDEXBUTTON, 'visible', 'off');
set(SAVEBUTTON, 'visible', 'off');
set(SAVEASBUTTON, 'visible', 'off');
set(QUITBUTTON, 'visible', 'off');
end


% Cancel Button Used In Several Locations
CANCELBUTTON=uicontrol('Style','PushButton',...
'Units','Normalized',...
'String','Cancel', 'Visible', 'off',...
'Parent',menuCol, 'Callback', {@cancelCallback, temp});

% Cancel Callback Reloads Main Menu
function cancelCallback(src, eventdata, temp)
    set(menuCol, 'visible', 'off');
    panelAndButtonEdit(f, temp);
end 

% Menu Loaded when 'Add' Is Selected
function addMenu(temp)
set(EDITTEXTBOX, 'string', 'Select Feature To Add');
set(EDITTEXTBOX, 'visible', 'on');
set(EDITTEXTBOX, 'Position', [0 0.875 1 0.125]);
ADDPANELBUTTON=uicontrol('Style','PushButton',...
'Units','Normalized',...
'String','Panel',...
'Position',[0 0.7 1 0.175],...
'Parent',menuCol, 'Callback', {@addPanelCallback, temp});
ADDGPANELBUTTON=uicontrol('Style','PushButton',...
'Units','Normalized',...
'String','Graphic Panel',...
'Position',[0 0.525 1 0.175],...
'Parent',menuCol, 'Callback', {@addGPanelCallback, temp});
ADDTEXTBUTTON=uicontrol('Style','PushButton',...
'Units','Normalized',...
'String','Text Box',...
'Position',[0 0.35 1 0.175],...
'Parent',menuCol, 'Callback', {@addTextCallback, temp});
ADDBUTTONBUTTON=uicontrol('Style','PushButton',...
'Units','Normalized',...
'String','Button',...
'Position',[0 0.175 1 0.175],...
'Parent',menuCol, 'Callback', {@addButtonCallback, temp, f});
set(CANCELBUTTON, 'Position', [0 0 1 0.175]);
set(CANCELBUTTON, 'Visible', 'on');
set(menuCol, 'Position', [.36 .65 .15 .3]);
end

% Menu Loaded when 'Move' Is Selected
function moveMenu(temp)
set(EDITTEXTBOX, 'string', 'Select Feature To Move/Resize');
set(EDITTEXTBOX, 'visible', 'on');
set(EDITTEXTBOX, 'Position', [0 0.85 1 0.15]);
MOVEPANELBUTTON=uicontrol('Style','PushButton',...
'Units','Normalized',...
'String','Panel',...
'Position',[0 0.68 1 0.17],...
'Parent',menuCol, 'Callback', {@movePanelCallback, temp});
MOVEGPANELBUTTON=uicontrol('Style','PushButton',...
'Units','Normalized',...
'String','Graphic Panel',...
'Position',[0 0.51 1 0.17],...
'Parent',menuCol, 'Callback', {@moveGPanelCallback, temp});
MOVETEXTBUTTON=uicontrol('Style','PushButton',...
'Units','Normalized',...
'String','Text Box',...
'Position',[0 0.34 1 0.17],...
'Parent',menuCol, 'Callback', {@moveTextCallback, temp});
MOVEBUTTONBUTTON=uicontrol('Style','PushButton',...
'Units','Normalized',...
'String','Button',...
'Position',[0 0.17 1 0.17],...
'Parent',menuCol, 'Callback', {@moveButtonCallback, temp});
set(CANCELBUTTON, 'Position', [0 0 1 0.17]);
set(CANCELBUTTON, 'Visible', 'on');
set(menuCol, 'Position', [.36 .65 .15 .3]);
end

% Menu Loaded when 'Delete' Is Selected
function deleteMenu(temp)
set(EDITTEXTBOX, 'string', 'Select Feature To Delete');
set(EDITTEXTBOX, 'visible', 'on');
set(EDITTEXTBOX, 'Position', [0 0.85 1 0.15]);
DELETEPANELBUTTON=uicontrol('Style','PushButton',...
'Units','Normalized',...
'String','Panel',...
'Position',[0 0.68 1 0.17],...
'Parent',menuCol, 'Callback', {@deletePanelCallback, temp});
DELETEGPANELBUTTON=uicontrol('Style','PushButton',...
'Units','Normalized',...
'String','Graphic Panel',...
'Position',[0 0.51 1 0.17],...
'Parent',menuCol, 'Callback', {@deleteGPanelCallback, temp});
DELETETEXTBUTTON=uicontrol('Style','PushButton',...
'Units','Normalized',...
'String','Text Box',...
'Position',[0 0.34 1 0.17],...
'Parent',menuCol, 'Callback', {@deleteTextCallback, temp});
DELETEBUTTONBUTTON=uicontrol('Style','PushButton',...
'Units','Normalized',...
'String','Button',...
'Position',[0 0.17 1 0.17],...
'Parent',menuCol, 'Callback', {@deleteButtonCallback, temp});
set(CANCELBUTTON, 'Position', [0 0 1 0.17]);
set(CANCELBUTTON, 'Visible', 'on');
set(menuCol, 'Position', [.36 .65 .15 .3]);
end

% Menu Loaded when 'Modify' Is Selected
function modifyMenu(temp)
set(EDITTEXTBOX, 'string', 'Select Feature To Modify');
set(EDITTEXTBOX, 'visible', 'on');
set(EDITTEXTBOX, 'Position', [0 0.775 1 0.235]);
MODTEXTBUTTON=uicontrol('Style','PushButton',...
'Units','Normalized',...
'String','Text Box',...
'Position',[0 0.51 1 0.255],...
'Parent',menuCol, 'Callback', {@modifyTextboxCallback, temp});
MODBUTTONBUTTON=uicontrol('Style','PushButton',...
'Units','Normalized',...
'String','Button',...
'Position',[0 0.255 1 0.255],...
'Parent',menuCol, 'Callback', {@modifyButtonCallback, temp});
set(CANCELBUTTON, 'Position', [0 0 1 0.255]);
set(CANCELBUTTON, 'Visible', 'on');
set(menuCol, 'Position', [.36 .75 .15 .2]);
end

% Menu Loaded when 'Feature Index' Is Selected
function indexMenu(temp)
set(EDITTEXTBOX, 'string', 'Select Feature To Index');
set(EDITTEXTBOX, 'visible', 'on');
set(EDITTEXTBOX, 'Position', [0 0.8 1 0.2]);
INDEXGPANELBUTTON=uicontrol('Style','PushButton',...
'Units','Normalized',...
'String','Graphic Panels',...
'Position',[0 .6 1 0.2],...
'Parent',menuCol, 'Callback', {@indexGPanelCallback, temp});
INDEXTEXTBUTTON=uicontrol('Style','PushButton',...
'Units','Normalized',...
'String','Text Boxes',...
'Position',[0 0.4 1 0.2],...
'Parent',menuCol, 'Callback', {@indexTextboxCallback, temp});
INDEXBUTTONBUTTON=uicontrol('Style','PushButton',...
'Units','Normalized',...
'String','Buttons',...
'Position',[0 0.2 1 0.2],...
'Parent',menuCol, 'Callback', {@indexButtonCallback, temp});
set(CANCELBUTTON, 'Position', [0 0 1 0.2]);
set(CANCELBUTTON, 'Visible', 'on');
set(menuCol, 'Position', [.36 .7 .15 .25]);
end

% DONE Button used to close Features Index Screen
DONEBUTTON = uicontrol('visible', 'off');
function doneButtonCallback(src, eventdata, temp)
    set(DONEBUTTON, 'visible', 'off');
    clf;
    panelAndButtonEdit(f,temp);
end   

% Function textData loads the Textbox Specs Screen and outputs
% the user defined Text Specifications
function[tbFont, tbString, tbWeight, tbAngle] =...
        textData(temp, tempFont, tempString, tempWeight, tempAngle)

% Set the 'Font Style' parameter based on the bold/italic input specs
% Numerical variable tempStyle used in 'Font Style' pulldown menu
if (strcmp(tempWeight, 'normal') && strcmp(tempAngle, 'normal'))
    tempStyle = 1;
elseif (strcmp(tempWeight,  'bold') && strcmp(tempAngle, 'normal'))
    tempStyle = 2;
elseif (strcmp(tempWeight, 'normal') && strcmp(tempAngle, 'italic'))
    tempStyle = 3;
elseif (strcmp(tempWeight, 'bold') && strcmp(tempAngle, 'italic'))
    tempStyle = 4;
else
    tempStyle = 1;
end

% Create a new figure for user-defined Textbox specs
textStats = figure('Visible', 'on', 'Units', 'normalized',...
    'Position', [0.2 0.2 0.6 0.6], 'MenuBar', 'none',...
    'NumberTitle', 'off', 'Name', 'Text Box Stats', 'UserData', 0);
textStatsTitleDisplay=uicontrol('Parent',textStats,...
'Units','Normalized',...
'Style','text',...
'Position',[0.3 0.875 0.4 0.12],...
'FontUnits', 'normalized',...
'FontSize',.75,...
'FontWeight', 'bold',...
'String','Text Stats GUI');
EnterTextStringBox=uicontrol('Parent',textStats,...
'Units','Normalized',...
'Style','edit',...
'Max', 5,...
'Position',[0.3 0.655 0.4 0.2],...
'Backgroundcolor','w',...
'String', tempString);
Label9=uicontrol('parent',textStats,...
'Units','normalized',...
'Position',[0.3 0.615 0.4 0.03],...
'Style','text',...
'String','Enter Text Box Content');
EnterTextSizeBox=uicontrol('Parent',textStats,...
'Units','Normalized',...
'Style','edit',...
'Position',[0.4 0.475 0.2 0.1],...
'Backgroundcolor','w',...
'String',num2str(tempFont));
Label9=uicontrol('parent',textStats,...
'Units','normalized',...
'Position',[0.4 0.435 0.2 0.03],...
'Style','text',...
'String','Enter Text Size');
EnterTextStyleBox=uicontrol('Parent',textStats,...
'Units','Normalized',...
'Style','popupmenu',...
'Position',[0.4 0.295 0.2 0.1],...
'Backgroundcolor','w',...
'val',tempStyle,...
'String','normal|bold|italics|bold + italics');
TextStyleLabel=uicontrol('parent',textStats,...
'Units','normalized',...
'Position',[0.4 0.325 0.2 0.03],...
'Style','text',...
'String','Choose the Style of the Text Box');
acceptTextSpecsBox=uicontrol('Parent',textStats,...
'Units','Normalized',...
'Position',[0.35 0.14 0.3 0.1],...
'String','Accept Text Box Specs',...
'Callback',{@acceptTextSpecsCallback, textStats});

% Pause program functionality while Textbox Specs Figure is open
while (get(textStats, 'UserData') == 0)
pause(0.01);
end


tbFont = int8(str2num(get(EnterTextSizeBox, 'string')));    % Text Size
tbString = {get(EnterTextStringBox, 'string')};             % Text String
tStyleNum = get(EnterTextStyleBox, 'val');                  % Font Style

% Define font properties (bold/italic) depending on Font Style Number
switch tStyleNum
    case 1
        tbWeight = {'normal'};
        tbAngle = {'normal'};
    case 2
        tbWeight = {'bold'};
        tbAngle = {'normal'};
    case 3
        tbWeight = {'normal'};
        tbAngle = {'italic'};
    case 4
        tbWeight = {'bold'};
        tbAngle = {'italic'};
    otherwise
        tbWeight = {'normal'};
        tbAngle = {'normal'};
end
end

% Function buttonData loads the Button Specs Screen and outputs
% the user defined Button Specifications
function[tLHeight, tStyle, tString, tLabel, bTxtSize, lTxtSize] =...
        buttonData(temp, tLHeight, tStyleVal, tString, tLabel, bTxt, lTxt)

% Create new figure for user-defined button specifications
buttonStats = figure('Visible', 'on', 'Units', 'normalized',...
    'Position', [0.2 0.2 0.6 0.6], 'MenuBar', 'none',...
    'NumberTitle', 'off', 'Name', 'Button Stats', 'UserData', 0);

move = 0.1; % Helpful variable definition used with figure objet positions
buttonStatsTitleDisplay=uicontrol('Parent',buttonStats,...
'Units','Normalized',...
'Style','text',...
'Position',[0.35 0.9 0.2 0.075],...
'FontSize',13, 'FontWeight', 'bold',...
'String','Button Stats GUI');
ENTERSTYLEOFBUTTONBox=uicontrol('Parent',buttonStats,...
'Units','Normalized',...
'Style','popupmenu',...
'Position',[0.2 0.84-move 0.2 0.1],...
'Backgroundcolor','w',...
'String','pushbutton|edit|text|popupmenu|slider',...
'val', tStyleVal);
Label8=uicontrol('parent',buttonStats,...
'Units','normalized',...
'Position',[0.2 0.81-move 0.2 0.06],...
'Style','text',...
'String','Choose the type of the button');
ENTERSTRINGOFBUTTONBox=uicontrol('Parent',buttonStats,...
'Units','Normalized',...
'Style','edit',...
'Position',[0.5 0.88-move 0.2 0.1],...
'Backgroundcolor','w',...
'String',tString);
Label9=uicontrol('parent',buttonStats,...
'Units','normalized',...
'Position',[0.5 0.81-move 0.2 0.06],...
'Style','text',...
'String','Enter the string to be written on the button.');
ENTERLABELOFBUTTONBox=uicontrol('Parent',buttonStats,...
'Units','Normalized',...
'Style','edit',...
'Position',[0.2 0.67-move 0.2 0.1],...
'Backgroundcolor','w',...
'String',tLabel);
labelString=strcat('Enter a label for the button ',...
' created in the box below. After you have ',...
' entered a label click on the Accept Specs ',...
' button. If you do not require a label, ',...
' click the Accept Specs Button. ');
labelInfoBox=uicontrol('Parent',buttonStats,...
'Units','Normalized',...
'Style','text',...
'Position',[0.2 0.52-move 0.2 0.13],...
'String',labelString);
labelHeightBox=uicontrol('Parent',buttonStats,...
'Units','Normalized',...
'Style','edit',...
'Position',[0.2 0.42-move 0.2 0.06],...
'Backgroundcolor','w',...
'String',tLHeight);
labelHeightInfoString = strcat('Enter the label height. ',...
    ' If no label is required, the label height selected ',...
    ' is arbitrary.');
labelHeightInfoBox=uicontrol('Parent',buttonStats,...
'Units','Normalized',...
'Style','text',...
'Position',[0.2 0.35-move 0.2 0.06],...
'String',labelHeightInfoString);
ENTERBUTTONTEXTSIZEBox=uicontrol('Parent',buttonStats,...
'Units','Normalized',...
'Style','edit',...
'Position',[0.5 0.61 0.2 0.06],...
'Backgroundcolor','w',...
'String', num2str(bTxt));
bTxtString= ['Enter the button text size. The default value is 12'];
buttonTxtSizeInfoBox=uicontrol('Parent',buttonStats,...
'Units','Normalized',...
'Style','text',...
'Position',[0.5 0.53 0.2 0.07],...
'String',bTxtString);
ENTERLABELTEXTSIZEBox=uicontrol('Parent',buttonStats,...
'Units','Normalized',...
'Style','edit',...
'Position',[0.5 0.45-move 0.2 0.06],...
'Backgroundcolor','w',...
'String', num2str(lTxt));
lTxtString = ['Enter the label text size.  The default value is 12.',...
    'If no label is needed, label text size is arbitrary.'];
labelTxtSizeInfoBox=uicontrol('Parent',buttonStats,...
'Units','Normalized',...
'Style','text',...
'Position',[0.5 0.35-move 0.2 0.09],...
'String',lTxtString);
acceptSpecsBox=uicontrol('Parent',buttonStats,...
'Units','Normalized',...
'Position',[0.3 0.2-move 0.3 0.1],...
'String','Accept Specs Button',...
'Callback',{@acceptSpecsCallback, buttonStats});
labelNote=strcat('**NOTE:The popupmenu button requires that the ',...
' string be entered as shown in the example. ',...
' eg:Hamming|Triangular|Rectangular. Also, the "slider" ',...
'button does not require a string. ');
labelNoteBox=uicontrol('Parent',buttonStats,...
'Units','Normalized',...
'Style','text',...
'Position',[0.1 0.1-move 0.8 0.065],...
'String',labelNote);

% Pause program while Button Specs figure is open
while (get(buttonStats, 'UserData') == 0)
pause(0.01);
end

% Button Text Size
bTxtSize = str2num(get(ENTERBUTTONTEXTSIZEBox, 'string'));
% Label Text Size
lTxtSize = str2num(get(ENTERLABELTEXTSIZEBox, 'string'));
% Button String
tString = {get(ENTERSTRINGOFBUTTONBox, 'string')};
% Numerical Value for Button Type
tStyleNum = get(ENTERSTYLEOFBUTTONBox, 'val');
% Button Type
switch tStyleNum
    case 1
        tStyle = {'pushbutton'};
    case 2
        tStyle = {'edit'};
    case 3
        tStyle = {'text'};
    case 4
        tStyle = {'popupmenu'};
    case 5
        tStyle = {'slider'};
end

% There is no label if there isn't any label text inputted by user
if (strcmp('...', get(ENTERLABELOFBUTTONBox, 'String')) == 1)
    tLabel = {''};
    tLHeight = 0;
elseif (isempty(get(ENTERLABELOFBUTTONBox, 'String')))
    tLabel = {''};
    tLHeight = 0;
else
% Set label string and label box height if label text is user inputted
    tLabel = {get(ENTERLABELOFBUTTONBox, 'string')};
    tLHeight = str2num(get(labelHeightBox,'string'));
end
end

% Accept and Close Textbox Specs Figure
function acceptTextSpecsCallback(src, eventdata, textStats)
    set(textStats, 'Visible', 'off');
    set(textStats, 'UserData', 1); % Unpause Program
end

% Accept and Close Button Specs Figure
function acceptSpecsCallback(src, eventdata, buttonStats)
    set(buttonStats, 'Visible', 'off');
    set(buttonStats, 'UserData', 1); % Unpause Program
end

% Function cursorData allows a user to right-click to get the current
% location of the mouse cursor
function cursorData(x, y)
    dataBox = uicontrol('Style','text', 'Units','Normalized',...
        'String',['x: ', num2str(x), ', y: ', num2str(y)],...
        'Position',[.93 .98 0.07 0.02], 'Parent', f,...
        'FontUnits', 'normalized', 'FontSize', .5);
end  

%%%%% Callbacks %%%%%%
% Step 3a: Save/Save As: Save GUI. Message Box informs of successful save %
% Save Callback
function saveCallback(src,eventdata,temp)
currentDir=pwd;
currDir=strcat(currentDir,'\',temp{1,26},'.mat');
save(strvcat(currDir),'temp');
msgbox('Save Successful', strcat(temp{1,26}, '.mat'), 'help');
uiwait(gcf);
end
    
% Save As Callback
function saveAsCallback(src,eventdata,temp)
filenameTemp = inputdlg('Enter New File Name', 'Save As',...
    1, {fileName});
if (length(filenameTemp) == 1)  % Check against 'cancel' selection
    fileName = filenameTemp{1};
    clearvars filenameTemp;
    currentDir=pwd;
    currDir=strcat(currentDir,'/',fileName,'.mat');
    temp{1,26} = fileName;
    save(strvcat(currDir),'temp');
    saveGood = msgbox('Save Successful', strcat(fileName, '.mat'), 'help');
    waitfor(saveGood);
    hideButtons;
    panelAndButtonEdit(f, temp);
end
end


% Step 3b: Quit: Quit GUI. Warning Box informs of potential unsaved quit %
% Quit Callback
function quitCallback(src, eventdata)
    quitVerify = questdlg(['Quit GUI Editor?' ...
        '  Unsaved Changes Will Not Be Saved'],...
        'Quit GUI','Yes','No','No');
    switch quitVerify
        case 'Yes'
            close(f);
    end
end

%%%%% Step 3c: Add - Add object selected %%%%%
%          Add Options - Panel, Graphic Panel, Title Box, Button, Cancel %

% Add Callback - Loads Add Menu When 'Add' is Seleced
function addCallback(src, eventdata, temp)
hideButtons;
addMenu(temp);
end

% Add Panel Callback
function addPanelCallback(src, eventdata, temp)
set(menuCol, 'visible', 'off');
panelString=strcat('You may now begin selecting the ',...
' co-ordinates of the panel. Begin by selecting the lower ',...
' left corner, then the lower right corner and finish by ',...
' selecting the top right corner for the panel.');
msgbox(panelString,'Add Panel', 'help', 'modal');
uiwait(gcf); %This pauses execution until the user has clicked ok
j = 1;
while (j <= 3)
    [tx(j) ty(j) button] = ginput(1);
    if (button ~= 1) % If right-click show cursor coordinates
        cursorData(tx(j), ty(j));
    else
        plot(tx(j),ty(j),'marker','*');
        j = j + 1;
    end
    hold on;
    xlim([0 1]);ylim([0 1]);
end

if noPanels == 0
    temp{1,1} = tx;
    temp{1,2} = ty;
else
    temp{1,1} = [x 0 tx];
    temp{1,2} = [y 0 ty];
end
temp{1,14} = noPanels + 1;
panelAndButtonEdit(f, temp);
end

% Add Graphic Panel Callback
function addGPanelCallback(src, eventdata, temp)
set(menuCol, 'visible', 'off');
graphicString=strcat('You may now begin selecting the ',...
' co-ordinates of the graphics panel. Begin by ',...
' selecting the lower left corner, then the lower ',...
' right corner and finish by selecting the top right ',...
' corner for the graphic panel.');
msgbox(graphicString,'Add Graphic Panel', 'help', 'modal');
uiwait(gcf);%This stops execution until the user has clicked ok
j = 1;
while (j <= 3)
    [ta(j) tb(j) button] = ginput(1);
    if (button ~= 1) % If right-click show cursor coordinates
        cursorData(ta(j), tb(j));
    else
        plot(ta(j),tb(j),'marker','*');
        j = j + 1;
    end
    hold on;
    xlim([0 1]);ylim([0 1]);
end
if noGraphicPanels == 0
    temp{1,3} = ta;
    temp{1,4} = tb;
else
    temp{1,3} = [a 0 ta];
    temp{1,4} = [b 0 tb];
end
temp{1,15} = noGraphicPanels + 1;
panelAndButtonEdit(f, temp);
end

% Add Title Box Callback
function addTextCallback(src, eventdata, temp)
set(menuCol, 'visible', 'off');
titleString=strcat('You may now begin selecting the ',...
' co-ordinates of the text box. Begin by selecting ',...
' the lower left corner, then the lower right corner ',...
' and finish by selecting the top right corner for ',...
' the text box.');
msgbox(titleString,'Add Text Box', 'help','modal');
uiwait(gcf);%This stops execution until the user has clicked ok
j = 1;
while (j <= 3)
    [tu(j) tv(j) button] = ginput(1);
    if (button ~= 1) % If right-click show cursor coordinates
        cursorData(tu(j), tv(j));
    else
        plot(tu(j),tv(j),'marker','*');
        j = j + 1;
    end
    hold on;
    xlim([0 1]);ylim([0 1]);
end

% Opens the Textbox Specs Figure with default values and gets user-defined
% values
[tbFont, tbString, tbWeight, tbAngle] = textData(temp, 12,...
    'This is a Text Box.  Change String Here', 'normal', 'normal');

if noTitles == 0
    temp{1,5} = tu;
    temp{1,6} = tv;
else
    temp{1,5} = [u 0 tu];
    temp{1,6} = [v 0 tv];
end
temp{1,18} = noTitles + 1;
temp{1,21} = [textboxFont tbFont];
temp{1,22} = [textboxString tbString];
temp{1,23} = [textboxWeight tbWeight];
temp{1,24} = [textboxAngle tbAngle];
panelAndButtonEdit(f, temp);
end


% Add Button Callback
function addButtonCallback(src, eventdata, temp, f)
set(menuCol, 'visible', 'off');
buttonString=strcat('You may now begin selecting the ',...
' co-ordinates of the button. Select the lower left corner',...
' and then the upper right corner for the button.');
msgbox(buttonString,'Add Button', 'help', 'modal');
uiwait(gcf);%This stops execution until the user has clicked ok
tn = zeros(1,2);
j = 1;
while (j <= 2)
    [tm(j) tn(j) button] = ginput(1);
    if (button ~= 1) % If right-click show cursor coordinates
        cursorData(tm(j), tn(j));
    else
        plot(tm(j),tn(j),'marker','*');
        j = j + 1;
    end
    hold on;
    xlim([0 1]);ylim([0 1]);
end

while (tn(2) == 0) % Pause program execution until button position is set
pause(0.01);
end

% Opens the Button Specs Figure with default values and gets user-defined
% values
[tmpHeight, tmpStyle, tmpString, tmpLabel, bTxt, lTxt] =...
    buttonData(temp, '.04', 1, 'Play', '...', 12, 12);

twidth = tm(2) - tm(1);
tlength = tn(2) - tn(1);

temp{1,7} = [m tm];
temp{1,8} = [n tn];
temp{1,9} = [lengthbutton tlength];
temp{1,10} = [widthbutton twidth];
temp{1,25} = [labelHeight tmpHeight];
temp{1,11} = [enterType tmpStyle];
temp{1,12} = [enterString tmpString];
temp{1,13} = [enterLabel tmpLabel];
temp{1,16} = noButtons + 1;
temp{1,19} = [buttonTextSize bTxt]; 
temp{1,20} = [labelTextSize lTxt];
panelAndButtonEdit(f, temp);
end



% Step 3d: Delete - Click on object to delete. Object is highlighted.
%                   Warning box warns of deletion
%          Delete Options - Panel, Graphic Panel, Title Box, Button, Cancel
% Delete Callback - Loads Delete Menu When 'Delete' is Selected
function deleteCallback(src, eventdata, temp)
hideButtons;
deleteMenu(temp);
end

% Delete Panel Callback
function deletePanelCallback(src, eventdata, temp)
set(menuCol, 'visible', 'off');
msgbox('Left click inside the panel that is to be deleted',...
    'Delete Panel', 'help', 'modal');
uiwait(gcf); % Pauses program execution while message box is open
toDel = 0;
j = 0;
while (j == 0)
[xDel, yDel, button] = ginput(1);
if (button ~= 1) % If right-click show cursor coordinates
    cursorData(xDel, yDel);
else
    j = 1;
    for i=(1:noPanels) % Search for valid panel selection
        if ((x(1+4*(i-1)) <= xDel) && (xDel <= x(2+4*(i-1))) &&...
              (y(1+4*(i-1)) <= yDel) && (yDel <= y(3+4*(i-1))))
            toDel = i;
        end
    end
end
end

if (toDel == 0) % If improper panel selection - error message
    abortDel = warndlg(['No Panel Selected to be Deleted.',...
        'Deletion Aborted'],'Improper Panel Selection');
    waitfor(abortDel);
    panelAndButtonEdit(f,temp);
else
    line([x(1+4*(toDel-1)) x(2+4*(toDel-1)) x(3+4*(toDel-1))...
        x(1+4*(toDel-1)) x(1+4*(toDel-1))],...
        [y(1+4*(toDel-1)) y(2+4*(toDel-1)) y(3+4*(toDel-1))...
        y(3+4*(toDel-1)) y(1+4*(toDel-1))],...
        'Color', 'r', 'linewidth', 2);
    delVerify = questdlg('Delete the Selected Panel?',...
        'Verify Delete','Yes','No','Yes');
    waitfor(delVerify);
    if strcmp(delVerify, 'No')
        panelAndButtonEdit(f,temp);
    else
        if (noPanels == 1)
        x = [];
        y = [];
        noPanels = 0;
        elseif (toDel == noPanels)
        x = x(1:(length(x)-4));
        y = y(1:(length(y)-4));
        noPanels = noPanels - 1;
        else
        x = [x(1:(4*(toDel-1))) x(((4*toDel)+1):length(x))];
        y = [y(1:(4*(toDel-1))) y(((4*toDel)+1):length(y))];
        noPanels = noPanels - 1;       
        end
    temp{1,1} = x;
    temp{1,2} = y;
    temp{1,14} = noPanels;
    panelAndButtonEdit(f,temp);    
    end
end
end


% Delete Graphic Panel Callback
function deleteGPanelCallback(src, eventdata, temp)
set(menuCol, 'visible', 'off');
hideButtons;
msgbox('Left click inside the graphic panel that is to be deleted',...
    'Delete Graphic Panel', 'help', 'modal');
uiwait(gcf); % Pauses program execution while message box is open
toDel = 0;
j = 0;
while (j == 0)
[aDel, bDel, button] = ginput(1); 
    if (button ~= 1) % If right-click show cursor coordinates
        cursorData(aDel, bDel);
    else
        j = 1;
        for i=(1:noGraphicPanels) % Search for valid g.panel selection
            if ((a(1+4*(i-1)) <= aDel) && (aDel <= a(2+4*(i-1))) &&...
              (b(1+4*(i-1)) <= bDel) && (bDel <= b(3+4*(i-1))))
            toDel = i;
            end
        end
    end
end

if (toDel == 0) % If no g.panel is selected - error message
    abortDel = warndlg(['No Graphic Panel Selected to be Deleted.',...
        'Deletion Aborted'],'Improper Graphic Panel Selection');
    waitfor(abortDel);
    panelAndButtonEdit(f,temp);
else
    line([a(1+4*(toDel-1)) a(2+4*(toDel-1)) a(3+4*(toDel-1))...
        a(1+4*(toDel-1)) a(1+4*(toDel-1))],...
        [b(1+4*(toDel-1)) b(2+4*(toDel-1)) b(3+4*(toDel-1))...
        b(3+4*(toDel-1)) b(1+4*(toDel-1))],...
        'Color', 'r', 'linewidth', 2);
    delVerify = questdlg('Delete the Selected Graphic Panel?',...
        'Verify Delete','Yes','No','Yes');
    waitfor(delVerify);
    if strcmp(delVerify, 'No')
        panelAndButtonEdit(f,temp);
    else
        if (noGraphicPanels == 1)
        a = [];
        b = [];
        noGraphicPanels = 0;
        elseif (toDel == noGraphicPanels)
        a = a(1:(length(a)-4));
        b = b(1:(length(b)-4));
        noGraphicPanels = noGraphicPanels - 1;
        else
        a = [a(1:(4*(toDel-1))) a(((4*toDel)+1):length(a))];
        b = [b(1:(4*(toDel-1))) b(((4*toDel)+1):length(b))];
        noGraphicPanels = noGraphicPanels - 1;       
        end
    temp{1,3} = a;
    temp{1,4} = b;
    temp{1,15} = noGraphicPanels;
    panelAndButtonEdit(f,temp);    
    end
end
end

% Delete Title Box
function deleteTextCallback(src, eventdata, temp)
set(menuCol, 'visible', 'off');
msgbox('Left click inside the text box that is to be deleted',...
    'Delete Text Box', 'help', 'modal');
uiwait(gcf); % Pauses program execution while message box is open
toDel = 0;
j = 0;
while (j == 0)
    [uDel, vDel, button] = ginput(1); 
    if (button ~= 1) % If right-click show cursor coordinates
        cursorData(uDel, vDel);
    else
        j = 1;
        for i=(1:noTitles) % Search for valid textbox to be deleted
            if ((u(1+4*(i-1)) <= uDel) && (uDel <= u(2+4*(i-1))) &&...
                (v(1+4*(i-1)) <= vDel) && (vDel <= v(3+4*(i-1))))
                toDel = i;
            end
        end
    end
end

if (toDel == 0) % If no textbox is selected - error message
    abortDel = warndlg(['No Text Box Selected to be Deleted.',...
        'Deletion Aborted'],'Improper Text Box Selection');
    waitfor(abortDel);
    panelAndButtonEdit(f,temp);
else
    line([u(1+4*(toDel-1)) u(2+4*(toDel-1)) u(3+4*(toDel-1))...
        u(1+4*(toDel-1)) u(1+4*(toDel-1))],...
        [v(1+4*(toDel-1)) v(2+4*(toDel-1)) v(3+4*(toDel-1))...
        v(3+4*(toDel-1)) v(1+4*(toDel-1))],...
        'Color', 'r', 'linewidth', 2);
    delVerify = questdlg('Delete the Selected Text Box?',...
        'Verify Delete','Yes','No','Yes');
    waitfor(delVerify);
    if strcmp(delVerify, 'No')
        panelAndButtonEdit(f,temp);
    else
        if (noTitles == 1)
        u = [];
        v = [];
        textboxFont = [];
        textboxString = [];
        textboxWeight = [];
        textboxAngle = [];
        noTitles = 0;
        elseif (toDel == noTitles)
        u = u(1:(length(u)-4));
        v = v(1:(length(v)-4));
        textboxFont = textboxFont(1:(length(textboxFont)-1));
        textboxString = textboxString(1:(length(textboxString)-1));
        textboxWeight = textboxWeight(1:(length(textboxWeight)-1));
        textboxAngle = textboxAngle(1:(length(textboxAngle)-1));        
        noTitles = noTitles - 1;
        else
        u = [u(1:(4*(toDel-1))) u(((4*toDel)+1):length(u))];
        v = [v(1:(4*(toDel-1))) v(((4*toDel)+1):length(v))];
        textboxFont = [textboxFont(1:(toDel-1)) ...
             textboxFont((toDel+1):length(textboxFont))];
        textboxString = [textboxString(1:(toDel-1)) ...
             textboxString((toDel+1):length(textboxString))];
        textboxWeight = [textboxWeight(1:(toDel-1)) ...
             textboxWeight((toDel+1):length(textboxWeight))];
        textboxAngle = [textboxAngle(1:(toDel-1)) ...
             textboxAngle((toDel+1):length(textboxAngle))];         
        noTitles = noTitles - 1;       
        end
    temp{1,5} = u;
    temp{1,6} = v;
    temp{1,18} = noTitles;
    temp{1,21} = textboxFont;
    temp{1,22} = textboxString;
    temp{1,23} = textboxWeight;
    temp{1,24} = textboxAngle;
    panelAndButtonEdit(f,temp);    
    end
end
end


% Delete Button
function deleteButtonCallback(src, eventdata, temp)
set(menuCol, 'visible', 'off');
msgbox('Left click inside the button that is to be deleted',...
    'Delete Button', 'help', 'modal');
uiwait(gcf); % Pause program execution while message box is open
toDel = 0;
j = 0;
while (j == 0)
    [mDel, nDel, button] = ginput(1);
    if (button ~= 1) % If right-click show cursor coordinates
        cursorData(mDel, nDel);
    else
        j = 1;
        for i=(1:noButtons) % search for button to be deleted
            if ((m(1+2*(i-1)) <= mDel) && (mDel <= m(2+2*(i-1))) &&...
                (n(1+2*(i-1)) <= nDel) && (nDel <= n(2+2*(i-1))))
                toDel = i;
            end
        end
    end
end


if (toDel == 0) % if no button is selected - error message
    abortDel = warndlg(['No Button Selected to be Deleted.',...
        'Deletion Aborted'],'Improper Button Selection');
    waitfor(abortDel);
    panelAndButtonEdit(f,temp);
else
    line([m(1+2*(toDel-1)) m(2+2*(toDel-1)) m(2+2*(toDel-1))...
        m(1+2*(toDel-1)) m(1+2*(toDel-1))],...
        [n(1+2*(toDel-1)) n(1+2*(toDel-1)) n(2+2*(toDel-1))...
        n(2+2*(toDel-1)) n(1+2*(toDel-1))],...
        'Color', 'r', 'linewidth', 2);
    delVerify = questdlg('Delete the Selected Button?',...
        'Verify Delete','Yes','No','Yes');
    waitfor(delVerify);
    if strcmp(delVerify, 'No')
        panelAndButtonEdit(f,temp);
    else
        if (noButtons == 1)
        m = [];
        n = [];
        lengthbutton = [];
        widthbutton = [];
        labelHeight = [];
        enterString = [];
        enterLabel = [];
        enterType = [];
        noButtons = 0;
        elseif (toDel == noButtons)
        m = m(1:(length(m)-2));
        n = n(1:(length(n)-2));
        lengthbutton = lengthbutton(1:(length(lengthbutton)-1));
        widthbutton = widthbutton(1:(length(widthbutton)-1));
        labelHeight = labelHeight(1:(length(labelHeight)-1));
        enterString = enterString(1:(length(enterString)-1));
        enterLabel = enterLabel(1:(length(enterLabel)-1));
        enterType = enterType(1:(length(enterType)-1));
        noButtons = noButtons - 1;
        else
        m = [m(1:(2*(toDel-1))) m(((2*toDel)+1):length(m))];
        n = [n(1:(2*(toDel-1))) n(((2*toDel)+1):length(n))];
        lengthbutton = [lengthbutton(1:(toDel-1))...
            lengthbutton((toDel+1):length(lengthbutton))];
        widthbutton = [widthbutton(1:(toDel-1))...
            widthbutton((toDel+1):length(widthbutton))];
        labelHeight = [labelHeight(1:(toDel-1))...
            labelHeight((toDel+1):length(labelHeight))];
        enterString = [enterString(1:(toDel-1))...
            enterString((toDel+1):length(enterString))];
        enterLabel = [enterLabel(1:(toDel-1))...
            enterLabel((toDel+1):length(enterLabel))];
        enterType = [enterType(1:(toDel-1))...
            enterType((toDel+1):length(enterType))];
        noButtons = noButtons - 1;       
        end
    temp{1,7} = m;
    temp{1,8} = n;
    temp{1,9} = lengthbutton;
    temp{1,10} = widthbutton;
    temp{1,25} = labelHeight;
    temp{1,11} = enterType;
    temp{1,12} = enterString;
    temp{1,13} = enterLabel;
    temp{1,16} = noButtons;
    panelAndButtonEdit(f,temp);    
    end
end
end

% Step 3e: Move - Click on object to move. Object is Highlighted. Click to
%                 select new location
%          Move Options - Panel, Graphic Panel, Title Box, Button,  Cancel

% Move Callback - Loads Move Menu When 'Move' is Seleced
function moveCallback(src, eventdata, temp)
hideButtons;
moveMenu(temp);
end

% Move Panel Button Callback
function movePanelCallback(src, eventdata, temp)
set(menuCol, 'visible', 'off');
msgbox('Left click inside the panel that is to be moved',...
    'Move Panel', 'help', 'modal');
uiwait(gcf);
toMove = 0;
j = 0;
while (j == 0)
    [xMove, yMove, button] = ginput(1); 
    if (button ~= 1) % Right click for cursor position
        cursorData(xMove, yMove);
    else
        j = 1;
        for i=(1:noPanels) % Check if selected position is in a panel
            if ((x(1+4*(i-1)) <= xMove) && (xMove <= x(3+4*(i-1))) &&...
                (y(1+4*(i-1)) <= yMove) && (yMove <= y(3+4*(i-1))))
                toMove = i;
            end
        end
    end
end

if (toMove == 0) % If no panel is selected - error message
    abortMove = warndlg('No Panel Selected to be Moved. Move Aborted',...
        'Improper Panel Selection');
    waitfor(abortMove);
else % If panel is selected, 1) highlight panel
    line([x(1+4*(toMove-1)) x(2+4*(toMove-1)) x(3+4*(toMove-1))...
        x(1+4*(toMove-1)) x(1+4*(toMove-1))],...
        [y(1+4*(toMove-1)) y(2+4*(toMove-1)) y(3+4*(toMove-1))...
        y(3+4*(toMove-1)) y(1+4*(toMove-1))],...
        'Color', 'r', 'linewidth', 2);
    % 2) Provide instructions
    msgString = ['Provide the coordinates of the new panel ',...
        'position by first selecting the bottom left corner, ',...
        'then the bottom right corner and finally the top right corner.'];
    msgbox(msgString, 'Move Panel', 'help', 'modal');
    uiwait(gcf);
    
    j = 1; % 3) Select new panel position
    while ( j <= 3)
        [tx(j), ty(j), button]=ginput(1);
        if (button ~= 1)
            cursorData(tx(j), ty(j));
        else
            plot(tx(j), ty(j), 'marker', '*');
            j = j+1;
        end
        hold on;
        xlim([0 1]);ylim([0 1]);
    end
    
x((4*(toMove-1)+1):(4*(toMove-1)+3)) = tx;
y((4*(toMove-1)+1):(4*(toMove-1)+3)) = ty;
end
temp{1,1} = x;
temp{1,2} = y;
panelAndButtonEdit(f,temp);
end
       

% Move Graphic Button Callback
function moveGPanelCallback(src, eventdata, temp)
set(menuCol, 'visible', 'off');
msgbox('Left click inside the graphic panel that is to be moved',...
    'Move Graphic Panel', 'help', 'modal');
uiwait(gcf); % Pause program execution while message box is open
toMove = 0;
j = 0;
while (j == 0)
    [aMove, bMove, button] = ginput(1); 
    if (button ~= 1) % Right Click for Cursor Position
        cursorData(aMove, bMove);
    else
        j = 1;
        for i=(1:noGraphicPanels) % Check is point is in a g.panel
            if ((a(1+4*(i-1)) <= aMove) && (aMove <= a(3+4*(i-1))) &&...
                (b(1+4*(i-1)) <= bMove) && (bMove <= b(3+4*(i-1))))
                toMove = i;
            end
        end
    end
end

if (toMove == 0) % If no g.panel is selected - error message
    abortMove = warndlg(['No Graphic Panel Selected to be Moved.',...
        'Move Aborted'],'Improper Graphic Panel Selection');
        waitfor(abortMove); % pause execution while message is open
else % Highlight selected g.panel
    line([a(1+4*(toMove-1)) a(2+4*(toMove-1)) a(3+4*(toMove-1))...
        a(1+4*(toMove-1)) a(1+4*(toMove-1))],...
        [b(1+4*(toMove-1)) b(2+4*(toMove-1)) b(3+4*(toMove-1))...
        b(3+4*(toMove-1)) b(1+4*(toMove-1))],...
        'Color', 'r', 'linewidth', 2);
    msgString = ['Provide the coordinates of the new graphic panel ',...
        'position by first selecting the bottom left corner, ',...
        'then the bottom right corner and finally the top right corner.'];
    msgbox(msgString, 'Move Graphic Panel', 'help', 'modal');
    uiwait(gcf);
      
    j = 1;
    while (j <= 3) % Select position of new g.panel
        [ta(j), tb(j), button]=ginput(1);
        if (button ~= 1)
            cursorData(ta(j), tb(j));
        else
            plot(ta(j), tb(j), 'marker', '*');
            j = j+1;
        end
        hold on;
        xlim([0 1]);ylim([0 1]);
    end
    
a((4*(toMove-1)+1):(4*(toMove-1)+3)) = ta;
b((4*(toMove-1)+1):(4*(toMove-1)+3)) = tb;
end
temp{1,3} = a;
temp{1,4} = b;
panelAndButtonEdit(f,temp);
end

% Move Text Box Callback
function moveTextCallback(src, eventdata, temp)
set(menuCol, 'visible', 'off');
msgbox('Left click inside the text box that is to be moved',...
    'Move Text Box', 'help', 'modal');
uiwait(gcf); % Pause program execution
toMove = 0;
j = 0;
while (j == 0)
    [uMove, vMove, button] = ginput(1);
    if (button ~= 1) % Right click for cursor data
        cursorData(uMove, vMove);
    else
        j = 1;
        for i=(1:noTitles) % Check if titlebox is selected
            if ((u(1+4*(i-1)) <= uMove) && (uMove <= u(3+4*(i-1))) &&...
                (v(1+4*(i-1)) <= vMove) && (vMove <= v(3+4*(i-1))))
                toMove = i;
            end
        end
    end
end

if (toMove == 0) % If no titlebox is selected - error message
    abortMove = warndlg(['No Text Box Selected to be Moved.',...
        'Move Aborted'], 'Improper Title Box Selection');
        waitfor(abortMove); % Pause program while messagebox is open
else % Highlight selected textbox
    line([u(1+4*(toMove-1)) u(2+4*(toMove-1)) u(3+4*(toMove-1))...
        u(1+4*(toMove-1)) u(1+4*(toMove-1))],...
        [v(1+4*(toMove-1)) v(2+4*(toMove-1)) v(3+4*(toMove-1))...
        v(3+4*(toMove-1)) v(1+4*(toMove-1))],...
        'Color', 'r', 'linewidth', 2);
    msgString = ['Provide the coordinates of the new text box ',...
        'position by first selecting the bottom left corner, ',...
        'then the bottom right corner and finally the top right corner.'];
    msgbox(msgString, 'Move Text Box', 'help', 'modal');
    uiwait(gcf);
    
    j = 1;
    while ( j <= 3) % Select new textbox position
        [tu(j), tv(j), button]=ginput(1);
        if (button ~= 1)
            cursorData(tu(j), tv(j));
        else
            plot(tu(j), tv(j), 'marker', '*');
            j = j+1;
        end
        hold on;
        xlim([0 1]);ylim([0 1]);
    end
    
u((4*(toMove-1)+1):(4*(toMove-1)+3)) = tu;
v((4*(toMove-1)+1):(4*(toMove-1)+3)) = tv;
end
temp{1,5} = u;
temp{1,6} = v;
panelAndButtonEdit(f,temp);
end

% Move Button Callback
function moveButtonCallback(src, eventdata, temp)
set(menuCol, 'visible', 'off');
msgbox('Left click inside the button that is to be moved',...
    'Move Button', 'help', 'modal');
uiwait(gcf);
toMove = 0;
j = 0;
while (j == 0)
    [mMove, nMove, button] = ginput(1); 
    if (button ~= 1) % Right click for cursor position
        cursorData(mMove, nMove);
    else
        j = 1;
        for i=(1:noButtons) % Check if button is selected
            if ((m(1+2*(i-1)) <= mMove) && (mMove <= m(2+2*(i-1))) &&...
                (n(1+2*(i-1)) <= nMove) && (nMove <= n(2+2*(i-1))))
                toMove = i;
            end
        end
    end
end

if (toMove == 0) % no button is selected - error message
    abortMove = warndlg('No Button Selected to be Moved. Move Aborted',...
        'Improper Button Selection');
        waitfor(abortMove);
else % button selected - highlight selected button
    line([m(1+2*(toMove-1)) m(2+2*(toMove-1)) m(2+2*(toMove-1))...
        m(1+2*(toMove-1)) m(1+2*(toMove-1))],...
        [n(1+2*(toMove-1)) n(1+2*(toMove-1)) n(2+2*(toMove-1))...
        n(2+2*(toMove-1)) n(1+2*(toMove-1))],...
        'Color', 'r', 'linewidth', 2);
    msgString = ['Provide the coordinates of the new button ',...
        'location by first left clicking at the bottom left corner, ',...
        'and then the top right corner.'];
    msgbox(msgString, 'Move Button', 'help', 'modal');
    uiwait(gcf);
      
    j = 1;
    while (j <= 2) % Select new button coordinates
        [tm(j), tn(j), button]=ginput(1);
        if (button ~= 1)
            cursorData(tm(j), tn(j));
        else
            plot(tm(j), tn(j), 'marker', '*');
            j = j+1;
        end
        hold on;
        xlim([0 1]);ylim([0 1]);
    end
    
m((2*(toMove-1)+1):(2*(toMove-1)+2)) = tm;
n((2*(toMove-1)+1):(2*(toMove-1)+2)) = tn;
lengthbutton(toMove) = tn(2) - tn(1);
widthbutton(toMove) = tm(2) - tm(1);
end
temp{1,7} = m;
temp{1,8} = n;
temp{1,9} = lengthbutton;
temp{1,10} = widthbutton;
panelAndButtonEdit(f,temp);
end



% Step 3f: Modify - Click on object to modify. Highlight object. Click to
%                   provide modifications.  
%          Modify Options - Textbox and Button

% Modify Callback - Loads Modify Menu When 'Modify' is Selected
function modifyCallback(src, eventdata, temp)
hideButtons;
modifyMenu(temp);
end

% Modify Text Box Callback
function modifyTextboxCallback(src, eventdata, temp)
set(menuCol, 'visible', 'off');
msgbox('Left click inside the title box that is to be modified',...
    'Modify Text Box', 'help', 'modal');
uiwait(gcf);
toMod= 0;
j = 0;
while(j == 0)
    [uMod, vMod, button] = ginput(1); 
    if (button ~= 1) % Right click for cursor position
        cursorData(uMod, vMod);
    else
        j = 1;
        for i=(1:noTitles) %Check if titlebox is selected
            if ((u(1+4*(i-1)) <= uMod) && (uMod<= u(3+4*(i-1))) &&...
                (v(1+4*(i-1)) <= vMod) && (vMod<= v(3+4*(i-1))))
                toMod= i;
            end
        end
    end
end

if (toMod == 0) % No textbox selected - error message
    abortMod = warndlg(['No Title Box Selected to be Modified.',...
        'Modify Aborted'],'Improper Text Box Selection');
    waitfor(abortMod);
    panelAndButtonEdit(f,temp);
else % Highlight selected textbox
    line([u(1+4*(toMod-1)) u(2+4*(toMod-1)) u(3+4*(toMod-1))...
        u(1+4*(toMod-1)) u(1+4*(toMod-1))],...
        [v(1+4*(toMod-1)) v(2+4*(toMod-1)) v(3+4*(toMod-1))...
        v(3+4*(toMod-1)) v(1+4*(toMod-1))],...
        'Color', 'r', 'linewidth', 2);

% Open Textbox Specs Figure with current textbox data
[tbFont, tbString, tbWeight, tbAngle] = textData(temp,...
    num2str(textboxFont{toMod}), textboxString{toMod},...
    textboxWeight{toMod}, textboxAngle{toMod});
    
    textboxFont(toMod) = {tbFont};
    textboxString(toMod) = tbString;
    textboxWeight(toMod) = tbWeight;
    textboxAngle(toMod) = tbAngle;

    temp{1,21} = textboxFont;
    temp{1,22} = textboxString;
    temp{1,23} = textboxWeight;
    temp{1,24} = textboxAngle;
    panelAndButtonEdit(f,temp);
end
end

% Modify Button Callback
function modifyButtonCallback(src, eventdata, temp)
set(menuCol, 'visible', 'off');
msgbox('Left click inside the button that is to be modified',...
    'Modify Button', 'help', 'modal');
uiwait(gcf);
toMod = 0;
j = 0;
while(j == 0)
    [mMod, nMod, button] = ginput(1);
    if (button ~= 1) % Right click for cursor location
        cursorData(mMod, nMod);
    else
        j = 1;
        for i=(1:noButtons) % Check if button is selected
            if ((m(1+2*(i-1)) <= mMod) && (mMod <= m(2+2*(i-1))) &&...
                (n(1+2*(i-1)) <= nMod) && (nMod <= n(2+2*(i-1))))
                toMod = i;
            end
        end
    end
end

if (toMod == 0) % no button selected - error message
    abortMod = warndlg('No Button Selected to be Modified. Modify Aborted',...
        'Improper Button Selection');
    waitfor(abortMod);    
else % Highlight selected button
    line([m(1+2*(toMod-1)) m(2+2*(toMod-1)) m(2+2*(toMod-1))...
        m(1+2*(toMod-1)) m(1+2*(toMod-1))],...
        [n(1+2*(toMod-1)) n(1+2*(toMod-1)) n(2+2*(toMod-1))...
        n(2+2*(toMod-1)) n(1+2*(toMod-1))],...
        'Color', 'r', 'linewidth', 2);  

    % Get selected button data
    tLabelHeight = labelHeight(toMod);
    bTxt = buttonTextSize(toMod);
    lTxt = labelTextSize(toMod);
    tString = enterString{toMod};
    tButStyle = enterType{toMod};
    if strcmp(tButStyle, 'pushbutton')
        tStyle = 1;
    elseif strcmp(tButStyle, 'edit')
        tStyle = 2;
    elseif strcmp(tButStyle, 'text')
        tStyle = 3;
    elseif strcmp(tButStyle, 'popupmenu')
        tStyle = 4;
    elseif strcmp(tButStyle, 'slider')
        tStyle = 5;
    end
    
    tButLabel = enterLabel{toMod};
    if strcmp(tButLabel, '')
        tLabel = '...';
    else
        tLabel = tButLabel;
    end
    
    % Open Button Specs Figure with current button data as input
    [tmpHeight, tmpStyle, tmpString, tmpLabel, bText, lText] =...
       buttonData(temp, tLabelHeight, tStyle, tString, tLabel, bTxt, lTxt);
    
   % Replace old button data with new button data
    labelHeight(toMod) = tmpHeight;
    enterString(toMod) = tmpString;
    enterType(toMod) = tmpStyle;
    enterLabel(toMod) = tmpLabel;
    buttonTextSize(toMod) = bText;
    labelTextSize(toMod) = lText;
end
temp{1,25} = labelHeight;
temp{1,11} = enterType;
temp{1,12} = enterString;
temp{1,13} = enterLabel;
temp{1,19} = buttonTextSize;
temp{1,20} = labelTextSize;
panelAndButtonEdit(f,temp);      
end

% Step 3g: Index - Click on feature to show index values. Index values
%                  shown in feature boundaries.  Click 'close' to exit
%          Index Options - Graphic Panel, Textbox and Button
% Modify Callback - Loads Modify Menu When 'Modify' is Selected
function indexCallback(src, eventdata, temp)
    hideButtons;
    indexMenu(temp);
end

% Index of Graphic Panels Callback
function indexGPanelCallback(src, eventdata, temp)
    set(menuCol, 'visible', 'off');         % Hide Menu
    % Set "Done" Button on top-middle of screen
    DONEBUTTON = uicontrol('Style','PushButton',...
                     'Units','Normalized',...
                     'String','Done',...
                     'visible', 'on',...
                     'Position',[.475 0.975 .05 0.025],...
                     'Callback', {@doneButtonCallback, temp});
        for i = 0:(noGraphicPanels-1)       % Show Index Values
            bot = .5*(b(4*i+3) + b(4*i+1)) - .01;
            left = .5*(a(4*i+3) + a(4*i+1)) - .01;
            iString = num2str(i+1);
            uicontrol('parent', f, 'style', 'text', 'string', iString,...
                      'units', 'normalized',...
                      'position', [left, bot, .02, .02],...
                      'FontSize', 10, 'FontWeight', 'bold');
        end
   
end

% Index of Text Boxes Callback
function indexTextboxCallback(src, eventdata, temp)
    set(menuCol, 'visible', 'off');     % Hide Menu
    % Set "Done" Button on top-middle of screen
    DONEBUTTON = uicontrol('Style','PushButton',...
                     'Units','Normalized',...
                     'String','Done',...
                     'visible', 'on',...
                     'Position',[.475 0.975 .05 0.025],...
                     'Callback', {@doneButtonCallback, temp});
        for i = 0:(noTitles-1)          % Show Index Values
            left = .5*(u(4*i+3) + u(4*i+1)) - .01;
            bot = .5*(v(4*i+3) + v(4*i+1)) - .01;
            iString = num2str(i+1);
            uicontrol('parent', f, 'style', 'text', 'string', iString,...
                      'units', 'normalized',...
                      'position', [left, bot, .02, .02],...
                      'FontSize', 10, 'FontWeight', 'bold');
        end
   
end
 
% Index of Buttons Callback
function indexButtonCallback(src, eventdata, temp)
    set(menuCol, 'visible', 'off'); % Hide Menu
    % Set "Done" Button on top-middle of screen
    DONEBUTTON = uicontrol('Style','PushButton',...
                     'Units','Normalized',...
                     'String','Done',...
                     'visible', 'on',...
                     'Position',[.475 0.975 .05 0.025],...
                     'Callback', {@doneButtonCallback, temp});
        for i = 0:(noButtons-1)         % Show Index Values
            bot = .5*(n(2*i+2)+n(2*i+1)) - .01;
            left = .5*(m(2*i+2)+m(2*i+1)) - .01;
            iString = num2str(i+1);
            uicontrol('parent', f, 'style', 'text', 'string', iString,...
                      'units', 'normalized',...
                      'position', [left, bot, .02, .02],...
                      'FontSize', 10, 'FontWeight', 'bold');
        end
   
end

    % end :)
end 