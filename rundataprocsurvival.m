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

function rundataprocsurvival(hObject, eventdata, h)

% Initialize variables
%-------------------------------------
direc = getappdata(0, 'getbrowsedir');
data = readtable(direc);

% Extract Handle Values
%-------------------------------------
timevariablevallabelval = get(h.timevariablevallabel, 'String');
statusvariablelabelval = get(h.statusvariablelabel, 'String');

% Extract column number
%------------------------------------------------------
[~,~,raw] = xlsread(direc);
numcol = raw(1,:);
numcol = numcol(cellfun('isclass', numcol,'char')); % remove non char values from the array
timevar = find(ismember(numcol, timevariablevallabelval)); % extract column number
karnovskyvar = find(ismember(numcol, statusvariablelabelval)); % extract column number

% Algorithm
%-------------------------------------
survivaloveralldataproc(data, timevar, karnovskyvar);

% diary off
% displaycommands(hObject, eventdata, h);

end