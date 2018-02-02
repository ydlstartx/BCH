%compute_dk.m
%Author: YU DONG LEI
%Date: 2017/12/17
%Version: 0.1
%
%
%
function dk = compute_dk(BM_table,syndrome,field_table,m,k)
	index_begin = 2*k+1;
	index_end = BM_table{k+2,5} + 1;
	lk = BM_table{k+2,4};

	dk = zeros(1,lk+1);
	sv = zeros(1,lk+1);
	sigma_k_x = zeros(1,lk+1);	%dk = sv * sigma_k_x'

	tmp = [];
	for i_ = 1:lk+1
		sv(i_) = syndrome(2*k+2-i_);
		sigma_k_x(i_) = BM_table{k+2,2}(1,i_);
		if i_ == 1
			tmp(end+1) = sv(i_);
		elseif sigma_k_x(i_) == -1
			tmp(end+1) = -1;
		else
			tmp(end+1) = sigma_k_x(i_) + sv(i_);
		end
	end

	%sv
	%sigma_k_x
	%tmp

	pos = find(tmp ~= -1);
	tmp = tmp(pos);
	tmp = mod(tmp,2^m-1);
    
    %tmp

	for j_ = 1:length(tmp)-1
		tmp(j_+1) = gf_add(tmp(j_),tmp(j_+1),field_table);
	end

	dk = tmp(end);
	%if tmp(end)==-1, means that the true value of dk is 0, sigma(k+1) = sigma(k)

end