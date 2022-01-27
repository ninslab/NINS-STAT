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

function mann_whitney_utest(data, inp_cat, inp_num)

% Data columns
%-----------------------------------------
d_categorical = table2array(data(:,inp_cat)); % Categorical variable
d_continuous = table2array(data(:,inp_num)); % Continuous variable

% Data Transformation Algorithm
%-----------------------------------------
unique_num = unique(d_categorical); % Find uniques numbers in categorical column
len = length(unique_num);

assert(len == 2, 'More than 2 categories')

% For column 1
%-----------------------------------------
num_col_1 = unique_num(1);
result_num_1 = find(d_categorical== num_col_1);
len_res_1 = length(result_num_1);

for j=1:len_res_1
        arr_num_1(j,:) = d_continuous(result_num_1(j));
end

% For column 2
%-----------------------------------------
num_col_2 = unique_num(2);
result_num_2 = find(d_categorical== num_col_2);
len_res_2 = length(result_num_2);

for j=1:len_res_2
        arr_num_2(j,:) = d_continuous(result_num_2(j));
end

% Man Whitney U Test
%-----------------------------------------
[p,h,stats] = ranksum(arr_num_1, arr_num_2,'method','approximate');

% Display results
%-----------------------------------------
H_value = h;
P_Value = estimateto001(p);
Z_Value = stats.zval;
Rank_Sum = stats.ranksum;

% Display Results in Table
%----------------------------------------
T = table(H_value, P_Value, Z_Value, Rank_Sum);
disp(T);

end