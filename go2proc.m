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

function go2proc(hObject, eventdata, h)

questionlistnumber = get(h.researchquestion2,'Value');

switch questionlistnumber
    case 1
        % Quantative Analysis
        %-------------------------------------------------------------------------
        h.radiogroup = uibuttongroup(h.panel3,...
            'Units','normalized',...
            'Position', [0.1 0.07 0.8 0.9]);
        
        h.continuouslabel = uicontrol(h.radiogroup,...
            'Style','radiobutton',...
            'String',' Continuous',...
            'Units', 'normalized', ...
            'Position',[0.2 0.84 0.9 0.1],...
            'HandleVisibility','off');
        
        h.discretelabel = uicontrol(h.radiogroup,...
            'Style','radiobutton',...
            'String',' Discrete',...
            'Units', 'normalized', ...
            'Position',[0.2 0.78 0.9 0.1],...
            'HandleVisibility','off');
        
        h.proceedbutton  = uicontrol(h.panel3,...
            'Style','pushbutton',...
            'String','Go',...
            'Units', 'normalized', ...
            'Position',[0.2 0.025 0.6 0.035]);
        
        set(h.proceedbutton, 'callback', {@proceedbuttonproc1, h});
        
    case 2
        % Qualititative Analysis
        %-------------------------------------------------------------------------
        h.radiogroup = uibuttongroup(h.panel3,...
            'Units','normalized',...
            'Position', [0.1 0.07 0.8 0.9]);
        
        h.nominallabel = uicontrol(h.radiogroup,...
            'Style','radiobutton',...
            'String',' Nominal',...
            'Units', 'normalized', ...
            'Position',[0.2 0.84 0.9 0.1],...
            'HandleVisibility','off');
        
        h.ordinallabel = uicontrol(h.radiogroup,...
            'Style','radiobutton',...
            'String',' Ordinal',...
            'Units', 'normalized', ...
            'Position',[0.2 0.78 0.9 0.1],...
            'HandleVisibility','off');
        
        h.proceedbutton  = uicontrol(h.panel3,...
            'Style','pushbutton',...
            'String','Go',...
            'Units', 'normalized', ...
            'Position',[0.2 0.025 0.6 0.035]);
        
        set(h.proceedbutton, 'callback', {@proceedbuttonproc2, h});
        
    otherwise
        % Do Nothing
        
end
end