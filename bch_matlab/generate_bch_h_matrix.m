%h_matrix_bch :every element save the order of alpha^i, from 0 to 2t*(2^m-2)
%h_matrix_bch.m
%Author: YU DONG LEI
%Date: 2017/12/17
%Version: 0.1
%
%
%
function h_matrix_bch = generate_bch_h_matrix(m,t)
	order = 0;
	rows = 2*t;
	columns = 2^m - 1;
	h_matrix_bch = zeros(rows,columns);
	h_matrix_bch(:,1) = 0;

	for i_ = 1:rows
		for j_ = 2:columns
			h_matrix_bch(i_,j_) = i_*(j_-1);
		end
	end

	h_matrix_bch = mod(h_matrix_bch,columns);
end