%generate_mini_poly.m
%Author: YU DONG LEI
%Date: 2017/12/17
%Version: 0.1
%
%
%
function [mini_poly] = generate_mini_poly(first_order,m,field_table)
	return1 = 2^m - 1;						%alpha^(2^m-1)=1
	order_list = [first_order];				%used to save alpha^first_order de suo_you tong_gou
	current_order = first_order * 2;

	while mod(current_order,return1) ~= first_order;
		order_list = [order_list,mod(current_order,return1)];
		current_order = current_order * 2;
	end
	%order_list now has the alpha^first_order de suo_you tong_gou

	%next, compute (X-alpha^i)*(X-alpha^j)......,the form of the result is 1+X+X^2+X^3+......
	X_xishu = cell(length(order_list)+1,2);			%have two columns, first is the order of X, from 0 to length(order_list)
													%second is the xi_shu of X^order
	for i_ = 0:length(order_list)
		X_xishu{i_+1,1} = i_;
		tmp = nchoosek(order_list,length(order_list)-i_);	%zu_he
		tmp = sum(tmp,2);							%for now, the sum is the multiply of alpha^i alpha^j->i+j
		tmp = mod(tmp,return1);					
		for j_ = 1:length(tmp)-1
			pos = find(tmp(j_+1:end)==tmp(j_));
			if pos
				tmp(j_) = 0;
				tmp(pos(1)+j_) = 0;					%the pos(1) is xiang_dui_yu tmp(j_+1:end), suo_yi xu_yao jia_shang j_
			end
		end

		pos = find(tmp ~= 0);
		tmp = tmp(pos);
		for j_ = 1:length(tmp)-1
			tmp(j_+1) = gf_add(tmp(j_),tmp(j_+1),field_table);
		end

		if isempty(tmp)						%tmp only have 3 state,empty,tmp(end)=0,tmp(end)=-1
			X_xishu{i_+1,2} = 1;
		elseif tmp(end)==0
			X_xishu{i_+1,2} = 1;
		elseif tmp(end)==-1
			X_xishu{i_+1,2} = 0;
		end
	end

	mini_poly = zeros(1,length(order_list)+1);
	for i_ = 1:length(order_list)+1
		mini_poly(i_) = X_xishu{i_,2};
	end

	mini_poly = gf(mini_poly,1);
end