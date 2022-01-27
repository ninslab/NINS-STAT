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

function runcbdataupload(hObject, eventdata, h)

% Initialize variables
%-------------------------------------
direc = getappdata(0, 'getbrowsedir');
data = xlsread(direc);

cbinp1vallabelval = get(h.cbinp1vallabel, 'String');
cbinp2vallabelval = get(h.cbinp2vallabel, 'String');

% Extract column number
%-------------------------------------
[~,~,raw] = xlsread(direc);
numcol = raw(1,:);
numcol = numcol(cellfun('isclass', numcol,'char')); %remove non char values from the array
cinp1 = find(contains(numcol, cbinp1vallabelval)); % extract column number
cinp2 = find(contains(numcol, cbinp2vallabelval)); % extract column number
inp = [cinp1, cinp2];
data_1 = data(:, cinp1);
data_2 = data(:, cinp2);

fprintf('--------------------------------------- \n');
fprintf('Parameter A : Cell Check = To check if value of cell is < 5 \n');
fprintf('--------------------------------------- \n');
f = cellcheck(data, inp);

% Decision Algorithm
%--------------------------------------
if f == 1
    fprintf('Parameter A : Pass \n');
    fprintf('Test -----> Fisher Exact Test \n');
    fprintf('--------------------------------------------------\n');
    fprintf('Results : \n\n');
    
    %---------------------Fisher Exact test Algorithm---------------------
    %---------------------------------------------------------------------
    tab = crosstab(data_1, data_2);
    fprintf('Cross-Tabulated Data : ');disp(tab);
    
    % Algorithm
    %---------------------------------------------------------------------
    [h,p,stats] = fishertest(tab);
    
    % Display Results
    %---------------------------------------------------------------------
    H_Value = h;
    P_Value = estimateto001(p);
    Odds_Ratio = stats.OddsRatio;
    CI_1 = stats.ConfidenceInterval(1,1);
    CI_2 = stats.ConfidenceInterval(1,2);
    
    % Display Results in Table
    %---------------------------------------------------------------------
    T = table(H_Value,P_Value, Odds_Ratio, CI_1, CI_2);
    disp(T);
else
    fprintf('Parameter A : Fail \n');
    fprintf('Test -----> Chi-Squared Test \n');
    fprintf('--------------------------------------------------\n');
    fprintf('Results : \n\n');
    
    %-------------------- Chi-Square Test---------------------------------
    %---------------------------------------------------------------------
    [tbl,chi2,p,~] = crosstab(data_1, data_2);
    disp(tbl);
    
    % Display Results
    %---------------------------------------------------------------------
    P_Value = estimateto001(p);
    Chi_Value = chi2;
    
    % Display Results in Table
    %---------------------------------------------------------------------
    T = table(P_Value, Chi_Value);
    disp(T);
end
diary off
displaycommands(hObject, eventdata, h);
end