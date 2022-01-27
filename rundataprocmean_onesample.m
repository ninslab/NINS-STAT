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

function rundataprocmean_onesample(hObject, eventdata, h)

% Get values from edit boxes
%-------------------------------
mean_val = str2double(get(h.meanval, 'String'));
std_dev_val = str2double(get(h.stdval,'String'));

% Get data column
%-------------------------------
sampledatastr = get(h.uploaddatalabel,'String');
inp_str = sampledatastr;

% Parse data
%-------------------------------
direc = getappdata(0, 'getbrowsedir');
data = readtable(direc);

% Find column number in excel sheet
%-------------------------------
[~,~,raw] = xlsread(direc);
col_arr = raw(1,:);
inp = find(ismember(col_arr, inp_str));

% Applying Z-test for one sample
%-------------------------------
data_inp = table2array(data(:,inp));
[h,p,ci,zval] = ztest(data_inp,mean_val,std_dev_val);

% Display Results
%-------------------------------
fprintf('H Value:');disp(h);
fprintf('P Value:');disp(p);
% fprintf('CI 1:');disp(ci(:,1));
% fprintf('CI 2:');disp(ci(:,2));
fprintf('Z Value:');disp(zval);


end