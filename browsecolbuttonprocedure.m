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

function browsecolbuttonprocedure(hObject, eventdata, h)

%------------------------------------------------------------------------
% Eventdata Indices :  To get the value selected in the Excel Sheet
%------------------------------------------------------------------------
cellids = eventdata.Indices;
colnumber = cellids(:, 2);
set(h.browselabel, 'String', colnumber);

% Data Selected
fprintf('Data Selected : ');disp(colnumber);

guidata(hObject,h)

end