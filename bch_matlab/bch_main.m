clc
clear
m = 5;
t = 3;
k = 16;
err_num = 3;

u = zeros(1,k);
%num = nchoosek(16,3);
err_3_loc = nchoosek([1:k],err_num);
loc = randperm(k);

field_table = generate_field(m);

[v1,v2,h_matrix] = bch_enc(u,m,t,field_table);

r = v1;

%err_3_loc(loc(1),:)
r(err_3_loc(loc(1),:)) = 1;

[v] = bch_dec(r,m,k,t,field_table);


disp(v == v1)