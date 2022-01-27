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

function rundataproctimeregression(hObject, eventdata, h)

% Extract Data from the directory
%------------------------------------------------------------------------
direc = getappdata(0, 'getbrowsedir');
data = xlsread(direc);

% Extract Data from Individual Handles
%------------------------------------------------------------------------
uploaddependentvarstrlabelval = get(h.uploaddependentvarstrlabel, 'String');
uploadindependentvarstrlabelval = get(h.uploadindependentvarstrlabel, 'String');

inp_time = data(:, str2double(uploaddependentvarstrlabelval));

% Converting to individual readable cells
%------------------------------------------------------------------------
cells = cellstr(uploadindependentvarstrlabelval);
len = length(cells);

for i = 1: len
    inp_independent(:,i) = data(:, str2double(cells{i}));
end


fprintf('Test -----> Cox Proportional Test \n');
fprintf('--------------------------------------------------\n');
fprintf('Results : \n\n');

% Applying Decision Loop
%------------------------------------------------------------------------
cox_proportional(inp_independent, inp_time);

diary off
displaycommands(hObject, eventdata, h);
end