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

function gobutton_tool_implement_proc_plot(hObject, eventdata, h)

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

% Plot Standard Plot
%------------------------------------------------------------------------
data = xlsread(direc);
dval1 = data(:,datavar1);
dval2 = data(:,datavar2);

figure(2);plot(dval1, dval2 ,'-o','LineWidth',1.5);
x_axis_label = raw(1,datavar1);
y_axis_label = raw(1,datavar2);
xlabel(x_axis_label,'Interpreter','none');
ylabel(y_axis_label,'Interpreter','none');
grid on;
legend(y_axis_label,'Interpreter','none');

end