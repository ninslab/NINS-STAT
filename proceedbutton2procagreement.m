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

function proceedbutton2procagreement(hObject, eventdata, h)

% Initialize Variables
%-------------------------------------
valuesample3 = get(h.sample3, 'Value');
valuesample4 = get(h.sample4, 'Value');

% Decision Algorithm
%-------------------------------------
if valuesample3 == 1 && valuesample4 == 0
    % Two Categories
    
    fprintf('------------------- \n');
    fprintf('Two Categories \n');
    fprintf('------------------- \n');
    
    h.panel12 = uipanel(h.panel11,...
        'Position',[.05 .06 .9 .5]);

    h.var1val = uicontrol(h.panel12,...
        'Style','text',...
        'String','Variable 1',...
        'Units', 'normalized', ...
        'Position',[0.05 0.60 0.3 0.2]);
    
    h.var1value = uicontrol(h.panel12 ,'Style','pushbutton',...
        'String','Upload Data',...
        'Units', 'normalized', ...
        'Position',[0.40 0.65 0.3 0.2]);
    
    h.var2val = uicontrol(h.panel12,...
        'Style','text',...
        'String','Variable 2',...
        'Units', 'normalized', ...
        'Position',[0.05 0.20 0.3 0.3]);
    
    h.var2value = uicontrol(h.panel12 ,'Style','pushbutton',...
        'String','Upload Data',...
        'Units', 'normalized', ...
        'Position',[0.40 0.35 0.3 0.2]);
    
    h.var1valuelabel = uicontrol(h.panel12,'Style','edit',...
        'String',' ',...
        'Units', 'normalized', ...
        'Position',[0.77 0.65 0.1 0.2]);
    
    h.var2valuelabel = uicontrol(h.panel12,...
        'Style','edit',...
        'String',' ',...
        'Units', 'normalized', ...
        'Position',[0.77 0.35 0.1 0.2]);
    
    h.rundata = uicontrol(h.panel4 ,'Style','pushbutton',...
        'String','Run',...
        'Units', 'normalized', ...
        'Position',[0.2 0.025 0.6 0.035]);
    
    set(h.var1value, 'callback',{@uploadvar1valueproc, h});
    set(h.var2value, 'callback',{@uploadvalueproc, h});
    set(h.rundata, 'callback',{@rundataprocagreement2, h});
    
    
elseif valuesample3 == 0 && valuesample4 == 1
    % Greater than Two Categories
    
    fprintf('------------------- \n');
    fprintf(' > (Greater) Two Categories \n');
    fprintf('------------------- \n');
    
    h.panel12 = uipanel(h.panel11,...
        'Position',[.05 .06 .9 .5]);
    
    h.var1val = uicontrol(h.panel12,...
        'Style','text',...
        'String','Variable 1',...
        'Units', 'normalized', ...
        'Position',[0.05 0.60 0.3 0.2]);
    
    h.var1value = uicontrol(h.panel12 ,'Style','pushbutton',...
        'String','Upload Data',...
        'Units', 'normalized', ...
        'Position',[0.40 0.65 0.3 0.2]);
    
    h.var2val = uicontrol(h.panel12,...
        'Style','text',...
        'String','Variable 2',...
        'Units', 'normalized', ...
        'Position',[0.05 0.20 0.3 0.3]);
    
    h.var2value = uicontrol(h.panel12 ,'Style','pushbutton',...
        'String','Upload Data',...
        'Units', 'normalized', ...
        'Position',[0.40 0.35 0.3 0.2]);
    
    h.var1valuelabel = uicontrol(h.panel12 ,...
        'Style','edit',...
        'String',' ',...
        'Units', 'normalized', ...
        'Position',[0.77 0.65 0.1 0.2]);
    
    h.var2valuelabel = uicontrol(h.panel12,...
        'Style','edit',...
        'String',' ',...
        'Units', 'normalized', ...
        'Position',[0.77 0.35 0.1 0.2]);
    
    h.rundata = uicontrol(h.panel4 ,'Style','pushbutton',...
        'String','Run',...
        'Units', 'normalized', ...
        'Position',[0.2 0.025 0.6 0.035]);
    
    set(h.var1value, 'callback',{@uploadvar1valueproc, h});
    set(h.var2value, 'callback',{@uploadvalueproc, h});
    set(h.rundata, 'callback',{@rundataprocagreementg2categorical, h});
    
else
    % Do Nothing
end
guidata(hObject,h)
end