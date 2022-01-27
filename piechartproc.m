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

function piechartproc(d)

fprintf('------------------- \n');
fprintf('Pie Chart \n');
fprintf('------------------- \n');

figure;pie(hist(d));
figure;pie3(hist(d));

end