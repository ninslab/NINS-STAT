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

function add_predicted_values(mdl, labels)

% Read Excel file
direc = getappdata(0, 'getbrowsedir');
data = xlsread(direc);

% required column number
[row, col] = size(data);

% Predicted values
pred_values = mdl.Fitted;

% Create column to be added
len = length(labels);

% for i = 1:len
%     prim_string = labels{i};
%     prim_str(1,i) = strcat(prim_string,'+');
% end

str_label_tbl = join(labels,'_and_');
tbl_pred = table(pred_values,'VariableNames',str_label_tbl);

% Add str cat to customize label

% Paste predicted column into the the existing excel file
excel_range = xlscol(col+1);

% String label
str_label = strcat(excel_range,'1',':',excel_range,string(row+1));

% Write table to excel
writetable(tbl_pred,direc,'Range',str_label);
msgbox('Predicted values have been added at the last column in the uploaded excel file');

end