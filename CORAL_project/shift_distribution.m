% In cvs files, class labels are removed since you do not need them to
% perform correlation alignment. 

% After correlation alignment is performed, 
% 'source_nonsparse_no_class_label_shifted_distrib.csv' is produced.
% It contains the same amount of training examples as the original source
% file ('source_nonsparse_no_class_label.csv') but attribute values are
% "shifted" to mimic the target distribution. 

% To reconstruct the class labels of the source file, you need to 
row_offset = 0;
column_offset = 0;
source_data =  csvread('\source_nonsparse_no_class_label.csv', row_offset, column_offset);
target_data =  csvread('\target_nonsparse_no_class_label.csv', row_offset, column_offset);

whos source_data
whos target_data

Ds = source_data;
Dt = target_data;

%CORAL
Cs = cov(Ds) + eye(size(Ds, 2));
Ct = cov(Dt) + eye(size(Dt, 2));

Ds = Ds * (Cs^(-1/2));
Ds_final = Ds * (Ct^(1/2));

whos Ds_final

csvwrite('source_nonsparse_no_class_label_shifted_distrib.csv', Ds_final)