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

function irqproc(d)

fprintf('------------------- \n');
fprintf('Inter Quartile Range \n');
fprintf('------------------- \n');

r = iqr(d);
disp(r);

end