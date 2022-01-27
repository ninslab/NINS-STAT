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

function medianproc(d)

fprintf('------------------- \n');
fprintf('Median \n');
fprintf('------------------- \n');

M = median(d);
disp(M);

end