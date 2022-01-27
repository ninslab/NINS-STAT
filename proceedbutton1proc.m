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

function proceedbutton1proc(hObject, eventdata, h)

% Initialize Variables
%-----------------------------------------------
sample1val = get(h.sample1, 'Value');
direc = getappdata(0, 'getbrowsedir2');
data = xlsread(direc);

var1valuelabelval = get(h.browselabel, 'String');
cells = cellstr(var1valuelabelval);
len = length(cells);

for i = 1: len
    d(:,i) = data(:, str2double(cells{i}));
end

% Decision Algorithm
%------------------------------------------------

switch sample1val
    
    case 1
        % Frequency
        %------------------------------------
        frequencyproc(d);
    case 2
        % Percentage
        %------------------------------------
        percentageproc(d);
    case 3
        % Mode
        %------------------------------------
        modeproc(d);
    case 4
        % Bar Chart
        %------------------------------------
        barchartproc(d);
    case 5
        % Pie Chart
        %------------------------------------
        piechartproc(d);
    case 6
        % Stack Chart
        %------------------------------------
        stackchartproc(d);
    otherwise
        % Do Nothing
end

diary off
displaycommands(hObject, eventdata, h);

end