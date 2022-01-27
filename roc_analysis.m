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

function roc_analysis(cont_data_num, bin_data_val, posclass)

d_cont = cont_data_num;
d_bin = bin_data_val;

[X,Y,T, AUC, OPT] = perfcurve(d_bin, d_cont, posclass);

spec_val = OPT(2);
sens_val = (1 - OPT(1));
yi_val = ((sens_val +  spec_val) - 1);
lr_positive = sens_val / (1 - spec_val);
lr_negative = (1 - sens_val) / spec_val;

idx_X = find(abs(X-OPT(1))<1e-3);
idx_Y = find(abs(Y-OPT(2))<1e-3);
thresh_num = intersect(idx_X, idx_Y);

if length(thresh_num) == 1
    thresh_val = T(thresh_num);
else
    fprintf('Multiple threshold values... Somthing is wrong with the data \n');
end

len = length(d_cont);
arr_num = [];

for i = 1:len
    prim_num = d_cont(i,1);
    
    if prim_num >= thresh_val
        arr_num(i,1) = 1;
    else
        arr_num(i,1) = 0;
    end
    
end

tbl = crosstab(d_bin, arr_num);
fp_val = tbl(1,1);
tn_val = tbl(1,2);
tp_val = tbl(2,1);
fn_val = tbl(2,2);

ppv = (tp_val)/(tp_val + fp_val);
npv = (tn_val)/(tn_val + fn_val);
acc = (tp_val + tn_val)/(tp_val + tn_val + fp_val + fn_val);
f1_score = (2 * tp_val) / ((2 * tp_val) + fp_val + fn_val);


% fprintf('Specificity : '); disp(spec_val);
% fprintf('Sensitivity : ');disp(sens_val);
% fprintf('AUC : ');disp(AUC);
% fprintf('Youden Index : ');disp(yi_val);
% fprintf('LR +ve : ');disp(lr_positive);
% fprintf('LR -ve : '); disp(lr_negative);
% fprintf('PPV : ');disp(ppv);
% fprintf('NPV : ');disp(npv);
% fprintf('Accuracy : ');disp(acc);
% fprintf('F1-Score : ');disp(f1_score);
%
% fprintf('TP : ');disp(tp_val);
% fprintf('FN : ');disp(fn_val);
% fprintf('FP : ');disp(fp_val);
% fprintf('TN : ');disp(tn_val);

T = table(spec_val, sens_val,AUC, yi_val,lr_positive,lr_negative ,'VariableNames',{'Specificity','Sensitivity','AUC','YI','LR_positive','LR_negative '});
T1 = table(tp_val,fn_val, fp_val, tn_val,'VariableNames',{'TP','FN','FP','TN'});
T2 = table(ppv, npv, acc, f1_score,'VariableNames',{'PPV','NPV','Accuracy','F1_score'});

fprintf('############################ ROC Tabular Values ################################## \n\n');
fprintf('---------------------------------------------------------------------------------- \n');
disp(T);
fprintf('---------------------------------------------------------------------------------- \n');
fprintf('################################################################################## \n\n');
fprintf('---------------------------------------------------------------------------------- \n');
disp(T1);
fprintf('---------------------------------------------------------------------------------- \n');
fprintf('################################################################################## \n\n');
fprintf('---------------------------------------------------------------------------------- \n');
disp(T2);
fprintf('---------------------------------------------------------------------------------- \n');
fprintf('################################################################################## \n\n');

end