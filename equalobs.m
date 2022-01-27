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

function [g] = equalobs(data)

% Initialize variables
%----------------------
[~, columns] = size(data);
count = 0;

% Iterate and Count
%-----------------------
for col5= 2: columns
    a = table2array(data(:, col5));
    y = length(a);
    m(col5) = y;
end

for i = 2: (col5 -1)
    if(m(i) == m(i+1))
        count = count + 1;
    else
        count = count -1;
    end
end

% Decision Loop
%-----------------------
if(count == (col5 - 2))
    g = 1;
    return;
else
    g = 2;
    return;
end
end
