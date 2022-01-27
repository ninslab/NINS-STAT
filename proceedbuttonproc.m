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

function proceedbuttonproc(hObject, eventdata, h)

valuesample1 = get(h.sample1, 'Value'); % One sample
valuesample2 = get(h.sample2, 'Value'); % Two sample
valuesample3 = get(h.sample3, 'Value'); % Three sample


if valuesample1 == 1 && valuesample2 == 0 && valuesample3 == 0
    % One Sample Analysis
    
    % Delete existing handles
    %----------------------------------------------
    panel10_label = findall(h.panel4,'title', 'B');
    panel11_label = findall(h.panel4,'title', 'C');
    delete(panel10_label);
    delete(panel11_label);
    
    fprintf('------------------- \n');
    fprintf('One Sample Analysis \n');
    fprintf('------------------- \n');
    
    h.panel10 = uipanel(h.panel4,...
    'Title','B',...
    'Position',[.05 .58 .9 .2]);

    h.alpha = uicontrol(h.panel10,...
        'Style','text',...
        'String','Alpha Value',...
        'Units', 'normalized', ...
        'Position',[0.05 0.75 0.3 0.2]);
    
    h.alphaval = uicontrol(h.panel10,...
        'Style','edit',...
        'String','',...
        'Units', 'normalized', ...
        'Position',[0.45 0.78 0.3 0.2]);
    
    h.succoutcomes = uicontrol(h.panel10,...
        'Style','text',...
        'String','Successful Outcomes',...
        'Units', 'normalized', ...
        'Position',[0.01 0.40 0.5 0.3]);
    
    h.succoutcomesvalue = uicontrol(h.panel10,...
        'Style','edit',...
        'String','',...
        'Units', 'normalized', ...
        'Position',[0.45 0.54 0.3 0.2]);
    
    h.totalsamples = uicontrol(h.panel10,...
        'Style','text',...
        'String','Total Samples',...
        'Units', 'normalized', ...
        'Position',[0.01 0.16 0.4 0.3]);
    
    h.totalsamplesvalue = uicontrol(h.panel10,...
        'Style','edit',...
        'String','',...
        'Units', 'normalized', ...
        'Position',[0.45 0.30 0.3 0.2]);
    
    h.proposedsuccessprob = uicontrol(h.panel10,...
        'Style','text',...
        'String','Proposed Success',...
        'Units', 'normalized', ...
        'Position',[0.01 0.01 0.4 0.2]);
    
    h.proposedsuccessprobvalue = uicontrol(h.panel10,...
        'Style','edit',...
        'String','',...
        'Units', 'normalized', ...
        'Position',[0.45 0.05 0.3 0.2]);
    
    h.rundata = uicontrol(h.panel4 ,'Style','pushbutton',...
        'String','Run',...
        'Units', 'normalized', ...
        'Position',[0.2 0.025 0.6 0.035]);
    
    set(h.rundata, 'callback',{@rundataonesampleproc, h});
    
elseif valuesample1 == 0 && valuesample2 == 1 && valuesample3 == 0
    % Two Sample Analysis
    
    % Delete existing handles
    %----------------------------------------------
    panel10_label = findall(h.panel4,'title', 'B');
    panel11_label = findall(h.panel4,'title', 'C');
    delete(panel10_label);
    delete(panel11_label);
    
    fprintf('------------------- \n');
    fprintf('Two Sample Analysis \n');
    fprintf('------------------- \n');
    
    h.panel10 = uipanel(h.panel4,...
    'Title','B',...
    'Position',[.05 .58 .9 .2]);

    h.radiogroup2 = uibuttongroup(h.panel10,...
     'Units','normalized',...
     'Position', [0.05 0.07 0.90 0.9]);

%     h.hypotheticaltext = uicontrol(h.radiogroup2,...
%         'Style','text',...
%         'String','Proportion(Small/Large)',...
%         'Units', 'normalized', ...
%         'Position',[0.01 0.60 0.5 0.1]);
    
    h.proportionunpaired = uicontrol(h.radiogroup2,...
        'Style','radiobutton',...
        'String',' Unpaired samples',...
        'Units', 'normalized', ...
        'Position',[0.25 0.75 0.92 0.2],...
        'HandleVisibility','off');
    
    h.proportionpaired = uicontrol(h.radiogroup2,...
        'Style','radiobutton',...
        'String',' Paired samples',...
        'Units', 'normalized', ...
        'Position',[0.25 0.50 0.92 0.2],...
        'HandleVisibility','off');
    
    h.proceedproc = uicontrol(h.radiogroup2,'Style','pushbutton',...
        'String','Proceed',...
        'Units', 'normalized', ...
        'Position',[0.25 0.10 0.4 0.2]);
    
    set(h.proceedproc, 'callback',{@proceedprocprocedure, h});
    
elseif valuesample1 == 0 && valuesample2 ==0 && valuesample3 == 1
    % More than 2 sample
    
     % Delete existing handles
    %----------------------------------------------
    panel10_label = findall(h.panel4,'title', 'B');
    panel11_label = findall(h.panel4,'title', 'C');
    delete(panel10_label);
    delete(panel11_label);
    
    fprintf('------------------- \n');
    fprintf('> Two Sample Analysis \n');
    fprintf('------------------- \n');
    
    h.panel10 = uipanel(h.panel4,...
    'Title','B',...
    'Position',[.05 .58 .9 .2]);

    h.radiogroup2 = uibuttongroup(h.panel10,...
     'Units','normalized',...
     'Position', [0.05 0.07 0.90 0.9]);

%     h.hypotheticaltext = uicontrol(h.radiogroup2,...
%         'Style','text',...
%         'String','Proportion(Small/Large)',...
%         'Units', 'normalized', ...
%         'Position',[0.01 0.60 0.5 0.1]);
    
    h.proportionunpaired = uicontrol(h.radiogroup2,...
        'Style','radiobutton',...
        'String',' Unpaired samples',...
        'Units', 'normalized', ...
        'Position',[0.25 0.75 0.92 0.2],...
        'HandleVisibility','off');
    
    h.proportionpaired = uicontrol(h.radiogroup2,...
        'Style','radiobutton',...
        'String',' Paired samples',...
        'Units', 'normalized', ...
        'Position',[0.25 0.50 0.92 0.2],...
        'HandleVisibility','off');
    
    h.proceedproc = uicontrol(h.radiogroup2,'Style','pushbutton',...
        'String','Proceed',...
        'Units', 'normalized', ...
        'Position',[0.25 0.10 0.4 0.2]);
    
    set(h.proceedproc, 'callback',{@proceedprocprocedure_morethan2, h});
    
else
    % Do Nothing
end

guidata(hObject,h)

end