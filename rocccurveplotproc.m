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

function rocccurveplotproc(inp_continuous_val, inp_cat_val, posclass, len)

X_all = cell([1 len]);
Y_all = cell([1 len]);

fprintf('Test -----> ROC Plot & Analysis \n');
fprintf('--------------------------------------------------\n');
fprintf('Results : \n\n');


for i = 1:len
    
    data_bin_value = inp_cat_val;
    data_cont_value = inp_continuous_val(:, i);
    [X,Y,~,AUC] = perfcurve(data_bin_value, data_cont_value, posclass);
    X_all{i} = X;
    Y_all{i} = Y;
    fprintf('Area Under Curve %d',i);
    disp(AUC);
    fprintf('\n');
    
end

figure; hold on

xlabel_str = 'False Positive Rate';
ylabel_str = 'True Positive Rate';
% fprintf('Area Under Curve : ');
% disp(AUC);

for i = 1: len
    
    plot(X_all{i}, Y_all{i});
    xlabel(xlabel_str);
    ylabel(ylabel_str);
    
end

end