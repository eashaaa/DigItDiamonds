
% BUTTONS 
% --- Executes on button press in ESTOP.
function estop_Callback(hObject, eventdata, handles)
% get (hobject, 'Value') returns toggle state of estop
% get (handles.estop, 'Value') == 1 when PRESSED
handles. estop = get (handles.estop,
'Value');
if handles. estop == 1
msgbox'One of the Emergency Stop
buttons have been pressed. ')
else
msgbox ('Emergency stop has been reset. Press "Resume" on control pad to continue operation. ')
end
% --- Executes on button press in
RESUME.
function resume_Callback(hObject, eventdata, handles)
handles. contM = get (handles.resume,'Value');
i = 1;

while i < 100
i = i + 1;
x_way = GetWaypoints) ;
for p = 1: size(x_way, 1)
