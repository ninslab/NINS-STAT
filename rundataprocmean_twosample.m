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

function rundataprocmean_twosample(hObject, eventdata, h)

% % Get values from edit boxes
% %-------------------------------
% mean_val = str2double(get(h.meanval, 'String'));
% std_dev_val = str2double(get(h.stdval,'String'));

% Get data column
%-------------------------------
sampledatastr = get(h.uploaddatalabel,'String');
sampledatastr1 = get(h.uploaddatalabel1,'String');
inp_str = sampledatastr;
inp_str1 = sampledatastr1;

% Parse data
%-------------------------------
direc = getappdata(0, 'getbrowsedir');
data = readtable(direc);

% Find column number in excel sheet
%-------------------------------
[~,~,raw] = xlsread(direc);
col_arr = raw(1,:);
inp = find(ismember(col_arr, inp_str));
inp1 = find(ismember(col_arr, inp_str1));

% % Applying Z-test for one sample
% %-------------------------------
% data_inp = data(:,inp);
% data_inp1 = data(:,inp1);
%
% data_tot = [data_inp, data_inp1];
%
% [h,p,ci,zval] = ztest(data_tot,mean_val,std_dev_val);
%
% % Display Results
% %-------------------------------
% fprintf('H Value:');fprintf(h);fprintf('\n');
% fprintf('P Value:');fprintf(p);fprintf('\n');
% fprintf('CI 1:');fprintf(ci(:,1));fprintf('\n');
% fprintf('CI 2:');fprintf(ci(:,2));fprintf('\n');
% fprintf('Z Value:');fprintf(zval);fprintf('\n');

% Applying Algorithm
%--------------------------

% Check condition if the sample is large or small
% -----------------------------------------------
%{
  Condition for testing if sample is small
    - Cell frequency < 5
    - Sample size <  30
%}

small_large_var = small_large_var_proc(direc, inp, inp1);
% small_large_var = 2;

if small_large_var == 1
    
    % Small sample
    %--------------------------
    % Applying Fisher Exact test
    % fishertestproportions(direc, cat1num, cat2num, alphaval);
    
    % Applying Levene test
    %-------------------------------------------------------------------------
    fprintf('------------------- \n');
    fprintf('Data = Levene Test  \n');
    fprintf('------------------- \n');
    r = levene_var_check(data,inp, inp1);
    
    if r == 1
        fprintf('Levene Test (Variance of Two Samples is Equal) : Passed \n\n');
        fprintf('Test -----> Two Sample T Test \n');
        fprintf('--------------------------------------------------\n');
        fprintf('Results : \n\n');
        
        % Applying Function
        %------------------
        two_sample_ttest(data, inp, inp1);
    else
        fprintf('Levene Test (Variance of Two Samples is Equal) : Fail \n\n');
        fprintf('Test -----> Welch T-Test \n');
        fprintf('--------------------------------------------------\n');
        fprintf('Results : \n\n');
        
        % Applying Function
        %------------------
        welch_t_test_sample(data, inp, inp1);
    end
    
else
    % Large sample
    %--------------------------
    % Applying Z-Test
    
    % Delete existing handles
    %----------------------------------------------
    
    h.radiogroup4 = uibuttongroup(h.panel11,...
        'Units','normalized',...
        'Position', [0.05 0.05 0.90 0.5]);
    
    h.mean_sample1= uicontrol(h.radiogroup4,...
        'Style','text',...
        'String','Mean (Sample 1)',...
        'Units', 'normalized', ...
        'Position',[0.01 0.60 0.5 0.3]);
    
    h.mean_sample1_val = uicontrol(h.radiogroup4 ,...
        'Style','edit',...
        'String','',...
        'Units', 'normalized', ...
        'Position',[0.45 0.78 0.3 0.15]);
    
    h.mean_sample2 = uicontrol(h.radiogroup4,...
        'Style','text',...
        'String','Mean (Sample 2)',...
        'Units', 'normalized', ...
        'Position',[0.01 0.45 0.5 0.2]);
    
    h.mean_sample2_val = uicontrol(h.radiogroup4 ,...
        'Style','edit',...
        'String','',...
        'Units', 'normalized', ...
        'Position',[0.45 0.52 0.3 0.15]);
    
    h.std_sample1= uicontrol(h.radiogroup4,...
        'Style','text',...
        'String','SD (Sample 1)',...
        'Units', 'normalized', ...
        'Position',[0.01 0.20 0.5 0.2]);
    
    h.std_sample1_val = uicontrol(h.radiogroup4 ,...
        'Style','edit',...
        'String','',...
        'Units', 'normalized', ...
        'Position',[0.45 0.28 0.3 0.15]);
    
    h.std_sample2 = uicontrol(h.radiogroup4,...
        'Style','text',...
        'String','SD (Sample 2)',...
        'Units', 'normalized', ...
        'Position',[0.01 0.01 0.5 0.2]);
    
    h.std_sample2_val = uicontrol(h.radiogroup4 ,...
        'Style','edit',...
        'String','',...
        'Units', 'normalized', ...
        'Position',[0.45 0.08 0.3 0.15]);
    
    h.runmean = uicontrol(h.panel4,...
        'Style','pushbutton',...
        'String','Run',...
        'Units', 'normalized', ...
        'Position',[0.2 0.025 0.6 0.035]);
    
    set(h.runmean, 'callback',{@run_twosample_ztest, h, data, inp, inp1});
    %chi_square_large_sample(direc, cat1num, cat2num, alphaval);
end

guidata(hObject,h);


% diary off
% displaycommands(hObject, eventdata, h);

end