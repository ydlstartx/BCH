%bch_dec.m
%Author: YU DONG LEI
%Date: 2017/12/17
%Version: 0.1
%
%
%
function [v] = bch_dec(r,m,k,t,field_table)
	n = length(r);
	r = gf(r,1);
	h_matrix_bch = generate_bch_h_matrix(m,t);

	syndrome = generate_syndrome(r,h_matrix_bch,t,m,field_table);
	%syndrome

	sigma_X = execute_BM(syndrome,t,m,field_table);
	%sigma_X

	root_sigma_X = find_root_sigma_X(sigma_X,m,field_table);
	%root_sigma_X

	%%next solve the error pattern
	err_pattern = zeros(1,n);
	err_locate = mod(2^m - 1 - root_sigma_X,2^m-1);
	err_pattern(err_locate+1) = 1;

	err_pattern = gf(err_pattern,1);
	v = r + err_pattern;
end