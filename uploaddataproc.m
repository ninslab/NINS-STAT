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

function uploaddataproc(hObject, eventdata, h)

h = guidata(hObject);

% Directory of the excelsheet
direc = getappdata(0, 'getbrowsedir');

% Display Excel Sheet

h.figure = figure('position' , [500 440 1500 700]);

h.exceltable = uitable(h.figure,...
    'Data',randi(100,10,3),...
    'Position',[20 30 1200 650],...
    'Enable','on');

h.uploaddata = uicontrol(h.figure ,'Style','pushbutton',...
    'String','Upload Data',...
    'Position',[1300 350 120 20]);

[~, ~, raw] = xlsread(direc);
set(h.exceltable,'Data',raw);
set(h.exceltable,'CellSelectionCallback',{@uploaddataprocedure,h});

guidata(hObject,h);

end





