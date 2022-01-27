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

function gobuttonproc(hObject, eventdata, h)

questionlistnumber = get(h.researchquestion,'Value');

switch questionlistnumber
    case 1
        % Selected Option : CrossSectional Study
        crosssectionalstudyobjectivelist(hObject, eventdata, h);
        fprintf('Study Design Type ------->  Cross Sectional Study \n');
    case 2
        % Selected Option : Cohort Study
        cohortstudyobjectivelist(hObject, eventdata, h);
        fprintf('Study Design Type ------->  Cohort Study \n');
    case 3
        % Selected Option : Case Control Study
        casecontrolstudyobjectivelist(hObject, eventdata, h);
        fprintf('Study Design Type -------> Case Control Study \n');
%     case 4
%         % Selected Option : Survival Study
%         survivalstudyobjectivelist(hObject, eventdata, h);
%         fprintf('Study Design Type -------> Survival Study \n');
    case 4
        % Selected Option : Clinical Trial
        clinicaltrialobjectivelist(hObject, eventdata, h);
        fprintf('Study Design Type -------> Clinical Trial \n');
    otherwise
        % Do Nothing
end

end