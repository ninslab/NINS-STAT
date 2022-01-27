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

function runordinaldataproc(hObject, eventdata, h)

% Initialize Variables
%--------------------------------------
direc = getappdata(0, 'getbrowsedir');
data = readtable(direc);
ordinalinp1vallabelval = get(h.ordinalinp1vallabel, 'String');
ordinalinp2vallabelval = get(h.ordinalinp2vallabel, 'String');

% Extract column number
%------------------------------------------------------
[~,~,raw] = xlsread(direc);
numcol = raw(1,:);
numcol = numcol(cellfun('isclass', numcol,'char')); % remove non char values from the array
inp1 = find(ismember(numcol, ordinalinp1vallabelval)); % extract column number
inp2 = find(ismember(numcol, ordinalinp2vallabelval)); % extract column number

% Extract Excel Data
%------------------------------------------------------
data_1 = table2array(data(:, inp1));
data_2 = table2array(data(:, inp2));

% Decison Algorithm
%------------------------------------------------------
ordinaldataproc(data_1, data_2);

% diary off
% displaycommands(hObject, eventdata, h);
end