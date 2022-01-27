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

function rocccurveplotprocedure(inp_continuous_val,inp_continuous_val_label, inp_cat_val, inp_cat_lab, posclass, len)

X_all = cell([1 len]);
Y_all = cell([1 len]);
labelname_all = cell([1 len]);

xlabel_str = 'False Positive Rate';
ylabel_str = 'True Positive Rate';

fprintf('Test -----> ROC Plot & Analysis \n');
fprintf('--------------------------------------------------\n');
fprintf('Results : \n\n');

datac = [inp_cat_val, inp_continuous_val];
alterdata = rmmissing(datac);
[~,column] = size(alterdata);
groupvar = alterdata(:,1);
contvar = alterdata(:,2:column);

% % Plot ROC for all the classes
% mdl = fitglm(contvar, groupvar, 'Distribution','binomial','Link','logit');
% scores = mdl.Fitted.Probability;
% [X,Y,~,AUC] = perfcurve(groupvar, scores, posclass);
% fprintf('ROC for Total ----- >  \n');
% figure;plot(X,Y);
% title([inp_cat_lab,'vs',inp_continuous_val_label(1)]);xlabel(xlabel_str);ylabel(ylabel_str);
% fprintf('Area Under Curve (AUC) : ');
% disp(AUC);

% Plot ROC for individual classes wrt total.
% Multi ROC plot

for i = 1:len
    labelname = inp_continuous_val_label(i);
    data_bin_value = groupvar;
    data_cont_value = contvar(:,i);
    [X1,Y1,~,AUC1,OPTROCPT] = perfcurve(data_bin_value, data_cont_value, posclass);
    figure;plot(X1,Y1,'LineWidth',1.5);
    hold on;
    plot(OPTROCPT(1),OPTROCPT(2),'ro')
    title([inp_cat_lab,'vs',labelname], 'Interpreter', 'none');xlabel(xlabel_str,'Interpreter', 'none');ylabel(ylabel_str,'Interpreter', 'none');
    X_all{i} = X1;
    Y_all{i} = Y1;
    labelname_all{i} = labelname;
    %     fprintf('Area Under Curve %d',i);
    %     disp(AUC1);
    %     fprintf('\n');
    
    line([0 1],[0 1],'Color','k');
    
end

figure; hold on

for i = 1: len
    plot(X_all{i}, Y_all{i},'LineWidth',1.5,'DisplayName', char(labelname_all{i}));
    xlabel(xlabel_str,'Interpreter', 'none');
    ylabel(ylabel_str,'Interpreter', 'none');
    legend('show', 'Location','southeast');
    title('ROC Comparison','Interpreter', 'none');
end


% Draw a reference line
line([0 1],[0 1],'Color','k', 'DisplayName', 'Ref line');

end