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

function two_sample_ttest(data, inp_cat, inp_num)

% Data separation according to categorical variable
%---------------------------
d_categorical = table2array(data(:,inp_cat)); % Categorical variable
d_continuous = table2array(data(:,inp_num)); % Continuous variable

% Data Transformation Algorithm
%---------------------------
unique_num = unique(d_categorical); % Find uniques numbers in categorical column
len = length(unique_num);

assert(len == 2, 'More than 2 categories')

% For column 1
%---------------------------
num_col_1 = unique_num(1);
result_num_1 = find(d_categorical== num_col_1);
len_res_1 = length(result_num_1);

for j=1:len_res_1
        arr_num_1(j,:) = d_continuous(result_num_1(j));
end

% For column 2
%---------------------------
num_col_2 = unique_num(2);
result_num_2 = find(d_categorical== num_col_2);
len_res_2 = length(result_num_2);

for j=1:len_res_2
        arr_num_2(j,:) = d_continuous(result_num_2(j));
end

% Run Two Sample t Test
%---------------------------
[h,p,ci,stats] = ttest2(arr_num_1, arr_num_2);

% Display Results
%---------------------------
H_Value = h;
P_Value = estimateto001(p);
CI_1 = ci(1,1);
CI_2 = ci(2,1);
Tstat_Value = stats.tstat;
DF = stats.df;
SD = stats.sd;

% Display Results in Table
%---------------------------
T = table(H_Value,P_Value, CI_1,CI_2, Tstat_Value,DF,SD);
disp(T);

end
