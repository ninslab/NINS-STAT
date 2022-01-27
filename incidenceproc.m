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

function incidenceproc(hObject, eventdata, h)

% Extract data from browse path
%-----------------------------------------------------------
direc = getappdata(0, 'getbrowsedir');
data = readtable(direc);

% Get column values
%-----------------------------------------------------------
inp = get(h.mean2num1label, 'String');
disease_condition = str2double(get(h.conditionlabel, 'String')); % diesease condition

% Extract column number values
%-----------------------------------------------------------
[~,~,raw] = xlsread(direc);
numcol = raw(1,:);
numcol = numcol(cellfun('isclass', numcol,'char')); %remove non char values from the array
dat = find(ismember(numcol, inp )); % extract column number

dat_inp = table2array(data(:, dat));

% Incidence rate formula
%-----------------------------------------------------------
check_var = any(dat_inp(:)== disease_condition); % Check if diesease condition is in the sample given

if check_var == 1
    % Condition is there in the data.
    %--------------------------------
    [row,~] = size(dat_inp);
    
    total_elements = row; % total number of elements
    condition_occ = sum(ismember(dat_inp, disease_condition)); % Calculate the number of occurence of disease condition
    
    incidence_rate = condition_occ/total_elements;
    fprintf('Incidence Rate: ');disp(incidence_rate);
    
else
    % Condition is not there in the data.
    msgbox('Disease condition code is not existent in sample data uploaded');
    
end


end