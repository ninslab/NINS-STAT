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

function run2button_regression_lin(hObject, eventdata, h, independent_val, dependent_val, label_name_independent,label_name_dependent)

% Linear Regression (Simple + Multinomial)
lin_regress(independent_val, dependent_val, label_name_independent,label_name_dependent);

guidata(hObject,h);

end