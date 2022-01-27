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

function descriptive_analysis_proc(hObject, eventdata, h, selection_index)

% Extract Data from Browse Path
%------------------------------------------------------------------------
direc = getappdata(0, 'getbrowsedir');

% Get Inputs from handles
%------------------------------------------------------------------------
% datavar_cont1 = get(h.cont_var_edit, 'String');
datavar_cont2 = get(h.cont_var_edit1, 'String');
group_var = get(h.group_var_edit, 'String');

% Extract column number values
%------------------------------------------------------------------------
[~,~,raw] = xlsread(direc);
numcol = raw(1,:);
numcol = numcol(cellfun('isclass', numcol,'char')); %remove non char values from the array
datavar2 = find(contains(numcol, datavar_cont2 )); % extract column number
group_num = find(contains(numcol, group_var )); % extract column number

len = length(datavar2);
data = xlsread(direc);

group_var = group_var(find(~isspace(group_var)));

if ~isempty(group_var)
    % grouping var is there
    gr_var = data(:, group_num);
    un_a = unique(gr_var);
    len1 = length(un_a);
    
    for j=1:len1
        grp_vr = un_a(j);
        indx_grp = find(gr_var == grp_vr);
        
        for i=1:len
            y_values = data(indx_grp, datavar2(i)); % collecting all y values
            
            % Only to count relevant observations
            y_observations = y_values;
            y_observations(isnan(y_observations)) = [];
            [rows, ~] = size(y_observations);
            % [rows, ~] = size(y_values);
            
            y_values = rmmissing(y_values);
            VARIABLE(i,1) = raw(1,datavar2(i));
            OBSERVATIONS(i,1) = rows;
            MEAN(i,1) = mean(y_values);
            MEDIAN(i,1) = median(y_values);
            MODE(i,1) = mode(y_values);
            SD(i,1) = std(y_values);
            RANGE(i,1) = range(y_values);
            IQR(i,1) = iqr(y_values);
            CV(i,1) = ((std(y_values))/(mean(y_values)));
            
        end
        
        selection_val = selection_index + 1;
        t = table(VARIABLE, OBSERVATIONS, MEAN, MEDIAN, MODE, SD, CV, RANGE, IQR);
        t(:, selection_val) = [];
        
        str_txt = strcat('Group -', {' '}, string(un_a(j)));
        disp(str_txt);
        disp(t);
        
    end
    
else
    % grouping var is not there
    for i=1:len
        y_values = data(:, datavar2(i)); % collecting all y values
        VARIABLE(i,1) = raw(1,datavar2(i));
        
        % Only to count relevant observations
        y_observations = y_values;
        y_observations(isnan(y_observations)) = [];
        [rows, ~] = size(y_observations);
        % [rows, ~] = size(y_values);
        
        OBSERVATIONS(i,1) = rows;
        MEAN(i,1) = nanmean(y_values);
        MEDIAN(i,1) = nanmedian(y_values);
        MODE(i,1) = mode(y_values);
        SD(i,1) = nanstd(y_values);
        RANGE(i,1) = range(y_values);
        IQR(i,1) = iqr(y_values);
        CV(i,1) = ((std(y_values))/(mean(y_values)));
        
    end
    
    selection_val = selection_index + 1;
    t = table(VARIABLE, OBSERVATIONS, MEAN, MEDIAN, MODE, SD, CV, RANGE, IQR);
    t(:, selection_val) = [];
    disp(t);
end

end