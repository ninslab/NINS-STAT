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

function proceedbuttonprocpairedsample(hObject, eventdata, h)

pairedopt = get(h.pairedoption, 'Value');
independentopt = get(h.independentoption, 'Value');

if pairedopt == 1 && independentopt == 0
    % Paired Mean Two Sample Analysis
    pairedtwosamplemeananalysis();
    
elseif pairedopt == 0 && independentopt == 1
    % Independent Mean Two Sample Analysis
    independenttwosamplemeananalysis();
    
else
    % Do Nothing
end

end