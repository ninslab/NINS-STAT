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

function startbuttonproccasecontrolstudy(hObject, eventdata, h)

proportionlist = get(h.proportionoption, 'Value');
meanlist = get(h.meanoption, 'Value');
associationlist = get(h.associationoption, 'Value');
agreementlist = get(h.agreementoption, 'Value');
regressionlist = get(h.regression, 'Value');

if proportionlist == 1 && meanlist == 0 && associationlist == 0 && agreementlist == 0 && regressionlist == 0
    % Proportions
    proportionlistproc(hObject, eventdata, h);
    
elseif proportionlist == 0 && meanlist == 1 && associationlist == 0 && agreementlist == 0 && regressionlist == 0
    % Mean
    meanlistproc(hObject, eventdata, h);
    
elseif proportionlist == 0 && meanlist == 0 && associationlist == 1 && agreementlist == 0 && regressionlist == 0
    % Association
    associationlistproc(hObject, eventdata, h);
    
elseif proportionlist == 0 && meanlist == 0 && associationlist == 0 && agreementlist == 1 && regressionlist == 0
    % Agreement
    agreementlistproc(hObject, eventdata, h);
    
elseif proportionlist == 0 && meanlist == 0 && associationlist == 0 && agreementlist == 0 && regressionlist == 1
    % Regression
    regressionlistproc(hObject, eventdata, h);
    
else
    % Do Nothing
end

end