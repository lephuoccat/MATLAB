function varargout = presscount(varargin)
% PRESSCOUNT MATLAB code for presscount.fig
%      PRESSCOUNT, by itself, creates a new PRESSCOUNT or raises the existing
%      singleton*.
%
%      H = PRESSCOUNT returns the handle to a new PRESSCOUNT or the handle to
%      the existing singleton*.
%
%      PRESSCOUNT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRESSCOUNT.M with the given input arguments.
%
%      PRESSCOUNT('Property','Value',...) creates a new PRESSCOUNT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before presscount_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to presscount_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help presscount

% Last Modified by GUIDE v2.5 15-May-2013 15:47:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @presscount_OpeningFcn, ...
                   'gui_OutputFcn',  @presscount_OutputFcn, ...
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


% --- Executes just before presscount is made visible.
function presscount_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to presscount (see VARARGIN)

% Choose default command line output for presscount
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes presscount wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = presscount_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in press.
function press_Callback(hObject, eventdata, handles)
% hObject    handle to press (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
persistent count
if isempty(count)
    count=0;
end
count=count+1;
str=sprintf('Total Clicks: %d',count);
set(handles.text,'string',str);
