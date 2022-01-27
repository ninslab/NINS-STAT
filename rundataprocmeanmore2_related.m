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

function rundataprocmeanmore2_related(hObject, eventdata, h)

% Extract data from browse path
%-----------------------------------------------------------
direc = getappdata(0, 'getbrowsedir');
data = readtable(direc);

% Get multiple inputs from handles
%-----------------------------------------------------------
uploaddatalabelcatval = get(h.uploaddatalabelcat, 'String');
uploaddatalabelval = get(h.uploaddatalabel, 'String');

% Extract column number values
[~,~,raw] = xlsread(direc);
numcol = raw(1,:);
numcol = numcol(cellfun('isclass', numcol,'char')); %remove non char values from the array
inp_cat = find(ismember(numcol, uploaddatalabelcatval )); % extract column number
inp_num = find(ismember(numcol, uploaddatalabelval)); % extract column number

% Applying Decision Loop
%------------------------------------------------------------------------
% Calculating Equal Number of Observations in Each Sample
%------------------------------------------------------------------------

fprintf('-------------------------------------------------------------- \n');
fprintf('Parameter A : Equal Number of Observations \n');
fprintf('-------------------------------------------------------------- \n');
g = equalobs(data);

if g == 1
    % Equal number of observations in each sample
    fprintf('Parameter A :  Passed \n');
    
    % Check for normality
    s = normal_distribution(data, inp_num);
    % s = 1; % Change it as soon as done
    
    if s == 1
        % Data is normal
        % Applying repeated measured ANOVA test on data
        
        % User input for external paramaters
        h.radiogroup4 = uibuttongroup(h.panel11,...
            'Units','normalized',...
            'Position', [0.05 0.1 0.90 0.3]);
        
        h.repeatedtimetext = uicontrol(h.radiogroup4,...
            'Style','text',...
            'String','Time intervals',...
            'Units', 'normalized', ...
            'Position',[0.05 0.4 0.3 0.2]);
        
        h.timevar = uicontrol(h.radiogroup4 ,...
            'Style','edit',...
            'String',' ',...
            'Units', 'normalized', ...
            'Position',[0.4 0.4 0.5 0.3]);
        
        h.rundataproc = uicontrol(h.panel4 ,'Style','pushbutton',...
            'String','Run',...
            'Units', 'normalized', ...
            'Position',[0.2 0.025 0.6 0.035]);
        
        set(h.rundataproc, 'callback', {@rundataprocrepeatedanova, h, inp_num, inp_cat});
        
    else
        % Data is not normal
        % Applying Friedman's test
        
        runfriedmantest(data, inp_num);
        
    end
    
else
    % Non-Equal Number of Observations in each Sample
    fprintf('Parameter A : Fail \n');
    fprintf('Please Restart the process again......\n');
end
% 
% diary off
% displaycommands(hObject, eventdata, h);

end