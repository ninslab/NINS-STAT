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

function proceedbuttonprocassociation(hObject, eventdata, h)

valuesample1 = get(h.sample1, 'Value');
valuesample2 = get(h.sample2, 'Value');
valuesample3 = get(h.sample3, 'Value');
valuesample4 = get(h.sample4, 'Value');

if valuesample1 == 1 && valuesample2 == 0 && valuesample3 == 0 && valuesample4 == 0
    % Both variables are ordinal
elseif valuesample1 == 0 && valuesample2 == 1 && valuesample3 == 0 && valuesample4 == 0
    % Both variables are Continuous
elseif valuesample1 == 0 && valuesample2 == 0 && valuesample3 == 1 && valuesample4 == 0
    % Both variables are Nominal
elseif valuesample1 == 0 && valuesample2 == 0 && valuesample3 == 0 && valuesample4 == 1
    % One is Continuous and One is Binary
else
    % Do Nothing
end
    


end