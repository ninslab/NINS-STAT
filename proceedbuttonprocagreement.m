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

function proceedbuttonprocagreement(hObject, eventdata, h)

% Initialize variables
%--------------------------------------
valuesample1 = get(h.sample1, 'Value');
valuesample2 = get(h.sample2, 'Value');

% Decision Algorithm
%--------------------------------------
if valuesample1 == 1 && valuesample2 == 0
    % Agreement
    
    % Delete existing handles
    %----------------------------------------------
    panel10_label = findall(h.panel4,'title', 'B');
    panel11_label = findall(h.panel4,'title', 'C');
    delete(panel10_label);
    delete(panel11_label);
    
    fprintf('------------------- \n');
    fprintf('Agreement \n');
    fprintf('------------------- \n');
    
    h.panel10 = uipanel(h.panel4,...
        'Title','B',...
        'Position',[.05 .58 .9 .2]);
    
    h.radiogroup2 = uibuttongroup(h.panel10,...
        'Units','normalized',...
        'Position', [0.05 0.07 0.90 0.9]);
    
    h.categoricalopt = uicontrol(h.radiogroup2,...
        'Style','radiobutton',...
        'String','    Categorical Data',...
        'Units', 'normalized', ...
        'Position',[0.25 0.75 0.92 0.2],'HandleVisibility','off');
    
    h.continuousopt = uicontrol(h.radiogroup2,...
        'Style','radiobutton',...
        'String','    Continuous Data',...
        'Units', 'normalized', ...
        'Position',[0.25 0.50 0.92 0.2],'HandleVisibility','off');
    
    h.proceedbutton = uicontrol(h.radiogroup2 ,'Style','pushbutton',...
        'String','Proceed',...
        'Units', 'normalized', ...
        'Position',[0.25 0.10 0.4 0.2]);
    
    set(h.proceedbutton, 'callback',{@proceedbuttonprocagreementcategorical, h});
    
    
elseif valuesample1 == 0 && valuesample2 == 1
    % Repeatability
    
    % Delete existing handles
    %----------------------------------------------
    panel10_label = findall(h.panel4,'title', 'B');
    panel11_label = findall(h.panel4,'title', 'C');
    delete(panel10_label);
    delete(panel11_label);
    
    fprintf('------------------- \n');
    fprintf('Repeatibility \n');
    fprintf('------------------- \n');
    
    h.panel10 = uipanel(h.panel4,...
        'Title','B',...
        'Position',[.05 .07 .9 .70]);
    
    h.uploaddatastring1 = uicontrol(h.panel10,...
        'Style','text',...
        'String','Upload Data 1',...
        'Units', 'normalized', ...
        'Position',[0.01 0.80 0.5 0.1]);
    
    h.uploaddata1 = uicontrol(h.panel10 ,'Style','pushbutton',...
        'String','Upload Data',...
        'Units', 'normalized', ...
        'Position',[0.45 0.85 0.25 0.06]);
    
    h.uploaddatastring2 = uicontrol(h.panel10,...
        'Style','text',...
        'String','Upload Data 2',...
        'Units', 'normalized', ...
        'Position',[0.01 0.68 0.5 0.1]);
    
    h.uploaddata2 = uicontrol(h.panel10 ,'Style','pushbutton',...
        'String','Upload Data',...
        'Units', 'normalized', ...
        'Position',[0.45 0.74 0.25 0.06]);
    
    h.uploaddatastring1label = uicontrol(h.panel10,...
        'Style','edit',...
        'String',' ',...
        'Units', 'normalized', ...
        'Position',[0.755 0.85 0.15 0.06]);
    
    h.uploaddatastring2label = uicontrol(h.panel10 ,'Style','edit',...
        'String',' ',...
        'Units', 'normalized', ...
        'Position',[0.755 0.74 0.15 0.06]);
    
%     h.titvallabel = uicontrol(h.panel10 ,'Style','text',...
%         'String','Title',...
%         'Units', 'normalized', ...
%         'Position',[0.01 0.53 0.5 0.1]);
%     
%     h.titvallabeltext = uicontrol(h.panel10 ,'Style','edit',...
%         'String','',...
%         'Units', 'normalized', ...
%         'Position',[0.45 0.59 0.45 0.06]);
%     
%     h.corrinfolabel = uicontrol(h.panel10 ,'Style','text',...
%         'String','CorrInfo',...
%         'Units', 'normalized', ...
%         'Position',[0.01 0.45 0.5 0.1]);
%     
%     h.corrinfotext = uicontrol(h.panel10 ,'Style','edit',...
%         'String','',...
%         'Units', 'normalized', ...
%         'Position',[0.45 0.50 0.45 0.06]);
%     
%     h.bainfolabel = uicontrol(h.panel10 ,'Style','text',...
%         'String','BaInfo',...
%         'Units', 'normalized', ...
%         'Position',[0.01 0.35 0.5 0.1]);
%     
%     h.bainfolabeltext = uicontrol(h.panel10 ,'Style','edit',...
%         'String','',...
%         'Units', 'normalized', ...
%         'Position',[0.45 0.40 0.45 0.06]);
    
    h.rundata = uicontrol(h.panel4 ,'Style','pushbutton',...
        'String','Run',...
        'Units', 'normalized', ...
        'Position',[0.2 0.025 0.6 0.035]);
    
    set(h.uploaddata1, 'callback',{@uploaddata1procrepeat, h});
    set(h.uploaddata2, 'callback',{@uploaddata2procrepeat, h});
    set(h.rundata, 'callback',{@rundataprocrepeat, h});
    
else
    % Do Nothing
end

guidata(hObject,h)

end