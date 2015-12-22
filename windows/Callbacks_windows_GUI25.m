function Callbacks_windows_GUI25(f,C)
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
% %PANELS
% for j=0:noPanels-1
% uipanel('Parent',f,...
% 'Units','Normalized',...
% 'Position',[x(1+4*j) y(1+4*j) x(2+4*j)-x(1+4*j) y(3+4*j)-y(2+4*j)]);
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%GRAPHIC PANELS
for i=0:noGraphicPanels-1
switch (i+1)
case 1
graphicPanel1 = axes('parent',f,...
'Units','Normalized',...
'Position',[a(1+4*i) b(1+4*i) a(2+4*i)-a(1+4*i) b(3+4*i)-b(2+4*i)],...
'GridLineStyle','--');
case 2
graphicPanel2 = axes('parent',f,...
'Units','Normalized',...
'Position',[a(1+4*i) b(1+4*i) a(2+4*i)-a(1+4*i) b(3+4*i)-b(2+4*i)],...
'GridLineStyle','--');
case 3
graphicPanel3 = axes('parent',f,...
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
case 6
button6=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button6Callback);
case 7
button7=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button7Callback);
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%USER CODE FOR THE VARIABLES AND CALLBACKS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialize Variables
WL1=31;
WL2=31;
fs=1;
wno1=6;
wno2=6;
M1=WL1-1;
M2=WL2-1;
nfft=16384;

% Name the GUI
    set(f,'Name','windows_GUI');

% CALLBACKS

% Callback for button3 -- wno1: first window type or types
 function button3Callback(h,eventdata)
     wno1=get(button3,'val');
 end

% Callback for button1 -- WL1: window length in samples
 function button1Callback(h,eventdata)
     WL1=str2num(get(button1,'string'));
     if WL1 < 0
         waitfor(msgbox('The window length cannnot be negative'));
     end
 end

% Callback for button6 -- wno2: second window type or types
 function button6Callback(h,eventdata)
     wno2=get(button6,'val');
 end

% Callback for button7 -- WL2: window length in samples
 function button7Callback(h,eventdata)
     WL2=str2num(get(button7,'string'));
     if WL2 < 0
         waitfor(msgbox('The window length cannnot be negative'));
     end
 end

% Callback for button2 -- fs: sampling rate
 function button2Callback(h,eventdata)
     fs=str2num(get(button2,'string'));
     if fs < 0
         waitfor(msgbox('The sampling rate cannnot be negative'));
     end
 end

% Callback for button4 -- Run windows program to plot IR and FR of windows
 function button4Callback(h,eventdata)
     wno1=get(button3,'val');
     WL1=str2num(get(button1,'string'));
     M1=WL1-1;
     
% generate set of 6 windows (rectangular, triangular, Hann, Hamming,
% modified Hamming, Blackman)
     [win1,win2,win3,win4,win5,win6] = gen_window(WL1,M1);

% plot 1 -- window impulses responses on a common plot on graphics Panel 3
    reset(graphicPanel3);axes(graphicPanel3);cla;
    
% plot window (or windows) in time domain
    M=M1;
    hold on;
    axis([0 M 0 1.2]);
    grid on;
    np1=0:WL1-1;
    
plot_window_time_response(wno1,np1,win1,win2,win3,win4,win5,win6)
    ylabel('Amplitude'),xlabel('Time in Samples');
    
     wno2=get(button6,'val');
     WL2=str2num(get(button7,'string'));
     M2=WL2-1;
    
% generate set of 6 windows (rectangular, triangular, Hann, Hamming,
% modified Hamming, Blackman)
     [win12,win22,win32,win42,win52,win62] = gen_window(WL2,M2);
     
% plot window (or windows) in time domain
    M=max(M1,M2);
    axis([0 M 0 1.2]);
    grid on;
    np2=0:WL2-1;
    
    plot_window_time_response(wno2,np2,win12,win22,win32,win42,win52,win62);
    
    ylabel('Amplitude'),xlabel('Time in Samples');
    
    lstr=['rectangular ';'triangular  ';'Hann        ';'Hamming     ';...
        'Modified Ham';'Blackman    ';'all windows '];
    legend(lstr(wno1,:), lstr(wno2,:));
    
% calculate frequency responses (log magnitude) of windows and normalize to
% 0 dB at zero frequency
    [win1lm,win2lm,win3lm,win4lm,win5lm,win6lm,smin1] = ...
    logmag_window(WL1,nfft,win1,win2,win3,win4,win5,win6);

% plot 2 -- plot log magnitude responses over full frequency range on
% graphics Panel 2
    reset(graphicPanel2);axes(graphicPanel2);cla;
    
% plot frequency response of window(s) over full frequency range (0-fs/2)
    w=0:fs/nfft:fs/2;
    hold on;
    axis([0 fs/2 smin1 0]);
    grid on;
    
plot_window_frequency_response(w,wno1,win1lm,win2lm,win3lm,win4lm,win5lm,win6lm,nfft);
    xlabel('Frequency (Hz)'),ylabel('Log Magnitude (dB)');
    
% calculate frequency responses (log magnitude) of second windows and normalize to
% 0 dB at zero frequency
    [win12lm,win22lm,win32lm,win42lm,win52lm,win62lm,smin2] = ...
    logmag_window(WL2,nfft,win12,win22,win32,win42,win52,win62);

plot_window_frequency_response(w,wno2,win12lm,win22lm,win32lm,win42lm,win52lm,win62lm,nfft);
    xlabel('Frequency (Hz)'),ylabel('Log Magnitude (dB)');
    
    lstr=['rectangular ';'triangular  ';'Hann        ';'Hamming     ';...
        'Modified Ham';'Blackman    ';'all windows '];
    legend(lstr(wno1,:), lstr(wno2,:));
    
% plot 3 -- log magnitude responses over smaller frequency range on
% graphics Panel 1
    reset(graphicPanel1);
    axes(graphicPanel1);
    cla;
    
% plot frequency response of window(s) over partial frequency range (0-4*fs/WL)
    w=0:fs/nfft:4*fs/WL1;
    hold on;
    axis([0 4*fs/WL1 -80 0]);
    grid on;
    
% plot log magnitude over partial frequency range for rectangular window
plot_window_limited_frequency_response(wno1,w,win1lm,win2lm,...
    win3lm,win4lm,win5lm,win6lm);

plot_window_limited_frequency_response(wno2,w,win12lm,win22lm,...
    win32lm,win42lm,win52lm,win62lm);

    xlabel('Frequency (Hz)'),ylabel('Log Magnitude (dB)');
    
    lstr=['rectangular ';'triangular  ';'Hann        ';'Hamming     ';...
        'Modified Ham';'Blackman    ';'all windows '];
    legend(lstr(wno1,:), lstr(wno2,:));
    
% Title for GUI Plot titleBox1
    stitle=sprintf('Time Windows and DTFTs: L1=%d, L2=%d, fs=%d',WL1,WL2,fs);
    set(titleBox1,'String',stitle);
    set(titleBox1,'FontSize',25);
 end

% Callback for button5 -- close GUI
 function button5Callback(h,eventdata)
     close(gcf);
 end
end