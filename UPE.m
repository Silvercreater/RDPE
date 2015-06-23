function [ R,x_rotate,y_rotate,z_rotate,S,P,tx,ty] = UPE( x2D_o,x3D_o, on_mean_space ,gen_vector)
%% Rein.Y.Wu Copyright @ CBL.UH



%% Average pose error
if on_mean_space==1
    [ x2D ] = gen_mean_group( x2D_o );
    [ x3D ] = gen_mean_group( x3D_o );
end
%% generate vector group
if gen_vector==1
[ x2D ] = gen_vector_group( x2D_o );
[ x3D ] = gen_vector_group( x3D_o );
elseif on_mean_space~=1
    
    x2D = x2D_o;
    x3D = x3D_o;
    
end
%% least square minimization
P = x3D' \ x2D';
P = P';

[ S,R ,x_rotate,y_rotate,z_rotate ] = svd_decompose( P );
%%
% [x_rotate,y_rotate,z_rotate,s] = o_decompose(P);
P2 = S*compose_rotation(x_rotate,y_rotate,z_rotate);

%% 
rotated_3D = P*x3D_o;
[offset]=mean((x2D_o-rotated_3D),2);
tx = offset(1);
ty = offset(2);



end

