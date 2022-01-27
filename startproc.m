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

function startproc(hObject, eventdata, h)

proportionlist = get(h.proportionoption, 'Value');
meanlist = get(h.meanoption, 'Value');
associationlist = get(h.associationoption, 'Value');
agreementlist = get(h.agreementoption, 'Value');
regressionlist = get(h.regressionoption, 'Value');
diagnosticlist = get(h.diagnosticoption, 'Value');
survivallist = get(h.survivaloption, 'Value');
incidencelist = get(h.incidenceoption, 'Value');
relativerisklist = get(h.relativeriskoption, 'Value');
oddsratiolist = get(h.oddsratiooption, 'Value');


if proportionlist == 1 && meanlist == 0 && associationlist == 0 && agreementlist == 0 && regressionlist == 0 && diagnosticlist == 0 && survivallist == 0 && incidencelist == 0 && relativerisklist == 0 && oddsratiolist == 0
    % Proportion
    fprintf('########################################################### \n');
    fprintf('Objective : Proportions \n');
    fprintf('########################################################### \n');
    
    proportionlistproc(hObject, eventdata, h);
    
elseif proportionlist == 0 && meanlist == 1 && associationlist == 0 && agreementlist == 0 && regressionlist == 0 && diagnosticlist == 0 && survivallist == 0 && incidencelist == 0 && relativerisklist == 0 && oddsratiolist == 0
    % Mean
    fprintf('########################################################### \n');
    fprintf('Objective : Mean \n');
    fprintf('########################################################### \n');
    
    meanlistproc(hObject, eventdata, h);
    
elseif proportionlist == 0 && meanlist == 0 && associationlist == 1 && agreementlist == 0 && regressionlist == 0 && diagnosticlist == 0 && survivallist == 0 && incidencelist == 0 && relativerisklist == 0 && oddsratiolist == 0
    % Association
    fprintf('########################################################### \n');
    fprintf('Objective : Association \n');
    fprintf('########################################################### \n');
    
    associationlistproc(hObject, eventdata, h);
    
elseif proportionlist == 0 && meanlist == 0 && associationlist == 0 && agreementlist == 1 && regressionlist == 0 && diagnosticlist == 0 && survivallist == 0 && incidencelist == 0 && relativerisklist == 0 && oddsratiolist == 0
    % Agreement
    fprintf('########################################################### \n');
    fprintf('Objective : Agreement \n');
    fprintf('########################################################### \n');
    
    agreementlistproc(hObject, eventdata, h);
    
elseif proportionlist == 0 && meanlist == 0 && associationlist == 0 && agreementlist == 0 && regressionlist == 1 && diagnosticlist == 0 && survivallist == 0 && incidencelist == 0 && relativerisklist == 0 && oddsratiolist == 0
    % Regression
    fprintf('########################################################### \n');
    fprintf('Objective : Regression \n');
    fprintf('########################################################### \n');
    
    regressionlistproc(hObject, eventdata, h);
    
elseif proportionlist == 0 && meanlist == 0 && associationlist == 0 && agreementlist == 0 && regressionlist == 0 && diagnosticlist == 1 && survivallist == 0 && incidencelist == 0 && relativerisklist == 0 && oddsratiolist == 0
    % Diagnostic
    fprintf('########################################################### \n');
    fprintf('Objective : Diagnostics \n');
    fprintf('########################################################### \n');
    
    diagnosticlistproc(hObject, eventdata, h);
    
elseif proportionlist == 0 && meanlist == 0 && associationlist == 0 && agreementlist == 0 && regressionlist == 0 && diagnosticlist == 0 && survivallist == 1 && incidencelist == 0 && relativerisklist == 0 && oddsratiolist == 0
    % Survival
    fprintf('########################################################### \n');
    fprintf('Objective : Survival \n');
    fprintf('########################################################### \n');
    
    survivallistproc(hObject, eventdata, h);
    
elseif proportionlist == 0 && meanlist == 0 && associationlist == 0 && agreementlist == 0 && regressionlist == 0 && diagnosticlist == 0 && survivallist == 0 && incidencelist == 1 && relativerisklist == 0 && oddsratiolist == 0
    % Incidence
    fprintf('########################################################### \n');
    fprintf('Objective : Incidence \n');
    fprintf('########################################################### \n');
    
    incidencelistproc(hObject, eventdata, h);
    
elseif proportionlist == 0 && meanlist == 0 && associationlist == 0 && agreementlist == 0 && regressionlist == 0 && diagnosticlist == 0 && survivallist == 0 && incidencelist == 0 && relativerisklist == 1 && oddsratiolist == 0
    % Relative Risk
    fprintf('########################################################### \n');
    fprintf('Objective : Relative Risk \n');
    fprintf('########################################################### \n');
    
    relativerisklistproc(hObject, eventdata, h);
    
elseif proportionlist == 0 && meanlist == 0 && associationlist == 0 && agreementlist == 0 && regressionlist == 0 && diagnosticlist == 0 && survivallist == 0 && incidencelist == 0 && relativerisklist == 0 && oddsratiolist == 1
    % Odds Ratio
    fprintf('########################################################### \n');
    fprintf('Objective : Odds Ratio \n');
    fprintf('########################################################### \n');
    
    oddsratiolistproc(hObject, eventdata, h);
    
else
    % Do Nothing
end

end