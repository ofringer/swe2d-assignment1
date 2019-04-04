% Initial conditions for:
%
% u : Face-centered u velocity in m/s (size Ni+1 x Nj)
% v : Face-centered v velocity in m/s (size Ni x Nj+1)
% C : Cell-centered SSC or scalar in mg/l (size Ni x Nj)
% zb : Cell-centered bed height in m (size Ni x Nj)
%
% The cell-centered locations [xc,yc], each of size (Ni x Nj) 
% can be used here. For example, C = exp(-(xc-x0).^2);
% 

% Velocity components
u = zeros(Ni+1,Nj);
v = zeros(Ni,Nj+1);

%
% Suspended sediment concentration
%
C = zeros(Ni,Nj);

% Free-surface height
h = hoffset*ones(Ni,Nj);

% Bed height
zb = zeros(Ni,Nj);






