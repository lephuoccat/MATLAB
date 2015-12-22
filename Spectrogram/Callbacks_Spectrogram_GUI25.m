function Callbacks_Spectrogram_GUI25(f,C)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SENSE COMPUTER AND SET FILE DELIMITER
switch(computer)				
    case 'MACI64',		char= '/';
    case 'GLNX86',  char='/';
    case 'PCWIN',	char= '\';
    case 'PCWIN64', char='\';
    case 'GLNXA64', char='/';
end

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
case 13
button13=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button13Callback);
case 14
button14=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button14Callback);
case 15
button15=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button15Callback);
case 16
button16=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button16Callback);
case 17
button17=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button17Callback);
case 18
button18=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button18Callback);
case 19
button19=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button19Callback);
case 20
button20=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button20Callback);
case 21
button21=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button21Callback);
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %USER CODE FOR THE VARIABLES AND CALLBACKS
    %INITIALIZATION 
    %Initialization
    curr_file=1234;
    curr_file_new=1234;
    fs=1234;
    fsin=fs;
    directory_name='abcd';
    wav_file_names='abcd';
    file_info_string=' ';
    winlen_WB=3;
    winlen_NB=30;
    nfft_WB=1024;
    nfft_NB=1024;
    overlap=90;
    map_index=1;
    select_win=1;
    logLinear_index=1;
    dyn_range=60;
    scale_f=2;
    fsNew=10000;
    fname='output';
    fsr=10000;
    nsec=4;
    fileName='out_speech';
    nsamp=1;

% Name the GUI
    set(f,'Name','Spectrograms');
    
%Callback for button1 -- Get Speech Files Directory
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

%Callback for button2 -- Choose speech file for play and plot
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
    fsin=fs;
    nsamp=num2str(length(curr_file));
    file_info_string=strcat('  file: ',fname,', fs: ',FS,' Hz, nsamp:',nsamp);
end

% callback for button3 -- soundsc: play out speech/audio file
 function button3Callback(h,eventdata)        
	soundsc(curr_file,fs);       
 end

% callback for button4 -- nsec: number of seconds of recording
 function button4Callback(h,eventdata)        
	nsec=str2num(get(button4,'String')); 
     if ~(nsec >=1 && nsec <=6)
        waitfor(errordlg('nsec must be between 1 and 6'))
     return;
     end
 end

% callback for the button5 -- fsr: sampling rate for recording
 function button5Callback(h,eventdata)        
	fsr=str2num(get(button5,'String'));       
 end

% callback for button6 -- fileName: name of recording file
 function button6Callback(h,eventdata)        
	fileName=get(button6,'string');
 end

% callback for button7 -- save the recording into fileName
 function button7Callback(h,eventdata)
     button5Callback(h,eventdata);
     fs=fsr;
     button6Callback(h,eventdata);
     newFolder=uigetdir(cd);
     oldFolder=cd(newFolder);
     
     y=y/max(abs(y))*0.99;
     wavwrite(y,fs,16,fileName);
     cd(oldFolder);    
 end

% callback for button8 -- record speech
 function button8Callback(h,eventdata)        
     button4Callback(h,eventdata);
     button5Callback(h,eventdata);
     fs=fsr;
     clear y;
 % yn=speech in range -1 to 1
 % N=number of samples of speech
 % ch=number of recording channels
    N=fs*nsec;
    ch=1;
    
% Begin recording after hitting OK on msg box
    uiwait(msgbox('Ready to Record -- Hit OK to Begin','Record','modal'));
    
    recobj=audiorecorder(fs,16,1);
    recordblocking(recobj,nsec);
    y=getaudiodata(recobj);

% normalize to 32768 range
    ymin=min(y);
    ymax=max(y);
    ym=max(ymax,-ymin);
    xin=(y/ym)*32768;
    
% highpass filter to eliminate dc offset and 60 Hz hum
    y=highpass_filter_signal(y,fsr);
    ym=max(max(y),-min(y));
    y=(y/ym)*32767.;
    
% plot waveform in graphics panel3
    reset(graphicPanel3);axes(graphicPanel3);cla;
    plot(0:length(y)-1,y,'k');
    [X,Y]=ginput(2);
    ss=round(X(1)); es=round(X(2));
    cla;
    yn=y(ss:es); y=yn;
    plot(0:length(y)-1,y,'k');ylabel('Amplitude');grid on; axis tight;
    
% play out endpointed file
    soundsc(y,fsr);
    
% setup recorded speech for spectrogram analysis
    curr_file=y;
    fs=fsr;
    
% create title information with file, sampling rate, number of samples
    fname=fileName;
    FS=num2str(fs);
    fsin=fs;
    nsamp=num2str(length(curr_file));
    file_info_string=strcat('  file: ',fname,', fs: ',FS,' Hz, nsamp:',nsamp);
        
% setup text box
	stitle1=strcat('Spectrograms -- ',file_info_string);
	set(titleBox1,'String',stitle1);
	set(titleBox1,'FontSize',25);
 end

% callback for button9 -- winlen_WB: wideband filter length in msec
 function button9Callback(varargin)
	winlen_WB = str2num(get(button9,'String'));  
    if ~((winlen_WB >=3 && winlen_WB <=20))
        waitfor(errordlg('WB must be a positive integer between 3 and 20'))
        return
    end
 end 

% callback for button10 -- winlen_NB: narrowband filter length in msec
 function button10Callback(varargin)
	winlen_NB = str2num(get(button10,'String'));
    if ~((winlen_NB >=20 && winlen_NB <=80))
        waitfor(errordlg('NB must be a positive integer between 20 and 80'))
    return
    end
 end 

% callback for button11 -- nfft_WB: wideband FFT size in samples
 function button11Callback(varargin)
	nfft_WB = str2num(get(button11,'String'));
    if (~(nfft_WB >=256 && nfft_WB <=8192) || ~(floor(log2(nfft_WB)) == log2(nfft_WB)))
        waitfor(errordlg('WB FFT must be a power of 2 between 256 and 8192'))
        return
    end
 end 

% callback for button12 -- nfft_NB: narrowband FFT size in samples
 function button12Callback(varargin)
	nfft_NB = str2num(get(button12,'String'));
    if (~(nfft_NB >=256 && nfft_NB <=8192) || ~(floor(log2(nfft_NB)) == log2(nfft_NB)))
        waitfor(errordlg('NB FFT must be a power of 2 between 256 and 8192'))
        return
    end
 end

% callback for button13 -- overlap: frame overlap in percentage
 function button13Callback(varargin)
	overlap = str2num(get(button13,'String'));
    if ~(overlap >= 50 && overlap <=98)
        waitfor(errordlg('overlap must be between 50 and 98 percent.'))
        return
    end
 end 

% callback for button14 -- fsNew: change sampling frequency
 function button14Callback(h,eventdata)        
    samp = [16000, 10000, 8000, 6000];
    fsNew = samp(get(button14,'val'));
	[curr_file_new]=srconv(curr_file,fs,fsNew);
 end

% callback for button15 -- dyn_range: dynamic range of spectrogram display
 function button15Callback(h,eventdata)
	dyn_range= str2num(get(button15,'String'));
    if ~(dyn_range >= 10 && dyn_range <= 90)
        waitfor(errordlg('Dynamic Range must be between 10 and 90 dB.'))
        return
    end
 end

% callback for button16 -- scale_f: the scale factor for linear spectrum displays   
 function button16Callback(h,eventdata)
	scale_f = str2num(get(button16,'String'));
    if ~(scale_f >= 0.1 && scale_f <= 2.0)
        waitfor(errordlg('scale factor must be between 0.1 and 2.0.'))
        return
    end
 end

% callback for button17 -- logLinear_index: select log magnitude/linear magnitude
 function button17Callback(h,eventdata)
	logLinear_index=get(button17,'val');
 end

% callback for button18 -- select_win: type of window-1 hamming,2 rectangular, 3 triangular
 function button18Callback(h,eventdata)
	select_win=get(button18,'val');
 end
    
% callback for button19 == map_index: gray/color drop down menu
 function button19Callback(h,eventdata)        
	map_index=get(button19,'val') ; 
 end   

% callback for button20 -- spectrogram implementation
 function button20Callback(h,eventdata)
       
% converting window lengths from ms to samples
	winlen_WBsamples = fix(winlen_WB*0.001*fs); 
	winlen_NBsamples = fix(winlen_NB*0.001*fs);
       
% overlap in samples based on window size
	overlap_WB=fix(overlap*winlen_WBsamples/100);
	overlap_NB=fix(overlap*winlen_NBsamples/100);
        
% selection of window
	if select_win==1;
        w_WB = window(@hamming,winlen_WBsamples);
        w_NB = window(@hamming,winlen_NBsamples);
	elseif select_win==2;
        w_WB = window(@rectwin,winlen_WBsamples);  
        w_NB = window(@rectwin,winlen_NBsamples);   
    else 
        w_WB = window(@triang,winlen_WBsamples);  
        w_NB = window(@triang,winlen_NBsamples); 
	end
        
% run this callback **********
    button14Callback(h,eventdata);
        
	[B,BA,F,T]=create_spectrogram(curr_file_new,nfft_NB,fsNew,w_NB,...
        dyn_range,logLinear_index,overlap_NB);
    
% plot narrowband spectrogram in graphics Panel 2
	axes(graphicPanel2);

	if (map_index==2)
        t=colormap;
        colormap(1-t);
        colormap(jet);    
    else
        t=colormap(gray);
        colormap(1-t);          
    end
    
	if (logLinear_index==1)
        imagesc(T,F,BA);            
    else
        imagesc(T,F,abs(B).^scale_f);            
    end
        
	axis xy,ylabel('Frequency in Hz');
	axis([0 length(curr_file_new)/fsNew 0 fsNew/2]);
	axis tight;
	title('Narrowband Spectrogram');      
               
% plot wideband spectrogram in graphics Panel 1
	[B,BA,F,T]=create_spectrogram(curr_file_new,nfft_WB,...
        fsNew,w_WB,dyn_range,logLinear_index,overlap_WB);        
	axes(graphicPanel1);
	if (logLinear_index==1)
        imagesc(T,F,BA);            
    else
        imagesc(T,F,abs(B).^scale_f);            
    end
    
    xpp=['Time in Seconds; fs=',num2str(fs),' samples/second'];
	axis xy,xlabel(xpp),ylabel('Frequency in Hz');
	axis([0 length(curr_file_new)/fsNew 0 fsNew/2]);
	axis tight;
	title('Wideband Spectrogram');              
end

% create spectrogram function
    function [B,BA,F,T]=create_spectrogram(y,nfft,fs,w,dyn_range,logLinear_index,overlap_new);
	[B,F,T]=spectrogram(y,w,overlap_new,nfft,fs,'yaxis');
	BA=[];
	if (logLinear_index == 1)
        BA=20*log10(abs(B));
        BAM=max(BA);
        BAmax=max(BAM);
        BA(find(BA < BAmax-dyn_range))=BAmax-dyn_range;            
    end

% plot wavefrom in graphics Panel 3
	cla(graphicPanel3);
	axes(graphicPanel3); 
	l=length(curr_file);
    fs=fsin;
	i=(1:l)/fs;%coverting samples to time
	plot(i,curr_file,'k','LineWidth',1),...
	ylabel('Amplitude');
	axis tight;
    
% setup text box
	stitle1=strcat('Spectrograms -- ',file_info_string);
	set(titleBox1,'String',stitle1);
	set(titleBox1,'FontSize',25);
end

% callback for the close gui button
 function button21Callback(h,eventdata)        
	close(gcf);
 end
end