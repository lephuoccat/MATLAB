function Callbacks_time_domain_features_GUI25(f,C)

%SENSE COMPUTER AND SET FILE DELIMITER
switch(computer)				
    case 'MACI64',		char= '/';
    case 'GLNX86',  char='/';
    case 'PCWIN',	char= '\';
    case 'PCWIN64', char='\';
    case 'GLNXA64', char='/';
end

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
case 4
graphicPanel4 = axes('parent',f,...
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
case 8
button8=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button8Callback);
case 9
button9=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button9Callback);
case 10
button10=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button10Callback);
case 11
button11=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button11Callback);
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%USER CODE FOR THE VARIABLES AND CALLBACKS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
curr_file='abcd';
directory_name='abcd';
wav_file_names='abcd';
file_info_string=' ';
ss=1;
fs=10000;
Lm=5;
L=50;
Rm=10;
R=100;
ndoubles=4;
log_lin=1;
wtype=1;
fname='output';
nsamp=1;
% set color values for multiple runs
    color=['b';'g';'r';'c';'m';'y';'k'];

% Name the GUI
    set(f,'Name','time_domain_features_GUI');

% CALLBACKS

% Callback for button1 -- Get Speech Files Directory
 function button1Callback(h,eventdata)
     %% ***** modified below **************************************************************************
     if isempty(getpref('SpeechApps'))
         url = sprintf('%s%s',...
             'http://www.mathworks.com/matlabcentral/fileexchange/',...
             'submissions/45293/v/1/download/zip');
         [saveloc, ~, ~] = fileparts(pwd); %save to one level up from current folder
         % Create a waitbar during download
         h = waitbar(0.35,'This may take several minutes...',...
             'Name','Downloading Speech Files...');
         % Download the zipped file
         [filestr,status] = urlwrite(url,[saveloc filesep 'speech_files.zip'],...
             'Timeout',10);
         if status
             delete(h);
             hh1= helpdlg('Downloaded. Select a location to UNZIP the speech files.');
             uiwait(hh1);
             unziploc = uigetdir(saveloc,'Select a location to unzip the speech files');
             h2 = waitbar(0.2,'This may take a minute...',...
                 'Name','Unzipping the Speech Files to Location Selected...');
             unzip(filestr,unziploc);
             delete(h2)
             addpref('SpeechApps','path',unziploc);
             hh2= helpdlg('Ready. Select the speech_files folder in the next window');
             uiwait(hh2);
         else
             warndlg('No Internet Connection to MATLAB Central!');
         end
         
     else
     end
     directory_name = uigetdir(getpref('SpeechApps','path'));
%% ***** modified above *******************************************
     
     A=strvcat(strcat((directory_name),[char,'*.wav']));
     struct_filenames=dir(A);
     wav_file_names={struct_filenames.name};
     set(button2,'String',wav_file_names);
     
% once the popupmenu/drop down menu is created, by default, the first
% selection from the popupmenu/drop down menu id not called
    indexOfDrpDwnMenu=1;
    
% by default first option from the popupmenu/dropdown menu will be loaded
    [curr_file,fs]=loadSelection(directory_name,wav_file_names,indexOfDrpDwnMenu);
 end

% Callback for button2 -- Choose speech file for play and plot
 function button2Callback(h,eventdata)
     indexOfDrpDwnMenu=get(button2,'val');
     [curr_file,fs]=loadSelection(directory_name,wav_file_names,indexOfDrpDwnMenu);
 end

%*************************************************************************
% function -- load selection from designated directory and file
%
function [curr_file,fs]=loadSelection(directory_name,wav_file_names,...
    indexOfDrpDwnMenu);
%
% read in speech/audio file
% fin_path is the complete path of the .wav file that is selected
    fin_path=strcat(directory_name,char,strvcat(wav_file_names(indexOfDrpDwnMenu)));
    
% clear speech/audio file
    clear curr_file;
    
% read in speech/audio signal into curr_file; sampling rate is fs 
    [curr_file,fs]=wavread(fin_path);
    
% create title information with file, sampling rate, number of samples
    fname=wav_file_names(indexOfDrpDwnMenu);
    FS=num2str(fs);
    nsamp=num2str(length(curr_file));
    file_info_string=strcat('  file: ',fname,', fs: ',FS,' Hz, nsamp:',nsamp);
    
% correct fname by changing underbar characters to space characters
    fname=wav_file_names{indexOfDrpDwnMenu};
    fname(find(fname(:)=='_'))=' ';
end
%*************************************************************************

% Callback for button11 -- Play Speech File
    function button11Callback(h,eventdata)
% play speech
    soundsc(curr_file,fs);
    end

% Callback for button3 -- Lm: initial frame length in msec
 function button3Callback(h,eventdata)
     Lm=str2num(get(button3,'string'));
     if Lm < 1 | Lm > 100
         waitfor(msgbox('The initial frame length must be in the range 1-100'));
     end
 end

% Callback for button4 -- Rm: frame shift in msec
 function button4Callback(h,eventdata)
     Rm=str2num(get(button4,'string'));
     if Rm < 1 | Rm > 100
         waitfor(msgbox('The frame shift must be in the range 1-100'));
     end
 end

% Callback for button5 -- ndoubles: number of doublings of frame duration
 function button5Callback(h,eventdata)
     ndoubles=str2num(get(button5,'string'));
     if (ndoubles > 5)
         uiwait(msgbox('ndoubles must be 5 or less','Warning','modal'));
     end
 end

% Callback for button6 -- fs: sampling rate -- set from speech file
 function button6Callback(h,eventdata)
     set(button6,'string',num2str(fs));
     if fs < 0
         waitfor(msgbox('The sampling rate must be positive'));
     end
 end

% Callback for button7 -- popuplist for log or linear scaling of features,
% 1:log scaling, 2:linear scaling
 function button7Callback(h,eventdata)
     log_lin=get(button7,'val');
 end

% Callback for button8 -- popuplist for analysis window type, 1:Hamming,
%  2:rectangular
 function button8Callback(h,eventdata)
     wtype=get(button8,'val');
 end

% Callback for button9 -- Run Program
 function button9Callback(h,eventdata)
     
% clear all graphics screens
    axes(graphicPanel4); cla;
    axes(graphicPanel3); cla;
    axes(graphicPanel2); cla;
    axes(graphicPanel1); cla;
     
% set button 6 with value of fs
    set(button6,'string',num2str(fs));
    
% determine number of doubling runs for frame duration
    % button5Callback(h,eventdata);
    ndoubles=str2num(get(button5,'string'));
    
% initial frame duration in msec
    Lm=str2num(get(button3,'string'));
    
% get log_lin parameter
    log_lin=get(button7,'val');
    
% process entire speech file, from ss=1 to es=length(xin), in a sequence of
% overlapped frames
    ss=1;
    es=length(curr_file);

% normalize speech signal to +/- 1 range
    x=curr_file(ss:es);
    xm=max(abs(x));
    x=x/xm;
    
% convert initial frame duration (ndur) and initial frame shift (shiftdur)
% from msec to samples
    L=round(fs*Lm/1000);
    M=round(Rm*fs/1000);
    
% iteration of L from initial value to up to 16 times initial value, 
% in steps of 2 at each iteration
    s1=sprintf('duration:  %d msec',Lm);
    s2=sprintf('duration: %d msec',2*Lm);
    s3=sprintf('duration: %d msec',4*Lm);
    s4=sprintf('duration: %d msec',8*Lm);
    s5=sprintf('duration: %d msec',16*Lm);
    
    for index=1:ndoubles    
        if (wtype == 1)
            win(1:L)=hamming(L);
            wins=sum(win(:).^2);
            win(1:L)=win(1:L)/wins;
        else
            win(1:L)=ones(L,1)/L;
        end
        
% perform calculation of short-time energy (linear or log energy), 
% magnitude (linear or log magnitude), and zero crossing rate;
% save in arrays En, Mn, Zc
        En=[];  % short-time energy
        Mn=[]; % short-time magnitude
        Zc=[]; % short-time zero crossing
        
% variable n keeps track of ending sample of current frame
        n=L;
        times2=[];
        while n<=length(x)
            times2=[times2 n/fs];
            if (log_lin == 2)
                En=[En sum(x(n-L+1:n).^2.*win(1:L)')];
                Mn=[Mn sum(abs(x(n-L+1:n).*win(1:L)'))];
            elseif (log_lin == 1)
                En=[En 10*log10(sum(x(n-L+1:n).^2.*win(1:L)'))];
                Mn=[Mn 20*log10(sum(abs(x(n-L+1:n).*win(1:L)')))];
            end
            Zc=[Zc sum(abs(diff(sign(x(n-L+1:n)))))];
            n=n+M;
        end
 
% plotting parameters
        n10msec=fs/100;
        Zc=Zc/(2*L)*n10msec;
        
% plot the data in the graphics panels
%   plot 1 -- speech waveform in graphics Panel 4
%   plot 2 -- short-time linear energy or log energy in graphics Panel 3
%   plot 3 -- short-time linear magnitude or log magnitude in graphics
%   Panel 2
%   plot 4 -- short-time zero crossings in graphics Panel 1

% clear graphics Panel 4
        reset(graphicPanel4);axes(graphicPanel4);
        hold on;
        
% plot speech waveform in graphics Panel 4
        times=[0:length(x)-1]/fs;
        str1=sprintf('file:%s,  ss,es:%d, %d, ',fname,ss,es);
        str2=sprintf('  window length, shift (samples):%d, %d, wtype:%d',...
            L,M,wtype);
        string=strcat(str1,str2);
        plot(times,x,'b','LineWidth',2), axis tight, legend('Signal',0);
            ylabel('Amplitude');
        
% clear graphics Panel 3
        reset(graphicPanel3);axes(graphicPanel3);
        hold on;
        
% plot short-time linear or log energy in graphics Panel 3
        plot(times2,En,color(index),'LineWidth',2), axis tight,hold on;
        if (index == ndoubles)
            if (ndoubles == 1)
                legend(s1);
            elseif (ndoubles == 2)
                legend(s1,s2);
            elseif (ndoubles == 3)
                legend(s1,s2,s3);
            elseif (ndoubles == 4)
                legend(s1,s2,s3,s4);
            else
                legend(s1,s2,s3,s4,s5);
            end
            if (log_lin == 2) ylabel('Energy');
            else ylabel('Log Energy (dB)');
            end
        end
        
% clear graphics Panel 2
        reset(graphicPanel2);axes(graphicPanel2);
        hold on;
        
% plot linear or log magnitude in graphics Panel 2
        plot(times2,Mn,color(index),'LineWidth',2), axis tight,hold on;
        if (index == ndoubles)
            if (ndoubles == 1)
                legend(s1);
            elseif (ndoubles == 2)
                legend(s1,s2);
            elseif (ndoubles == 3)
                legend(s1,s2,s3);
            elseif (ndoubles == 4)
                legend(s1,s2,s3,s4);
            else
                legend(s1,s2,s3,s4,s5);
            end
            % xlabel('time in seconds');
            if (log_lin == 2) ylabel('Magnitude');
            else ylabel('Log Magnitude (dB)');
            end
        end
        
        
% clear graphics Panel 1
        reset(graphicPanel1);axes(graphicPanel1);
        hold on;
        
        
% plot zero crossings rate in graphics Panel 1
        plot(times2,Zc,color(index),'LineWidth',2), axis tight,hold on;
        if (index == ndoubles)
            if (ndoubles == 1)
                legend(s1);
            elseif (ndoubles == 2)
                legend(s1,s2);
            elseif (ndoubles == 3)
                legend(s1,s2,s3);
            elseif (ndoubles == 4)
                legend(s1,s2,s3,s4);
            else
                legend(s1,s2,s3,s4,s5);
            end
            xpp=['Time in Seconds; fs=',num2str(fs),' samples/second'];
            xlabel(xpp); ylabel('Zero Crossing Rate');
        end
        L=L*2;
    end
    
% set up text box header
    stitle1=strcat('Time Domain Features -- ',file_info_string);
    set(titleBox1,'String',stitle1);
    set(titleBox1,'FontSize',25);
end
 
% Callback for button10  -- Close GUI
 function button10Callback(h,eventdata)
     close(gcf);
 end
end