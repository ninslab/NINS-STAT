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

function gobutton_data_visualization_proc(hObject, eventdata, h)

visual_tool = get(h.datavartype, 'Value');

switch visual_tool
    case 1
        % Continuous Variables
        
        h.panel20 = uipanel(h.panel3,...
            'Position',[.03 .01 .95 .98]);
        
        h.plot_tool_header = uicontrol(h.panel20,...
            'Style','text',...
            'String','Plotting Tools',...
            'Units', 'normalized', ...
            'Position',[0.05 0.85 0.9 0.1]);
        
        h.visual_plot_selection = uicontrol(h.panel20,...
            'Style', 'popup', ...
            'Units', 'normalized', ...
            'Position', [0.05, 0.80, 0.9, 0.1], ...
            'String', {'Histogram','Standard Plot','Scatter Plot'});
        
        h.gobutton_visualize_go  = uicontrol(h.panel20,...
            'Style','pushbutton',...
            'String','Proceed',...
            'Units', 'normalized', ...
            'Position',[0.1 0.01 0.8 0.04]);
        
        set(h.gobutton_visualize_go, 'callback', {@gobutton_visualize_goproc, h}); % Procedure for data visualization
        
    case 2
        % Categorical Variables
        
        h.panel20 = uipanel(h.panel3,...
            'Position',[.03 .01 .95 .98]);
        
        h.plot_tool_header = uicontrol(h.panel20,...
            'Style','text',...
            'String','Plotting Tools',...
            'Units', 'normalized', ...
            'Position',[0.05 0.85 0.9 0.1]);
        
        h.visual_plot_selection = uicontrol(h.panel20,...
            'Style', 'popup', ...
            'Units', 'normalized', ...
            'Position', [0.05, 0.80, 0.9, 0.1], ...
            'String', {'Bar Plot','Line Plot','Stack Chart','Pie Chart','Box and Whiskers Plot'});
        
        h.gobutton_visualize_go  = uicontrol(h.panel20,...
            'Style','pushbutton',...
            'String','Proceed',...
            'Units', 'normalized', ...
            'Position',[0.1 0.01 0.8 0.04]);
        
        set(h.gobutton_visualize_go, 'callback', {@gobutton_visualize_goproc_cat, h}); % Procedure for data visualization
        
end

guidata(hObject,h);


end