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

function rundataprocsurvivalsubset(hObject, eventdata, h)

% Initialize Variables
%-------------------------------------
direc = getappdata(0, 'getbrowsedir');
data = readtable(direc);

% Extract Handle values
%-------------------------------------
timevariablevallabelval = get(h.timevariablevallabel, 'String');
% statusvariablelabelval = get(h.statusvariablelabel, 'String');
groupvariablevalval = get(h.groupvariablelabel, 'String');

% Extract column number
%------------------------------------------------------
[~,~,raw] = xlsread(direc);
numcol = raw(1,:);
numcol = numcol(cellfun('isclass', numcol,'char')); % remove non char values from the array
timevar = find(ismember(numcol, timevariablevallabelval)); % extract column number
% statusvar = find(contains(numcol, statusvariablelabelval)); % extract column number
groupvar = find(ismember(numcol, groupvariablevalval)); % extract column number

% Algorithm
%--------------------------------------
% survivalprocsubset(data, timevar, statusvar, groupvar);
survivalprocsubset(data, timevar, groupvar);

% diary off
% displaycommands(hObject, eventdata, h);

end