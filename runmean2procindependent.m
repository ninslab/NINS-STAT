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

function runmean2procindependent(hObject, eventdata, h)

% Get String from Handles
%-------------------------------------------------------------------------
mean2num1labelval = get(h.mean2num1label, 'String');
mean2num2labelval = get(h.mean2num2label, 'String');

% Convert String to Numbers
%-------------------------------------------------------------------------
% inp_cat = str2double(mean2num1labelval);
% inp_num = str2double(mean2num2labelval);

% Extract Data from path
%-------------------------------------------------------------------------
direc = getappdata(0, 'getbrowsedir');
data = readtable(direc);

% Extract column number
[~,~,raw] = xlsread(direc);
numcol = raw(1,:);
numcol = numcol(cellfun('isclass', numcol,'char')); %remove non char values from the array
inp_cat = find(ismember(numcol, mean2num1labelval)); % extract column number
inp_num = find(ismember(numcol, mean2num2labelval)); % extract column number

% Applying Normality Test
%-------------------------------------------------------------------------
s = normal_distribution(data, inp_num);

% Applying Decision Algorithm
%-------------------------------------------------------------------------
if s == 1
    % Data is Normal
    % Applying Levene test
    %-------------------------------------------------------------------------
    fprintf('------------------- \n');
    fprintf('Data = Levene Test  \n');
    fprintf('------------------- \n');
    r = levene_var_check(data,inp_num, inp_cat);
    
    if r == 1
        fprintf('Levene Test (Variance of Two Samples is Equal) : Passed \n\n');
        fprintf('Test -----> Two Sample T Test \n');
        fprintf('--------------------------------------------------\n');
        fprintf('Results : \n\n');
        
        % Applying Function
        %------------------
        two_sample_ttest(data,inp_cat,inp_num);
    else
        fprintf('Levene Test (Variance of Two Samples is Equal) : Fail \n\n');
        fprintf('Test -----> Welch T-Test \n');
        fprintf('--------------------------------------------------\n');
        fprintf('Results : \n\n');
        
        % Applying Function
        %------------------
        welch_t_test_sample(data, inp_cat, inp_num);
    end
    
else
    % Data is not Normal
    fprintf('------------------- \n');
    fprintf('Data : Log Transformed \n');
    fprintf('------------------- \n');
    
    temp = log10(table2array(data));
    log_transform_user_data = array2table(temp);
    
    s = normal_distribution(log_transform_user_data,inp_num);
    
    if s == 1
        % Applying Levene test
        %-------------------------------------------------------------------------
        fprintf('------------------- \n');
        fprintf('Data = Levene Test  \n');
        fprintf('------------------- \n');
        r = levene_var_check(data,inp_num, inp_cat);
        
        if r == 1
            fprintf('Levene Test (Variance of Two Samples is Equal) : Passed \n\n');
            fprintf('Test -----> Two Sample T Test \n');
            fprintf('--------------------------------------------------\n');
            fprintf('Results : \n\n');
            
            % Applying Function
            %------------------
            two_sample_ttest(data,inp_cat,inp_num);
        else
            fprintf('Levene Test (Variance of Two Samples is Equal) : Fail \n\n');
            fprintf('Test -----> Welch T-Test \n');
            fprintf('--------------------------------------------------\n');
            fprintf('Results : \n\n');
            
            % Applying Function
            %------------------
            welch_t_test_sample(data, inp_cat, inp_num);
        end
        
    else
        % Log Transformed Dats is not Normal
        fprintf('Test -----> Man Whitney U Test \n');
        fprintf('--------------------------------------------------\n');
        fprintf('Results : \n\n');
        mann_whitney_utest(data, inp_cat, inp_num);
    end
end

% diary off
% displaycommands(hObject, eventdata, h);
end