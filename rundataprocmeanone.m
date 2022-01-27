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

function rundataprocmeanone(hObject, eventdata, h)

% Extracting Hypothetical Values
%-------------------------------
hypotheticalvaluedat = get(h.hypotheticalvalue,'String');
hypo_val = str2double(hypotheticalvaluedat);

% Extracting Sample for Analysis
%-------------------------------
sampledatastr = get(h.uploaddatalabel,'String');
% sampledat = str2double(sampledatastr);
inp_str = sampledatastr;

% Browse and Parse Directory
%-------------------------------
direc = getappdata(0, 'getbrowsedir');
data = readtable(direc);

% Find column number in excel sheet
%-------------------------------
[~,~,raw] = xlsread(direc);
col_arr = raw(1,:);
inp = find(ismember(col_arr, inp_str));

% Check for Normalization
%-------------------------------
s = normal_distribution(data,inp);

% Analysing Data
%-------------------------------
% Applying Decision Loop
%-------------------------------

if s == 1
    fprintf('Test -----> Student-T Test \n');
    fprintf('--------------------------------------------------\n');
    fprintf('Results : \n\n');
    
    student_t_test(data,inp,hypo_val);
else
    % Applying Log Transform (Base 10)
    %-----------------------------------
    fprintf(' Data = Applying Log Transform \n\n');
    
    fprintf('----------------------\n');
    fprintf('Log Transformed Data \n');
    fprintf('----------------------\n');
    
    temp = log10(table2array(data));
    log_transform_user_data = array2table(temp); 
    
    % Check for Normality
    %------------------------------------
    normal_distribution(log_transform_user_data, inp);
    
    % Applying Algorithm
    %------------------------------------
    if (s == 1)
        % Student T Test
        fprintf('Test -----> Student-T Test \n');
        fprintf('--------------------------------------------------\n');
        fprintf('Results : \n\n');
        student_t_test(data,hypo_val,inp);
    else
        % Wilcoxon Test
        fprintf('Test ----->  Wilcoxon Signed Rank Test \n');
        fprintf('--------------------------------------------------\n');
        fprintf('Results : \n\n');
        wilcoxon_sign_rank_test(data,inp,hypo_val);
    end
end

% diary off
% displaycommands(hObject, eventdata, h);
end