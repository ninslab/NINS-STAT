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

function [f] = cellcheck(user_input, inp)

% Initialize Variables
%-----------------------------
data_1 = user_input(:, inp(1));
data_2 = user_input(:, inp(2));

% Cross Tabulate Data
%-----------------------------
tabg = crosstab(data_1, data_2);
disp(tabg);

% Check if any cell value is < 5
%------------------------------
f = all(tabg(:) < 5);

end