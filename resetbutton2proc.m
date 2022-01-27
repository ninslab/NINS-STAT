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

function resetbutton2proc(hObject, eventdata, h)

% Reset all function handles for panel 3 and panel 4
%----------------------------------------------------
h = guidata(hObject);

% Find handles for relevant panels
%-----------------------------------------------------

% Panel 3 Handles all
%-----------------------------------------------------
checkbox_panel3 = findall(h.panel3, 'Style', 'checkbox');
pushbutton_panel3 = findall(h.panel3, 'Style', 'pushbutton');
edit_panel3 = findall(h.panel3, 'Style', 'edit');
text_panel3 = findall(h.panel3, 'Style', 'text');

% Panel 4 Handles all
%-----------------------------------------------------
checkbox_panel4 = findall(h.panel4,'Style','checkbox');
pushbutton_panel4 = findall(h.panel4,'Style','pushbutton');
edit_panel4 = findall(h.panel4, 'Style', 'edit' );
text_panel4 = findall(h.panel4, 'Style', 'text' );

% Delete all Handles
%-----------------------------------------------------
delete(checkbox_panel3);
delete(pushbutton_panel3);
delete(edit_panel3);
delete(text_panel3);

delete(checkbox_panel4);
delete(pushbutton_panel4);
delete(edit_panel4);
delete(text_panel4);

% Delete Log File
%-------------------------------------------------------
delete logtextfile.txt;

guidata(hObject,h);

end