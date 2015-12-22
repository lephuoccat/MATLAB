function PanelButtonSetup
clc;
clear all;
%DECLARATIONS
% labelHeight;%height of button label
% x; %x co ordinates of the panel
% y; %y co ordinates of the panel
% m; %left bottom x co ordinate of the button
% n; %left bottom y co ordinate of the button
global ENTERSTYLEOFBUTTON;%element of a cell array in which the STYLE
%of the button is stored
global ENTERSTRINGOFBUTTON;%element of a cell array in which the STRING
%of the button is stored
global ENTERLABELOFBUTTON;
global FLAGFORPAUSE; %for the pause function after the button stats GUI appears
%it is related to the accept specs button
global SAVEGUIBUTTON;
global SAVEASBUTTON;
global MODIFYBUTTON;
global QUITBUTTON;
global NEWBUTTON;
global SAVETEXTBOX;

global nP;
global nGP;
global nTi;
global nB;
%INITIALIZATION
move=0.1;%the buttons move by this amount
labelDist=0.01;%distance that the label is below the button
noPanels=0;             
noGraphicPanels=0;      
noButtons=0;            
noTitles=0;             
writefilename='file1';%name of the file in which the name
ofile = 'file1';
%of the file is stored
typeIndex=1;%index for the popupmenu which allows you to choose the type
%of button. typeIndex=1=pushbutton,2=edit,etc.
FLAGFORPAUSE=0;%for the pause function after the button stats GUI
%appears it is related to the accept specs button

f = figure('Visible','on',...
'Units','normalized',...
'Position',[0 0 1 1],...
'MenuBar','none',...
'NumberTitle','off',...
'Name', 'Feature Setup GUI');
% Initialize Feature Number Title
setDrawTitle=uicontrol('Parent',f,...
    'Units','Normalized',...
    'Style','text',...
    'Position',[0.2 0.9-move 0.5 0.075],...
    'String','New GUI - Set Number of Features',...
    'FontUnits', 'Normalized',...
    'FontSize', .6,...
    'FontWeight', 'bold');

%Enter the number of panels
numberOfPanels=uicontrol('Parent',f,...
'Units','Normalized',...
'Style','edit',...
'Position',[0.1 0.75-move 0.1 0.05],...
'Backgroundcolor','w',...
'String','0',...
'Callback',@noPanelsCallback);
Label1=uicontrol('parent',f,...
'Units','Normalized',...
'Position',[0.1 0.7-move 0.1 0.04],...
'Style','text',...
'String','Enter the total number of panels');
%Enter the number of panels
numberOfGraphicPanels=uicontrol('Parent',f,...
'Units','Normalized',...
'Style','edit',...
'Position',[0.3 0.75-move 0.1 0.05],...
'Backgroundcolor','w',...
'String','0',...
'Callback',@noGraphicPanelsCallback);
Label2=uicontrol('parent',f,...
'Units','Normalized',...
'Position',[0.3 0.7-move 0.1 0.04],...
'Style','text',...
'String','Enter the total number of graphic panels');
%Enter the number of title boxes
numberOfTitles=uicontrol('Parent',f,...
'Units','Normalized',...
'Style','edit',...
'Position',[0.5 0.75-move 0.1 0.05],...
'Backgroundcolor','w',...
'String','0',...
'Callback',@noTitlesCallback);
Label4=uicontrol('parent',f,...
'Units','Normalized',...
'Position',[0.5 0.7-move 0.1 0.04],...
'Style','text',...
'String','Enter the total number of text boxes');
%Enter the number of buttons
numberOfButtons=uicontrol('Parent',f,...
'Units','Normalized',...
'Style','edit',...
'Position',[0.7 0.75-move 0.1 0.05],...
'Backgroundcolor','w',...
'String','0',...
'Callback',@noButtonsCallback);
Label3=uicontrol('parent',f,...
'Units','Normalized',...
'Position',[0.7 0.7-move 0.1 0.04],...
'Style','text',...
'String','Enter the total number of buttons');
% Enter a file name for the save option
fileName=uicontrol('parent',f,...
'Units','normalized',...
'Position',[0.4 0.6-move 0.1 0.05],...
'Style','edit',...
'String','file1',...
'BackgroundColor','white',...
'Callback',@fileNameCallback);
Label7=uicontrol('parent',f,...
'Units','normalized',...
'Position',[0.4 0.55-move 0.1 0.04],...
'Style','text',...
'String','Enter a name to save the file');
%Begin drawing
beginDraw=uicontrol('Parent',f,...
'Units','normalized',...
'Position',[0.3725 0.45-move 0.15 0.05],...
'String','Begin Drawing Panels & Buttons',...
'Callback',@beginDrawCallback);

%CALLBACKS
%callback for begin drawing
function beginDrawCallback(h,eventdata)

%turn all the buttons and edit boxes off
set(setDrawTitle, 'Visible', 'off');
set(numberOfPanels,'Visible','off');
set(numberOfGraphicPanels,'Visible','off');
set(numberOfButtons,'Visible','off');
set(numberOfTitles,'Visible','off');
set(Label1,'Visible','off');
set(Label2,'Visible','off');
set(Label3,'Visible','off');
set(Label4,'Visible','off');
set(beginDraw,'Visible','off');
set(fileName,'Visible','off');
set(Label7,'Visible','off');
%A cell i.e. temp, which stores all information from panelSetup is
%created and will be written into a .mat file
temp=cell(1,26);
temp{1,26}=writefilename;
temp{1,14}=noPanels;
temp{1,15}=noGraphicPanels;
temp{1,16}=noButtons;
temp{1,18}=noTitles;
temp{1,17}=labelDist;

%Draw a plot to select points.If a plot(i.e. the white screen)is not
%drawn over the figure window using the axes command, the ginput
%command will not work
plotHandle = axes('parent',f,...
'Units','Normalized',...
'Position',[0 0 1 1]);
grid on;
hold on;

%PANELS
%You may now begin selecting the endpoints for each panel
%Only three endpoints begining with the lower left point, the
%lower right point and the upper right point needs to be selected
x=zeros(1,3*noPanels);
y=zeros(1,3*noPanels);
if noPanels~=0
%Msgbox indicating that the co-ordinates for the panels will now begin
%to be selected
panelString=strcat('You may now begin selecting the ',...
' co-ordinates of the panels. Begin by selecting the lower ',...
' left corner, then the lower right corner and finish by ',...
' selecting the top right corner for each panel.');
msgbox(panelString,'Add Panel', 'help', 'modal');
uiwait(gcf);%This stops execution until the user has clicked ok
for i=0:noPanels-1
j = 1;

while (j <= 3)
[xT yT button] = ginput(1);
if (button ~= 1)
    cursorData(xT, yT);
else
    x(j+4*i) = xT;
    y(j+4*i) = yT;
    plot(x(j+4*i),y(j+4*i),'marker','*');
    j = j+1;
end
hold on;
xlim([0 1]);ylim([0 1]);
end

line([x(1+4*i) x(2+4*i) x(3+4*i) x(1+4*i) x(1+4*i)],...
[y(1+4*i) y(2+4*i) y(3+4*i) y(3+4*i) y(1+4*i)],...
'Color', 'k','linewidth', 2);
if i==noPanels-1
temp{1,1}=x;%x and y are for the button panels
temp{1,2}=y;
end
end
end

%GRAPHICS PANELS
%You may now begin selecting the endpoints for each graphic panel
%Only three endpoints begining with the lower left point, the
%lower right point and the upper right point needs to be selected
a=zeros(1,3*noGraphicPanels);
b=zeros(1,3*noGraphicPanels);
if noGraphicPanels~=0
%Msgbox indicating that the panels have been drawn and that the
%graphic panels may now be drawn
graphicString=strcat('You may now begin selecting the ',...
' co-ordinates of the graphics panels. Begin by ',...
' selecting the lower left corner, then the lower ',...
' right corner and finish by selecting the top right ',...
' corner for each graphic panel.');
msgbox(graphicString,'Add Graphic Panel', 'help', 'modal')
uiwait(gcf);%This stops execution until the user has clicked ok
for i=0:noGraphicPanels-1
j = 1;
while (j <= 3)
    [aT bT button] = ginput(1);
    if (button ~= 1)
        cursorData(aT, bT);
    else
        a(j+4*i) = aT;
        b(j+4*i) = bT;
        plot(a(j+4*i),b(j+4*i),'marker','*');
        j = j + 1;
    end
    hold on;
    xlim([0 1]);ylim([0 1]);
end

line([a(1+4*i) a(2+4*i) a(3+4*i) a(1+4*i) a(1+4*i)],...
[b(1+4*i) b(2+4*i) b(3+4*i) b(3+4*i) b(1+4*i)],...
'Color', 'g','linewidth', 2);
if i==noGraphicPanels-1
temp{1,3}=a;%a and b are coordiantes for the
temp{1,4}=b;%graphics panel
end
end
end

%TITLE BOXES
%You may now begin selecting the endpoints for each title box
%Only three endpoints begining with the lower left point, the
%lower right point and the upper right point needs to be selected
u=zeros(1,3*noTitles);
v=zeros(1,3*noTitles);
if noTitles~=0
%Msgbox indicating that the graphic panels have been drawn and
%that the title boxes may now be drawn
titleString=strcat('You may now begin selecting the ',...
' co-ordinates of the text boxes. Begin by selecting ',...
' the lower left corner, then the lower right corner ',...
' and finish by selecting the top right corner for ',...
' each text box.');
msgbox(titleString,'Add Text Box', 'help','modal')
uiwait(gcf);%This stops execution until the user has clicked ok
for i=0:noTitles-1
j = 1;
while (j <= 3)
    [uT vT button] = ginput(1);
    if (button ~= 1)
        cursorData(uT, vT);
    else
        u(j+4*i) = uT;
        v(j+4*i) = vT;
        plot(u(j+4*i),v(j+4*i),'marker','*');
        j = j + 1;
    end
    hold on;
    xlim([0 1]);ylim([0 1]);
end


%if you have not yet selected the position of the text box,pause until
%you have. If a pause is not created, the text box stats gui will
%appear before the position of the point is selected.
while (v(3+4*i) == 0)                               
pause(0.01);
end

% Initialize Values
textboxFont{1,i+1} = 12;
textboxString{1,i+1} = 'This is a Text Box.  Change String Here';
textboxWeight{1,1+i} = 'normal';
textboxAngle{1,1+i} = 'normal';


%TextStats figure to enter the text box details
textStats = figure('Visible','on',...
'Units','normalized',...
'Position',[0.2 0.2 0.6 0.6],...
'MenuBar','none',...
'NumberTitle','off');
set(textStats,'Name','Text Box Stats');
% Figure Title
textStatsTitleDisplay=uicontrol('Parent',textStats,...
'Units','Normalized',...
'Style','text',...
'Position',[0.3 0.875 0.4 0.12],...
'FontUnits', 'normalized',...
'FontSize',.75,...
'FontWeight', 'bold',...
'String','Text Stats GUI');
% Edit Box for textbox string
EnterTextStringBox=uicontrol('Parent',textStats,...
'Units','Normalized',...
'Style','edit',...
'Max', 5,...
'Position',[0.3 0.655 0.4 0.2],...
'Backgroundcolor','w',...
'String','This is a Text Box.  Change String Here',...
'Callback',{@EnterTextStringBoxCallback,i});
% Textbox String Edit Button Caption
Label9=uicontrol('parent',textStats,...
'Units','normalized',...
'Position',[0.3 0.615 0.4 0.03],...
'Style','text',...
'String','Enter Text Box Content');
% Edit box for text size
EnterTextSizeBox=uicontrol('Parent',textStats,...
'Units','Normalized',...
'Style','edit',...
'Position',[0.4 0.475 0.2 0.1],...
'Backgroundcolor','w',...
'String','12',...
'Callback',{@EnterTextSizeBoxCallback,i});
% Caption for text size box
Label9=uicontrol('parent',textStats,...
'Units','normalized',...
'Position',[0.4 0.435 0.2 0.03],...
'Style','text',...
'String','Enter Text Size');
% Pulldown menu for text style (bold/italic)
EnterTextStyleBox=uicontrol('Parent',textStats,...
'Units','Normalized',...
'Style','popupmenu',...
'Position',[0.4 0.295 0.2 0.1],...
'Backgroundcolor','w',...
'val',1,...
'String','normal|bold|italics|bold + italics',...
'Callback',{@EnterTextStyleBoxCallback,i});
% Caption for text style menu
TextStyleLabel=uicontrol('parent',textStats,...
'Units','normalized',...
'Position',[0.4 0.325 0.2 0.03],...
'Style','text',...
'String','Choose the Style of the Text Box');
% Accept and close Textbox Specs Box
acceptTextSpecsBox=uicontrol('Parent',textStats,...
'Units','Normalized',...
'Position',[0.35 0.14 0.3 0.1],...
'String','Accept Text Box Specs',...
'Callback',{@acceptTextSpecsCallback});

% Pause program execution while textbox figure is open
while FLAGFORPAUSE==0
pause(0.01);
end
FLAGFORPAUSE=0;

% Draw textbox
line([u(1+4*i) u(2+4*i) u(3+4*i) u(1+4*i) u(1+4*i)],...
[v(1+4*i) v(2+4*i) v(3+4*i) v(3+4*i) v(1+4*i)],...
'Color', 'm','linewidth', 2);

% Place data in 'temp' cell array
if i==noTitles-1
temp{1,5}=u;%u and v are for the title boxes
temp{1,6}=v;
temp{1,21}=textboxFont;
temp{1,22}=textboxString;
temp{1,23}=textboxWeight;
temp{1,24}=textboxAngle;
end
end
end

%BUTTONS
%You may now begin selecting the endpoints for each button
%Only the lower left and top right points need to be selected
m=zeros(1,2*noButtons);                          
n=zeros(1,2*noButtons);                          
labelHeight = zeros(1,noButtons);                

if noButtons~=0
%Msgbox indicating that the title boxes have been drawn and
%that the buttons may now be drawn
buttonString=strcat('You may now begin selecting the ',...
' co-ordinates of the buttons. Select the lower left corner',...
' and then the upper right corner for each button.');
msgbox(buttonString,'Add Button', 'help', 'modal');
uiwait(gcf);%This stops execution until the user has clicked ok
%Initializing for default values
for i=1:noButtons
ENTERSTYLEOFBUTTON{1,i}='pushbutton';
ENTERSTRINGOFBUTTON{1,i}='Play';
ENTERLABELOFBUTTON{1,i}='';
end
for i=1:noButtons
j = 1;
while (j <= 2)
    [mT nT button] = ginput(1);
    if (button ~= 1)
        cursorData(mT, nT);
    else
        m(j+2*(i-1)) = mT;
        n(j+2*(i-1)) = nT;
        plot(m(j+2*(i-1)),n(j+2*(i-1)),'marker','*');
        j = j + 1;
    end
    hold on;
    xlim([0 1]);ylim([0 1]);
end

%if you have not yet selected the position of the button, pause until
%you have. If a pause is not created, the button stats gui will
%appear before the position of the point is selected.
while (m(2+2*(i-1)) == 0)                               
pause(0.01);
end

% Calculate length/width (used for compatibility with older verions)
lengthbutton(i) = n(2+2*(i-1))- n(1+2*(i-1));
widthbutton(i) = m(2+2*(i-1)) - m(1+2*(i-1));
%Button Stats figure to enter the button details
buttonStats = figure('Visible','on',...
'Units','normalized',...
'Position',[0.2 0.2 0.6 0.6],...
'MenuBar','none',...
'NumberTitle','off');
set(buttonStats,'Name','Button Stats');
buttonStatsTitleDisplay=uicontrol('Parent',buttonStats,...
'Units','Normalized',...
'Style','text',...
'Position',[0.3 0.9 0.4 0.075],...
'FontUnits', 'normalized',...
'FontSize', .75,...
'FontWeight', 'bold',...
'String','Button Stats GUI');
%Buttons for Button stats
ENTERSTYLEOFBUTTONBox=uicontrol('Parent',buttonStats,...
'Units','Normalized',...
'Style','popupmenu',...
'Position',[0.2 0.84-move 0.25 0.1],...
'Backgroundcolor','w',...
'String','pushbutton|edit|text|popupmenu|slider',...
'Callback',{@ENTERSTYLEOFBUTTONCallback,i});
Label8=uicontrol('parent',buttonStats,...
'Units','normalized',...
'Position',[0.2 0.81-move 0.25 0.06],...
'Style','text',...
'String','Choose the type of the button');
ENTERSTRINGOFBUTTONBox=uicontrol('Parent',buttonStats,...
'Units','Normalized',...
'Style','edit',...
'Position',[0.55 0.88-move 0.25 0.1],...
'Backgroundcolor','w',...
'String','Play',...
'Callback',{@ENTERSTRINGOFBUTTONCallback,i});
Label9=uicontrol('parent',buttonStats,...
'Units','normalized',...
'Position',[0.55 0.81-move 0.25 0.06],...
'Style','text',...
'String','Enter the string to be written on the button.**');
ENTERLABELOFBUTTONBox=uicontrol('Parent',buttonStats,...
'Units','Normalized',...
'Style','edit',...
'Position',[0.3 0.67-move 0.4 0.1],...
'Backgroundcolor','w',...
'String','...',...
'Callback',{@ENTERLABELOFBUTTONCallback,i});
labelString=strcat('Enter a label for the button ',...
' created in the box below. After you have ',...
' entered a label click on the Accept Specs ',...
' button. If you do not require a label, ',...
' click the Accept Specs Button. ');
labelInfoBox=uicontrol('Parent',buttonStats,...
'Units','Normalized',...
'Style','text',...
'Position',[0.3 0.52-move 0.4 0.13],...
'String',labelString);
labelHeightBox=uicontrol('Parent',buttonStats,...
'Units','Normalized',...
'Style','edit',...
'Position',[0.3 0.42-move 0.4 0.06],...
'Backgroundcolor','w',...
'String','.04',...
'Callback',{@labelHeightCallback,i});
labelHeightInfoString = strcat('Enter the label height. ',...
    ' If no label is required, the label height selected ',...
    ' is arbitrary.');
labelHeightInfoBox=uicontrol('Parent',buttonStats,...
'Units','Normalized',...
'Style','text',...
'Position',[0.3 0.35-move 0.4 0.06],...
'String',labelHeightInfoString);
acceptSpecsBox=uicontrol('Parent',buttonStats,...
'Units','Normalized',...
'Position',[0.3 0.2-move 0.4 0.1],...
'String','Accept Specs Button',...
'Callback',{@acceptSpecsCallback,i,m,n});
labelNote=strcat('**NOTE:The popupmenu button requires that the ',...
' string be entered as shown in the example. ',...
' eg:Hamming|Triangular|Rectangular. Also, the "slider" ',...
'button does not require a string. ');
labelNoteBox=uicontrol('Parent',buttonStats,...
'Units','Normalized',...
'Style','text',...
'Position',[0.1 0.1-move 0.8 0.065],...
'String',labelNote);
%While the FLAGFORPAUSE is not set,pause. Then reset the FLAGFORPAUSE
while FLAGFORPAUSE==0
pause(0.01);
end
FLAGFORPAUSE=0;
pause(0.05);
xlim([0 1]);ylim([0 1]);
% Draw Button
line([m(1+2*(i-1)) m(2+2*(i-1)) m(2+2*(i-1)) m(1+2*(i-1)) m(1+2*(i-1))],...         
[n(1+2*(i-1)) n(1+2*(i-1)) n(2+2*(i-1)) n(2+2*(i-1)) n(1+2*(i-1))],...              
'Color', 'b', 'linewidth', 2);
%Load all button parameters into the cell once all the buttons are
%created
if i==noButtons
temp{1,7}=m;%m and n are for the buttons
temp{1,8}=n;
temp{1,9} = lengthbutton;
temp{1,10} = widthbutton;
temp{1,11}=ENTERSTYLEOFBUTTON;
temp{1,12}=ENTERSTRINGOFBUTTON;
temp{1,13}=ENTERLABELOFBUTTON;
temp{1,19} = 12.*ones(1,noButtons);
temp{1,20} = 10.*ones(1,noButtons);
temp{1,25} = labelHeight;
end
end
end



%UICONTROL objects associated with completion of build phase
% Menu Header Text
SAVETEXTBOX=uicontrol('Parent',f,...
'Units','Normalized',...
'Style','text',...
'Position',[0.36 0.9 0.15 0.05],...
'Backgroundcolor',[.95 .95 .95],...
'String','Creation Phase Complete Select Next Option',...
'FontSize', 14, 'FontWeight', 'bold', 'FontAngle', 'Italic');
% Save GUI
SAVEGUIBUTTON=uicontrol('Style','PushButton',...
'Units','Normalized',...
'String','Save',...
'Position',[0.36 0.85 0.15 0.05],...
'Parent',f,...
'Callback',{@saveCallback,temp});
% Save GUI as
SAVEASBUTTON=uicontrol('Style','PushButton',...
'Units','Normalized',...
'String','Save As',...
'Position',[0.36 0.8 0.15 0.05],...
'Parent',f,...
'Callback',{@saveAsCallback,temp});
% Open GUI Edit Mode
MODIFYBUTTON=uicontrol('Style','PushButton',...
'Units','Normalized',...
'String','Modify',...
'Position',[0.36 0.75 0.15 0.05],...
'Parent',f,...
'Callback',{@modifyCallback, temp});
% Create New GUI
NEWBUTTON=uicontrol('Style','PushButton',...
'Units','Normalized',...
'String','New',...
'Position',[0.36 0.7 0.15 0.05],...
'Parent',f,...
'Callback',@newCallback);
% Quit GUI Editor
QUITBUTTON=uicontrol('Style','PushButton',...
'Units','Normalized',...
'String','Quit',...
'Position',[0.36 0.65 0.15 0.05],...
'Parent',f,...
'Callback',@quitCallback);



%CALLBACKS within the beginDrawing function
% Sets textbox style from pulldown menu numeric value
function EnterTextStyleBoxCallback(src, eventdata, i)
    typeIndex=get(EnterTextStyleBox,'val');
    if typeIndex == 1
        textboxWeight{1,i+1} = 'normal';
        textboxAngle{1,i+1} = 'normal';
    elseif typeIndex == 2
        textboxWeight{1,i+1} = 'bold';
        textboxAngle{1,i+1} = 'normal';
    elseif typeIndex == 3
        textboxWeight{1,i+1} = 'normal';
        textboxAngle{1,i+1} = 'italic';
    elseif typeIndex == 4
        textboxWeight{1,i+1} = 'bold';
        textboxAngle{1,i+1} = 'italic';
    else
        textboxWeight{1,i+1} = 'normal';
        textboxAngle{1,i+1} = 'normal';
    end
end
% Get textbox String
function EnterTextStringBoxCallback(src, eventdata, i)
     textboxString{1,i+1} = get(EnterTextStringBox,'string');   
end
% Get textbox font size
function EnterTextSizeBoxCallback(src, eventdata, i)
    textboxFont{1,i+1} = int8(str2num(get(EnterTextSizeBox,'string')));
end
% Close textbox specs figure
function acceptTextSpecsCallback(src, eventdata)
    close(textStats);
    FLAGFORPAUSE = 1; % Unpauses program execution
end

% Get button style from pulldown menu's numeric representation
function ENTERSTYLEOFBUTTONCallback(src,eventdata,i)
typeIndex=get(ENTERSTYLEOFBUTTONBox,'val');
if typeIndex==1
ENTERSTYLEOFBUTTON{1,i}='pushbutton';
elseif typeIndex==2
ENTERSTYLEOFBUTTON{1,i}='edit';
elseif typeIndex==3
ENTERSTYLEOFBUTTON{1,i}='text';
elseif typeIndex==4
ENTERSTYLEOFBUTTON{1,i}='popupmenu';
elseif typeIndex==5
ENTERSTYLEOFBUTTON{1,i}='slider';
end
end
% Get Button's String
function ENTERSTRINGOFBUTTONCallback(src,eventdata,i)
ENTERSTRINGOFBUTTON{1,i}=get(ENTERSTRINGOFBUTTONBox,'string');
end
% Get Button Label's String
function ENTERLABELOFBUTTONCallback(src,eventdata,i)
ENTERLABELOFBUTTON{1,i}=get(ENTERLABELOFBUTTONBox,'string');
end
% Get height of label
function labelHeightCallback(src,eventdata,i)
labelHeight(i)=str2num(get(labelHeightBox,'string'));
end
% Close button specs figure and draw labels (if applicable)
function acceptSpecsCallback(src,eventdata,i,m,n)
%If a label is created, then draw the label.
if (isempty(ENTERLABELOFBUTTON{1,i}))
    labelHeight(i) = 0;
elseif (strcmp(ENTERLABELOFBUTTON{1,i},'...'))
    labelHeight(i) = 0;
else
    labelHeight(i) = str2num(get(labelHeightBox,'string'));
    figure(f),line([m(1+2*(i-1)), m(2+2*(i-1)), m(2+2*(i-1)), m(1+2*(i-1)),...
    m(1+2*(i-1))],[n(1+2*(i-1))-labelDist-labelHeight(i),...
    n(1+2*(i-1))-labelDist-labelHeight(i),...
    n(1+2*(i-1))-labelDist n(1+2*(i-1))-labelDist,...
    n(1+2*(i-1))-labelDist-labelHeight(i)],'Color', 'r');
end

close(buttonStats);
FLAGFORPAUSE=1; %Set FLAGFORPAUSE to release the pause
end
% Allows for right click to show cursor position
function cursorData(x, y)
    dataBox = uicontrol('Style','text', 'Units','Normalized',...
        'String',['x: ', num2str(x), ', y: ', num2str(y)],...
        'Position',[.93 .98 0.07 0.02], 'Parent', f,...
        'FontUnits', 'normalized', 'FontSize', .5);
end        
end
% Set number of panels from initialization screen
function noPanelsCallback(varargin)
noPanels = str2num(get(numberOfPanels,'string'));
nP=noPanels;
end

% Set number of g.panels from initialization screen
function noGraphicPanelsCallback(varargin)
noGraphicPanels = str2num(get(numberOfGraphicPanels,'string'));
nGP=noGraphicPanels;
end

% Set number of text boxes from initialization screen
function noTitlesCallback(varargin)
noTitles = str2num(get(numberOfTitles,'string'));
nTi=noTitles;
end

% Set number of buttons from initialization screen
function noButtonsCallback(varargin)
noButtons = str2num(get(numberOfButtons,'string'));
nB=noButtons;
end

% Set filename from initialization screen
function fileNameCallback(h,eventdata)
ofile = get(fileName,'string');
writefilename=strcat(get(fileName,'string'));
end

%Save Callback
%The entire cell, temp is saved into a .mat file
function saveCallback(src,eventdata,temp)
currentDir=pwd;
currDir=strcat(currentDir,'\',writefilename,'.mat');
save(strvcat(currDir),'temp');
do_stuff1();
do_stuff2();
msgbox('Save Successful', strcat(writefilename, '.mat'), 'help');
uiwait(gcf);
end

% Save As Callback
%The entire cell, temp is saved into a .mat file named by user
function saveAsCallback(src,eventdata,temp)
filenameTemp = inputdlg('Enter New File Name', 'Save As',...
    1, {writefilename});
if (length(filenameTemp) == 1) % Check against 'cancel' selection
    set(fileName, 'String', filenameTemp{1});
    writefilename = get(fileName, 'String');
    temp{1,26} = filenameTemp{1};
    clearvars filenameTemp;
    currentDir=pwd;
    currDir=strcat(currentDir,'/',writefilename,'.mat');
    save(strvcat(currDir),'temp');
    msgbox('Save Successful', strcat(writefilename, '.mat'), 'help');
    uiwait(gcf);
end
end

% Modify Callback - Opens Edit Mode
function modifyCallback(src,eventdata,temp)
modText = ['Enter GUI Modify Mode?  Unsaved Changes Will Not Be Saved'];
modVerify = questdlg(modText, 'Modify GUI','Yes','No','No');
    switch modVerify
        case 'Yes'
            set(SAVETEXTBOX, 'visible', 'off');
            set(SAVEGUIBUTTON, 'visible', 'off');
            set(SAVEASBUTTON, 'visible', 'off');
            set(MODIFYBUTTON, 'visible', 'off');
            set(NEWBUTTON, 'visible', 'off');
            set(QUITBUTTON, 'visible', 'off');
            set(f, 'visible', 'off');
            panelAndButtonEdit(f, temp);
    end 
end

% New Callback - Restarts new GUI editor
function newCallback(src, eventdata)
    newVerify = questdlg(['Create New GUI?',...
        '  Unsaved Changes Will Not Be Saved'],...
        'New GUI','Yes','No','No');
    switch newVerify
        case 'Yes'
            close(f);
            run PanelButtonSetup;
    end
end

% Quit Callback - Exits GUI Editor
function quitCallback(src, eventdata)
    quitVerify = questdlg(['Quit GUI Editor?  ',...
        'Unsaved Changes Will Not Be Saved'],...
        'Quit GUI','Yes','No','No');
    switch quitVerify
        case 'Yes'
            close(f);
    end
end

function do_stuff1()
    fid = fopen('EditrunGui.m');
    %edit(strcat((get(fileName,'string')),'.m'))
    edit(strcat(writefilename,'_GUI26.m'))
    fid2 = fopen(strcat(writefilename,'_GUI26.m'),'at');
    tline = [];
    while(~feof(fid))
        tline = fgetl(fid);
        if (strcmp(tline,'function EditrunGui') == 1)
            tline = strcat('function ',{' '},get(fileName,'string'),'_GUI26');
            tline = tline{1};
        end
        if (strcmp(tline,'fileName = ''lab1e1.mat'';    %USER - ENTER FILENAME') == 1)
            tline = 'fileName = ''';
            tline = strcat(tline,strcat(writefilename,'.mat'';'));
        end 
        if (strcmp(tline,'PanelandButtonCallbacks(f,temp,start_path);    %USER - ENTER PROPER CALLBACK FILE') == 1)
            tline = strcat('Callbacks_',strcat(writefilename,'_GUI26(f,temp,start_path);'));
        end 
        fwrite(fid2,tline);
        fprintf(fid2,'\n');
    end
    fclose(fid2);
end

function do_stuff2()
    fid = fopen('PanelandButtonCallbacks.m');
    edit(strcat('Callbacks_',strcat(writefilename,'_GUI26.m')));
    fid2 = fopen(strcat('Callbacks_',strcat(writefilename,'_GUI26.m')),'a+');
    tline = fgetl(fid);
    tline = strcat('function',{' '},'Callbacks_',get(fileName,'string'),'_GUI26','(f,C,start_path)\n');
    fprintf(fid2,tline{1});
    A = fread(fid,1193,'*char');
    fwrite(fid2,A','*char');
    for n=1:nGP
        gpcstring = strcat('case',{' '},num2str(n));
        gpstring = strcat('graphicPanel',num2str(n),{' '},'= axes(''parent'',f,...');
        fprintf(fid2,'\n');
        fprintf(fid2,'%s\n',gpcstring{1});
        fprintf(fid2,'%s\n',gpstring{1});
        fprintf(fid2,'%s\n','''Units'',''Normalized'',...');
        fprintf(fid2,'%s\n','''Position'',[a(1+4*i) b(1+4*i) a(2+4*i)-a(1+4*i) b(3+4*i)-b(2+4*i)],...');
        fprintf(fid2,'%s','''GridLineStyle'',''--'');');
    end
    fprintf(fid2,'\nend\nend');
    A = fread(fid,1683,'*char');
    A = fread(fid,124,'*char');
    fwrite(fid2,A,'*char');
    fprintf(fid2,'\n');
    for m=1:nTi
        ticstring = strcat('case',{' '},num2str(m));
        tistring = strcat('titleBox',num2str(m),{' '},'= uicontrol(''parent'',f,...');
        ticbstring = strcat('Callback,',{' '},'@button',num2str(m),'Callback);');
        fprintf(fid2,'%s\n',ticstring{1});
        fprintf(fid2,'%s\n',tistring{1});
        fprintf(fid2,'%s\n','''Units'',''Normalized'',...');
        fprintf(fid2,'%s\n','''Position'',[u(1+4*k) v(1+4*k) u(2+4*k)-u(1+4*k) v(3+4*k)-v(2+4*k)],...');
        fprintf(fid2,'%s\n','''Style'',''text'',...');
        fprintf(fid2,'%s\n','''FontSize'',textboxFont{k+1},...');
        fprintf(fid2,'%s\n','''String'',textboxString(k+1),...');
        fprintf(fid2,'%s\n','''FontWeight'',textboxWeight{k+1},...');
        fprintf(fid2,'%s\n','''FontAngle'',textboxAngle{k+1});');
    end
    fprintf(fid2,'end\nend');
    A = fread(fid,3013,'*char');
    A = fread(fid,679,'*char');
    fwrite(fid2,A,'*char');
    fprintf(fid2,'\n');
    for o=1:nB
        bcstring = strcat('case',{' '},num2str(o));
        bcbstring = strcat('''Callback''',{' '},',@button',num2str(o),'Callback);');
        bstring = strcat('button',num2str(o),'=uicontrol(''Parent'',f,...');
        fprintf(fid2,'%s\n',bcstring{1});
        fprintf(fid2,'%s\n',bstring);
        fprintf(fid2,'%s\n','''Units'',''Normalized'',...');
        fprintf(fid2,'%s\n','''Position'',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...');
        fprintf(fid2,'%s\n','''Style'',enterType{i+1},...');
        fprintf(fid2,'%s\n','''String'',enterString{i+1},...');
        fprintf(fid2,'%s\n','''FontSize'', buttonTextSize(1+i),...');
        fprintf(fid2,'%s\n','''BackgroundColor'',enterColor,...');
        fprintf(fid2,'%s\n','''HorizontalAlignment'',''center'',...');
        fprintf(fid2,'%s\n',bcbstring{1});
    end
    fprintf(fid2,'end\nend');
    A = fread(fid,5144,'*char');
    A = fread(fid,164,'*char');
    fwrite(fid2,A,'*char');
    fprintf(fid2,'set(f,''Name'',''%s'')\n',writefilename);
    for zz=1:nB
        fprintf(fid2,'function button%dCallback(h,eventdata)\n\n',zz);
        fprintf(fid2,'end\n\n');
    end
    fprintf(fid2,'end');
end
end
