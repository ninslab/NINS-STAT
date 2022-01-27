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

function run_twosample_ztest(hObject, eventdata, h, data, inp, inp1)

% Get handle values
%----------------------------------------------------------
mean_sample1 = str2double(get(h.mean_sample1_val, 'String'));
mean_sample2 = str2double(get(h.mean_sample2_val, 'String'));
sd_sample_1 = str2double(get(h.std_sample1_val, 'String'));
sd_sample_2 = str2double(get(h.std_sample2_val, 'String'));

% Call user values
%----------------------------------------------------------
data_sample1 = table2array(data(:, inp));
data_sample2 = table2array(data(:, inp1));

% Apply Z test for 2 sample
%----------------------------------------------------------
ztest2sample(data_sample1, data_sample2, mean_sample1, mean_sample2, sd_sample_1, sd_sample_2);

end