function [ vector_group ] = gen_vector_group( XnD )
%% XnD is a:  n by m matrix , has m obervations and n dimensions.
[n,m] = size(XnD);
v_i = combnk(1:m,2);
[a,b] = size(v_i);
vector_group = [];
for i=1:a
    c_vector = XnD(:,v_i(i,1))-XnD(:,v_i(i,2));
    vector_group = [vector_group  c_vector];
end
end

