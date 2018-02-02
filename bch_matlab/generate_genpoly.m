%generate_genpoly.m
%Author: YU DONG LEI
%Date: 2017/12/17
%Version: 0.1
%
%
%
function g_x = generate_genpoly(mini_poly_array)
	[rows,cols] = size(mini_poly_array);
	g_x = 1;
	for i_ = 1:rows
		g_x = conv(g_x,fliplr(mini_poly_array{i_,2}));
	end
	g_x = fliplr(g_x);
end