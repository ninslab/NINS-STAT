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

function rundata_morethantwosample_proc_paired(hObject, eventdata, h)

% Extract data from browse path
%-----------------------------------------------------------
direc = getappdata(0, 'getbrowsedir');
data = readtable(direc);

% Get multiple inputs from handles
%-----------------------------------------------------------
inp_categories = get(h.cat1value, 'String');
alpha_value = str2double(get(h.alphaval, 'String'));

% Extract column number values
[~,~,raw] = xlsread(direc);
numcol = raw(1,:);
numcol = numcol(cellfun('isclass', numcol,'char')); %remove non char values from the array
inp_cat = find(ismember(numcol, inp_categories )); % extract column number

% Applying Decision Loop
%------------------------------------------------------------------------
cochrantest(data, inp_cat, alpha_value);

end