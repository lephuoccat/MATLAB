function Callbacks_lpc_frame_GUI25(f,C)

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
case 12
button12=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button12Callback);
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%USER CODE FOR THE VARIABLES AND CALLBACKS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialize Variables
    curr_file=1;
    fs=8000;
    directory_name='abcd';
    wav_file_names='abce';
    fin_path='filename';
    fname='output';
    nsamp=1;
    ss=1;
    Lm=40;
    L=640;
    Rm=10;
    R=160;
    wtype=1;
    wtype_STFT=1;
    nfft=2048;
    win=hamming(640);
    p=12;
    istart=1;

% Name the GUI
    set(f,'Name','lpc_frame_solution');

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
    
% read in filename (fname) from cell array
    fname=wav_file_names{indexOfDrpDwnMenu};
end

% Callback for button8 -- Play Speech File
    function button8Callback(h,eventdata)
        soundsc(curr_file,fs);
    end

% Callback for button3 -- Lm: frame length in msec; must be converted to
% samples at processing rate
 function button3Callback(h,eventdata)
     Lm=str2num(get(button3,'string'));
         if ~((Lm >= 1 && Lm <= 100))
        waitfor(errordlg('Lm must be a positive number between 1 and 100'))
        return;
     end
 end

% Callback for button9 -- Rm: frame shift in msec; must be converted to
% samples at processing rate
 function button9Callback(h,eventdata)
     Rm=str2num(get(button9,'string'));
         if ~((Rm >= 1 && Rm <= 100))
        waitfor(errordlg('Rm must be a positive number between 1 and 100'))
        return;
     end
 end

% Callback for button4 -- p: lpc analysis order
 function button4Callback(h,eventdata)
     p=str2num(get(button4,'string'));
     if ~((p >= 4 && p <= 32))
        waitfor(errordlg('p must be a positive integer between 4 and 32'))
        return;
     end
     p=round(p);
     set(button4,'string',num2str(p));
 end

% Callback for button5 -- wtype: analysis window type; 1:Hamming,
% 2:Rectangular
 function button5Callback(h,eventdata)
     wtype=get(button5,'val');
 end

% Callback for button12 -- wtype_STFT: STFT window type; 1:Hamming,
% 2:Rectangular
 function button12Callback(h,eventdata)
     wtype_STFT=get(button12,'val');
 end

% Callback for button6 -- choose starting sample of analysis frame
 function button6Callback(h,eventdata)
     
% check editable buttons for changes
    button3Callback(h,eventdata);  % Lm: frame length in msec
    button9Callback(h,eventdata);  % Rm: frame shift in msec
    button4Callback(h,eventdata);  % p: LPC system order
    button5Callback(h,eventdata);  % wtype: window type
    button12Callback(h,eventdata); % wtype_STFT: window type for STFT
    
% initialize signal processing parameters
    L=round(Lm*fs/1000);
    R=round(Rm*fs/1000);
    ss=1;
    istart=1;
    
% save speech file in x
    x=curr_file;
    
% plot entire speech file and use graphics cursor to find region of
% interest;
    ss=plot_speech_cursor(x,ss,istart,fs,L,graphicPanel3);
    
% plot out expanded speech frame and graphics cursor to home in on region
% of interest and choose starting sample
    plot_speech_frame(x,ss,L,fs,graphicPanel2,wtype);
 end

% Callback for button10 -- Use current frame
    function button10Callback(h,eventdata)
        
% check editable buttons for changes
    button3Callback(h,eventdata);  % Lm: frame length in msec
    button9Callback(h,eventdata);  % Rm: frame shift in msec
    button4Callback(h,eventdata);  % p: LPC system order
    button5Callback(h,eventdata);  % wtype: window type
    button12Callback(h,eventdata); % wtype_STFT: window type for STFT
    L=round(Lm*fs/1000);
    
    plot_speech_frame(x,ss,L,fs,graphicPanel2,wtype);
    
% perform lpc analysis on a frame of speech using 3 methods;
% autocorrelation analysis, covariance analysis, lattice analysis
    [f,h0,ha,hc,hl,U_log_STFT,U_log_LPC,U_log_LPC_co_la]=...
        lpc_frame_analysis(curr_file,fs,ss,Lm,wtype,wtype_STFT,p,nfft);
    
% store filename and signal processing parameters in titleBox1
    stitle=sprintf('LPC Frame Solutions -- file: %s, ss: %d Lm: %d p: %d, wtype:%d',...
        fname,ss,Lm,p,wtype);
	set(titleBox1,'String',stitle);
    set(titleBox1,'FontSize',20);
    
% clear graphics Panel 1
    reset(graphicPanel1);
    axes(graphicPanel1);
    cla;
    
% plot log magnitude of STFT of windowed speech frame on graphics Panel 1
    plot(f,20*log10(abs(h0(1:nfft/2+1)))-U_log_STFT,'b','LineWidth',1),...
        ylabel('Log Magnitude (dB)'),...
        xlabel('Frequency in Hz');
        grid on,hold on;
        
% plot log magnitude of LPC autocorrelation analysis of frame
    plot(f,20*log10(abs(ha(1:nfft/2+1)))-U_log_LPC,'k-','LineWidth',2);
    
% plot log magnitude of LPC covariance analysis of frame
    plot(f,20*log10(abs(hc(1:nfft/2+1)))-U_log_LPC_co_la,'g--','LineWidth',2);
    
% plot log magnitude of LPC lattice analysis of frame
    plot(f,20*log10(abs(hl(1:nfft/2+1)))-U_log_LPC_co_la,'r-.','LineWidth',2);
    legend('speech STFT','autocorrelation(-)','covariance(--)','lattice(-.)');
    axis tight;
 end

% Callback for button11 -- Use Next Frame
    function button11Callback(h,eventdata)
% check editable buttons for changes
    button3Callback(h,eventdata);  % Lm: frame length in msec
    button9Callback(h,eventdata);  % Rm: frame shift in msec
    button4Callback(h,eventdata);  % p: LPC system order
    button5Callback(h,eventdata);  % wtype: window type
    button12Callback(h,eventdata); % wtype_STFT: window type for STFT
    L=round(Lm*fs/1000);
    R=round(Rm*fs/1000);
        ss=ss+R;
        
% plot region of current starting sample
    reset(graphicPanel3);
    axes(graphicPanel3);

    s1=max(ss-2*L,0);
    s2=min(ss+3*L,length(x)-1);
    plot(s1:s2,x(s1+1:s2+1),'k','LineWidth',2);
    xpp=['Time in Samples; fs=',num2str(fs),' samples/second'];
    xlabel(xpp);ylabel('Amplitude'); hold on;
    grid on;axis tight;
    plot([ss-1:ss+L-2],hamming(L)*max(x(ss:ss+L-1)),'r:','LineWidth',3);
    axis tight;
        
        plot_speech_frame(x,ss,L,fs,graphicPanel2,wtype);
        button10Callback(h,eventdata)
    end

% Callback for button7 -- close GUI
 function button7Callback(h,eventdata)
     close(gcf);
 end
end