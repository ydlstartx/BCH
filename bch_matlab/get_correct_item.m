%get_correct_item.m
%Author: YU DONG LEI
%Date: 2017/12/17
%Version: 0.1
%
%
%
function correct_item = get_correct_item(dk, BM_table, field_table, m, k)

	i = -1/2;		%the ith step
	tmp = -1;	%2*k - l_k

	for i_ = 2:k+1
		if BM_table{i_,3} ~= -1
			if BM_table{i_,5} > tmp
				i = i_ - 2;
				tmp = BM_table{i_,5};
			end
		end
	end
	%i
	%tmp

	dk_di = mod(dk + 2^m - 1 - BM_table{floor(i+2),3}, 2^m-1);
	%BM_table{floor(i+2),3}
	%dk_di

	X_order = 2*(k-i);
	%X_order

	correct_item = BM_table{floor(i+2),2};
	%correct_item
	correct_item = mod(correct_item + dk_di, 2^m-1);

	%correct_item

	tmp = zeros(1,X_order);
	tmp(:) = -1;
	%tmp
	correct_item = [tmp correct_item];

end