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

function group_var_upload_proc_varset(hObject, eventdata, h)

%------------------------------------------------------------------------
% Eventdata Indices :  To get the value selected in the Excel Sheet
%------------------------------------------------------------------------
cellids = eventdata.Indices;
% rownumber = cellids(1);
colnumber = cellids(2);

% Read excel value
direc = getappdata(0, 'getbrowsedir');
[~, ~, raw] = xlsread(direc);
dispnum = raw(1,colnumber);

set(h.group_var_edit, 'String', dispnum);

% Data Selected
fprintf('Data Selected : ');disp(dispnum);

guidata(hObject,h)

end