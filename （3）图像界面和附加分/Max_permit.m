function varargout = Max_permit(varargin)
% MAX_PERMIT MATLAB code for Max_permit.fig
%      MAX_PERMIT, by itself, creates a new MAX_PERMIT or raises the existing
%      singleton*.
%
%      H = MAX_PERMIT returns the handle to a new MAX_PERMIT or the handle to
%      the existing singleton*.
%
%      MAX_PERMIT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAX_PERMIT.M with the given input arguments.
%
%      MAX_PERMIT('Property','Value',...) creates a new MAX_PERMIT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Max_permit_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Max_permit_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Max_permit

% Last Modified by GUIDE v2.5 25-May-2018 08:46:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Max_permit_OpeningFcn, ...
                   'gui_OutputFcn',  @Max_permit_OutputFcn, ...
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


% --- Executes just before Max_permit is made visible.
function Max_permit_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Max_permit (see VARARGIN)
handles.M0=[3 11 7 zeros(1,16)];% 网络的初始状态
load('new_minfbm.mat');
handles.num_of_minfbm=length(new_minfbm);
handles.CapaofP=[21 1 1 1 2 2 2 2];% 容量/能力矩阵
handles.checktable=[0 0 0 1 1 2 2 2 2 2  3 3 4 5 5 6 6 7 7] ;% 说明维度
handles.minfbm_checktable=[1 2 2 2 2 3 4 5 5 6 6 7 7 ];
load('sparse_matrix.mat');
handles.inci =spconvert(sparse_matrix);
% Choose default command line output for Max_permit
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Max_permit wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Max_permit_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Single.
function Single_Callback(hObject, eventdata, handles)
% hObject    handle to Single (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CapaofP=handles.CapaofP;
minfbm_checktable=handles.minfbm_checktable;
[num_of_M_s,constraint_of_M_s]=Single_color_occupied(CapaofP,minfbm_checktable);
handles.num_of_M_s=num_of_M_s;
set(handles.edit1,'string',num_of_M_s);
set(handles.uitable1,'Data',constraint_of_M_s);
guidata(hObject, handles);




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


% --- Executes on button press in Fully_filled.
function Fully_filled_Callback(hObject, eventdata, handles)
% hObject    handle to Fully_filled (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
num_of_minfbm=handles.num_of_minfbm;
num_of_M_s=handles.num_of_M_s;
CapaofP=handles.CapaofP;
checktable=handles.checktable;
minfbm_checktable=handles.minfbm_checktable;
inci=handles.inci;
[num_of_M_f,constraint_of_M_f]=Fully_filled(num_of_minfbm,num_of_M_s,CapaofP,checktable,minfbm_checktable,inci);
handles.num_of_M_f=num_of_M_f;
set(handles.edit2,'string',num_of_M_f);
set(handles.uitable1,'Data',[]);
set(handles.uitable1,'Data',constraint_of_M_f);
guidata(hObject, handles);




function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in next_Deadlock.
function next_Deadlock_Callback(hObject, eventdata, handles)
% hObject    handle to next_Deadlock (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
num_of_minfbm=handles.num_of_minfbm;
num_of_M_s=handles.num_of_M_s;
num_of_M_f=handles.num_of_M_f;
CapaofP=handles.CapaofP;
checktable=handles.checktable;
inci=handles.inci;
[num_of_M_p,constraint_of_M_p]=One_step_ahead_deadlock(num_of_minfbm,num_of_M_s,num_of_M_f,CapaofP,checktable,inci);
set(handles.edit3,'string',num_of_M_p);
set(handles.uitable1,'Data',[]);
set(handles.uitable1,'Data',constraint_of_M_p);


% --- Executes on button press in Clean.
function Clean_Callback(hObject, eventdata, handles)
% hObject    handle to Clean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit1,'string','');
set(handles.edit2,'string','');
set(handles.edit3,'string','');
set(handles.uitable1,'Data',[ ]);



% --- Executes on button press in Back.
function Back_Callback(hObject, eventdata, handles)
% hObject    handle to Back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 set(gcf,'Visible','off');%关闭当前界面
% h=figure(MyGui);
Welcome('Visible','on');
