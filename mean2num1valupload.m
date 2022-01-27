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

function mean2num1valupload(hObject, eventdata, h)

h = guidata(hObject);

% Directory of the excelsheet
%----------------------------
direc = getappdata(0, 'getbrowsedir');

% Display Excel Sheet
%----------------------------
h.figure = figure('units','normalized','position' , [0.20 0.1 0.6 0.6]);

h.exceltable = uitable(h.figure,...
    'Data',randi(100,10,3),...
    'units','normalized',...
    'Position',[0.02 0.08 0.95 0.9],...
    'Enable','on');

% Parse and Display Excel Sheet
%------------------------------
[~, ~, raw] = xlsread(direc);
set(h.exceltable,'Data',raw);
set(h.exceltable,'CellSelectionCallback',{@mean2num1valuploadproc,h});

h.donebutton = uicontrol(h.figure,...
    'Style','pushbutton',...
    'String','DONE',...
    'Units', 'pixels', ...
    'units','normalized',...
    'Position',[0.45 0.025 0.1 0.04]);

set(h.donebutton,'callback',{@doneproc,h});

guidata(hObject,h);

end