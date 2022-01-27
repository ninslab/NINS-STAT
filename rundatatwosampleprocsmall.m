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

function rundatatwosampleprocsmall(hObject, eventdata, h)

% Get Handle Values
%------------------
direc = getappdata(0, 'getbrowsedir');
cat1var = get(h.cat1value,'String');
cat2var = get(h.cat2value,'String');
alphavar = get(h.alphaval, 'String');

% Extract input variables
%--------------------------
[~,~,raw] = xlsread(direc);
numcol = raw(1,:);
numcol = numcol(cellfun('isclass', numcol,'char')); %remove non char values from the array
cat1num = find(ismember(numcol, cat1var)); % extract column number
cat2num = find(ismember(numcol, cat2var)); % extract column number
alphaval= str2double(alphavar);

% Applying Algorithm
%--------------------------

% Check condition if the sample is large or small
% -----------------------------------------------
%{
  Condition for testing if sample is small
    - Cell frequency < 5
    - Sample size <  30
%}

small_large_var = small_large_var_proc(direc, cat1num, cat2num);

if small_large_var == 1
    % Small sample
    %--------------------------
    % Applying Fisher Exact test
    fishertestproportions(direc, cat1num, cat2num, alphaval);
else
    % Large sample
    %--------------------------
    % Applying Chi-square test
    chi_square_large_sample(direc, cat1num, cat2num, alphaval);
end

% diary off
% displaycommands(hObject, eventdata, h);

end