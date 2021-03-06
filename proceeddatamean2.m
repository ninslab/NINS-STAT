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

function proceeddatamean2(hObject, eventdata, h)

% Initialize Variables
%-------------------------------------------
valuesample1 = get(h.pairedoption, 'Value');
valuesample2 = get(h.independentoption, 'Value');

% Applying decision Algorithm
%-------------------------------------------
if valuesample1 == 1 && valuesample2 == 0
    % Paired Mean Analysis
    
    % Delete existing handles
    %----------------------------------------------
    % panel11_label = findall(h.panel4,'title', 'C');
    % delete(panel11_label);
    
    fprintf('------------------- \n');
    fprintf('Paired Mean Analysis \n');
    fprintf('------------------- \n');
    
    h.radiogroup4 = uibuttongroup(h.panel11,...
        'Units','normalized',...
        'Position', [0.05 0.05 0.90 0.6]);
    
    h.mean2num1 = uicontrol(h.radiogroup4,...
        'Style','text',...
        'String','Continuous Data 1',...
        'Units', 'normalized', ...
        'Position',[0.01 0.80 0.5 0.1]);
    
    h.mean2num1val = uicontrol(h.radiogroup4,...
        'Style','pushbutton',...
        'String','Upload Data',...
        'Units', 'normalized', ...
        'Position',[0.45 0.75 0.25 0.2]);
    
    h.mean2num2 = uicontrol(h.radiogroup4,...
        'Style','text',...
        'String','Continuous Data 2',...
        'Units', 'normalized', ...
        'Position',[0.01 0.55 0.5 0.1]);
    
    h.mean2num2val = uicontrol(h.radiogroup4,...
        'Style','pushbutton',...
        'String','Upload Data',...
        'Units', 'normalized', ...
        'Position',[0.45 0.50 0.25 0.2]);
    
    h.mean2num1label = uicontrol(h.radiogroup4,...
        'Style','edit',...
        'String',' ',...
        'Units', 'normalized', ...
        'Position',[0.755 0.75 0.15 0.2]);
    
    h.mean2num2label = uicontrol(h.radiogroup4,...
        'Style','edit',...
        'String',' ',...
        'Units', 'normalized', ...
        'Position',[0.755 0.50 0.15 0.2]);
    
    h.runmean2 = uicontrol(h.panel4,...
        'Style','pushbutton',...
        'String','Run',...
        'Units', 'normalized', ...
        'Position',[0.2 0.025 0.6 0.035]);
    
    % Button Callbacks
    %--------------------------------------------------------
    set(h.mean2num1val, 'callback',{@mean2num1valupload, h});
    set(h.mean2num2val, 'callback',{@mean2num2valupload, h});
    set(h.runmean2, 'callback',{@runmean2proc, h});
    
elseif valuesample1 == 0 && valuesample2 == 1
    % Independent Mean Analysis
    
    % Delete existing handles
    %----------------------------------------------
    %     panel11_label = findall(h.panel4,'title', 'C');
    %     delete(panel11_label);
    
    fprintf('------------------- \n');
    fprintf('Independent Mean Analysis \n');
    fprintf('------------------- \n');
    
    h.radiogroup4 = uibuttongroup(h.panel11,...
        'Units','normalized',...
        'Position', [0.05 0.05 0.90 0.6]);
    
    h.mean2num1 = uicontrol(h.radiogroup4,...
        'Style','text',...
        'String','Categorical Data',...
        'Units', 'normalized', ...
        'Position',[0.01 0.80 0.5 0.1]);
    
    h.mean2num1val = uicontrol(h.radiogroup4,...
        'Style','pushbutton',...
        'String','Upload Data',...
        'Units', 'normalized', ...
        'Position',[0.45 0.75 0.25 0.2]);
    
    h.mean2num2 = uicontrol(h.radiogroup4,...
        'Style','text',...
        'String','Numerical Data',...
        'Units', 'normalized', ...
        'Position',[0.01 0.55 0.5 0.1]);
    
    h.mean2num2val = uicontrol(h.radiogroup4,...
        'Style','pushbutton',...
        'String','Upload Data',...
        'Units', 'normalized', ...
        'Position',[0.45 0.50 0.25 0.2]);
    
    h.mean2num1label = uicontrol(h.radiogroup4,...
        'Style','edit',...
        'String',' ',...
        'Units', 'normalized', ...
        'Position',[0.755 0.75 0.15 0.2]);
    
    h.mean2num2label = uicontrol(h.radiogroup4,...
        'Style','edit',...
        'String',' ',...
        'Units', 'normalized', ...
        'Position',[0.755 0.50 0.15 0.2]);
    
    h.runmean2 = uicontrol(h.panel4,...
        'Style','pushbutton',...
        'String','Run',...
        'Units', 'normalized', ...
        'Position',[0.2 0.025 0.6 0.035]);
    
    % Button Callbacks
    %--------------------------------------------------------
    set(h.mean2num1val, 'callback',{@mean2num1valupload, h});
    set(h.mean2num2val, 'callback',{@mean2num2valupload, h});
    set(h.runmean2, 'callback',{@runmean2procindependent, h});
    
else
    % Do Nothing
end

guidata(hObject,h)

end