function [ S,R ,x_rotate,y_rotate,z_rotate] = svd_decompose( P )
row3 = cross(P(1,:),P(2,:));
P2 = [P;row3];
[U,D,V]=svd(P2);

R = U*V';
S = P*pinv(R);

[x_rotate,y_rotate,z_rotate] = decompose_rotation(R);
%  [x_rotate,y_rotate,z_rotate] = decompose_rotation_noz(R);

end

