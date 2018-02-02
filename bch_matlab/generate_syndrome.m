%generate_syndrome.m
%Author: YU DONG LEI
%Date: 2017/12/17
%Version: 0.1
%
%
%
function syndrome = generate_syndrome(r,h_matrix_bch,t,m,field_table)
	syndrome = zeros(1,2*t);

	for i_ = 1:2*t 			%qiu_jie ge_ge Si
		tmp = [];

		for j_ = 1:2^m-1
			if r(j_)==1
				tmp(end+1) = h_matrix_bch(i_,j_);
			end
		end

		for j_ = 1:length(tmp)-1
			tmp(j_+1) = gf_add(tmp(j_),tmp(j_+1),field_table);
		end

		if isempty(tmp)
			tmp(end+1) = -1;	%denote this is 0
		end
		syndrome(i_) = tmp(end);
	end

	%the element in syndrome is the order of alpha
	%if one element is -1, that denote this element is 0
	%if one element is 0 , that denote this element is 1
	%if one element is 1 , that denote this element is alpha^1
	%......
end