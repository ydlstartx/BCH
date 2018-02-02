%u: information vector in gf(2) form.
%m: codeword length is 2^m-1
%t: the error correct ability
%every poly's order is from lower up to higher 1+X^1+X^2+X^3+......
%bch_enc.m
%Author: YU DONG LEI
%Date: 2017/12/17
%Version: 0.1
%
%
%
function [v1,v2,h_matrix] = bch_enc(u,m,t,field_table)
	k = length(u);
	n = 2^m - 1;
	u = gf(u,1);

	mini_poly_array = generate_mini_poly_array(m,t,field_table); %shengchegn zuixiao duoxiangshi,alpha^i,1<=i<=2t

	g_x = generate_genpoly(mini_poly_array); %gou zao shengcheng duoxaingshi

	h_x = generate_checkpoly(g_x,n); %gou zao jiaoyan duoxiangshi

	%k = n - length(g_x) + 1;


    g_matrix = generate_g_matrix(g_x,n,k);	%gou_zao sheng_cheng ju_zhen

    h_matrix = generate_h_matrix(h_x,n,k);  %gou_zao jiao_yan ju_zhen

    v1 = u*g_matrix;


    [a,b] = deconv( fliplr( gf( [zeros(1,n-k),u] , 1 ) ) , fliplr(g_x) );
    v2 = fliplr(b) + [gf(zeros(1,n-k),1),u];

end
