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

function uploaddatacontinuousroc(hObject, eventdata, h)

%------------------------------------------------------------------------
% Eventdata Indices :  To get the value selected in the Excel Sheet
%------------------------------------------------------------------------

tab = eventdata.Source.Data;
s = tab(:,1);


cellids = eventdata.Indices;
colnumber = cellids(:, 2);

% Read excel value
direc = getappdata(0, 'getbrowsedir');
[~, ~, raw] = xlsread(direc);
dispnum = raw(1,colnumber);

set(h.continuousrocvarlabel, 'String', dispnum);

% Data Selected
fprintf('Data Selected : ');disp(dispnum);

guidata(hObject,h)


end