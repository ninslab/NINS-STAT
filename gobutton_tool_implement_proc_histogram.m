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

function gobutton_tool_implement_proc_histogram(hobject, eventdata, h)

% Extract Data from Browse Path
%------------------------------------------------------------------------
direc = getappdata(0, 'getbrowsedir');

% Get Inputs from handles
%------------------------------------------------------------------------
datavar_cont = get(h.cont_var_edit, 'String');

% Extract column number values
%------------------------------------------------------------------------
[~,~,raw] = xlsread(direc);
numcol = raw(1,:);
numcol = numcol(cellfun('isclass', numcol,'char')); %remove non char values from the array
datavar = find(contains(numcol, datavar_cont )); % extract column number

% Plot histogram
%------------------------------------------------------------------------
data = xlsread(direc);
dval = data(:,datavar);
xlabel_val = raw(1,datavar);
% xlabel(xlabel_val, 'FontSize', 14);
figure;histogram(dval);
grid on;
xlabel(xlabel_val, 'FontSize', 12,'Interpreter','none');

end