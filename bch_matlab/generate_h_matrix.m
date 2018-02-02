%generate_h_matrix.m
%Author: YU DONG LEI
%Date: 2017/12/17
%Version: 0.1
%
%
%
function h_matrix = generate_h_matrix(h_x,n,k)
	h_matrix = gf(zeros(n-k,n),1);
	for i_ = 1:n-k
		h_matrix(i_,i_:i_+k) = h_x;
	end
end