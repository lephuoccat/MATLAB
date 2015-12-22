function Callbacks_compute_cepstrum_GUI25(f,C)
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
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%USER CODE FOR THE VARIABLES AND CALLBACKS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialize Variables
    curr_file=1;
    fs=1;
    directory_name='abcd';
    wav_file_names='abce';
    fin_path='filename';
    fname='output';
    nsamp=1;
    ss=1;
    istart=1;
    Lm=40;
    L=320;
    Rm=10;
    R=80;
    ceplm=30;
    cepl=300;
    pdlow=5.0;
    pdhigh=12.5;
    nfft=1024;

% Name the GUI
    set(f,'Name','compute_cepstrum_GUI');

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

% Callback for button3 -- Lm: frame duration in msec
 function button3Callback(h,eventdata)
     Lm=str2num(get(button3,'string'));
      if (Lm < 1 || Lm > 100)
         waitfor(errordlg('The frame length must be between 1 and 100'));
         return;
     end
     L=round(Lm*fs/1000);
 end

% Callback for button9 -- Rm: frame duration in msec
 function button9Callback(h,eventdata)
     Rm=str2num(get(button9,'string'));
      if (Rm < 1 || Rm > 100)
         waitfor(errordlg('The frame duration must be between 1 and 100'));
         return;
     end
     R=round(Rm*fs/1000);
 end
% Callback for button4 -- ceplm: cepstral length in msec
 function button4Callback(h,eventdata)
     ceplm=str2num(get(button4,'string'));
     if (ceplm < 20 || ceplm > 60)
         waitfor(errordlg('The length of the cepstrum must be between 20 and 60'));
         return;
     end
     cepl=round(ceplm*fs/1000);
 end

% Callback for button5 -- nfft: fft size for cepstral computation (samples)
 function button5Callback(h,eventdata)
     %nfft=str2num(get(button5,'string'));
     Index=get(button5,'val');
     a = [512 1024 2048 4096 8192];
     nfft = a(Index); 
 end

% Callback for button6 -- get frame starting sample
 function button6Callback(h,eventdata)
% callbacks to buttons 3-5 for up-to-date data
    button3Callback(h,eventdata);  % Lm: frame length in msec to L in samples
    button9Callback(h,eventdata);  % Rm: frame shift in msec to R in samples
    button4Callback(h,eventdata);  % ceplm: cepstral length in msec to cepl in samples
    button5Callback(h,eventdata);  % nfft: fft size for computation
       
% save current speech file in x
        x=curr_file;
        win=hamming(L);
       
        ss=plot_speech_cursor(x,ss,curr_file,istart,graphicPanel3,win,L,fs);
 end

% button 10 Callback -- Run Current Frame
    function button10Callback(h,eventdata)
        
% create frame of speech, weight using hamming window, normalize frame
% so that the initial value of the frame is 1.0
    x1=curr_file(ss:ss+L-1).*hamming(L);
    xnorm=x1(1);
    x1n=x1/xnorm;
    x1n=[x1n; zeros(nfft-L,1)];
    
% plot current frame of speech in graphics Panel3
    reset(graphicPanel3);
    axes(graphicPanel3);
    cla;
    
    plot(0:L-1,x1n(1:L),'b','LineWidth',2);
    xpp=['Time in Samples; fs=',num2str(fs),' samples/second'];
    xlabel(xpp),ylabel('Amplitude');grid on;axis tight;
       
% GUI Title in titleBox1
    stitle=strcat('Compute Cepstrum --  file:',fname,', ss:',num2str(ss),...
        ', fs:',num2str(fs),', Lm:',num2str(Lm),...
        ', cepl:',num2str(cepl),', nfft:',num2str(nfft));
	set(titleBox1,'String',stitle);
    set(titleBox1,'FontSize',20);
    
% determine cepstral index for lowest pitch period (pdlow=2.5 msec)
% and index for highest pitch period (pdhigh=15 msec); convert from msec
% to samples at the input signal sampling rate; 
    ceplp=fix(pdlow*fs/1000); % cepstral index for lowest pitch period (2.5 msec)
    cephp=fix(pdhigh*fs/1000); % cepstral index for highest pitch period (15 msec)
    % cepwt(ceplp:cephp)=1+(7/(cephp-ceplp))*((ceplp:cephp)-ceplp); % cepstral weighting
    cepwt(ceplp:cephp)=1;
    
% create frame of speech, weight using hamming window, normalize frame
% so that the initial value of the frame is 1.0
    x1=curr_file(ss:ss+L-1).*hamming(L);
    xnorm=x1(1);
    x1n=x1/xnorm;
    x1n=[x1n; zeros(nfft-L,1)];

% comparison of two methods of cepstral analysis
%   method 1: standard analysis using FFTs (rceps for real cepstrum and
%   cceps for complex cepstrum
%   method 2: analytical methods based on solving for roots of numerator
%   polynomial and analytically substituting the appropriate z-transform
%   formula

% using cceps and rceps, compute real (RH1) and complex (XH1) cepstrums
    XH1S=cceps(x1n);
    RH1S=rceps(x1n);
    XH1=XH1S(1:cepl+1);
    RH1=RH1S(1:cepl+1);
    
% using function compute_cep.m compute the analytic cepstrum
    [RH2S,XH2S]=compute_cep(x1n,L,cepl,fs);
    RH2=RH2S(cepl+1:2*cepl+1);
    XH2=XH2S(cepl+1:2*cepl+1);
    
% clear graphics Panel 2
    reset(graphicPanel2);
    axes(graphicPanel2);
    cla;
    
% first line of plot for real cepstrum from rceps with the initial cepstral
% value set to 0, and cepstral values scaled using cepwt; results plotted
% on graphics Panel 2
    RH1(1)=0;
    RH1W=RH1(1:cepl+1);
    RH1W(ceplp:cephp)=cepwt(ceplp:cephp)'.*RH1W(ceplp:cephp);
    plot(0:cepl,RH1W(1:cepl+1),'r','LineWidth',2);
    ylabel('Value'),grid on, axis tight; 
    hold on;
    
% second line of plot for real cepstrum from analytic root finding method;
% need to first shift cepstral values so that the initial value is for zero
% quefrency; zero out the initial value, and cepstral values scaled using
% cepwt; results again plotted on graphics Panel 2
    RH2(1)=0;
    RH2W(1:cepl+1)=RH2(1:cepl+1);
    RH2W(ceplp:cephp)=cepwt(ceplp:cephp).*RH2W(ceplp:cephp);
    plot(0:cepl,RH2W(1:cepl+1),'b','LineWidth',2);
    ylabel('Value'),grid on, axis tight;
    legend('real cepstrum: rceps method','real cepstrum: analytical method');
    
% clear graphics Panel 1
    reset(graphicPanel1);
    axes(graphicPanel1);
    cla;
    
% third line of plot for complex cepstrum from cceps method with the initial
% cepstral value set to 0, and cepstral values scaled using cepwt;  results
% plotted on graphics Panel 1
    XH1(1)=0;
    XH1W(1:cepl+1)=XH1(1:cepl+1);
    XH1W(ceplp:cephp)=cepwt(ceplp:cephp).*XH1W(ceplp:cephp);
    XH1W(1:10)=0;
    plot(0:cepl,XH1W(1:cepl+1),'r','LineWidth',2);
    xpp=['Quefrency (samples); fs=',num2str(fs),' samples/second'];
    xlabel(xpp),ylabel('Value'),grid on, axis tight;
    legend('complex cepstrum, cceps method');hold on;
    
% fourth line of plot for complex cepstrum from analytic root finding method;
% need to first shift cepstral values so they the initial value is for zero
% quefrency; zero out the initial value, and cepstral values scaled using
% cepwt; results plotted on graphics Panel 1    
    XH2(1)=0;
    XH2W(1:cepl+1)=XH2(1:cepl+1);
    XH2W(ceplp:cephp)=cepwt(ceplp:cephp).*XH2W(ceplp:cephp);
    XH2W(1:10)=0;
    plot(0:cepl,XH2W(1:cepl+1),'b','LineWidth',2);
    xlabel(xpp),ylabel('Value'),grid on, axis tight;
    legend('complex cepstrum: cceps method','complex cepstrum: analytical method');
    end

% Callback for button11 -- Run Next Frame
    function button11Callback(h,eventdata)
        button9Callback(h,eventdata)
        ss=ss+R;
        button10Callback(h,eventdata)
    end

% Callback for button7 -- Close GUI
 function button7Callback(h,eventdata)
     close(gcf);
 end
end