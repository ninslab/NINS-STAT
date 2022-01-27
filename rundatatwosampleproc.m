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

function rundatatwosampleproc(hObject, eventdata, h)

% Initializing Variables
%-------------------------------------------------------------------------
totalsamplessample1valval = get(h.totalsamplessample1val, 'String');
totalsamplessample2valval = get(h.totalsamplessample2val, 'String');
favoutcomessample1valval = get(h.favoutcomessample1val, 'String');
favoutcomessample2valval = get(h.favoutcomessample2val, 'String');
alphalabel = get(h.alphaval, 'String');

% Converting String to Variables
%------------------------------------------------------------------------
totalnumberofsample1 = str2double(totalsamplessample1valval);
totalnumberofsample2 = str2double(totalsamplessample2valval);
favourableoutcomesample1 = str2double(favoutcomessample1valval);
favourableoutcomesample2 = str2double(favoutcomessample2valval);
alphaval = str2double(alphalabel);

% Applying Decision Algorithm
%-------------------------------------------------------------------------
twosampleproportionsztest(totalnumberofsample1,totalnumberofsample2,favourableoutcomesample1,favourableoutcomesample2, alphaval);

diary off
displaycommands(hObject, eventdata, h);
end