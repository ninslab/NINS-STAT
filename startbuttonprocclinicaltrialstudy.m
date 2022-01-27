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

function startbuttonprocclinicaltrialstudy(hObject, eventdata, h)

proportionlist = get(h.proportionoption, 'Value');
meanlist = get(h.meanoption, 'Value');
associationlist = get(h.associationoption, 'Value');
agreementlist = get(h.agreementoption, 'Value');
regressionlist = get(h.regression, 'Value');
diagnosticlist = get(h.diagnostic, 'Value');
survivallist = get(h.survival, 'Value');


if proportionlist == 1 && meanlist == 0 && associationlist == 0 && agreementlist == 0 && regressionlist == 0 && diagnosticlist == 0 && survivallist == 0
    % Proportion
    proportionlistproc(hObject, eventdata, h);
    
elseif proportionlist == 0 && meanlist == 1 && associationlist == 0 && agreementlist == 0 && regressionlist == 0 && diagnosticlist == 0 && survivallist == 0
    % Mean
    meanlistproc(hObject, eventdata, h);
    
elseif proportionlist == 0 && meanlist == 0 && associationlist == 1 && agreementlist == 0 && regressionlist == 0 && diagnosticlist == 0 && survivallist == 0
    % Association
    associationlistproc(hObject, eventdata, h);
    
elseif proportionlist == 0 && meanlist == 0 && associationlist == 0 && agreementlist == 1 && regressionlist == 0 && diagnosticlist == 0 && survivallist == 0
    % Agreement
    agreementlistproc(hObject, eventdata, h);
    
elseif proportionlist == 0 && meanlist == 0 && associationlist == 0 && agreementlist == 0 && regressionlist == 1 && diagnosticlist == 0 && survivallist == 0
    % Regression
    regressionlistproc(hObject, eventdata, h);
    
elseif proportionlist == 0 && meanlist == 0 && associationlist == 0 && agreementlist == 0 && regressionlist == 0 && diagnosticlist == 1 && survivallist == 0
    % Diagnostic
    diagnosticlistproc(hObject, eventdata, h);
    
elseif proportionlist == 0 && meanlist == 0 && associationlist == 0 && agreementlist == 0 && regressionlist == 0 && diagnosticlist == 0 && survivallist == 1
    % Survival
    survivallistproc(hObject, eventdata, h);
    
else
    % Do Nothing
end

end