%execute_BM.m
%Author: YU DONG LEI
%Date: 2017/12/17
%Version: 0.1
%
%
%
function sigma_X = execute_BM(syndrome,t,m,field_table)	%the simplified BM algorithm
	BM_table = cell(t+2,5);				%the second column of RM_table is an one-dimensions array, this row is the order of alpha
										%ie. 1+X+(alpha^5)*X^2
										%[0 0 5]
										%ie. 1+X+(alpha^5)*X^3
										%[0 0 -1 5]		%-1 denote this X^i do not exist
	BM_table{1,1} = -1/2;	BM_table{1,2} = [0]; BM_table{1,3} = 0; BM_table{1,4} = 0; BM_table{1,5} = -1;
	BM_table{2,1} = 0;	BM_table{2,2} = [0]; BM_table{2,4} = 0; BM_table{2,5} = 0;

	for k_ = 0:t-1
		dk = compute_dk(BM_table, syndrome, field_table, m, k_);	%ji_suan cha_zhi d(k)

		if dk == -1
			BM_table{k_+2+1,2} = BM_table{k_+2,2};
		else 		%%add the correct item
			correct_item = get_correct_item(dk, BM_table, field_table, m, k_);

			BM_table{k_+2+1,2} = zeros(1,length(correct_item));
			tmp = [BM_table{k_+2,2},-1*ones(1,length(correct_item)-length(BM_table{k_+2,2}))];	%bao_chi wei_du yi_zhi

			for i_ = 1:length(correct_item)
				if correct_item(i_) == -1 && tmp(i_) == -1
					BM_table{k_+2+1,2}(i_) = -1;
				elseif correct_item(i_) == -1 && tmp(i_) ~= -1
					BM_table{k_+2+1,2}(i_) = BM_table{k_+2,2}(i_);		
				elseif correct_item(i_) ~= -1 && tmp(i_) == -1
					BM_table{k_+2+1,2}(i_) = correct_item(i_);
				else 
					BM_table{k_+2+1,2}(i_) = gf_add(correct_item(i_),tmp(i_),field_table);
				end							
			end
		end

		BM_table{k_+2+1,1} = k_ + 1;
		BM_table{k_+2,3} = dk;
		BM_table{k_+2+1,4} = length(BM_table{k_+2+1,2})-1;
		BM_table{k_+2+1,5} = 2*(k_ + 1) - BM_table{k_+2+1,4};

	end

	sigma_X = BM_table{t+2,2};
	%BM_table
end