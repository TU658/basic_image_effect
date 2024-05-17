function varargout = basic_image_effect(varargin)
% basic_image_effect MATLAB code for basic_image_effect.fig
%      basic_image_effect, by itself, creates a new basic_image_effect or raises the existing
%      singleton*.
%
%      H = basic_image_effect returns the handle to a new basic_image_effect or the handle to
%      the existing singleton*.
%
%      basic_image_effect('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in basic_image_effect.M with the given input arguments.
%
%      basic_image_effect('Property','Value',...) creates a new basic_image_effect or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before basic_image_effect_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to basic_image_effect_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help basic_image_effect

% Last Modified by GUIDE v2.5 03-Oct-2022 22:47:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @basic_image_effect_OpeningFcn, ...
                   'gui_OutputFcn',  @basic_image_effect_OutputFcn, ...
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


% --- Executes just before basic_image_effect is made visible.
function basic_image_effect_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to basic_image_effect (see VARARGIN)

% Choose default command line output for basic_image_effect
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes basic_image_effect wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global imagenew;


% --- Outputs from this function are returned to the command line.
function varargout = basic_image_effect_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton_Open.
function pushbutton_Open_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global imagenew;
[filename, pathname] = uigetfile('*.jpg; *.png; *.jpeg');
img = fullfile(pathname, filename);
set(handles.text8, 'string', pathname);
show = imread(img);
axes(handles.axes2);
imshow(show);
axes(handles.axes3);
imshow(show);
handles.image = show;
imagenew = handles.image;
guidata(hObject,handles);




% --- Executes on button press in pushbutton_Save.
function pushbutton_Save_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes3);
Saved=getframe(gca);
[fileName, filePath] = uiputfile('*.jpg');
fileName = fullfile(filePath,fileName); 
imwrite(Saved.cdata, fileName, 'jpg');
guidata(hObject,handles);



% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global imagenew; 
val_show = get(hObject, 'Value');
set(handles.text4, 'string', num2str(val_show));
val_img = get(hObject, 'Value');
bright = double(imagenew) + val_img;
imshow(uint8(bright), 'Parent', handles.axes3);




% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
set(hObject,'Max',255,'Min',0,'Value',0);

% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global imagenew;
val_show = get(hObject, 'Value');
set(handles.text5, 'string', num2str(val_show));
val = get(hObject,'Value');
show1 = imadjust(uint8(imagenew),[0.0 1-val],[]);
axes(handles.axes3);
imshow(show1);


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
set(hObject,'Max',1.0,'Min',0.0,'Value',0);


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global imagenew;
val_show = get(hObject, 'Value');
set(handles.text6, 'string', num2str(val_show));
val = get(hObject,'Value');
hsv = rgb2hsv(imagenew);  %% hsv(hue,saturation,value) <->dvi: (angle,phantram,phantram)
hsv(:,:,2) = hsv(:,:,2) + val;
rgb = hsv2rgb(hsv);
axes(handles.axes3);
imshow(rgb);



% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
set(hObject,'Max',1.0,'Min',0.0,'Value',0);


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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global imagenew;

val1 = get(handles.slider1, 'Value');
val2 = get(handles.slider4, 'Value');
val3 = get(handles.slider5, 'Value');

img_new = double(imagenew) + val1;
img_new_tmp1 = img_new;

img_new_tmp1 = imadjust(uint8(img_new_tmp1),[0.0 1-val2],[]);
img_new_tmp2 = img_new_tmp1;

hsv = rgb2hsv(img_new_tmp2);  %% hsv(hue,saturation,value) <->dvi: (angle,phantram,phantram)
hsv(:,:,2) = hsv(:,:,2) + val3;
img_new_tmp2 = hsv2rgb(hsv);

axes(handles.axes3);
imshow(img_new_tmp2);
