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

function proportionlistproc(hObject, eventdata, h)

% Delete existing handles from Panel 4
%-----------------------------------------------------
radiobutton_panel4 = findall(h.panel4,'Style','radiobutton');
pushbutton_panel4 = findall(h.panel4,'Style','pushbutton');
edit_panel4 = findall(h.panel4, 'Style', 'edit' );
text_panel4 = findall(h.panel4, 'Style', 'text' );
panel10_label = findall(h.panel4,'title', 'B');
panel11_label = findall(h.panel4,'title', 'C');

delete(radiobutton_panel4);
delete(pushbutton_panel4);
delete(edit_panel4);
delete(text_panel4);
delete(panel10_label);
delete(panel11_label);

% Create new panel for objective
%----------------------------------------
h.panel9 = uipanel(h.panel4,...
    'Title','A',...
    'Position',[.05 .78 .9 .2]);

h.radiogroup1 = uibuttongroup(h.panel9,...
    'Units','normalized',...
    'Position', [0.05 0.07 0.90 0.9]);

h.sample1 = uicontrol(h.radiogroup1,...
    'Style','radiobutton',...
    'String','    One Sample Analysis',...
    'Units', 'normalized', ...
    'Position',[0.25 0.75 0.92 0.2],'HandleVisibility','off');

h.sample2 = uicontrol(h.radiogroup1,...
    'Style','radiobutton',...
    'String','    Two Sample Analysis',...
    'Units', 'normalized', ...
    'Position',[0.25 0.55 0.92 0.2],'HandleVisibility','off');

h.sample3 = uicontrol(h.radiogroup1,...
    'Style','radiobutton',...
    'String','   >Two Sample Analysis',...
    'Units', 'normalized', ...
    'Position',[0.25 0.35 0.92 0.2],'HandleVisibility','off');

h.proceedbutton = uicontrol(h.radiogroup1,...
    'Style','pushbutton',...
    'String','Proceed',...
    'Units', 'normalized', ...
    'Position',[0.25 0.10 0.4 0.2]);

% Button Function
%-----------------
set(h.proceedbutton, 'callback',{@proceedbuttonproc, h});

guidata(hObject,h)

end