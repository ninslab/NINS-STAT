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

function relativerisklistproc(hObject, eventdata, h)

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

% h.hypothetical = uicontrol(h.radiogroup1,...
%     'Style','text',...
%     'String','Hypothetical Value',...
%     'Units', 'normalized', ...
%     'Position',[0.01 0.65 0.5 0.2]);
%
% h.hypotheticalvalue = uicontrol(h.radiogroup1,...
%     'Style','edit',...
%     'String','',...
%     'Units', 'normalized', ...
%     'Position',[0.45 0.65 0.3 0.3]);

h.uploaddatastring1 = uicontrol(h.radiogroup1,...
    'Style','text',...
    'String','Upload Data 1',...
    'Units', 'normalized', ...
    'Position',[0.01 0.40 0.3 0.3]);

h.uploaddata1 = uicontrol(h.radiogroup1 ,...
    'Style','pushbutton',...
    'String','Upload',...
    'Units', 'normalized', ...
    'Position',[0.35 0.50 0.4 0.3]);

h.mean2num1label = uicontrol(h.radiogroup1 ,...
    'Style','edit',...
    'String',' ',...
    'Units', 'normalized', ...
    'Position',[0.76 0.50 0.2 0.3],...
    'Max',100);

h.uploaddatastring2 = uicontrol(h.radiogroup1,...
    'Style','text',...
    'String','Upload Data 2',...
    'Units', 'normalized', ...
    'Position',[0.01 0.05 0.3 0.3]);

h.uploaddata2 = uicontrol(h.radiogroup1 ,...
    'Style','pushbutton',...
    'String','Upload',...
    'Units', 'normalized', ...
    'Position',[0.35 0.10 0.4 0.3]);

h.mean2num2label = uicontrol(h.radiogroup1 ,...
    'Style','edit',...
    'String',' ',...
    'Units', 'normalized', ...
    'Position',[0.76 0.10 0.2 0.3],...
    'Max',100);

h.rundata = uicontrol(h.panel4 ,'Style','pushbutton',...
    'String','Run',...
    'Units', 'normalized', ...
    'Position',[0.2 0.025 0.6 0.035]);

% Button Function
%------------------
set(h.uploaddata1, 'callback',{@mean2num1valupload, h});
set(h.uploaddata2, 'callback',{@mean2num2valupload, h});
set(h.rundata, 'callback',{@relativeriskproc, h});

guidata(hObject,h)


end