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

function runconditionallogit(hObject, eventdata, h)

% Extract Data from the directory
%------------------------------------------------------------------------
direc = getappdata(0, 'getbrowsedir');
data = readtable(direc);

% Extract Data from Individual Handles
%------------------------------------------------------------------------
uploaddependentvarstrlabelval = get(h.uploaddependentvarstrlabel, 'String');
uploadindependentvarstrlabelval = get(h.uploadindependentvarstrlabel, 'String');
uploadgroupvarstrlabelval = get(h.uploadgroupvarstrlabel, 'String');

% Extract column number values
%-----------------------------------------------------------
[~,~,raw] = xlsread(direc);
numcol = raw(1,:);
numcol = numcol(cellfun('isclass', numcol,'char')); %remove non char values from the array
inp_dependent = find(ismember(numcol, uploaddependentvarstrlabelval )); % extract dependent column number
inp_independent = find(ismember(numcol, uploadindependentvarstrlabelval )); % extract independent column number
inp_group = find(ismember(numcol, uploadgroupvarstrlabelval )); % extract group column number

% Matlab index starts from 1; in case of python it starts from 0
var_dependent = double(inp_dependent - 1);
var_group = double(inp_group - 1);

for k = 1:length(inp_independent)
    var_independent(k) = inp_independent(k) - 1;
end

save('roc_independent_var.mat', 'var_independent');

filename = 'conditional_logit_matlab.py';

% Check if python is installed on system

pystatus  = pyversion;

if isempty(pystatus)
    msgbox('Install python2.7 and then install statsmodels functionality in python');
else
    cmd = sprintf('python "%s" %s %g %g %g', filename, direc, var_dependent, var_group);
    system(cmd)
end

end