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

function gobutton_tool_implement_proc_bar(hObject, eventdata, h)

% Extract Data from Browse Path
%------------------------------------------------------------------------
direc = getappdata(0, 'getbrowsedir');

% Get Inputs from handles
%------------------------------------------------------------------------
datavar_cont1 = get(h.cont_var_edit, 'String');
datavar_cont2 = get(h.cont_var_edit1, 'String');

% Extract column number values
%------------------------------------------------------------------------
[~,~,raw] = xlsread(direc);
numcol = raw(1,:);
numcol = numcol(cellfun('isclass', numcol,'char')); %remove non char values from the array
datavar1 = find(contains(numcol, datavar_cont1 )); % extract column number
datavar2 = find(contains(numcol, datavar_cont2 )); % extract column number

len = length(datavar2);
data = xlsread(direc);

for i=1:len
    y_values(:,i) = data(:, datavar2(i)); % collecting all y values
end

x_values = data(:, datavar1); % collecting x values
x_val = isempty(datavar1); % Check if x values are there or not

if x_val == 1
    
    % X value does not exist
    figure;bar(y_values); % normal plot
    
    y_axis_values = raw(1,datavar2);
    ylabel(y_axis_values,'Interpreter','none');
    legend(y_axis_values,'Interpreter','none');
    grid on;
    
else
    
    % Both X and Y value exist
    figure;bar(x_values, y_values); % Normal Plot
    
    x_axis_values = raw(1,datavar1);
    y_axis_values = raw(1,datavar2);
    xlabel(x_axis_values,'Interpreter','none');
    ylabel(y_axis_values,'Interpreter','none');
    legend(y_axis_values,'Interpreter','none');
    grid on;
    
end


end