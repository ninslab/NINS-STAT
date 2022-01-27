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

function proceedbuttonprocdiagnostic(hObject, eventdata, h)

% Initialize variables
%-----------------------------------------------------------------------
valuesample1 = get(h.sample1, 'Value');
valuesample2 = get(h.sample2, 'Value');

% Decision Algorithm
%-----------------------------------------------------------------------
if valuesample1 == 1 && valuesample2 == 0
    % Categorical Sample
    
    % Delete existing handles
    %----------------------------------------------
    panel10_label = findall(h.panel4,'title', 'B');
    panel11_label = findall(h.panel4,'title', 'C');
    delete(panel10_label);
    delete(panel11_label);
    
    
    fprintf('------------------- \n');
    fprintf('Categorical Sample \n');
    fprintf('------------------- \n');
    
    h.panel10 = uipanel(h.panel4,...
        'Title','B',...
        'Position',[.05 .07 .9 .70]);
    
    h.truepositivelabel = uicontrol(h.panel10,...
        'Style','text',...
        'String','True Positive',...
        'Units', 'normalized', ...
        'Position',[0.01 0.80 0.5 0.1]);
    
    h.truepositiveval = uicontrol(h.panel10 ,...
        'Style','edit',...
        'String','',...
        'Units', 'normalized', ...
        'Position',[0.4 0.85 0.5 0.06]);
    
    h.falsenegativelabel= uicontrol(h.panel10,...
        'Style','text',...
        'String','False Negative',...
        'Units', 'normalized', ...
        'Position',[0.01 0.70 0.5 0.1]);
    
    h.falsenegativeval = uicontrol(h.panel10 ,...
        'Style','edit',...
        'String','',...
        'Units', 'normalized', ...
        'Position',[0.4 0.75 0.5 0.06]);
    
    h.falsepositivelabel = uicontrol(h.panel10 ,...
        'Style','text',...
        'String',' False Positive',...
        'Units', 'normalized', ...
        'Position',[0.01 0.60 0.5 0.1]);
    
    h.falsepositiveval = uicontrol(h.panel10 ,...
        'Style','edit',...
        'String','',...
        'Units', 'normalized', ...
        'Position',[0.4 0.65 0.5 0.06]);
    
    h.truenegativelabel = uicontrol(h.panel10 ,...
        'Style','text',...
        'String',' True Negative',...
        'Units', 'normalized', ...
        'Position',[0.01 0.50 0.5 0.1]);
    
    h.truenegativeval = uicontrol(h.panel10 ,...
        'Style','edit',...
        'String','',...
        'Units', 'normalized', ...
        'Position',[0.4 0.55 0.5 0.06]);
    
    h.rundata = uicontrol(h.panel4 ,...
        'Style','pushbutton',...
        'String','Run',...
        'Units', 'normalized', ...
        'Position',[0.2 0.025 0.6 0.035]);
    
    % Button Functions
    %-------------------------------------------------------------
    set(h.rundata, 'callback',{@rundatacategoricaldiagnostic, h});
    
elseif valuesample1 == 0 && valuesample2 == 1
    % One Continuous and One Binary Sample
    
    % Delete existing handles
    %----------------------------------------------
    panel10_label = findall(h.panel4,'title', 'B');
    panel11_label = findall(h.panel4,'title', 'C');
    delete(panel10_label);
    delete(panel11_label);
    
    
    fprintf('------------------- \n');
    fprintf('One Continuous and One Binary Sample \n');
    fprintf('------------------- \n');
    
    h.panel10 = uipanel(h.panel4,...
        'Title','B',...
        'Position',[.05 .58 .9 .2]);
    
    h.continuousrocvar = uicontrol(h.panel10,...
        'Style','text',...
        'String','Continuous Data',...
        'Units', 'normalized', ...
        'Position',[0.05 0.60 0.3 0.2]);
    
    h.continuousrocval = uicontrol(h.panel10 ,...
        'Style','pushbutton',...
        'String','Upload Data',...
        'Units', 'normalized', ...
        'Position',[0.45 0.65 0.3 0.2]);
    
    h.binaryroc = uicontrol(h.panel10,...
        'Style','text',...
        'String','Binary Data',...
        'Units', 'normalized', ...
        'Position',[0.05 0.30 0.3 0.3]);
    
    h.binaryrocval = uicontrol(h.panel10 ,...
        'Style','pushbutton',...
        'String','Upload Data',...
        'Units', 'normalized', ...
        'Position',[0.45 0.42 0.3 0.2]);
    
    h.continuousrocvarlabel = uicontrol(h.panel10,...
        'Style','edit',...
        'String',' ',...
        'Units', 'normalized', ...
        'Position',[0.77 0.63 0.1 0.2]);
    
    h.binaryroclabel = uicontrol(h.panel10,...
        'Style','edit',...
        'String',' ',...
        'Units', 'normalized', ...
        'Position',[0.77 0.42 0.1 0.2]);
    
    h.posclasslabel = uicontrol(h.panel10,...
        'Style','text',...
        'String','+ Response',...
        'Units', 'normalized', ...
        'Position',[0.01 0.05 0.3 0.3]);
    
    h.posclassval = uicontrol(h.panel10 ,...
        'Style','edit',...
        'String','',...
        'Units', 'normalized', ...
        'Position',[0.45 0.15 0.3 0.2]);
    
    h.rundata = uicontrol(h.panel4 ,'Style','pushbutton',...
        'String','Run',...
        'Units', 'normalized', ...
        'Position',[0.2 0.025 0.6 0.035]);
    
    % Button Functions
    %--------------------------------------------------------------------
    set(h.continuousrocval, 'callback',{@uploaddataroccontinuousproc, h});
    set(h.binaryrocval, 'callback',{@uploaddatarocbinaryproc, h});
    set(h.rundata, 'callback',{@rundatarocproc, h});
else
    % Do Nothing
end
guidata(hObject,h)
end