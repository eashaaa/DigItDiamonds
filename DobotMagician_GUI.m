function varargout = DobotMagician_GUI(varargin)
% DobotMagician_GUI MATLAB code for DobotMagician_GUI.fig
%      DobotMagician_GUI, by itself, creates a new DobotMagician_GUI or raises the existing
%      singleton*.
%
%      H = DobotMagician_GUI returns the handle to a new DobotMagician_GUI or the handle to
%      the existing singleton*.
%
%      DobotMagician_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DobotMagician_GUI.M with the given input arguments.
%
%      DobotMagician_GUI('Property','Value',...) creates a new DobotMagician_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DobotMagician_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DobotMagician_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DobotMagician_GUI

% Last Modified by GUIDE v2.5 10-Nov-2023 20:44:55

                        % INITIALISATION %
%---------------------------------------------------------------------%

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DobotMagician_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @DobotMagician_GUI_OutputFcn, ...
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

                        % OPENING FUNCTION %
%---------------------------------------------------------------------%

% --- Executes just before DobotMagician_GUI is made visible.
function DobotMagician_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DobotMagician_GUI (see VARARGIN)

cla
axes(handles.axes2);
r = DobotMagician();
%axis([-1 1 -1 1 -1 1.5]);

data = guidata(hObject);
handles.model = r.model;
guidata(hObject,data);


% Choose default command line output for DobotMagician_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DobotMagician_GUI wait for user response (see UIRESUME)
uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DobotMagician_GUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


                        % JOINT SLIDERS %
%---------------------------------------------------------------------%

% --- Executes on slider movement.
% SLIDER Q2
function slider1_Callback(hObject, eventdata, handles)
q = handles.model.getpos;
j2 = get(handles.slider1, 'Value');
q(1,2) = deg2rad(j2);
tr = handles.model.fkine(q);
handles.model.animate(q);
set(handles.text1, 'String', num2str(round((tr(1,4)),2)));
set(handles.text2, 'String', num2str(round((tr(2,4)),2)));
set(handles.text3, 'String', num2str(round((tr(3,4)),2)));
J1 = round(rad2deg(q(1,1)), 2);
J2 = round(rad2deg(q(1,2)), 2);
J3 = round(rad2deg(q(1,3)), 2);
J4 = round(rad2deg(q(1,4)), 2);
J5 = round(rad2deg(q(1,5)), 2);
% J6 = round(rad2deg(q(1,6)), 2);
% J7 = round(rad2deg(q(1,7)), 2);
set(handles.text10, 'String', num2str(J1));
set(handles.text11, 'String', num2str(J2));
set(handles.text12, 'String', num2str(J3));
set(handles.text13, 'String', num2str(J4));
set(handles.text14, 'String', num2str(J5));
set(handles.text15, 'String', num2str(J6));
% set(handles.text17, 'String', num2str(J7));


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
% SLIDER Q3
function slider2_Callback(hObject, eventdata, handles)
q = handles.model.getpos;
j3 = get(handles.slider2, 'Value');
q(1,3) = deg2rad(j3);
tr = handles.model.fkine(q);
handles.model.animate(q);
set(handles.text1, 'String', num2str(round((tr(1,4)),2)));
set(handles.text2, 'String', num2str(round((tr(2,4)),2)));
set(handles.text3, 'String', num2str(round((tr(3,4)),2)));
J1 = round(rad2deg(q(1,1)), 2);
J2 = round(rad2deg(q(1,2)), 2);
J3 = round(rad2deg(q(1,3)), 2);
J4 = round(rad2deg(q(1,4)), 2);
J5 = round(rad2deg(q(1,5)), 2);
J6 = round(rad2deg(q(1,6)), 2);
% J7 = round(rad2deg(q(1,7)), 2);
set(handles.text10, 'String', num2str(J1));
set(handles.text11, 'String', num2str(J2));
set(handles.text12, 'String', num2str(J3));
set(handles.text13, 'String', num2str(J4));
set(handles.text14, 'String', num2str(J5));
set(handles.text15, 'String', num2str(J6));
% set(handles.text17, 'String', num2str(J7));


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
% SLIDER Q4
function slider3_Callback(hObject, eventdata, handles)
q = handles.model.getpos;
j4 = get(handles.slider3, 'Value');
q(1,4) = deg2rad(j4);
tr = handles.model.fkine(q);
handles.model.animate(q);
set(handles.text1, 'String', num2str(round((tr(1,4)),2)));
set(handles.text2, 'String', num2str(round((tr(2,4)),2)));
set(handles.text3, 'String', num2str(round((tr(3,4)),2)));
J1 = round(rad2deg(q(1,1)), 2);
J2 = round(rad2deg(q(1,2)), 2);
J3 = round(rad2deg(q(1,3)), 2);
J4 = round(rad2deg(q(1,4)), 2);
J5 = round(rad2deg(q(1,5)), 2);
J6 = round(rad2deg(q(1,6)), 2);
% J7 = round(rad2deg(q(1,7)), 2);
set(handles.text10, 'String', num2str(J1));
set(handles.text11, 'String', num2str(J2));
set(handles.text12, 'String', num2str(J3));
set(handles.text13, 'String', num2str(J4));
set(handles.text14, 'String', num2str(J5));
set(handles.text15, 'String', num2str(J6));
% set(handles.text17, 'String', num2str(J7));


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
% SLIDER Q5
function slider4_Callback(hObject, eventdata, handles)
q = handles.model.getpos;
j5 = get(handles.slider4, 'Value');
q(1,5) = deg2rad(j5);
tr = handles.model.fkine(q);
handles.model.animate(q);
set(handles.text1, 'String', num2str(round((tr(1,4)),2)));
set(handles.text2, 'String', num2str(round((tr(2,4)),2)));
set(handles.text3, 'String', num2str(round((tr(3,4)),2)));
J1 = round(rad2deg(q(1,1)), 2);
J2 = round(rad2deg(q(1,2)), 2);
J3 = round(rad2deg(q(1,3)), 2);
J4 = round(rad2deg(q(1,4)), 2);
J5 = round(rad2deg(q(1,5)), 2);
J6 = round(rad2deg(q(1,6)), 2);
% J7 = round(rad2deg(q(1,7)), 2);
set(handles.text10, 'String', num2str(J1));
set(handles.text11, 'String', num2str(J2));
set(handles.text12, 'String', num2str(J3));
set(handles.text13, 'String', num2str(J4));
set(handles.text14, 'String', num2str(J5));
set(handles.text15, 'String', num2str(J6));
% set(handles.text17, 'String', num2str(J7));


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
% SLIDER Q6
function slider5_Callback(hObject, eventdata, handles)
q = handles.model.getpos;
j6 = get(handles.slider5, 'Value');
q(1,6) = deg2rad(j6);
tr = handles.model.fkine(q);
handles.model.animate(q);
set(handles.text1, 'String', num2str(round((tr(1,4)),2)));
set(handles.text2, 'String', num2str(round((tr(2,4)),2)));
set(handles.text3, 'String', num2str(round((tr(3,4)),2)));
J1 = round(rad2deg(q(1,1)), 2);
J2 = round(rad2deg(q(1,2)), 2);
J3 = round(rad2deg(q(1,3)), 2);
J4 = round(rad2deg(q(1,4)), 2);
J5 = round(rad2deg(q(1,5)), 2);
J6 = round(rad2deg(q(1,6)), 2);
% J7 = round(rad2deg(q(1,7)), 2);
set(handles.text10, 'String', num2str(J1));
set(handles.text11, 'String', num2str(J2));
set(handles.text12, 'String', num2str(J3));
set(handles.text13, 'String', num2str(J4));
set(handles.text14, 'String', num2str(J5));
set(handles.text15, 'String', num2str(J6));
% set(handles.text17, 'String', num2str(J7));


% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
% SLIDER Q1
function slider6_Callback(hObject, eventdata, handles)
q = handles.model.getpos;
j1 = get(handles.slider6, 'Value');
q(1,1) = deg2rad(j1);
tr = handles.model.fkine(q);
handles.model.animate(q);
set(handles.text1, 'String', num2str(round((tr(1,4)),2)));
set(handles.text2, 'String', num2str(round((tr(2,4)),2)));
set(handles.text3, 'String', num2str(round((tr(3,4)),2)));
J1 = round(rad2deg(q(1,1)), 2);
J2 = round(rad2deg(q(1,2)), 2);
J3 = round(rad2deg(q(1,3)), 2);
J4 = round(rad2deg(q(1,4)), 2);
J5 = round(rad2deg(q(1,5)), 2);
J6 = round(rad2deg(q(1,6)), 2);
% J7 = round(rad2deg(q(1,7)), 2);
set(handles.text10, 'String', num2str(J1));
set(handles.text11, 'String', num2str(J2));
set(handles.text12, 'String', num2str(J3));
set(handles.text13, 'String', num2str(J4));
set(handles.text14, 'String', num2str(J5));
set(handles.text15, 'String', num2str(J6));
% set(handles.text17, 'String', num2str(J7));


% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
% SLIDER Q7
function slider7_Callback(hObject, eventdata, handles)
q = handles.model.getpos;
j7 = get(handles.slider7, 'Value');
q(1,7) = deg2rad(j7);
tr = handles.model.fkine(q);
handles.model.animate(q);
set(handles.text1, 'String', num2str(round((tr(1,4)),2)));
set(handles.text2, 'String', num2str(round((tr(2,4)),2)));
set(handles.text3, 'String', num2str(round((tr(3,4)),2)));
J1 = round(rad2deg(q(1,1)), 2);
J2 = round(rad2deg(q(1,2)), 2);
J3 = round(rad2deg(q(1,3)), 2);
J4 = round(rad2deg(q(1,4)), 2);
J5 = round(rad2deg(q(1,5)), 2);
J6 = round(rad2deg(q(1,6)), 2);
% J7 = round(rad2deg(q(1,7)), 2);
set(handles.text10, 'String', num2str(J1));
set(handles.text11, 'String', num2str(J2));
set(handles.text12, 'String', num2str(J3));
set(handles.text13, 'String', num2str(J4));
set(handles.text14, 'String', num2str(J5));
set(handles.text15, 'String', num2str(J6));
% set(handles.text17, 'String', num2str(J7));


% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


                          % XYZ PUSH BUTTONS %
%---------------------------------------------------------------------%


% --- Executes on button press in pushbutton2.
% + X
function pushbutton2_Callback(hObject, eventdata, handles)
q = handles.model.getpos;
tr = handles.model.fkine(q);
tr(1,4) = tr(1,4) + 0.01;
newQ = handles.model.ikcon(tr);
handles.model.animate(newQ);
set(handles.text1, 'String', num2str(round((tr(1,4)),2)));
set(handles.text2, 'String', num2str(round((tr(2,4)),2)));
set(handles.text3, 'String', num2str(round((tr(3,4)),2)));
J1 = round(rad2deg(newQ(1,1)), 2);
J2 = round(rad2deg(newQ(1,2)), 2);
J3 = round(rad2deg(newQ(1,3)), 2);
J4 = round(rad2deg(newQ(1,4)), 2);
J5 = round(rad2deg(newQ(1,5)), 2);
J6 = round(rad2deg(newQ(1,6)), 2);
% J7 = round(rad2deg(newQ(1,7)), 2);
set(handles.text10, 'String', num2str(J1));
set(handles.text11, 'String', num2str(J2));
set(handles.text12, 'String', num2str(J3));
set(handles.text13, 'String', num2str(J4));
set(handles.text14, 'String', num2str(J5));
% set(handles.text15, 'String', num2str(J6));
% set(handles.text17, 'String', num2str(J7));


% --- Executes on button press in pushbutton3.
% - X
function pushbutton3_Callback(hObject, eventdata, handles)
q = handles.model.getpos;
tr = handles.model.fkine(q);
tr(1,4) = tr(1,4) - 0.01;
newQ = handles.model.ikcon(tr,q);
handles.model.animate(newQ);
set(handles.text1, 'String', num2str(round((tr(1,4)),2)));
set(handles.text2, 'String', num2str(round((tr(2,4)),2)));
set(handles.text3, 'String', num2str(round((tr(3,4)),2)));
J1 = round(rad2deg(newQ(1,1)), 2);
J2 = round(rad2deg(newQ(1,2)), 2);
J3 = round(rad2deg(newQ(1,3)), 2);
J4 = round(rad2deg(newQ(1,4)), 2);
J5 = round(rad2deg(newQ(1,5)), 2);
J6 = round(rad2deg(newQ(1,6)), 2);
% J7 = round(rad2deg(newQ(1,7)), 2);
set(handles.text10, 'String', num2str(J1));
set(handles.text11, 'String', num2str(J2));
set(handles.text12, 'String', num2str(J3));
set(handles.text13, 'String', num2str(J4));
set(handles.text14, 'String', num2str(J5));
% set(handles.text15, 'String', num2str(J6));
% set(handles.text17, 'String', num2str(J7));

% --- Executes on button press in pushbutton4.
% + Y
function pushbutton4_Callback(hObject, eventdata, handles)
q = handles.model.getpos;
tr = handles.model.fkine(q);
tr(2,4) = tr(2,4) + 0.01;
newQ = handles.model.ikcon(tr,q);
handles.model.animate(newQ);
set(handles.text1, 'String', num2str(round((tr(1,4)),2)));
set(handles.text2, 'String', num2str(round((tr(2,4)),2)));
set(handles.text3, 'String', num2str(round((tr(3,4)),2)));
J1 = round(rad2deg(newQ(1,1)), 2);
J2 = round(rad2deg(newQ(1,2)), 2);
J3 = round(rad2deg(newQ(1,3)), 2);
J4 = round(rad2deg(newQ(1,4)), 2);
J5 = round(rad2deg(newQ(1,5)), 2);
J6 = round(rad2deg(newQ(1,6)), 2);
% J7 = round(rad2deg(newQ(1,7)), 2);
set(handles.text10, 'String', num2str(J1));
set(handles.text11, 'String', num2str(J2));
set(handles.text12, 'String', num2str(J3));
set(handles.text13, 'String', num2str(J4));
set(handles.text14, 'String', num2str(J5));
set(handles.text15, 'String', num2str(J6));
% set(handles.text17, 'String', num2str(J7));

% - Z
% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
q = handles.model.getpos;
tr = handles.model.fkine(q);
tr(3,4) = tr(3,4) - 0.01;
newQ = handles.model.ikcon(tr,q);
handles.model.animate(newQ);
set(handles.text1, 'String', num2str(round((tr(1,4)),2)));
set(handles.text2, 'String', num2str(round((tr(2,4)),2)));
set(handles.text3, 'String', num2str(round((tr(3,4)),2)));
J1 = round(rad2deg(newQ(1,1)), 2);
J2 = round(rad2deg(newQ(1,2)), 2);
J3 = round(rad2deg(newQ(1,3)), 2);
J4 = round(rad2deg(newQ(1,4)), 2);
J5 = round(rad2deg(newQ(1,5)), 2);
J6 = round(rad2deg(newQ(1,6)), 2);
% J7 = round(rad2deg(newQ(1,7)), 2);
set(handles.text10, 'String', num2str(J1));
set(handles.text11, 'String', num2str(J2));
set(handles.text12, 'String', num2str(J3));
set(handles.text13, 'String', num2str(J4));
set(handles.text14, 'String', num2str(J5));
% set(handles.text15, 'String', num2str(J6));
% set(handles.text17, 'String', num2str(J7));


% --- Executes on button press in pushbutton6.
% + Z
function pushbutton6_Callback(hObject, eventdata, handles)
q = handles.model.getpos;
tr = handles.model.fkine(q);
tr(3,4) = tr(3,4) + 0.01;
newQ = handles.model.ikcon(tr,q);
handles.model.animate(newQ);
set(handles.text1, 'String', num2str(round((tr(1,4)),2)));
set(handles.text2, 'String', num2str(round((tr(2,4)),2)));
set(handles.text3, 'String', num2str(round((tr(3,4)),2)));
J1 = round(rad2deg(newQ(1,1)), 2);
J2 = round(rad2deg(newQ(1,2)), 2);
J3 = round(rad2deg(newQ(1,3)), 2);
J4 = round(rad2deg(newQ(1,4)), 2);
J5 = round(rad2deg(newQ(1,5)), 2);
J6 = round(rad2deg(newQ(1,6)), 2);
% J7 = round(rad2deg(newQ(1,7)), 2);
set(handles.text10, 'String', num2str(J1));
set(handles.text11, 'String', num2str(J2));
set(handles.text12, 'String', num2str(J3));
set(handles.text13, 'String', num2str(J4));
set(handles.text14, 'String', num2str(J5));
set(handles.text15, 'String', num2str(J6));
% set(handles.text17, 'String', num2str(J7));

% --- Executes on button press in pushbutton7.
% - Y
function pushbutton7_Callback(hObject, eventdata, handles)
q = handles.model.getpos;
tr = handles.model.fkine(q);
tr(2,4) = tr(2,4) - 0.01;
newQ = handles.model.ikcon(tr,q);
handles.model.animate(newQ);
set(handles.text1, 'String', num2str(round((tr(1,4)),2)));
set(handles.text2, 'String', num2str(round((tr(2,4)),2)));
set(handles.text3, 'String', num2str(round((tr(3,4)),2)));
J1 = round(rad2deg(newQ(1,1)), 2);
J2 = round(rad2deg(newQ(1,2)), 2);
J3 = round(rad2deg(newQ(1,3)), 2);
J4 = round(rad2deg(newQ(1,4)), 2);
J5 = round(rad2deg(newQ(1,5)), 2);
J6 = round(rad2deg(newQ(1,6)), 2);
% J7 = round(rad2deg(newQ(1,7)), 2);
set(handles.text10, 'String', num2str(J1));
set(handles.text11, 'String', num2str(J2));
set(handles.text12, 'String', num2str(J3));
set(handles.text13, 'String', num2str(J4));
set(handles.text14, 'String', num2str(J5));
set(handles.text15, 'String', num2str(J6));
% set(handles.text17, 'String', num2str(J7));


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
