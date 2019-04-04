%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Depth-averaged scalar transport.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function C_new = scalartransport(u_old,v_old,u_new,v_new,xc,yc,xu,yu,xv,yv,C,Huwx,Huwy,...
                                 dx,dy,dt,n,theta,h,d,H_old,L,W,rhs,boundaryregion_type2,Cb_type2,boundaryregion_type3,Cb_type3)

global_pointers;
getvariables;

C_new=zeros(size(C));

% Implement the scalar transport code here to obtain C_new which is
% C at time-step n.
