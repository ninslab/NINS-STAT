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

% Delete Text Files
%------------------------
function allData = ReadVerTxtData(filename,NumVar)

fid=fopen(filename,'r');
tline1 = fgetl(fid);    %%ï»¿Vernier Format 2
tline2 = fgetl(fid);    %Untitled.cmbl 4/7/2008 20:19:02 .
tline3 = fgetl(fid);    %Latest
tline4 = fgetl(fid);    %Time  Potential
tline5 = fgetl(fid);    %t  Pot
tline6 = fgetl(fid);    %s  V
tline7 = fgetl(fid);    %
tline8 = fgetl(fid);    %0  7.60683760684
allData=fscanf(fid,'%f',[NumVar,Inf]);  %
fclose(fid);

end