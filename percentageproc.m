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

function percentageproc(data, browselabelvalue)

fprintf('------------------- \n');
fprintf('Percentage Analysis \n');
fprintf('------------------- \n');

d = data(:, browselabelvalue);
numberOfBins = max(d);
countsPercentage = 100 * hist(d, numberOfBins) / numel(d);
disp(countsPercentage);

end