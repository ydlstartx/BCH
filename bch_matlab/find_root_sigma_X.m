%root_sigma_X.m
%Author: YU DONG LEI
%Date: 2017/12/17
%Version: 0.1
%
%
%
function root_sigma_X = find_root_sigma_X(sigma_X,m,field_table)
	root_sigma_X = [];
	for i_ = 2:2^m
		tmp = [0];
		for j_ = 2:length(sigma_X)
			if sigma_X(j_) ~= -1
				tmp(end+1) = mod(sigma_X(j_)+(i_-2)*(j_-1),2^m-1);
			end
		end

		for j_ = 1:length(tmp)-1
			tmp(j_+1) = gf_add(tmp(j_),tmp(j_+1),field_table);
		end

		if tmp(end) == -1
			root_sigma_X(end+1) = i_-2;
		end
	end
end