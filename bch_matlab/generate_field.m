%generate_field.m
%Author: YU DONG LEI
%Date: 2017/12/17
%Version: 0.1
%
%
%
%shengcheng GF(2^m) shang de yuansu biaoge
function [field_table] = generate_field(m)
	table = cell(2^m,2);
	primitive_polynomial = de2bi(primpoly(m),'left-msb');	%qu matlab cishu wei m de benyuan duoxiangshi

	table{1,1} = -1;	
	table{1,2} = zeros(1,m);
	table{2,1} = 0;		
	table{2,2} = [zeros(1,m-1),1];
	for i_ = 3:2^m
		table{i_,1} = i_ - 2;
		table{i_,2} = [table{i_ - 1, 2}(2:end),0]; 
		if(table{i_ - 1, 2}(1) == 1)
			table{i_,2} = double(xor(table{i_,2},primitive_polynomial(2:end)));
		end
	end

	for i_ = 1:2^m
		table{i_,2} = gf(table{i_,2},1);
	end
	field_table = table;

end