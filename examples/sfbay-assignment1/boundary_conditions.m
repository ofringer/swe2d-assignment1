% Incoming flows and SSC at the river boundaries
Qsac=0; % Sacramento River inflow (m3/s)
Csac=0; % Sacramento River incoming sediment concentration (mg/liter)
Qsan=0; % San Joaquin River inflow (m3/s)
Csan=0; % San Joaquin River incoming sediment (mg/liter)

% Create a pulse time series (the variables are known and global,
% except for Tday)
Tday=86400;
t=[1:nsteps]*dt; 

% Sacramento River boundary 
boundaryregion_type2{1} = 1e4*[8.7673 6.9737 ; 9.1820 7.6462];
Qb_type2{1} = Qsac;
Cb_type2{1} = Csac;
ub_type2{1} = 0;
vb_type2{1} = 0;

% San Joaquin River boundary 
boundaryregion_type2{2} = 1e4*[8.7442 6.2427 ; 9.2051 6.8860];
Qb_type2{2} = Qsan;
Cb_type2{2} = Csan;
ub_type2{2} = 0.0;
vb_type2{2} = 0.0;

% Tidal boundary condition
load data/point_reyes_tide_gauge
toffset=0;
hb=zeros(1,nsteps);
for n=1:nsteps
    hb(n)=hoffset+sum(tidal_amplitudes.*sin(tidal_frequencies*(toffset+t(n)/3600/24)+tidal_phases));
end

% This polygon surrounds the open ocean boundary where the tides are imposed
boundaryregion_type3{1} = 1e3*...
    [18.0405   81.4189
     80.2027   -0.7432
     33.1757  -22.6351
     -25.4730   63.5811];

% Sediment concentration at the ocean boundary
Cb_type3{1} = 0;

% Free surface at the ocean boundary
hb_type3{1} = hb;

