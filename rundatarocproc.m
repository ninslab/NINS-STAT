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

function rundatarocproc(hObject, eventdata, h)

% Initialize Handle Variables
%-----------------------------------------------------------------
binaryroclabelval = get(h.binaryroclabel, 'String');
controclabelval = get(h.continuousrocvarlabel, 'String');
posclassvalvalue = get(h.posclassval, 'String');
var_pos = str2double(posclassvalvalue);

% Extract input variables
%--------------------------
direc = getappdata(0, 'getbrowsedir');
[~,~,raw] = xlsread(direc);
numcol = raw(1,:);
numcol = numcol(cellfun('isclass', numcol,'char')); %remove non char values from the array
var_bin = find(ismember(numcol, binaryroclabelval)); % extract binary number
var_cont= find(ismember(numcol, controclabelval)); % extract continuous number

% Save predictor column values in a .mat file
save('cont_r_roc.mat','var_cont');

% Call R Sript

filename = 'r_script.R';
cmd = sprintf('Rscript "%s" %s %g %g', filename, direc, var_bin, var_pos);
system(cmd);

end