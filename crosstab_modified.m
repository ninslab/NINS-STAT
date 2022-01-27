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

function [table, chi2, p, labels] = crosstab_modified(dat)

%###############################################################
% putting data such that multiple inputs out of a for loop
% can be tabulated.
%
% - modified
%###############################################################

d = {dat}; % Add input in a cell
[~, col] = size(d{1}); % find the number of columns

sz = zeros(1,col);
if (nargout > 3), labels = cell(0, col); end
nonan = [];
M = [];

prim = d{1,1}; % Add all the columns values into a variable 

for j=1:col
    
   [g1,g2] = grp2idx(prim(:,j));
   ng = size(g2,1);
   if (nargout > 3), labels(1:ng,j) = g2; end
   sz(j) = ng;
   n = length(g1);
   if (j == 1)
      n1 = n;
      nonan = ~isnan(g1);
      M = zeros(n,col);
      M(:,1) = g1;
   elseif (n ~= n1)
      error(message('stats:crosstab:InputSizeMismatch'));
   else
      nonan = nonan & ~isnan(g1);
      M(:,j) = g1;
   end
end

M = M(nonan,:);
n = size(M,1);

table = accumarray(M,1);

% Pad the table with zeros for empty levels in categorical arrays.
dopad = false;
idx = cell(numel(sz),1);
for j=1:numel(sz)
    if size(table,j)==sz(j)
        idx{j} = 1:sz(j);        
    else
        dopad = true;
        idx{j} = size(table,j)+1:sz(j);
    end
end
if dopad
    table(idx{:}) = 0;
end
 
if (nargout > 1) && (sum(sz>1) > 1)
   % Remove degenerate dimensions
   if any(sz==1)
      sz = sz(sz>1);
      T = reshape(table,sz);
   else
      T = table;
   end
      
   expected = zeros(sz);
   expected(:) = n;
   szv = sz;
   permv = [(2:length(sz)) 1];
   for j = 1:length(sz)
      sz1 = szv(1);
      sz2 = prod(szv(2:end));
      frac = sum(reshape(T, sz1, sz2), 2) / n;
      frac = reshape(repmat(frac,1,sz2),szv);
      expected = expected .* frac;
      expected = shiftdim(expected, 1);
      szv = szv(permv);
      T = shiftdim(T, 1);
   end

   chi2 = (T - expected).^ 2 ./ expected;
   chi2 = sum(chi2(:));
   df = prod(sz) - (1 + sum(sz - 1));
   p = chi2pval(chi2,df);

elseif (nargout > 1)      % col <= 1
   chi2 = NaN;
   p = NaN;
end

end
