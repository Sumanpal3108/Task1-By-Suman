function varargout = covid_19(varargin)
% COVID_19 MATLAB code for covid_19.fig
%      COVID_19, by itself, creates a new COVID_19 or raises the existing
%      singleton*.
%
%      H = COVID_19 returns the handle to a new COVID_19 or the handle to
%      the existing singleton*.
%
%      COVID_19('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COVID_19.M with the given input arguments.
%
%      COVID_19('Property','Value',...) creates a new COVID_19 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before covid_19_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to covid_19_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help covid_19

% Last Modified by GUIDE v2.5 12-May-2020 06:34:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @covid_19_OpeningFcn, ...
                   'gui_OutputFcn',  @covid_19_OutputFcn, ...
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


% --- Executes just before covid_19 is made visible.
function covid_19_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to covid_19 (see VARARGIN)

% Choose default command line output for covid_19
handles.output = hObject;

img = imread('outbreak-coronavirus-world.png');
axes(handles.axes1);
imshow(img);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes covid_19 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = covid_19_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in menu.
function menu_Callback(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(handles.menu,'Value')==1)
    set(handles.warning,'String','*You havenot chosen any country');
elseif (get(handles.menu,'Value') == 2)
        set(handles.warning,'String','');
       
        opts = spreadsheetImportOptions("NumVariables", 6);

        
        opts.Sheet = "full_data (1)";
        opts.DataRange = "A6361:F6487";

        
        opts.VariableNames = ["date", "location", "new_cases", "new_deaths", "total_cases", "total_deaths"];
        opts.VariableTypes = ["datetime", "categorical", "double", "double", "double", "double"];
        opts = setvaropts(opts, 2, "EmptyFieldRule", "auto");

        % Import the data
        dindia = readtable("daily_data.xls", opts, "UseExcel", false);

        clear opts
        set(handles.totalcase,'String',dindia.total_cases(127));
        set(handles.totaldeath,'String',dindia.total_deaths(127));
        setappdata(0,'data',dindia);
 elseif (get(handles.menu,'Value') == 3)
        set(handles.warning,'String','');
        
        opts = spreadsheetImportOptions("NumVariables", 6);

        
        opts.Sheet = "full_data (1)";
        opts.DataRange = "A12818:F12945";

        
        opts.VariableNames = ["date", "location", "new_cases", "new_deaths", "total_cases", "total_deaths"];
        opts.VariableTypes = ["datetime", "categorical", "double", "double", "double", "double"];
        opts = setvaropts(opts, 2, "EmptyFieldRule", "auto");

        % Import the data
        dskorea = readtable("daily_data.xls", opts, "UseExcel", false);

        clear opts
        set(handles.totalcase,'String',dskorea.total_cases(127));
        set(handles.totaldeath,'String',dskorea.total_deaths(127));
        setappdata(0,'data',dskorea);
        
elseif (get(handles.menu,'Value') == 4)
        set(handles.warning,'String','');

        opts = spreadsheetImportOptions("NumVariables", 6);

 
        opts.Sheet = "full_data (1)";
        opts.DataRange = "A2934:F3061";

  
        opts.VariableNames = ["date", "location", "new_cases", "new_deaths", "total_cases", "total_deaths"];
        opts.VariableTypes = ["datetime", "categorical", "double", "double", "double", "double"];
        opts = setvaropts(opts, 2, "EmptyFieldRule", "auto");

  
        dchina = readtable("daily_data.xls", opts, "UseExcel", false);

        clear opts  
        set(handles.totalcase,'String',dchina.total_cases(127));
        set(handles.totaldeath,'String',dchina.total_deaths(127));
        setappdata(0,'data',dchina);
elseif (get(handles.menu,'Value') == 5)
        set(handles.warning,'String','');

        opts = spreadsheetImportOptions("NumVariables", 6);

 
        opts.Sheet = "full_data (1)";
        opts.DataRange = "A14644:F14771";

  
        opts.VariableNames = ["date", "location", "new_cases", "new_deaths", "total_cases", "total_deaths"];
        opts.VariableTypes = ["datetime", "categorical", "double", "double", "double", "double"];
        opts = setvaropts(opts, 2, "EmptyFieldRule", "auto");

  
        dus = readtable("daily_data.xls", opts, "UseExcel", false);

        clear opts  
        set(handles.totalcase,'String',dus.total_cases(127));
        set(handles.totaldeath,'String',dus.total_deaths(127));
        setappdata(0,'data',dus);
elseif (get(handles.menu,'Value') == 6)
        set(handles.warning,'String','');

        opts = spreadsheetImportOptions("NumVariables", 6);

 
        opts.Sheet = "full_data (1)";
        opts.DataRange = "A7225:F7352";

  
        opts.VariableNames = ["date", "location", "new_cases", "new_deaths", "total_cases", "total_deaths"];
        opts.VariableTypes = ["datetime", "categorical", "double", "double", "double", "double"];
        opts = setvaropts(opts, 2, "EmptyFieldRule", "auto");

  
        ditaly = readtable("daily_data.xls", opts, "UseExcel", false);

        clear opts  
        set(handles.totalcase,'String',ditaly.total_cases(127));
        set(handles.totaldeath,'String',ditaly.total_deaths(127));
        setappdata(0,'data',ditaly);
end

% Hints: contents = cellstr(get(hObject,'String')) returns menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu


% --- Executes during object creation, after setting all properties.
function menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in confirmed.
function confirmed_Callback(hObject, eventdata, handles)
% hObject    handle to confirmed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = getappdata(0,'data');
if (get(handles.menu,'Value') == 1)
    set(handles.warning,'String','*You have not Chosen any Country');
else    
    plot(handles.axes1,data.date,data.total_cases);
end

% --- Executes on button press in deceased.
function deceased_Callback(hObject, eventdata, handles)
% hObject    handle to deceased (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = getappdata(0,'data');
if (get(handles.menu,'Value') == 1)
    set(handles.warning,'String','*You have not Chosen any Country');
else    
    plot(handles.axes1,data.date,data.total_deaths);
end

% --- Executes on button press in both.
function both_Callback(hObject, eventdata, handles)
% hObject    handle to both (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = getappdata(0,'data');
if (get(handles.menu,'Value') == 1)
    set(handles.warning,'String','*You have not Chosen any Country');
else
    figure;
    subplot(2,1,1),plot(data.date,data.total_cases);
    xlabel({'Total cases'},'FontWeight','bold','FontSize',16.5,...
    'FontName','Times New Roman');

    subplot(2,1,2),plot(data.date,data.total_deaths);
    xlabel({'Total deaths',''},'FontWeight','bold','FontSize',16.5,...
    'FontName','Times New Roman');
end
    


function totalcase_Callback(hObject, eventdata, handles)
% hObject    handle to totalcase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of totalcase as text
%        str2double(get(hObject,'String')) returns contents of totalcase as a double


% --- Executes during object creation, after setting all properties.
function totalcase_CreateFcn(hObject, eventdata, handles)
% hObject    handle to totalcase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function totaldeath_Callback(hObject, eventdata, handles)
% hObject    handle to totaldeath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of totaldeath as text
%        str2double(get(hObject,'String')) returns contents of totaldeath as a double


% --- Executes during object creation, after setting all properties.
function totaldeath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to totaldeath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
