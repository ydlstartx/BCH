%generate_mini_poly_array.m
%Author: YU DONG LEI
%Date: 2017/12/17
%Version: 0.1
%
%
%
function [mini_poly_array] = generate_mini_poly_array(m,t,field_table)
	root_odd_order = [1:2:2*t-1];
	mini_poly_array = cell(length(root_odd_order),2);

	for i_ = 1:length(root_odd_order)
		mini_poly_array{i_,1} = root_odd_order(i_);
		mini_poly_array{i_,2} = generate_mini_poly(root_odd_order(i_),m,field_table);	%generate alpha^mini_poly_array{i_,1} zai gf(m)shang de zuixiao duoxaingshi
	end
end