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

function displaycommands(hObject, eventdata, h)

% Display Imported Data on Edit Box
%-------------------------------------------
fid = fopen('logtextfile.txt', 'r');
if fid == -1
    error('Cannot open file: %s', FileName);
end

Data = fscanf(fid, '%c', inf);
fclose(fid);
set(h.resultbutton, 'String', Data);

end