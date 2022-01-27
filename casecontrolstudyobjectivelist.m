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

function casecontrolstudyobjectivelist(hObject, eventdata, h)

% Available Objectives :
% 1) Proportions
% 2) Mean
% 3) Association
% 4) Agreement
% 5) Predictors of an Outcome (Regression Analysis)

h.radiogroup = uibuttongroup(h.panel3,...
    'Units','normalized',...
    'Position', [0.1 0.07 0.8 0.9]);

h.enterdirectory = uicontrol(h.radiogroup,...
    'Style','text',...
    'String','Recommended',...
    'Units', 'normalized', ...
    'Position',[0.05, 0.86, 0.5, 0.1]);

h.proportionoption = uicontrol(h.radiogroup,...
    'Style','radiobutton',...
    'String',' Proportions',...
    'Units', 'normalized', ...
    'Position',[0.2 0.82 0.9 0.1],...
    'HandleVisibility','off');

h.meanoption = uicontrol(h.radiogroup ,...
    'Style','radiobutton',...
    'String',' Mean',...
    'Units', 'normalized', ...
    'Position',[0.2 0.76 0.9 0.1],...
    'HandleVisibility','off');

h.associationoption = uicontrol(h.radiogroup ,...
    'Style','radiobutton',...
    'String',' Association',...
    'Units', 'normalized', ...
    'Position',[0.2 0.70 0.9 0.1],...
    'HandleVisibility','off');

h.regressionoption = uicontrol(h.radiogroup ,...
    'Style','radiobutton',...
    'String',' Regression',...
    'Units', 'normalized', ...
    'Position',[0.2 0.64 0.9 0.1],...
    'HandleVisibility','off');

h.oddsratiooption = uicontrol(h.radiogroup ,...
    'Style','radiobutton',...
    'String',' Odds Ratio',...
    'Units', 'normalized', ...
    'Position',[0.2 0.58 0.9 0.1],...
    'HandleVisibility','off');

h.enterdirectory = uicontrol(h.radiogroup,...
    'Style','text',...
    'String','Optional',...
    'Units', 'normalized', ...
    'Position',[0.01, 0.33, 0.4, 0.1]);

h.survivaloption = uicontrol(h.radiogroup ,...
    'Style','radiobutton',...
    'String',' Survival',...
    'Units', 'normalized', ...
    'Position',[0.2 0.27 0.9 0.1],...
    'HandleVisibility','off');

h.diagnosticoption = uicontrol(h.radiogroup ,...
    'Style','radiobutton',...
    'String',' Diagnostic',...
    'Units', 'normalized', ...
    'Position',[0.2 0.21 0.9 0.1],...
    'HandleVisibility','off');

h.agreementoption = uicontrol(h.radiogroup ,...
    'Style','radiobutton',...
    'String',' Agreement',...
    'Units', 'normalized', ...
    'Position',[0.2 0.15 0.9 0.1],...
    'HandleVisibility','off');

h.incidenceoption = uicontrol(h.radiogroup ,...
    'Style','radiobutton',...
    'String',' Incidence',...
    'Units', 'normalized', ...
    'Position',[0.2 0.09 0.9 0.1],...
    'HandleVisibility','off');

h.relativeriskoption = uicontrol(h.radiogroup ,...
    'Style','radiobutton',...
    'String',' Relative Risk',...
    'Units', 'normalized', ...
    'Position',[0.2 0.03 0.9 0.1],...
    'HandleVisibility','off');

h.startbutton  = uicontrol(h.panel3,...
    'Style','pushbutton',...
    'String','Proceed',...
    'Units', 'normalized', ...
    'Position',[0.2 0.025 0.6 0.035]);

set(h.startbutton, 'callback', {@startproc, h});

end