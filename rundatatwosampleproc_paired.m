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

function rundatatwosampleproc_paired(hObject, eventdata, h)

% Get Handle Values
%------------------
direc = getappdata(0, 'getbrowsedir');
nominal_val1 = get(h.cat1value, 'String');
nominal_val2 = get(h.cat2value, 'String');

% Extract input variables
%--------------------------
[~,~,raw] = xlsread(direc);
numcol = raw(1,:);
numcol = numcol(cellfun('isclass', numcol,'char')); %remove non char values from the array
% nominal1num = find(contains(numcol, nominal_val1)); % extract column number
% nominal2num = find(contains(numcol, nominal_val2)); % extract column number

nominal1num = find(ismember(numcol, nominal_val1)); % extract column number
nominal2num = find(ismember(numcol, nominal_val2)); % extract column number

% Applying Algorithm
%--------------------------
mcnemartest(direc, nominal1num, nominal2num);
% fishertestproportions(direc, cat1num, cat2num, alphaval);


end