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

function rundataonesampleproc(hObject, eventdata, h)

% Initialize Variables
%-------------------------------------------------------------------------
alphavalue = get(h.alphaval, 'String');
successfuloutcomesval = get(h.succoutcomesvalue, 'String');
totalsamples = get(h.totalsamplesvalue, 'String');
proposedprobval = get(h.proposedsuccessprobvalue, 'String');

% Algorithm Function
%-------------------------------------------------------------------------
proportionalgorithmapplyonesample(alphavalue,successfuloutcomesval,totalsamples,proposedprobval);

% diary off
% displaycommands(hObject, eventdata, h);

end