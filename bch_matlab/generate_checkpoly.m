%generate_checkpoly.m
%Author: YU DONG LEI
%Date: 2017/12/17
%Version: 0.1
%
%
%
function h_x = generate_checkpoly(g_x,n)
	X_n = zeros(1,n+1);
	X_n([1,end]) = 1;
	X_n = gf(X_n,1);
	[f_x,r] = deconv(X_n, fliplr(g_x));
	h_x = f_x;
end