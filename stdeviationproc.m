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

function stdeviationproc(d)

fprintf('------------------- \n');
fprintf('Standard Deviation \n');
fprintf('------------------- \n');

S = std(d);
disp(S);

end