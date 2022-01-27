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

function rundataprocrepeatedanova(hObject, eventdata, h , inp_num, inp_cat)

% Extract values from handle values
str_inp = get(h.timevar, 'String');
categorical_inp  = inp_cat;
numerical_inp = inp_num;

% Extract data from browse path
%-----------------------------------------------------------
direc = getappdata(0, 'getbrowsedir');
data = readtable(direc);
[~,~,raw] = xlsread(direc);

% Algorithm for repeated measure ANOVA analysis
column_names = raw(1,:);
column_names(cellfun(@(column_names) any(isnan(column_names)),column_names)) = []; % Remove NaN values from column array

% Iterate and save

len = length(numerical_inp);

for i = 1:len
    var_inp(:,i) = table2array(data(:, numerical_inp(i)));
    col_name(i) = column_names(numerical_inp(i));
end

var_cat = categorical(table2array(data(:, categorical_inp)));
col_name_cat = column_names(categorical_inp);

% Creating a table for repeated measures ANOVA analysis
t = array2table(var_inp);
T = [table(var_cat,'VariableNames',{col_name_cat{1}}) t];

% Create time points
% Time = str_inp';
Time = cell2mat(textscan(str_inp, '%u64'));

% Applying RMA
% Extract column names from table

tab_col = T.Properties.VariableNames;
[~, col] = size(T);
str = strcat(tab_col{2},'-',tab_col{col},{' '},'~',{' '},tab_col{1});
rm = fitrm(T,str{1},'WithinDesign',Time);
ranovatbl = ranova(rm); % Ranova Table
table_rm = epsilon(rm); % Epsilon values
table_mauchly = mauchly(rm); % Mauchly's test for sphericity

fprintf('------------------------------------------------------------------------------------------------------------------- \n');
fprintf('Test of Hypothesis for Within Subject Effects \n');
fprintf('------------------------------------------------------------------------------------------------------------------- \n\n');
disp(ranovatbl);
fprintf('---------------------------------------------------------------------- \n');
disp(table_rm);
fprintf('---------------------------------------------------------------------- \n\n');
fprintf('------------------------------------------------------------------------------------------------------------------- \n');
fprintf('Mauchlys test for sphericity \n');
fprintf('------------------------------------------------------------------------------------------------------------------- \n\n');
disp(table_mauchly);
fprintf('---------------------------------------------------------------------- \n\n');

% Post Hoc Analysis - Tukey Analysis
%-------------------
tukey_post_hoc_repeated(rm,tab_col{1});

end