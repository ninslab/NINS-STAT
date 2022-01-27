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

function [small_large_var] = small_large_var_proc(direc, cat1num, cat2num)

data = xlsread(direc); % Read data from path

% Condition 1 - check if cell frequency < 5
%-------------------------------------------
freq_var = cell_freq(data, cat1num, cat2num);

% Condition 2 - check if sample size < 30
%-------------------------------------------
sample_size_var = sample_size(data);

% Condition 1 (OR) Condition 2
%-------------------------------------------
if (freq_var == 1) && (sample_size_var == 1)
    
    % Sample is Small
    %-----------------
    small_large_var = 1;
    return;
    
else
    % Sample is Large
    %-----------------
    small_large_var = 2;
    return;
    
end

end

% Condition 1 - algorithm
%--------------------------
function [freq_var] = cell_freq(data, cat1num, cat2num)

% Data columns
datacol_1 = data(:, cat1num);
datacol_2 = data(:, cat2num);

% Cross tabulate
crosstab_group = crosstab(datacol_1, datacol_2);

d1 = crosstab_group(1,1);
d2 = crosstab_group(1,2);
d3 = crosstab_group(2,1);
d4 = crosstab_group(2,2);

if (d1 < 5) || (d2 < 5) || (d3 < 5) || (d4 < 5)
    % Sample is small
    freq_var = 1;
    return;
else
    % Sample is large
    freq_var = 2;
    return;
end

end

% Condition 2 - algorithm
%--------------------------
function [sample_size_var] = sample_size(data)

[row, ~] = size(data);

if row < 30
    % Sample size is small
    sample_size_var = 1;
    return;
else
    % Sampple size is large
    sample_size_var = 2;
    return;
end

end