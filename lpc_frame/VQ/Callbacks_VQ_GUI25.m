function Callbacks_VQ_GUI25(f,C)
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
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%USER CODE FOR THE VARIABLES AND CALLBACKS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialize Variables
    vqsize=64;
    Lm=12;
    epsilon=0.001;
    thresh=0.001;
    feature='cc';
    tset='tidig_';
    nrun=11;
    idebug=1;

% Name the GUI
    set(f,'Name','vector_quantization');
    
% CALLBACKS
% Callback for button1 -- vqsize: size of largest VQ for each digit
 function button1Callback(h,eventdata)
     vqsize=str2num(get(button1,'string'));
 end

% Callback for button2 -- Lm: size of cepstral coefficient vector
 function button2Callback(h,eventdata)
     Lm=str2num(get(button2,'string'));
 end

% Callback for button3 -- epsilon: splitting factor on vq cells
 function button3Callback(h,eventdata)
     epsilon=str2num(get(button3,'string'));
 end

% Callback for button4 -- thresh: threshold on change for terminating vq
%   loop
 function button4Callback(h,eventdata)
     thresh=str2num(get(button4,'string'));
 end

% Callback for button5 -- prefix: cepstral coefficient vector file prefix
 function button5Callback(h,eventdata)
     feature=get(button5,'string');
 end

% Callback for button6 -- file: name of data set with cepstral vectors
 function button6Callback(h,eventdata)
     tset=get(button6,'string');
 end

% Callback for button7 -- nrun: number of digit training files
 function button7Callback(h,eventdata)
     nrun=str2num(get(button7,'string'));
 end

% Callback for button8 -- idebug: verbose output switch, 1:no verbose
% output; 2: verbose output
 function button8Callback(h,eventdata)
     idebug=get(button8,'val');
 end

% Callback for button9 -- Run Vector Quantizer design
 function button9Callback(h,eventdata)
     
% check editable buttons for changes
    button1Callback(h,eventdata);
    button2Callback(h,eventdata);
    button3Callback(h,eventdata);
    button4Callback(h,eventdata);
    button5Callback(h,eventdata);
    button6Callback(h,eventdata);
    button7Callback(h,eventdata);
    button8Callback(h,eventdata);

% setup_VQ_design
    setup_VQ_design(vqsize,Lm,epsilon,thresh,feature,tset,nrun,idebug);
 end

%**********************************************************************
    function setup_VQ_design(vqsize,Lm,epsilon,thresh,feature,tset,...
            nrun,idebug)
%
%  create a set of isolated digit VQ's from isolated digit training sets of
%  cepstral vectors;
%  create a single VQ for each digit (1-9,O,Z) and for each VQ size from 2
%  to VQ-max

% Inputs:
%   vqsize: maximum size vq for each training set
%   Lm: size of cepstral coefficient vector
%   epsilon: splitting factor on vq cells
%   thresh: threshold on change for terminating vq loop
%   feature: cepstral coefficient vector prefix
%   tset: dataset identifier
%   nrun: number of digit files
%   idebug: switch on verbose output; 1:no verbose output, 2: verbose
%   output

% color index for plotting VQ distortion versus log(VQ size)
    color=['b','g','r','c','m','y','k','b','g','r','c'];
    
% open file for writing VQ run results
    fidw=fopen('output_vq.txt','w');
    
% output file header
    fprintf(fidw,'VQ Runs, Isolated Digit input, 12 coefficients (cep) \n \n');
    
nloops=log2(vqsize);
    
    fprintf(fidw,'vqsize:%d, vqloops:%d \n',vqsize,nloops);
    fprintf(fidw,'epsilon:%8.4f \n',epsilon);
    fprintf(fidw,'thresh: %8.4f \n',thresh);
    fprintf(fidw,'nrun: %8.4f \n',nrun);
    
% create string to load featurestring    
    featurestring=[feature,'_',tset,'.mat'];
    
% complete featurestring based on nrun value
    for run=1:nrun 
        
% Create a Message Box to Show Progress
% Message=strcat('Working on Digit:',num2str(run),', VQ Size:',num2str(vqsize));
% msgbox(Message,'Update','help');
    
        fprintf('\n \n working on run:%d \n',run);
        if (nrun > 1 && run <= 9)
            featurestring=[feature,'_',tset,'endpt_',num2str(run),'.mat'];
        elseif (nrun > 1 && run == 10)
            featurestring=[feature,'_',tset,'endpt_','O','.mat'];
        elseif (nrun > 1 && run == 11)
            featurestring=[feature,'_',tset,'endpt_','Z','.mat'];
        end
        
% load feature vectors for current run
        load (featurestring);

% determine number of feature vectors in training set, nframes
% determine number of components in each feature vector, L
        n=size(c);
        nframes=n(1);
        L=n(2);
    
% create vq of size 1 -- i.e., the centroid of the data
% compute average distortion
        for i=1:L   
            newcentroid(1,i)=sum(c(:,i))/nframes;
        end
        centroidsave=newcentroid(1,:);
        dist(1)=0;
        for i=1:nframes
            dist(1)=dist(1)+sum((c(i,:)-newcentroid(1,:)).^2);
        end
        dist(1)=dist(1)/nframes;
        ncentroid=1;
        fprintf(fidw,'vq size: %d, average distortion: %6.2f \n',...
            ncentroid,dist(1));
        fprintf(fidw,'centroid values: %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f \n',...
            newcentroid(1,:));
    
% now split the centroid and go through optimization loop
        for iloop=1:nloops   
            for nc=1:ncentroid
                newcentroid(2*nc-1,:)=centroidsave(nc,:)*(1+epsilon);
                newcentroid(2*nc,:)=centroidsave(nc,:)*(1-epsilon);
            end
            ncentroid=ncentroid*2;
                               
% loop until new distortion is within tolerance of old distortion
            distortionold = 1.e15;
            distortiondiff = 1.e15;
            loopcount=0;
            while distortiondiff > thresh*distortionold
                loopcount=loopcount+1;

% now assign each of the training set vectors to one of the new centroids
                [assignment,distortion,localcount,localdistortion]=...
                    assign(c,nframes,L,newcentroid,ncentroid);
        
% compute centroids of assigned vectors
                cnew=centroidcal(assignment,ncentroid,c,L);
                newcentroid=cnew;
        
% compute average distortion and see if it is close to previous iteration
                distortionnew=sum(distortion)/nframes;
                distortiondiff=distortionold-distortionnew;
                distortionold=distortionnew;
            fprintf(fidw,'\niloop: %d, distortionnew,distortiondiff: %6.2f %8.6f \n',...
                iloop,distortionnew,distortiondiff);
            end
            dist(iloop+1)=distortionnew;
    
% print out loop results on screen; print to output file more 
% detailed results            
    fprintf('\n nframes: %d, ncentroid: %d, nloops: %d, distortionnew: %6.2f',...
        nframes,ncentroid,loopcount,distortionnew);
    fprintf(fidw,'\n nframes: %d, ncentroid: %d, nloops: %d, distortionnew: %6.2f',...
        nframes,ncentroid,loopcount,distortionnew);
    if (ncentroid < 10)
    fprintf(fidw,'\n count: %d %d %d %d %d %d %d %d %d %d \n',localcount);
    fprintf(fidw,'\n distortion: %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f \n',...
        localdistortion);
    else
    fprintf(fidw,'\n count: %d %d %d %d %d %d %d %d %d %d',localcount);
    fprintf(fidw,'\n distortion: %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f',...
        localdistortion);
    end
        
% save centroids and distortions
            centroidsave=newcentroid;
            dist(iloop+1)=distortionnew;
            if (ncentroid >= 8)
                outfile=['vq_',feature,'_',tset,'_endpt',...
                    num2str(ncentroid),'.mat'];
            end
            if (nrun > 1 && run <= 9)
                outfile=['vq_',feature,'_',tset,'endpt_',...
                    num2str(ncentroid),'_',num2str(run),'.mat'];
            elseif (nrun > 1 && run == 10)
                outfile=['vq_',feature,'_',tset,'endpt_',...
                    num2str(ncentroid),'_O','.mat'];
            elseif (nrun > 1 && run == 11)
                outfile=['vq_',feature,'_',tset,'endpt_',...
                    num2str(ncentroid),'_Z','.mat'];
            end
            tc='centroidsave';
            save (outfile, tc);
        end
    
% save final centroids in file mfcc_centroid or cc_centroid
	stitle=sprintf('cepstral coefficient vq distortion--tidig--single digits');
    
    fprintf(fidw,'\n');
    index(1:nloops+1)=2.^(0:nloops);
    
% initialize figure
    if (run == 1)
        
% clear graphics Panel 1
        reset(graphicPanel1);axes(graphicPanel1);cla;
    end
     
% plot VQ characteristics for each of 11 vowels on graphics Panel 1
    plot(0:nloops,log(dist),color(run),'LineWidth',2),...
        xlabel('Number of VQ Cells'),ylabel('Average Distance');
    hold on; grid on;legend('one','two','three','four','five','six','seven','eight','nine','O','Z');
    end
    
% display VQ header in titleBox1
        stitle1=strcat('VQ Design:',stitle);
        set(titleBox1,'string',stitle1);
        set(titleBox1,'FontSize',20);
    
% close input and output files
    fclose(fidw);
    end

% Callback for button10 -- Clse GUI
 function button10Callback(h,eventdata)
     fclose('all');
     close(gcf);
 end
end