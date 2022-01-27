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

function runcontinuousdataproc(hObject, eventdata, h)

% Initialize Variables
%-------------------------------------------------------------------
continuousinp1vallabelval = get(h.continuousinp1vallabel, 'String');
continuousinp2vallabelval = get(h.continuousinp2vallabel, 'String');

% Reading Excel Sheet
%-------------------------------------------------------------------
direc = getappdata(0, 'getbrowsedir');
data = readtable(direc);

% Extracting Data
%-------------------------------------------------------------------
[~,~,raw] = xlsread(direc);
numcol = raw(1,:);
numcol = numcol(cellfun('isclass', numcol,'char')); %remove non char values from the array
contval1 = find(ismember(numcol, continuousinp1vallabelval)); % extract column number
contval2 = find(ismember(numcol, continuousinp2vallabelval)); % extract column number
data1 = table2array(data(:, contval1));
data2 = table2array(data(:, contval2));

% Processing Data Further
%-------------------------------------------------------------------
inp = [contval1, contval2];
s = normal_distribution(data,inp);

if s == 1
    
    % Data is Normalized
    fprintf('----------------------------------------------------- \n');
    fprintf('Parameter A : Pass  \n');
    fprintf('Test -----> Karl Pearson Test \n');
    fprintf('--------------------------------------------------\n');
    fprintf('Results : \n\n');
    
    %--------------- Karl Pearson Test Function----------------------
    %----------------------------------------------------------------
    [rho, pval] = corr(data1, data2, 'Type', 'Pearson','rows','complete');
    
    % Display Results
    %---------------------------------------------------------------
    Rho_Value = rho;
    P_value = estimateto001(pval);
    
    % Display Results on Table
    %---------------------------------------------------------------
    T = table(Rho_Value,P_value);
    disp(T);
    
else
    
    % Data is not Normalized
    fprintf('------------------- \n');
    fprintf('Data : Log Transformed \n');
    fprintf('------------------- \n');
    
    % Converting to Log Transform  - log (Base 10)
    temp = log10(table2array(data));
    logdata = array2table(temp);
    
    
    s = normal_distribution(logdata, inp);
    if s == 1
        % Log transformed Data is Normalized
        fprintf('Test -----> Karl Pearson Test \n');
        fprintf('--------------------------------------------------\n');
        fprintf('Results : \n\n');
        
        %--------------- Karl Pearson Test Function----------------------
        %----------------------------------------------------------------
        [rho, pval] = corr(data1, data2, 'Type', 'Pearson','rows','complete');
        
        % Display Results
        %---------------------------------------------------------------
        Rho_Value = rho;
        P_value = estimateto001(pval);
        
        % Display Results on Table
        %---------------------------------------------------------------
        T = table(Rho_Value,P_value);
        disp(T);
        %----------------------------------------------------------------
    else
        % Log transformed Data is not Normalized
        fprintf('Test -----> Spearman Correlation Test \n');
        fprintf('--------------------------------------------------\n');
        fprintf('Results : \n\n');
        
        %--------------- Spearman Correlation Test Function-------------
        %----------------------------------------------------------------
        [rho, pval] = corr(data1, data2, 'Type', 'Spearman','rows','complete');
        
        % Display Results
        %---------------------------------------------------------------
        Rho_Value = rho;
        P_Value = estimateto001(pval);
        
        % Display Results on Table
        %---------------------------------------------------------------
        T = table(Rho_Value, P_Value);
        disp(T);
        %---------------------------------------------------------------
    end
end

end