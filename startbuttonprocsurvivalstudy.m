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

function startbuttonprocsurvivalstudy(hObject, eventdata, h)

survivallist = get(h.survival, 'Value');
regressionlist = get(h.regression, 'Value');

if survivallist == 1 && regressionlist == 0
    % Survival
    survivallistproc(hObject, eventdata, h);
    
elseif survivallist == 0 && regressionlist == 1
    % Regression
    regressionlistproc(hObject, eventdata, h);
    
else
    % Do Nothing
end

end