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

function rundataproccontregression(hObject, eventdata, h)

% Extract Data from the directory
%-----------------------------------------
direc = getappdata(0, 'getbrowsedir');
data = readtable(direc);

% Extract Data from Individual Handles
%-----------------------------------------
uploaddependentvarstrlabelval = get(h.uploaddependentvarstrlabel, 'String');
uploadindependentvarstrlabelval = get(h.uploadindependentvarstrlabel, 'String');

[~,~,raw] = xlsread(direc);
numcol = raw(1,:);
numcol = numcol(cellfun('isclass', numcol,'char')); %remove non char values from the array
inp_dependent = find(ismember(numcol, uploaddependentvarstrlabelval )); % extract column number | Dependent variable
inp_independent = find(ismember(numcol, uploadindependentvarstrlabelval )); % extract column number | Independent variable
label_name_independent = inp_independent;
label_name_dependent = inp_dependent;

dependent_val = table2array(data(:, inp_dependent));

% Converting to individual readable cells
%-----------------------------------------
%(inpindependent = str2double(uploadindependentvarstrlabelval);)
len = length(inp_independent);

for i = 1: len
    independent_val(:,i) = table2array(data(:, inp_independent(i)));
end

% Checking for Assumptions for Linear and Non-Linear Regression
%---------------------------------------------------------------
n = check_assumptions_regress(independent_val, dependent_val);

% Applying Decision Loop
%--------------------------------------------------------------
if n == 3
    
    % Delete existing handles
    %----------------------
    panel11_label = findall(h.panel4,'title', 'C');
    delete(panel11_label);
    
    h.run2button= uicontrol(h.panel4,...
        'Style','pushbutton',...
        'String','Run',...
        'Units', 'normalized', ...
        'Position',[0.2 0.025 0.6 0.035]);
    
    % Linear Regression
    %----------------------
    set(h.run2button, 'callback',{@run2button_regression_lin, h, independent_val, dependent_val, label_name_independent,label_name_dependent });
    %lin_regress(independent_val, dependent_val);
    
elseif n == 1
    % Non-Linear Regression
    %----------------------
    nonlin_regress(hObject, eventdata, h, independent_val, dependent_val, label_name_independent,label_name_dependent);
    
else
    % Do Nothing
end


% diary off
% displaycommands(hObject, eventdata, h);

end