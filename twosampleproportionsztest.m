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

function twosampleproportionsztest(totalnumberofsample1,totalnumberofsample2,favourableoutcomesample1,favourableoutcomesample2, alphaval)

% Initializing Variables
%----------------------------------
n1 = totalnumberofsample1;
n2 = totalnumberofsample2;
s1 = favourableoutcomesample1;
s2 = favourableoutcomesample2;

% Applying Mathematical Calculations
%------------------------------------
p1 = (s1/n1);
p2 = (s2/n2);

% Defining the Numerator
%------------------------------------
if p1 > p2
    num = (p1-p2);
else
    num = (p2-p1);
end

% Defining the Denominator
%------------------------------------
p = ((s1 + s2)/(n1 + n2));
a = (1-p);
b = ((1/n1) + (1/n2));
den = sqrt(p*a*b);

% Z parameter Calculation
%------------------------------------
Z = (num/den);

p_one = normcdf(Z,'upper');
p_two = 2 * normcdf(Z,'upper');


% Display all Results
%------------------------------------
fprintf('Test -----> Z-Test Proportions Analysis \n');
fprintf('--------------------------------------------------\n');
fprintf('Results : \n\n');
fprintf('Z value : '); disp(Z);
fprintf('One tailed P-Value : '); disp(p_one);
fprintf('Two tailed P-Value : '); disp(p_two);

diary off

end
