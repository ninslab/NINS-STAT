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

function descriptive_analysis_cat_proc(hObject, eventdata, h, selection_index)

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
            VARIABLE = raw(1,datavar2(i));
            
            % Only to count relevant observations
            y_observations = y_values;
            y_observations(isnan(y_observations)) = [];
            [rows, ~] = size(y_observations);
            OBSERVATIONS = rows;
            
            t_init = table(VARIABLE, OBSERVATIONS);
            
            
            tbl = tabulate(y_values);
            tbl = array2table(tbl,'VariableNames', ...
                {'VALUE','COUNT','PERCENT'});
            
            tbl(:, selection_index) = [];
            
            str_txt = strcat('Group -', {' '}, string(un_a(j)));
            disp(str_txt);
            fprintf('######################################## \n\n');
            disp(t_init);
            fprintf('-----------------------------------------\n');
            fprintf('-----------------------------------------\n\n');
            disp(tbl);
            fprintf('######################################## \n\n')
            
        end
        
    end
    
else
    for i=1:len
        y_values = data(:, datavar2(i)); % collecting all y values
        VARIABLE = raw(1,datavar2(i));
        
        % Only to count relevant observations
        y_observations = y_values;
        y_observations(isnan(y_observations)) = [];
        [rows, ~] = size(y_observations);
        
        OBSERVATIONS = rows;
        
        t_init = table(VARIABLE, OBSERVATIONS);
        
        
        tbl = tabulate(y_values);
        tbl = array2table(tbl,'VariableNames', ...
            {'VALUE','COUNT','PERCENT'});
        
        tbl(:, selection_index) = [];
        
        fprintf('######################################## \n\n');
        disp(t_init);
        fprintf('-----------------------------------------\n');
        fprintf('-----------------------------------------\n\n');
        disp(tbl);
        fprintf('######################################## \n\n')
        
    end
    
end

end