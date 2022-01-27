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

function proceedbutton2proc(hObject, eventdata, h)

% Initialize Variables
%-----------------------------------------------
sample2val = get(h.sample1, 'Value');
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

switch sample2val
    
    case 1
        % Mean
        %------------------------------------
        meanproc(d);
    case 2
        % Standard Deviation
        %------------------------------------
        stdeviationproc(d);
    case 3
        % Median
        %------------------------------------
        medianproc(d);
    case 4
        % IRQ
        %------------------------------------
        irqproc(d);
    case 5
        % histogram
        %------------------------------------
        histogramproc(d);
    case 6
        % Line Chart
        %------------------------------------
        linechartproc(d);
    case 7
        % Box Plot
        %------------------------------------
        boxplotproc(d);
    case 8
        % Scatter Plot
        %------------------------------------
        scatterplotproc(d);
    otherwise
        % Do Nothing
end

diary off
displaycommands(hObject, eventdata, h);

end