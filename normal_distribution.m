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

function [s] = normal_distribution(user_input, inp)

% Read raw data
excel_data = user_input;
[rows, ~] = size(excel_data);
sample_size = rows;

% Number of columns to be analyzed
inp_length = length(inp);

% Empty array lists for SD, Mean and Mean/2
stn_dev_var = [];
mn_dev_var = [];
mn_div_2 = [];

count_positive_1 = 0; count_positive_2 = 0; count_positive_3 = 0; count_positive_4 = 0;
count_negative_1 = 0; count_negative_2 = 0; count_negative_3 = 0; count_negative_4 = 0;
count_c1 =0; count_c2 =0; count_c3 =0; count_c4 =0;

% Convert infinity values to 0 for normlality check
% excel_data(isinf(excel_data) | isnan(excel_data)) = 0;

if sample_size <= 100
    
    for i = 1:inp_length
        
        primary_col_num = inp(:,i);
        primary_data = table2array(excel_data(:, primary_col_num));
        
        % primary_data(isinf(primary_data) | isnan(primary_data)) = [];
        
        % Perform three condition check
        stn_dev_var(i,1) = nanstd(primary_data);
        mn_dev_var(i,1) = nanmean(primary_data);
        mn_div_2(i,1) = (nanmean(primary_data)/2);
        
        if stn_dev_var(i,1) <= mn_div_2(i,1)
            count_positive_1 = count_positive_1 + 1;
        else
            count_negative_1 = count_negative_1 + 1;
        end
        
        
        % Check skewness values
        skew_val(i,1) = skewness(primary_data);
        
        if((-0.5 <= skew_val(i,1)) && (skew_val(i,1) <= 0.5))
            count_positive_2 = count_positive_2 + 1;
        else
            count_negative_2 = count_negative_2 + 1;
        end
        
        
    end
    
    fprintf('---------------------------------------------------\n');
    fprintf('Parameter A (Sample size <= 100): Pass \n');
    fprintf('---------------------------------------------------\n');
    
    fprintf('---------------------------------------------------\n');
    tbl_cond_2 = table(stn_dev_var, mn_dev_var, mn_div_2, 'VariableNames',{'SD','Mean','Mean2'});
    disp(tbl_cond_2);
    disp(' ');
    
    if count_positive_1 == inp_length
        count_c1 = count_c1 + 1;
        fprintf('Parameter B (Standard deviation <= (Mean/2)): Passed \n');
    else
        fprintf('Parameter B (Standard deviation <= (Mean/2)): Failed \n');
        count_c1 = count_c1 + 2;
        
    end
    
    fprintf('---------------------------------------------------\n');
    fprintf('---------------------------------------------------\n');
    if count_positive_2 == inp_length
        count_c2 = count_c2 + 1;
        fprintf('Parameter C (-0.5 <= skewness <= 0.5): Passed \n');
    else
        fprintf('Parameter C (-0.5 <= skewness <= 0.5): Failed \n');
        count_c2 = count_c2 + 3;
    end
    
    fprintf('---------------------------------------------------\n\n');
    
    if (count_c1 == count_c2)
        fprintf('############################### \n');
        fprintf('Status of data = Normalized \n');
        fprintf('############################### \n');
        s = 1;
        return;
    else
        fprintf('################################ \n');
        fprintf('Status of data = Not Normalized \n');
        fprintf('################################ \n\n');
        s = 2;
        return;
    end
    
    
else
    
    % Perform Shapiro Wilk Test
    H = []; pval = []; W = [];
    
    for i=1:inp_length
        primary_col_num = inp(:,i);
        primary_data = table2array(excel_data(:, primary_col_num));
        [H(i,1),pval(i,1),W(i,1)] = swtest(primary_data);
        
        if pval > 0.05
            count_positive_4 = count_positive_4 + 1;
        else
            count_negative_4 = count_negative_4 + 1;
        end
        
    end
    
    fprintf('---------------------------------------------------\n');
    fprintf('Parameter A (Sample size <= 100): Fail \n');
    fprintf('---------------------------------------------------\n');
    
    fprintf('---------------------------------------------------\n');
    tbl = table(H, pval, W,'VariableNames',{'H','P_value','W'});
    disp(tbl);
    disp(' ');
    
    
    if count_positive_4 == inp_length
        fprintf('Parameter B (P value > 0.05): Passed \n\n');
        fprintf('---------------------------------------------------\n');
        fprintf('############################### \n');
        fprintf('Status of data = Normalized \n');
        fprintf('############################### \n');
        s = 1;
        return;
    else
        fprintf('Parameter B (P value > 0.05): Failed \n\n');
        fprintf('---------------------------------------------------\n');
        fprintf('################################ \n');
        fprintf('Status of data = Not Normalized \n');
        fprintf('################################ \n');
        s = 4;
        return;
    end
    
    
end

end
