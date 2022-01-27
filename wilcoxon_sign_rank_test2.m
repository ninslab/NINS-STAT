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

function wilcoxon_sign_rank_test2(data, inp_num)

% Initialize Variables
%-----------------------------------
data_1 = table2array(data(:, inp_num(1)));
data_2 = table2array(data(:, inp_num(2)));

% Applying Wilcoxon Sign Rank Test
%-----------------------------------
% [p, h, stats] = signrank(data_1, data_2, 'method','approximate');
% Approximate value command

[p, h, stats] = signrank(data_1, data_2);

% Display Variables
%-----------------------------------
P_Value = estimateto001(p);
H_Value = h;
% Z_Value = stats.zval; % Can only be used when method = 'approximate'
Signed_Rank = stats.signedrank;

% Display Variables in Table
%------------------------------------
T = table(P_Value, H_Value, Signed_Rank);
disp(T);


end
