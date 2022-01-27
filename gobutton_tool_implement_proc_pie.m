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

function gobutton_tool_implement_proc_pie(hObject, eventdata, h)

% Extract Data from Browse Path
%------------------------------------------------------------------------
direc = getappdata(0, 'getbrowsedir');

% Get Inputs from handles
%------------------------------------------------------------------------
datavar_cont1 = get(h.cont_var_edit, 'String');
% datavar_cont2 = get(h.cont_var_edit1, 'String');

% Extract column number values
%------------------------------------------------------------------------
[~,~,raw] = xlsread(direc);
numcol = raw(1,:);
numcol = numcol(cellfun('isclass', numcol,'char')); %remove non char values from the array
datavar1 = find(contains(numcol, datavar_cont1 )); % extract column number
% datavar2 = find(contains(numcol, datavar_cont2 )); % extract column number

% len = length(datavar2);
data = xlsread(direc);

x_values = categorical(data(:, datavar1)); % collecting x values
title_val = raw(1, datavar1); % Title

figure;pie(x_values); % pie plot
% figure;pie3(x_values); % 3D Pie plot
title(title_val);

end