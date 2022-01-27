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

function rundatacategoricaldiagnostic(hObject, eventdata, h)

% Initialize variables
%-----------------------------------------------------
% Extract handles
%-----------------------------------------------------
truepositivevalue = get(h.truepositiveval, 'String');
falsenegativevalue = get(h.falsenegativeval, 'String');
falsepositivevalue = get(h.falsepositiveval, 'String');
truenegativelabelue = get(h.truenegativeval, 'String');

a = str2double(truepositivevalue);
b = str2double(falsenegativevalue);
c = str2double(falsepositivevalue);
d = str2double(truenegativelabelue);

% Algorithm
%------------------------------------------------------
diagnosticvalueproc(a,b,c,d);

% diary off
% displaycommands(hObject, eventdata, h);

end