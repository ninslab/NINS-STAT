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

function browse2proc(hObject, eventdata, h)

% Parsing and opening Excel Sheet
[file , path] = uigetfile('*.xlsx');
excelfilepath = fullfile(path,file);

% display on GUI
strarr = strcat('Filename selected: '," ", file);
set(h.dirtype2,'String',strarr);

fprintf('Excel Sheet : ');disp(excelfilepath);

% Setting directory value as Global Variable
setappdata(0, 'getbrowsedir2', excelfilepath);

end