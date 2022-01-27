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

function [p] = estimateto001(arg)

% Check if value(inp) is below 0.001
% Remove original value and input val < 0.001

% Initialize Variable
%--------------------
inp = arg;

% Decision Loop
%--------------------
if inp < 0.001
    val = 0.001;
    p = val;
else
    val = inp;
    p = val;
end
end



