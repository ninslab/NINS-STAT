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

function scatterplotproc(d)

fprintf('------------------- \n');
fprintf('Scatter Plot \n');
fprintf('------------------- \n');

S = scatter(d);
disp(S);

end