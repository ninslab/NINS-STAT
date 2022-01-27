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

function rocccurveplotproceduresingle(cont_data_val,controclabelval, bin_data_val, binaryroclabelval, posclass)

% ROC plot using Matlab
xlabel_str = 'False Positive Rate';
ylabel_str = 'True Positive Rate';

fprintf('Test -----> ROC Plot & Analysis \n');
fprintf('--------------------------------------------------\n');
fprintf('Results : \n\n');

data_bin_value = bin_data_val;
data_cont_value  = cont_data_val;
[X,Y,~,AUC,OPTROCPT] = perfcurve(data_bin_value, data_cont_value, posclass);
figure;plot(X,Y,'LineWidth',1.5); 
hold on;
plot(OPTROCPT(1),OPTROCPT(2),'ro');
title([controclabelval, 'vs', binaryroclabelval],'Interpreter','none');
xlabel(xlabel_str); ylabel(ylabel_str);

% fprintf('Area Under Curve (AUC)');
% disp(AUC); fprintf('\n');
line([0 1],[0 1],'Color','k');


end