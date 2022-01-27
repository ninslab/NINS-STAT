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

function gobutton_descriptive_analysis_proc(hObject, eventdata, h)

descriptive_tool = get(h.descriptive_analysis, 'Value');

switch descriptive_tool
    case 1
        % Continuous Variable
        
        h.panel20 = uipanel(h.panel3,...
            'Position',[.03 .01 .95 .98]);
        
        h.plot_tool_header = uicontrol(h.panel20,...
            'Style','text',...
            'String','Descriptive Analysis Tools',...
            'Units', 'normalized', ...
            'Position',[0.05 0.85 0.9 0.1]);
        
        h.descriptive_tool_1 = uicontrol(h.panel20,...
            'Style', 'checkbox', ...
            'Units', 'normalized', ...
            'Position', [0.2, 0.82, 0.9, 0.05], ...
            'String', 'Observations');
        
        h.descriptive_tool_2 = uicontrol(h.panel20,...
            'Style', 'checkbox', ...
            'Units', 'normalized', ...
            'Position', [0.2, 0.76, 0.9, 0.05], ...
            'String', 'Mean');
        
        h.descriptive_tool_3 = uicontrol(h.panel20,...
            'Style', 'checkbox', ...
            'Units', 'normalized', ...
            'Position', [0.2, 0.70, 0.9, 0.05], ...
            'String', 'Median');
        
        h.descriptive_tool_4 = uicontrol(h.panel20,...
            'Style', 'checkbox', ...
            'Units', 'normalized', ...
            'Position', [0.2, 0.64, 0.9, 0.05], ...
            'String', 'Mode');
        
        h.descriptive_tool_5 = uicontrol(h.panel20,...
            'Style', 'checkbox', ...
            'Units', 'normalized', ...
            'Position', [0.2, 0.58, 0.9, 0.05], ...
            'String', 'Standard Deviation');
        
        h.descriptive_tool_6 = uicontrol(h.panel20,...
            'Style', 'checkbox', ...
            'Units', 'normalized', ...
            'Position', [0.2, 0.52, 0.9, 0.05], ...
            'String', 'Coefficient of Variation');
        
        h.descriptive_tool_7 = uicontrol(h.panel20,...
            'Style', 'checkbox', ...
            'Units', 'normalized', ...
            'Position', [0.2, 0.46, 0.9, 0.05], ...
            'String', 'Range');
        
        h.descriptive_tool_8 = uicontrol(h.panel20,...
            'Style', 'checkbox', ...
            'Units', 'normalized', ...
            'Position', [0.2, 0.40, 0.9, 0.05], ...
            'String', 'IQR');
        
        h.gobutton_descriptive_go  = uicontrol(h.panel20,...
            'Style','pushbutton',...
            'String','Proceed',...
            'Units', 'normalized', ...
            'Position',[0.1 0.01 0.8 0.04]);
        
        set(h.gobutton_descriptive_go, 'callback', {@gobutton_descriptive_proc, h}); % Procedure for data visualization
        
    case 2
        % Categorical Variable
        
        h.panel20 = uipanel(h.panel3,...
            'Position',[.03 .01 .95 .98]);
        
        h.plot_tool_header = uicontrol(h.panel20,...
            'Style','text',...
            'String','Descriptive Analysis Tools',...
            'Units', 'normalized', ...
            'Position',[0.05 0.85 0.9 0.1]);
        
        h.descriptive_tool_1 = uicontrol(h.panel20,...
            'Style', 'checkbox', ...
            'Units', 'normalized', ...
            'Position', [0.2, 0.82, 0.9, 0.05], ...
            'String', 'Observations');
        
        h.descriptive_tool_2 = uicontrol(h.panel20,...
            'Style', 'checkbox', ...
            'Units', 'normalized', ...
            'Position', [0.2, 0.76, 0.9, 0.05], ...
            'String', 'Frequency');
        
        h.descriptive_tool_3 = uicontrol(h.panel20,...
            'Style', 'checkbox', ...
            'Units', 'normalized', ...
            'Position', [0.2, 0.70, 0.9, 0.05], ...
            'String', 'Percentage');
                        
        h.gobutton_descriptive_go  = uicontrol(h.panel20,...
            'Style','pushbutton',...
            'String','Proceed',...
            'Units', 'normalized', ...
            'Position',[0.1 0.01 0.8 0.04]);
        
        set(h.gobutton_descriptive_go, 'callback', {@gobutton_descriptive_cat_proc, h}); % Procedure for data visualization
        
    otherwise
        % Do Nothing
end

guidata(hObject,h);

end