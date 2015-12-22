function varargout = Arabic_Roman(varargin)
% ARABIC_ROMAN MATLAB code for Arabic_Roman.fig
%      ARABIC_ROMAN, by itself, creates a new ARABIC_ROMAN or raises the existing
%      singleton*.
%
%      H = ARABIC_ROMAN returns the handle to a new ARABIC_ROMAN or the handle to
%      the existing singleton*.
%
%      ARABIC_ROMAN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ARABIC_ROMAN.M with the given input arguments.
%
%      ARABIC_ROMAN('Property','Value',...) creates a new ARABIC_ROMAN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Arabic_Roman_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Arabic_Roman_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Arabic_Roman

% Last Modified by GUIDE v2.5 15-May-2013 22:18:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Arabic_Roman_OpeningFcn, ...
                   'gui_OutputFcn',  @Arabic_Roman_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Arabic_Roman is made visible.
function Arabic_Roman_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Arabic_Roman (see VARARGIN)

% Choose default command line output for Arabic_Roman
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Arabic_Roman wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Arabic_Roman_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=str2num(get(handles.edit1,'string'));
if a>=4000 || a<0 || a==0
    set(handles.edit2,'string','Invalid');
else
n=length(a);
x=(a-mod(a,1000));
y=(a-x-mod((a-x),100));
z=(a-x-y-mod((a-x-y),10));
t=a-x-y-z;
str01=0; str02=0; str03=0; str04=0;

%1000x
if x==1000
    str01='M';
elseif x==2000
    str01='MM';
elseif x==3000
    str01='MMM';
else
    str01='';
end
%100y
if y==100
    str02='C';
elseif y==200
    str02='CC';
elseif y==300
    str02='CCC';
elseif y==400
    str02='CD';
elseif y==500
    str02='D';    
elseif y==600
    str02='DC';
elseif y==700
    str02='DCC';
elseif y==800
    str02='DCCC';
elseif y==900
    str02='CM';
else
    str02='';
end
%10z
if z==10
    str03='X';
elseif z==20
    str03='XX';
elseif z==30
    str03='XXX';    
elseif z==40
    str03='XL';
elseif z==50
    str03='L';    
elseif z==60
    str03='LX';    
elseif z==70
    str03='LXX';
elseif z==80
    str03='LXXX';    
elseif z==90
    str03='XC';
else
    str03='';
end    
%1t
if t==1
    str04='I';
elseif t==2
    str04='II';
elseif t==3
    str04='III';
elseif t==4
    str04='IV';
elseif t==5
    str04='V';
elseif t==6
    str04='VI';
elseif t==7
    str04='VII';
elseif t==8
    str04='VIII';
elseif t==9
    str04='IX';
else
    str04='';
end

str=[str01 str02 str03 str04];
set(handles.edit2,'string',str);
end
    
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
A=get(handles.edit2,'string');
n=length(A);
validity=1;
%Value
for i=1:n
    if A(i)=='I'
        B(i)=1;
        C(i)=1;
    elseif A(i)=='V'
        B(i)=5;
        C(i)=2;
    elseif A(i)=='X'
        B(i)=10;
        C(i)=3;
    elseif A(i)=='L'
        B(i)=50;
        C(i)=4;
    elseif A(i)=='C'
        B(i)=100;
        C(i)=5;
    elseif A(i)=='D'
        B(i)=500;
        C(i)=6;
    else
        B(i)=1000;
        C(i)=7;
    end
end
%Conditions
for i=1:n
    if (A(i)~='I' && A(i)~='I' && A(i)~='V' && A(i)~='X' && A(i)~='L' && A(i)~='C' && A(i)~='D' && A(i)~='M') 
        validity=0;
        break
    end
end
if n>=3
    for i=1:n-2
        if C(i)==C(i+1) && C(i)<C(i+2)
            validity=0;
            break
        end
    end
end
if n==4
    if C(1)==C(2) && C(i)==C(3) && C(i)==C(4)
        validity=0;
    end
end
for i=1:n
    if B(i)==5 || B(i)==50 || B(i)==500
        for j=i+1:n
            if B(j)>B(i)
                validity=0;
                break
            end
        end
        if validity==0
            break
        end
    end
end
for i=1:n-1
    if C(i+1)-C(i)>=3 || C(i)<C(i+1) && mod(C(i),2)==0
        validity=0;
        break;
    elseif C(i)<C(i+1)
        B(i)=-B(i);
    end
end
        
%Compute
if validity==0
    S='invalid';
else
    S=sum(B);
    S=num2str(S);
end
set(handles.edit1,'string',S)
