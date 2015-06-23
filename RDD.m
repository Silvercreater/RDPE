function [P] = RDD(x2D, meanX3D)



X2D_T = x2D;
X3D = meanX3D;
[  R,~,~,~,S,~,tx,ty] = UPE( X2D_T,X3D,2,1 );
P.tx = tx;
P.ty = ty;
P.R = R;
P.S = S;
