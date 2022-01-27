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

function browseproc(hObject, eventdata, h)

% Parsing and opening Excel Sheet
[file , path] = uigetfile('*.xlsx');

 % Path to be used only for display
excelfilepath = strcat('Filename selected:'," ",file);

% Use path in the complete GUI
excelpath_complete = strcat(path, file); 

% Set filename on GUI
set(h.dirtype,'String', excelfilepath );
fprintf('Filename: ');disp(excelfilepath);

% Setting directory value as Global Variable
setappdata(0, 'getbrowsedir', excelpath_complete);

end