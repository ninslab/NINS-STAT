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

function wilcoxon_sign_rank_test(data, inp, hypo_val)

% Initilalize Variables
%-------------------------
data1 = table2array(data(:, inp));

% Applying Wilcoxon Test
%-------------------------
[p,h, stats] = signrank(data1, hypo_val);

% calculate Z test 
% [~,~,~,zval] = ztest(data1,hypo_val, std(data1));

% Display Variables
%-------------------------
P_Value = estimateto001(p);
H_Value = h;
% Z_Value = zval;
Signed_Rank = stats.signedrank;

% Display Results in Table
%--------------------------
T = table(P_Value, H_Value, Signed_Rank);
disp(T);

end
