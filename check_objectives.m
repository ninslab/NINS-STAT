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


function check_objectives(user_input)

study_objectives = input(sprintf('Please specify your Objectives under the given options (1/2/3/4/5/6/7)): \n 1)Prevalence/Proportion \n 2)Mean \n 3)Correlation/Association \n 4)Agreement/Concordance between parameters \n 5)Diagnostic Test \n 6)Predictors of an Outcome (Regression Analysis) \n 7)Survival Outcomes \n'));

switch study_objectives
    case 1
        disp('Selected Objective : Proportion');
        proportion_input = input(sprintf('Please select the type of Proportion Analysis: \n 1) One Sample 2) two Sample'));
        
        switch proportion_input
            case 1
                
                fprintf('Proceeding with One Sample Proportion Analysis..........\n\n');
                binomial_test_objective(user_input);
                
            case 2
                fprintf('Proceeding for Two Sample Proportion Analysis.....\n');
                fprintf('Determining Small or Larger Prportion Condition............\n\n');
                
                s = input(sprintf(' Select the type of Prevalence (1/2) : \n\n 1) Large Proportion/ Prevalence  \n 2) Small Proportion/ Prevalence \n'));
                
                if s == 1
                    
                    ztest_prop_new;
                else
                    
                    fish(user_input);
                end
                
            otherwise
                
                fprintf('Choose a valid option.....\n\n');
                fprintf('Exiting Process.....\n');
                
        end
    case 2
        disp('Selected Objective : Mean');
        fprintf('Proceeding Forward....\n');
        mean_type_input = input(sprintf('Please select the type Mean Analysis: \n 1)One Sample \n 2)Two Sample \n 3)More than 2 Sample '));
        switch mean_type_input
            case 1
                fprintf('Proceeding with One Sample Analysis.........\n');
                fprintf('One Sample Mean test using hypothetical value......\n');
                hypo_val = input(sprintf('Please enter a hypothetical value for further analysis.........\n'));
                
                fprintf('Select Sample space for further analysis.......\n ');
                inp = input(sprintf('Enter for Sample Variable......\n'));
                
                s = normal_distribution(user_input, inp);
                if (s == 1)
                    fprintf('Applying Student T-Test for One Sample Mean Analysis........\n');
                    student_t_test(user_input,hypo_val,inp);
                else
                    fprintf('Applying Wilcoxon Signed-Rank test.........\n\n');
                    fprintf('Applying Log Transform on the Data..........\n');
                    log_transform_user_data = log10(user_input);
                    normal_distribution(log_transform_user_data, inp);
                    
                    if (s == 1)
                        fprintf('Log Transformed Data is Normally Distributed........\n\n');
                        fprintf('Proceeding forward....\n');
                        fprintf('Applying Student T-Test for One Sample Mean Analysis......\n');
                        student_t_test(user_input,hypo_val,inp);
                    else
                        fprintf('Log Transformed Data is also not Normally Distributed.....\n\n');
                        fprintf('Proceeding Forward.....\n');
                        fprintf('Applying Wilcoxon Signed Rank Test........\n\n');
                        wilcoxon_sign_rank_test(user_input,inp,hypo_val);
                    end
                end
            case 2
                fprintf('Proceeding with Two Sample Analysis.........\n');
                variable_input = input(sprintf('Please define the type of variable: \n\n 1) Independent Variable \n 2) Paired Variable \n'));
                
                switch(variable_input)
                    case 1
                        fprintf('Moving forward with Independent Variable Analysis.......\n');
                        fprintf('Please input the Categorical Variable for Analysis......\n');
                        inp_cat = input(sprintf('Add Sample Variable...........\n'));
                        fprintf('Please input the Numerical Variables for Analysis.........\n');
                        inp_num = input(sprinf('Add Sample Variable..............\n'));
                        s = normal_distribution(user_input, inp_num);
                        
                        if (s == 1)
                            fprintf('Checking for variance in the given population..........\n\n');
                            r = levene_var_check(user_input,inp_num);
                            
                            if (r == 1)
                                fprintf('Variance of the two samples is EQUAL...........\n\n');
                                fprintf('Proceeding to Two-Sample T Test...........\n');
                                two_sample_ttest(user_input,inp_cat,inp_num);
                            else
                                fprintf('Variance of the two samples is NOT EQUAL.......\n\n');
                                fprintf('Proceeding tp perform Aspin-Welsh Unequal Variance Test.......\n');
                                welch_t_test_sample(user_input, inp_cat, inp_num);
                            end
                        else
                            
                            fprintf('Applying Log Transform to all data.............\n\n');
                            log_transform_user_data = log10(user_input);
                            s = normal_distribution(log_transform_user_data,inp_num);
                            
                            if (s == 1)
                                fprintf('Applying Two Sample T-Test.........\n');
                                two_sample_ttest(user_input,inp_cat, inp_num);
                            else
                                fprintf('Applying Man-Whitney U Test........\n');
                                mann_whitney_utest(user_input, inp_cat, inp_num);
                            end
                        end
                    case 2
                        fprintf('Proceeding forward with Paired Variable Analysis............\n');
                        fprintf('Please enter the numerical sample variables.............\n');
                        for j= 1:2
                            inp_num(j)= input(sprintf('Add Sample Outcome Variables..........\n'));
                        end
                        
                        s = normal_distribution(user_input, inp_num);
                        
                        if (s == 1)
                            fprintf('Applying Student T-Test for one Sample .....\n\n');
                            student_t_test2(user_input,inp_num);
                        else
                            
                            fprintf('Applying Log-Transformed on dataset......\n\n');
                            log_transform_user_data = log10(user_input);
                            s = normal_distribution(log_transform_user_data, inp_num);
                            
                            if (s == 1)
                                fprintf('Log Transformed Data is normalized......\n\n');
                                fprintf('Proceeding forward with Student T-Test for one Sample.......\n');
                                student_t_test2(user_input,inp_num);
                            else
                                fprintf('Log Transformed Data is not normalized....\n\n');
                                fprintf('Proceeding forward with Wilcoxon Sign Rank Test......\n');
                                wilcoxon_sign_rank_test2(log_transform_user_data,inp_num);
                            end
                            
                        end
                    otherwise
                        fprintf('Please enter a valid option........\n');
                end
            case 3
                fprintf('Proceeding with More than Two Sample Analysis......\n');
                fprintf('Checking if there ae equal number of observation in each sample........\n\n');
                g = equalobs(user_input);
                if (g == 2)
                    fprintf('There are equal number of observations in each Sample........\n');
                    fprintf('Proceeding to Normalization Check........\n');
                    fprintf('Please enter the categorical sample variables ......\n');
                    inp_cat = input(sprintf('Add the Sample Variable......\n'));
                    fprintf('Please enter the numerical sample variables.........\n');
                    inp_num = input(sprintf('Add Sample Variable.....\n'));
                    s = normal_distribution(user_input, inp_num);
                    if (s == 1)
                        fprintf('Proceeding to Statistical Analaysis.........\n');
                        fprintf('Checking for homogenity of variances........\n');
                        fprintf('Applying condition test.........\n');
                        
                        h = condition_test(user_input, inp_num);
                        
                        if (h == 1)
                            fprintf('Homogenity condition is satisfied......\n');
                            fprintf('Applying One way ANOVA.......\n');
                            anova_test(user_input, inp_cat, inp_num);
                        else
                            fprintf('Homogenity condition is not satisifed....\n');
                            fprintf('Applying Welch ANOVA Test.......\n');
                            welch_anova_test(user_input, inp_cat, inp_num);
                        end
                        
                    else
                        
                        fprintf('Proceeding to Statistical Analysis.....\n\n');
                        fprintf('Applying Log Transform on dataset......\n');
                        
                        log_transform_user_data = log10(user_input);
                        s = normal_distribution(log_transform_user_data, inp_num);
                        
                        if (s == 1)
                            fprintf('Log Transformed Data is normalized......\n\n');
                            fprintf('Proceeding Forward......\n');
                            
                            
                            fprintf('Proceeding to Statistical Analaysis.........\n');
                            fprintf('Checking for homogenity of variances........\n');
                            fprintf('Applying condition test.........\n');
                            
                            h = condition_test(user_input, inp_num);
                            
                            if (h == 1)
                                fprintf('Homogenity condition is satisfied......\n');
                                fprintf('Applying One way ANOVA.......\n');
                                anova_test(user_input, inp_cat, inp_num);
                            else
                                fprintf('Homogenity condition is not satisifed....\n');
                                fprintf('Applying Welch ANOVA Test.......\n');
                                welch_anova_test(user_input, inp_cat, inp_num);
                            end
                            
                        else
                            fprintf('Log Transformed Data is not normalized...\n\n');
                            fprintf('Proceeding forward with Krusk Wallis Test....\n');
                            krusk(user_input,inp_cat, inp_num);
                        end
                        
                    end
                    
                else
                    fprintf('Number of Observations under each sample is not equal........\n');
                    fprintf('Exiting Process.......\n');
                    fprintf('Please Restart the process again......\n');
                    
                end
        end
        
    case 3
        
        disp('Selected Objective : Correlation/ Association');
        fprintf('Note : Since Associaion is amongst two sample size user is prompted to input two sample sizes from the given dataset.......\n');
        tap = input(sprintf('Please determine the type of the input data (1/2/3) : \n 1) Both are Ordinal \n 2) Both are Continuous \n 3) One is Continuous and other is Binary \n 4) Both are Nominal \n'));
        
        switch tap
            
            case 1
                fprintf('Both Samples are Ordinal in nature......\n\n');
                fprintf('Applying Kendall Tau Correlation Coefficient....\n');
                
                for j = 1:2
                    inp(j) = input(sprintf('Add Sample Outcome Variable.....\n\n'));
                end
                
                kendall_tau_coeff(user_input, inp);
                
            case 2
                fprintf('Both Samples are Continuous in nature......\n\n');
                
                for j = 1:2
                    inp(j) = input(sprintf('Add Sample Outcome Variable.....\n\n'));
                end
                
                fprintf('Checking Normal Distribution Data......\n');
                s = normal_distribution(user_input,inp);
                
                if s == 1
                    % Data is normally Distributed
                    
                    fprintf('Proceeding to check the variance of the two samples....\n');
                    fprintf('Performing Levene Test on Sample.....\n\n');
                    r = levene_var_check(user_input, inp);
                    
                    if r == 1
                        fprintf('Variance of the two populations are the same.....\n');
                        fprintf('Applying Karl Pearson Correlation Coefficients......\n');
                        karl_test(user_input, inp);
                    else
                        fprintf('Variance of the two populations are not the same......\n');
                        fprintf('Applying Spearman Correlation Coefficient.......\n');
                        spearman_test(user_input,inp);
                    end
                    
                else
                    % Data is not normally distributed
                    
                    fprintf('Applying Log Transformations on the given Data.....\n\n');
                    log_transform_user_data = log10(user_input);
                    fprintf('Reapplying Normality Conditions......\n');
                    s = normal_distribution(log_transform_user_data,inp);
                    
                    if s == 1
                        fprintf('Applying Karl Pearson Test on data.......\n');
                        karl_test(user_input, inp);
                    else
                        fprintf('Applying Spearman Correlation Coefficient.....\n');
                        spearman_test(user_input,inp);
                    end
                    
                    
                end
            case 3
                fprintf('One Sample is Continuous in nature and the other is Binary in nature....\n\n');
                fprintf('Applying Point Biserial Correlation.......\n');
                
                for g = 1:2
                    inp(g) = input(sprintf('Add Sample Outcome Variable.....\n\n'));
                end
                
                biserial(user_input,inp);
                
            case 4
                fprintf('Both Samples are Nominal......\n\n');
                
                for g = 1:2
                    inp(g) = input(sprintf('Add Sample Outcome Variable.....\n\n'));
                end
                
                fprintf('Checking Conditions.....\n');
                fprintf('Checking to see if any value is less than 5.....\n');
                f = cellcheck(user_input, inp);
                
                if f == 1
                    fprintf('Condition satisfied....\n');
                    fprintf('Applying Fisher Exact Test.....\n');
                    fish(user_input, inp);
                else
                    fprintf('Condition not satisfied.....\n');
                    fprintf('Applying Chi-Squared Test.....\n');
                    chi_test(user_input, inp);
                end
                
        end
        
        
    case 4
        
        disp('Selected Objective : Agreement');
        agree_rep = input(sprintf('Please select the type of analysis you would proceed with : (1/2) \n\n 1) Agreement \n 2) Repeatibility \n'));
        
        switch agree_rep
            
            case 1
                fprintf('Proceeding forward with Agreement parameters......\n');
                hj = input(sprintf('Please define the type of data for both the variables...... \n  1) Categorical Data \n 2) Continuous Data \n  '));
                
                switch hj
                    
                    case 1
                        fprintf('The Data selected is Categorical in nature............\n');
                        fprintf('Proceeding forward..............\n');
                        fprintf('Checking the number of categories..............\n');
                        
                        ft = input(sprintf('Please Select.....(1/2)\n\n 1) 2 Categories \n 2) More than 2 Categories \n'));
                        
                        switch ft
                            
                            case 1
                                
                                for g = 1:2
                                    inp(g) = input(sprintf('Add Sample Outcome Variable.....\n\n'));
                                end
                                
                                fprintf('Proceeding with only 2 categories...........\n');
                                fprintf('Applying Cohens Kappa Test on the dataset...........\n');
                                cohenkappa(user_input, inp);
                                
                            case 2
                                
                                
                                bn = input(sprintf('Please enter the number of categories you want to analyze......\n'));
                                len_bn = length(bn);
                                
                                for g = 1:len_bn
                                    inp(g) = input(sprintf('Add Sample Outcome Variable.....\n\n'));
                                end
                                
                                fprintf('Proceeding with more than 2 categories..........\n');
                                fprintf('Proceeding with Weighted Cohens Kappa Test on the dataset..........\n');
                                weighted_cohenkappa(user_input, inp);
                        end
                        
                    case 2
                        
                        fprintf('The Data selected is Continuous in nature..............\n');
                        fprintf('Proceeding forward.................\n');
                        
                        rater_number = input(sprintf('Please select the number of raters (1/2)......\n\n 1) 2 raters \n 2) More Than 2 Raters \n'));
                        
                        switch rater_number
                            
                            case 1
                                fprintf('The number of raters is 2....\n');
                                fprintf('Performing Lin Concordance Correlation Coefficient..........\n');
                                
                                for g = 1:2
                                    inp(g) = input(sprintf('Add Sample Outcome Variable.....\n\n'));
                                end
                                
                                linccc(user_input,inp);
                                
                            case 2
                                fprintf('The number of raters is more than 2.........\n');
                                fprintf('Performing Intra Class Correlation Coefficient.......\n ');
                                
                                gen = input(sprintf('Please add the number of categories you want to analyze......\n'));
                                
                                for g = 1:gen
                                    inp(g) = input(sprintf('Add Sample Outcome Variable.....\n\n'));
                                end
                                
                                iccc(user_input, inp);
                                
                        end
                        
                end
                
            case 2
                
                fprintf('Proceeding forward with Repeatibility parameters......\n');
                
                fprintf('Please note that BLAND-ALTMAN can be done only on 2 datasets......\n');
                fprintf('Performing Bland Altman Analysis........\n\n');
                fprintf('Analyzing graphs...........\n');
                fprintf('Proceeding forward........\n');
                
                for g = 1:2
                    inp(g) = input(sprintf('Add Sample Outcome Variable.....\n\n'));
                end
                
                altman_analysis(user_input, inp);
        end
        
    case 5
        
        disp('Selected Objective : Diagnostic Test');
        data_inp = input(sprintf('Select the type of Data for both the variables (1/2) :\n 1) Both are Categorical \n 2) One is Continuous and One is Binary \n \n '));
        
        switch data_inp
            
            case 1
                fprintf('Please define if the data is Gold Standard or Test Variable..... \n');
                
                for h = 1:2
                    inp(h) = input(sprintf('Add Sample Outcome Variable......\n'));
                end
                
                fprintf('Performing various Test as per condition,....\n');
                test_diagnostic_new(user_input, inp);
                
            case 2
                
                fprintf('Data type is Continuous and Binary,,,\n');
                fprintf('Moving Forward.....\n');
                fprintf('Creating ROC curve cut off value using Youden Index........\n');
                inp_cat = input(sprintf('Please Enter the Categorical Sample Variable'));
                inp_num = input(sprintf('Please Enter the Numerical Sample Variabe'));
                
                roc_analysis(user_input, inp_cat, inp_num);
        end
        
        
    case 6
        
        disp('Selected Objective : Prediction Analysis');
        % Earlier named as Regression Analysis as Objective 6 in the diagrammatic flowchart
        opt = input(sprintf('Please enter the type of dependent variable (1/2/3) \n 1) Continuous \n 2) Categorical \n 3) Time to an event \n\n'));
        
        switch opt
            
            case 1
                fprintf('The variabe type is continuous.....\n');
                fprintf('Checking assumptions...............\n');
                
                val = input(sprintf('Please enter the number of independent input variables....\n'));
                
                for h = 1:val
                    inp(h) = input(sprintf('Add Sample Outcome Variable......\n'));
                end
                val_dependent = input('Please enter the dependent variable..........\n');
                check_assumptions_regress(user_input, inp , val_dependent);
                
                if n == 1
                    fprintf('Starting Linear Regression......\n');
                    lin_regress(user_input, inp, val_dependent);
                else
                    fprintf('Starting Non-Linear Regression......\n');
                    nonlin_regress(user_input, inp, val_dependent);
                end
                
            case 2
                fprintf('The variable type is categorical......\n');
                fprintf('Proceeding further............\n');
                
                val = input(sprintf('Please enter the number of response variables....\n'));
                
                for h = 1:val
                    inp(h) = input(sprintf('Add Sample Outcome Variable......\n'));
                end
                val_predictor = input(sprintf('Please enter predictor variable.......\n'));
                
                regression_categorical(user_input, inp, val_predictor);
                
                
            case 3
                fprintf('The variable type is a time to an event.........\n');
                fprintf('Proceeding further........\n');
                fprintf('Performing Cox Proportional Hazard Model.....\n');
                
                time_var = input(sprintf('Please enter the time variable input......\n'));
                val = input(sprintf('Please enter the number of input predictors....\n'));
                
                
                for h = 1:val
                    inp(h) = input(sprintf('Add Sample Outcome Variable......\n'));
                end
                
                cox_proportional(user_input, inp, time_var);
        end
        
        
    case 7
        
        disp('Selected Objective : Survival Analysis');
        opt = input(sprintf('Please select the following option : (1/2) \n 1) Kaplan Meier Analysis for Overall Data \n 2) Kaplan Meier Analysis for Subset Data \n\n'));
        
        
        switch opt
            case 1
                fprintf('Applying Kaplan Meier Analysis for Overall Data.....\n');
                time_var = input(sprintf('Please select time variable.....\n'));
                status_var = input(sprintf('Please enter the status variable.....\n'));
                fprintf('Applying Kaplan Meier Analysis.....\n');
                
                kaplan_meier_analysis(user_input, time_var, status_var);
            case 2
                fprintf('Applying Kaplan Meier Analysis for Subset of Data......\n');
                group_var = input(sprintf('Please enter the number of group variable.....\n'));
                fprintf('Applying Kaplan Meier Analysis......\n');
                
                kaplan_meier_analysis3(user_input, group_var);
        end
        
    otherwise
        
        disp('Please select a valid choice (values = 1-7)');
        
end

end
