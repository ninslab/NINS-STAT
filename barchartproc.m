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

function barchartproc(d)

% Display text
fprintf('------------------- \n');
fprintf('Bar Chart \n');
fprintf('------------------- \n');

% Plot in different figure
figure;bar(hist(d));
figure;bar3(hist(d));
figure;bar3h(hist(d));

end