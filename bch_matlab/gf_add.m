%gf_add.m
%Author: YU DONG LEI
%Date: 2017/12/17
%Version: 0.1
%
%
%
function [order] = gf_add(order1,order2,field_table)

	[rows,cols] = size(field_table);

	for i_ = 1:rows
		if(field_table{i_,1}==order1)
			pos1 = i_;
		end
		if(field_table{i_,1}==order2)
			pos2 = i_;
		end
	end

	sum_vector = field_table{pos1,2} + field_table{pos2,2};
	
	for i_ = 1:rows
		if(field_table{i_,2}==sum_vector)
			pos3 = i_;
		end
	end

	order = field_table{pos3,1};
end