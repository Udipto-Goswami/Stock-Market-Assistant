function varargout = sma(varargin)
% SMA MATLAB code for sma.fig
%      SMA, by itself, creates a new SMA or raises the existing
%      singleton*.
%
%      H = SMA returns the handle to a new SMA or the handle to
%      the existing singleton*.
%
%      SMA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SMA.M with the given input arguments.
%
%      SMA('Property','Value',...) creates a new SMA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sma_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sma_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sma

% Last Modified by GUIDE v2.5 16-Apr-2018 23:10:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sma_OpeningFcn, ...
                   'gui_OutputFcn',  @sma_OutputFcn, ...
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


% --- Executes just before sma is made visible.
function sma_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

guidata(hObject, handles);

set(handles.sp, 'enable', 'off');
set(handles.mal13, 'enable', 'off');
set(handles.mal26, 'enable', 'off');
set(handles.sp, 'enable', 'off');
set(handles.predict, 'enable', 'off');
set(handles.cr, 'enable', 'off');
set(handles.final, 'enable', 'off');
set(handles.message_box_1,'string','');




% --- Outputs from this function are returned to the command line.
function varargout = sma_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in month.
function month_Callback(hObject, eventdata, handles)
% hObject    handle to month (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns month contents as cell array
%        contents{get(hObject,'Value')} returns selected item from month


% --- Executes during object creation, after setting all properties.
function month_CreateFcn(hObject, eventdata, handles)
% hObject    handle to month (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in day.
function day_Callback(hObject, eventdata, handles)
% hObject    handle to day (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns day contents as cell array
%        contents{get(hObject,'Value')} returns selected item from day


% --- Executes during object creation, after setting all properties.
function day_CreateFcn(hObject, eventdata, handles)
% hObject    handle to day (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in time.
function time_Callback(hObject, eventdata, handles)
% hObject    handle to time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns time contents as cell array
%        contents{get(hObject,'Value')} returns selected item from time


% --- Executes during object creation, after setting all properties.
function time_CreateFcn(hObject, eventdata, handles)
% hObject    handle to time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2

% --- Executes on button press in validate.
function validate_Callback(hObject, eventdata, handles)
% hObject    handle to validate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
indicating=0;
choice =get(get(handles.panelsos,'SelectedObject'),'TAG');
display(choice);

if choice =='radiobutton1'
    choice =0;
else
    choice =1;
end
%display(choice);
month_in =get(handles.month,'Value');
day_in =get(handles.day,'Value');
time_in =get(handles.time,'Value');
%disp(time_in);
proceed=readfis('Proceed.fis');
output = evalfis([choice month_in day_in time_in],proceed);
set(handles.message_box_1,'string',output);

if(output <0.5)
    set(handles.message_box_1,'String','Cannot Proceed');
    set(handles.sp,'String','');
     set(handles.mal13,'String','');
      set(handles.mal26,'String','');
       set(handles.cr,'String','');
        set(handles.final,'String','');
     
        
        set(handles.sp, 'enable', 'off');
set(handles.mal13, 'enable', 'off');
set(handles.mal26, 'enable', 'off');
set(handles.sp, 'enable', 'off');
set(handles.predict, 'enable', 'off');
set(handles.cr, 'enable', 'off');
set(handles.final, 'enable', 'off');

else
    set(handles.message_box_1,'String','Can Proceed');
   set(handles.sp, 'enable','ON');
   set(handles.mal13, 'enable','ON');
   set(handles.mal26, 'enable','ON');
   set(handles.predict, 'enable','ON');
   
   indicating =1;
end
 



function sp_Callback(hObject, eventdata, handles)
% hObject    handle to sp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sp as text
%        str2double(get(hObject,'String')) returns contents of sp as a double


% --- Executes during object creation, after setting all properties.
function sp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mal13_Callback(hObject, eventdata, handles)
% hObject    handle to mal13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mal13 as text
%        str2double(get(hObject,'String')) returns contents of mal13 as a double


% --- Executes during object creation, after setting all properties.
function mal13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mal13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mal26_Callback(hObject, eventdata, handles)
% hObject    handle to mal26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mal26 as text
%        str2double(get(hObject,'String')) returns contents of mal26 as a double


% --- Executes during object creation, after setting all properties.
function mal26_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mal26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in predict.
function predict_Callback(hObject, eventdata, handles)
% hObject    handle to predict (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

sp =get(handles.sp,'string');
mal13 = get(handles.mal13,'string');
mal26 = get(handles.mal26,'string');

if ~isempty(mal13) && ~isempty(mal26) && ~isempty(sp)
sp = str2double(get(handles.sp,'string'));
   mal13 = str2double(get(handles.mal13,'string'));
   mal26 = str2double(get(handles.mal26,'string'));
   
 if (sp>20) || (sp<0) || (mal13 >2) || (mal13 <-2) || (mal26 >2) || (mal26<0)
    set(handles.final,'String','Error! Valid ranges are: Stock price[0 20],Mal13 [-2 2], Mal26 [0 2]','ForegroundColor',[1 0 0]);
 else
        cr = readfis('CR.fis');
   chance = readfis('QR.fis');
   output2 = evalfis([sp mal13],cr); 
   output3 = evalfis([output2 mal26],chance);
if(output3>0.4)
    textLabel = sprintf('Changes are high, You can Proceed with [QR]: %f', output3);
    set(handles.final,'String',textLabel);
else
     textLabel = sprintf('Chances are against your choice!: %f', output3);
    set(handles.final,'String',textLabel);

end
   %disp(output2);
   set(handles.cr,'string',output2);
   
   disp(output3);

 end

else
             set(handles.final,'String','All fields are mendatory!');

end



function message_box_1_Callback(hObject, eventdata, handles)
% hObject    handle to message_box_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of message_box_1 as text
%        str2double(get(hObject,'String')) returns contents of message_box_1 as a double


% --- Executes during object creation, after setting all properties.
function message_box_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to message_box_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cr_Callback(hObject, eventdata, handles)
% hObject    handle to cr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cr as text
%        str2double(get(hObject,'String')) returns contents of cr as a double


% --- Executes during object creation, after setting all properties.
function cr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
% hObject    handle to panel_choice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function final_Callback(hObject, eventdata, handles)
% hObject    handle to final (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of final as text
%        str2double(get(hObject,'String')) returns contents of final as a double


% --- Executes during object creation, after setting all properties.
function final_CreateFcn(hObject, eventdata, handles)
% hObject    handle to final (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
