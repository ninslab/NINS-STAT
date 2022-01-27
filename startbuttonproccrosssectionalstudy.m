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

function startbuttonproccrosssectionalstudy(hObject, eventdata, h)

% Get all variable from GUI Handles
%-------------------------------------------------------------------------
proportionlist = get(h.proportionoption, 'Value');
meanlist = get(h.meanoption, 'Value');
associationlist = get(h.associationoption, 'Value');
agreementlist = get(h.agreementoption, 'Value');
diagnosticlist = get(h.diagnosticoption, 'Value');
%-------------------------------------------------------------------------

% Decision Loop
%-------------------------------------------------------------------------
if proportionlist == 1 && meanlist == 0 && associationlist == 0 && agreementlist == 0 && diagnosticlist == 0
    % Proportions
    fprintf('########################################################### \n');
    fprintf('Objective : Proportions \n');
    fprintf('########################################################### \n');
    
    proportionlistproc(hObject, eventdata, h);
    
elseif proportionlist == 0 && meanlist == 1 && associationlist == 0 && agreementlist == 0 && diagnosticlist == 0
    % Mean
    fprintf('########################################################### \n');
    fprintf('Objective : Mean \n');
    fprintf('########################################################### \n');
    
    meanlistproc(hObject, eventdata, h);
    
elseif proportionlist == 0 && meanlist == 0 && associationlist == 1 && agreementlist == 0 && diagnosticlist == 0
    % Association
    fprintf('########################################################### \n');
    fprintf('Objective : Association \n');
    fprintf('########################################################### \n');
    
    associationlistproc(hObject, eventdata, h);
    
elseif proportionlist == 0 && meanlist == 0 && associationlist == 0 && agreementlist == 1 && diagnosticlist == 0
    % Agreement
    fprintf('########################################################### \n');
    fprintf('Objective : Agreement \n');
    fprintf('########################################################### \n');
    
    agreementlistproc(hObject, eventdata, h);
    
elseif proportionlist == 0 && meanlist == 0 && associationlist == 0 && agreementlist == 0 && diagnosticlist == 1
    % Diagnostics
    fprintf('########################################################### \n');
    fprintf('Objective : Diagnostics \n');
    fprintf('########################################################### \n');
    
    diagnosticlistproc(hObject, eventdata, h);
    
else
    % Do Nothing
end
%-------------------------------------------------------------------------

end