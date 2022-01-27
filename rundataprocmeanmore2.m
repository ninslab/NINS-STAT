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

function rundataprocmeanmore2(hObject, eventdata, h)

% Extract Data from Browse Path
%------------------------------------------------------------------------
direc = getappdata(0, 'getbrowsedir');
data = readtable(direc);

% Get Inputs from handles
%------------------------------------------------------------------------
uploaddatalabelcatval = get(h.uploaddatalabelcat, 'String');
uploaddatalabelval = get(h.uploaddatalabel, 'String');

% Extract column number values
%------------------------------------------------------------------------
[~,~,raw] = xlsread(direc);
numcol = raw(1,:);
numcol = numcol(cellfun('isclass', numcol,'char')); %remove non char values from the array
inp_cat = find(ismember(numcol, uploaddatalabelcatval )); % extract column number
inp_num = find(ismember(numcol, uploaddatalabelval)); % extract column number

% Applying Decision Loop
%------------------------------------------------------------------------
% Calculating Equal Number of Observations in Each Sample
%------------------------------------------------------------------------

fprintf('-------------------------------------------------------------- \n');
fprintf('Parameter A : Equal Number of Observations \n');
fprintf('-------------------------------------------------------------- \n');
g = equalobs(data);

if g == 1 % Note : I changed from 2 to 1; Need Clarification
    % Equal Number of observations in each sample
    fprintf('Parameter A : Passed \n');
    s = normal_distribution(data, inp_num);
    if s == 1
        % Data is Normally Distributed
        fprintf('-------------------------------------------------------------- \n');
        fprintf('Parameter B : Levene Test (Variance of Two Samples is Equal ?) \n');
        fprintf('-------------------------------------------------------------- \n');
        % h = condition_test(data, inp_num);
        h = levene_var_check(data,inp_num, inp_cat);
        
        if h ==1
            fprintf('-------------------------------------------------------------- \n\n');
            fprintf('Parameter C : Variance  =  Equal \n');
            fprintf('Test -----> One-way Anova Test \n');
            fprintf('--------------------------------------------------\n');
            fprintf('Results : \n\n');
            
            anova_test(data, inp_cat, inp_num);
            
        else
            fprintf('-------------------------------------------------------------- \n\n');
            fprintf('Parameter C : Variance = Non-equal \n');
            fprintf('Test -----> Welch Anova Test \n');
            fprintf('--------------------------------------------------\n');
            fprintf('Results : \n\n');
            
            welch_anova_test(data, inp_cat, inp_num, direc);
            
        end
    else
        % Data is not Normally Distributed
        fprintf('------------------- \n');
        fprintf('Data : Log Transformed \n');
        fprintf('------------------- \n');
        
        temp = log10(table2array(data));
        log_transform_user_data = array2table(temp);
        
        s = normal_distribution(log_transform_user_data, inp_num);
        
        if s == 1
            % Log Transformed Data is Normalized
            fprintf('-------------------------------------------------------------- \n');
            fprintf('Parameter B : Levene Test (Variance of Two Samples is Equal ?) \n');
            fprintf('-------------------------------------------------------------- \n');
            
            h = levene_var_check(data,inp_num, inp_cat);
            
            if h ==1
                % Homogenity Satisfied
                fprintf('Parameter B : Variance = Equal \n');
                fprintf('Test -----> One-way Anova Test \n');
                fprintf('--------------------------------------------------\n');
                fprintf('Results : \n\n');
                anova_test(data, inp_cat, inp_num);
            else
                % Homogenity is not Satisfied
                fprintf('Parameter B : Variance = Non-equal \n');
                fprintf('Test -----> Welch Anova Test \n');
                fprintf('--------------------------------------------------\n');
                fprintf('Results : \n\n');
                welch_anova_test(data, inp_cat, inp_num, direc);
            end
        else
            % Log Transformed Data is not Normalized
            fprintf('Test -----> Krush Wallis Test \n');
            fprintf('--------------------------------------------------\n');
            fprintf('Results : \n\n');
            
            krusk(data,inp_cat, inp_num);
        end
    end
else
    % Non-Equal Number of Observations in each Sample
    fprintf('Parameter A : Fail \n');
    fprintf('Please Restart the process again......\n');
end

% displaycommands(hObject, eventdata, h);
% diary off

end