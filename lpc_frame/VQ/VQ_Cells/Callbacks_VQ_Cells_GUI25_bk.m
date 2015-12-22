function Callbacks_VQ_Cells_GUI25(f,C)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=C{1,1};
y=C{1,2};
a=C{1,3};
b=C{1,4};
u=C{1,5};
v=C{1,6};
m=C{1,7};
n=C{1,8};
lengthbutton=C{1,9};
widthbutton=C{1,10};
enterType=C{1,11};
enterString=C{1,12};
enterLabel=C{1,13};
noPanels=C{1,14};
noGraphicPanels=C{1,15};
noButtons=C{1,16};
labelDist=C{1,17};%distance that the label is below the button
noTitles=C{1,18};
buttonTextSize=C{1,19};
labelTextSize=C{1,20};
textboxFont=C{1,21};
textboxString=C{1,22};
textboxWeight=C{1,23};
textboxAngle=C{1,24};
labelHeight=C{1,25};
fileName=C{1,26};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PANELS
for j=0:noPanels-1
uipanel('Parent',f,...
'Units','Normalized',...
'Position',[x(1+4*j) y(1+4*j) x(2+4*j)-x(1+4*j) y(3+4*j)-y(2+4*j)]);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%GRAPHIC PANELS
for i=0:noGraphicPanels-1
switch (i+1)
case 1
graphicPanel1 = axes('parent',f,...
'Units','Normalized',...
'Position',[a(1+4*i) b(1+4*i) a(2+4*i)-a(1+4*i) b(3+4*i)-b(2+4*i)],...
'GridLineStyle','--');
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TITLE BOXES
for k=0:noTitles-1
switch (k+1)
case 1
titleBox1 = uicontrol('parent',f,...
'Units','Normalized',...
'Position',[u(1+4*k) v(1+4*k) u(2+4*k)-u(1+4*k) v(3+4*k)-v(2+4*k)],...
'Style','text',...
'FontSize',textboxFont{k+1},...
'String',textboxString(k+1),...
'FontWeight',textboxWeight{k+1},...
'FontAngle',textboxAngle{k+1});
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%BUTTONS
for i=0:(noButtons-1)
enterColor='w';
if strcmp(enterType{i+1},'pushbutton')==1 ||strcmp(enterType{i+1},'text')==1
enterColor='default';
end
if (strcmp(enterLabel{1,(i+1)},'')==0 &&...
        strcmp(enterLabel{1,(i+1)},'...')==0) %i.e. there is a label
%creating a label for some buttons
uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i)-labelDist-labelHeight(i+1) ...
(m(2+2*i)-m(1+2*i)) labelHeight(i+1)],...
'Style','text',...
'String',enterLabel{i+1},...
'FontSize', labelTextSize(i+1),...
'HorizontalAlignment','center');
end
switch (i+1)
case 1
button1=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button1Callback);
case 2
button2=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button2Callback);
case 3
button3=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button3Callback);
case 4
button4=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button4Callback);
case 5
button5=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button5Callback);
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%USER CODE FOR THE VARIABLES AND CALLBACKS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialize Variables
    vqsize=64;
    Lm=2;
    idigit=1;
    centroidsave=[];

% Name the GUI
    set(f,'Name','VQ_Cells');


% CALLBACKS
% Callback for button1 -- vqsize: size of VQ (2/4/8/16/32/64)
 function button1Callback(h,eventdata)
     vqsize=str2num(get(button1,'string'));
 end

% Callback for button2 -- idigit: digit for plot (1-9, 10=o, 11=Z)
 function button2Callback(h,eventdata)
     idigit=str2num(get(button2,'string'));
 end

% Callback for button3 -- Lm: size of cepstral vector (2)
 function button3Callback(h,eventdata)
     Lm=str2num(get(button3,'string'));
 end

% Callback for button4 -- Run VQ Cells
 function button4Callback(h,eventdata)
     
% check editable buttons for changes
    button1Callback(h,eventdata);
    button2Callback(h,eventdata);
    button3Callback(h,eventdata);
    
% setup VQ cell plot
    setup_VQ_Cells(vqsize,idigit,Lm);
 end

    function setup_VQ_Cells(vqsize,idigit,Lm)
%
% program to plot first vs second cepstral coefficients, as a function 
% of the best VQ match for a given size vq and a specific training set

% Inputs:
%   vqsize: size of vq for cells (2/4/8/16/32/64)
%   idigit: digit for cell analysis (1-9, 10=o, 11=Z)
%   Lm: size of cepstral vector (2)

% read in cepstral data
    if (idigit <= 9)
        nums=num2str(idigit);
    elseif (idigit == 10)
        nums='O';
    elseif (idigit == 11)
        nums='Z';
    end
    ccfile=['cc_tidig_endpt_',nums,'.mat'];
    load (ccfile);
    [nframes,L]=size(c);
    
% modify number of cepstral coefficients
    cm=c(:,1:Lm);
    
% read in VQ centroids
    vqfile=['vq_cc_tidig_endpt_',num2str(vqsize),'_',nums']
    str=load (vqfile);
    centroidsave=str.centroidsave;
    
% assign all of the training vectors to one of the VQ centroids
    [assignment,distortion,localcount,localdistortion]=assign(cm,nframes,Lm,...
        centroidsave,vqsize);
    
% plot c1 versus c2 for all training set vectors using unique color for
% best matching centroid
    color=['b*';'g*';'r*';'c*';'m*';'y*';'k*';'b+';'g+';'r+';'c+';'m+';'y+';'k+';'bd';'gd';];

% initialize figure
        reset(graphicPanel1);
        axes(graphicPanel1);
        cla;
    
% loop on all possible assignments (1 to vqsize)
    for index=1:vqsize
        array=c(find(assignment == index),1:Lm);
        plot(array(:,1),array(:,2),color(mod(index,16)+1,1:2)),hold on;
    end
    
% plot circle for centroids
    for index=1:vqsize
        plot(centroidsave(index,1),centroidsave(index,2),'ko','LineWidth',2);
    end
    xlabel('first cepstral coefficient'),ylabel('second cepstral coefficient');
    stitle=[' c(1) vs c(2); cep:2; vq:',num2str(vqsize),'; digit:',nums];
    
% title GUI plot
        stitle1=strcat('VQ Cells -- ',stitle);
        set(titleBox1,'string',stitle1);
        set(titleBox1,'FontSize',20);
    end

% Callback for button5 -- close GUI
 function button5Callback(h,eventdata)
     fclose('all');
     close(gcf);
 end
end