%generate_g_matrix.m
%Author: YU DONG LEI
%Date: 2017/12/17
%Version: 0.1
%
%
%
function g_matrix = generate_g_matrix(g_x,n,k)
	g_matrix = gf(zeros(k,n),1);
	for i_ = 1:k
		g_matrix(i_,i_:i_+n-k) = g_x;
	end
end