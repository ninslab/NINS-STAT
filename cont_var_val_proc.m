% NINS-STAT Graphical User Interface
% start.m function starts the entire
% interface.
%
% Final revision date : 11th August 2021

% Author:
% Dr. Pravat K. Mandal
% Neuroimaging and Neurospectroscopy Lab,
% National Brain Research Centre,
% Manesar, India

function cont_var_val_proc(hObject, eventdata, h)

h = guidata(hObject);

% Directory of the excelsheet
%-------------------------------------
direc = getappdata(0, 'getbrowsedir');

% Display Excel Sheet
%-------------------------------------
h.figure = figure('position' , [500 440 1200 700]);

h.exceltable = uitable(h.figure,...
    'Data',randi(100,10,3),...
    'Position',[20 80 1150 600],...
    'Enable','on');

% Parsing and Display Excel Sheet
%--------------------------------
[~, ~, raw] = xlsread(direc);
set(h.exceltable,'Data',raw);
set(h.exceltable,'CellSelectionCallback',{@cont_var_val_proc_varset,h});

h.donebutton = uicontrol(h.figure,...
    'Style','pushbutton',...
    'String','DONE',...
    'Units', 'pixels', ...
    'Position',[550 35 100 25]);

set(h.donebutton,'callback',{@doneproc,h});

guidata(hObject,h);

end