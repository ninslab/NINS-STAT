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

function proceedbuttonprocagreementcategorical(hObject, eventdata, h)

% Initialize Variables
%---------------------------------------------------
categoricalvalue = get(h.categoricalopt , 'Value');
continuousvalue = get(h.continuousopt, 'Value');

% Decision Algorithm
%---------------------------------------------------
if categoricalvalue == 1 && continuousvalue == 0
    % Categorical Data
    
    % Delete existing handles
    %----------------------------------------------
    panel11_label = findall(h.panel4,'title', 'C');
    delete(panel11_label);
    
    fprintf('------------------- \n');
    fprintf('Categorical Data \n');
    fprintf('------------------- \n');
    
    h.panel11 = uipanel(h.panel4,...
        'Title','C',...
        'Position',[.05 .08 .9 .5]);
    
    h.radiogroup3 = uibuttongroup(h.panel11,...
        'Units','normalized',...
        'Position', [0.05 0.58 0.90 0.4]);
    
    h.sample3 = uicontrol(h.radiogroup3,...
        'Style','radiobutton',...
        'String','    2 Categories',...
        'Units', 'normalized', ...
        'Position',[0.25 0.75 0.92 0.2],'HandleVisibility','off');
    
    h.sample4 = uicontrol(h.radiogroup3,...
        'Style','radiobutton',...
        'String','    > 2 Categories',...
        'Units', 'normalized', ...
        'Position',[0.25 0.50 0.92 0.2],'HandleVisibility','off');
    
    h.proceedbutton2 = uicontrol(h.radiogroup3 ,'Style','pushbutton',...
        'String','Proceed',...
        'Units', 'normalized', ...
        'Position',[0.25 0.10 0.4 0.2]);
    
    set(h.proceedbutton2, 'callback',{@proceedbutton2procagreement, h});
    
elseif categoricalvalue == 0 && continuousvalue == 1
    % Continuous Data
    
    % Delete existing handles
    %----------------------------------------------
    panel11_label = findall(h.panel4,'title', 'C');
    delete(panel11_label);
    
    fprintf('------------------- \n');
    fprintf('Continuous Data \n');
    fprintf('------------------- \n');
    
    h.panel11 = uipanel(h.panel4,...
        'Title','C',...
        'Position',[.05 .08 .9 .5]);
    
    h.radiogroup3 = uibuttongroup(h.panel11,...
        'Units','normalized',...
        'Position', [0.05 0.58 0.90 0.4]);
    
    h.sample3 = uicontrol(h.radiogroup3,...
        'Style','radiobutton',...
        'String','    2 Raters',...
        'Units', 'normalized', ...
        'Position',[0.25 0.75 0.92 0.2],'HandleVisibility','off');
    
    h.sample4 = uicontrol(h.radiogroup3,...
        'Style','radiobutton',...
        'String','    > 2 Raters',...
        'Units', 'normalized', ...
        'Position',[0.25 0.50 0.92 0.2],'HandleVisibility','off');
    
    h.proceedbutton2 = uicontrol(h.radiogroup3 ,'Style','pushbutton',...
        'String','Proceed',...
        'Units', 'normalized', ...
        'Position',[0.25 0.10 0.4 0.2]);
    
    set(h.proceedbutton2, 'callback',{@proceedbutton2procagreementg2, h});
else
    % Do Nothing
end
guidata(hObject,h);
end