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

function [h] = condition_test(user_input, inp)

% Initialize variables
%----------------------
K=[]; F = [];
a = length(inp);

% Parse thorough Data
%----------------------
for i = 1: a
    data = user_input(:, inp(i));
    g = std(data);
    K = [K;i g];
    F = [F;g];
end

fprintf('\t S.no \t Stn Dev\n ');
disp(K);

C = max(F);
C1 = min(F);

% Decision Loop
%--------------------
if C < (2*C1)
    h =1;
    return;
else
    h=3;
    return;
end
end
