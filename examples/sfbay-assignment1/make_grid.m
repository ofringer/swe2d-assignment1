function [dx,dy,Ni,Nj,depth,markuface,markvface,cellmark]=make_grid()

load('data/sfbay_grid_long');
%cellmark(cellmark==2)=1;

% Bathymetry is in depth
hoffset = -4;
H = depth+hoffset;
Dmin = 1.0;          % Minimum allowable bottom depth (relative to
                     % MSL) to prevent wetting/drying (otherwise
                     % the calculation takes a lot longer).
depth(H<Dmin & depth~=0)=Dmin-hoffset;

