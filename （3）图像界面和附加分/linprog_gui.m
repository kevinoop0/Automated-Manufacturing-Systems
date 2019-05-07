function varargout = linprog_gui(varargin)
% LINPROG_GUI MATLAB code for linprog_gui.fig
%      LINPROG_GUI, by itself, creates a new LINPROG_GUI or raises the existing
%      singleton*.
%
%      H = LINPROG_GUI returns the handle to a new LINPROG_GUI or the handle to
%      the existing singleton*.
%
%      LINPROG_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LINPROG_GUI.M with the given input arguments.
%
%      LINPROG_GUI('Property','Value',...) creates a new LINPROG_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before linprog_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to linprog_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help linprog_gui

% Last Modified by GUIDE v2.5 10-Jun-2018 17:53:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @linprog_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @linprog_gui_OutputFcn, ...
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


% --- Executes just before linprog_gui is made visible.
function linprog_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to linprog_gui (see VARARGIN)
load('linprog.mat')
temp_x( find(temp_x<=0.1^(10) ) ) =0;
round_x=roundn(temp_x,-4);
handles.linprog=round_x;
% Choose default command line output for linprog_gui
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes linprog_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = linprog_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Constraint.
function Constraint_Callback(hObject, eventdata, handles)
% hObject    handle to Constraint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
linprog=handles.linprog;
set(handles.uitable1,'Data',linprog(1:13,:));



% --- Executes on button press in Translation.
function Translation_Callback(hObject, eventdata, handles)
% hObject    handle to Translation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

linprog=handles.linprog;
set(handles.uitable2,'Data',linprog(14,:));


% --- Executes on button press in Linearly.
function Linearly_Callback(hObject, eventdata, handles)
% hObject    handle to Linearly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
linprog=handles.linprog;
is_linearly=linprog(14,:)>0;
set(handles.uitable3,'Data',is_linearly);



% --- Executes on button press in Clear_return.
function Clear_return_Callback(hObject, eventdata, handles)
% hObject    handle to Clear_return (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uitable1,'Data',[ ]);
set(handles.uitable2,'Data',[ ]);
set(handles.uitable3,'Data',[ ]);
 set(gcf,'Visible','off');%关闭当前界面
% h=figure(MyGui);
Welcome('Visible','on');


% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
