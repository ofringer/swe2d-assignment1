% SSC is used for scalar transport when there is no settling or
% erosion
SSC=true;

% Linear free surface, i.e. H = d, not H=h+d;
LINEAR=false;                             

% Whether or not to use ELM
ELM=true;                                 

% Verbose output
VERBOSE=false;                            

% Store h for offline use; 
% Up to 1000x real time without storing h.
% Up to 5000x real time with precomputed h.
STORE_H=false;

% Load h so don't need to use slow CG solve
LOAD_H=true;

% Whether or not to create a movie
MOVIE=false;

% Data where h is stored
hdatafile='data/hdata_dt360.mat';               

% Gravity 
g = 9.81;                                 

% Seconds per day
Tday = 86400;                             

% Coriolis parameter
Omega_day = 2*pi/Tday;                    
phi = 37;                                 
f=2*Omega_day*sin(phi*pi/180);            

% Wind stress in x and y directions
tau_x0 = 0.0;                             
tau_y0 = 0.0;                             

% Frequency of wind-stress forcing (in rad/s)
omega_0 = 0;                              

% Tolerance for conjugate gradient solver
tol = 1e-4;                               

% Maximum number of iterations for conjugate gradient solver
nmax = 400;                               

% Bottom roughness
z0 = 1e-4;                                

%Value of Cd when H<2*z0 (water depth less than roughness)
Cd = 0.0025;                              
                                          
% Von karman constant
kappa = 0.41;                             

% For plotting (1000 m = 1 km);
km=1000;                                  

% Time step size 
dt=360;

% Maximum allowable Courant number before exiting
Cmax_allowed = 1;                         

% Maximum allowable SSC (to detect blowups for scalar transport)
C0_max_allowed=201;

% Total simulation time
max_time = 4*Tday; 

% total number of time steps
nsteps = fix(max_time/dt);                    
tmax = nsteps*dt; % Do not change                         

% implicitness parameter
theta = 0.55;                             

% Mean sea-level is offset relative to bathymetry datum
hoffset=-4;                               

% How often to report progress
ntprog = 10;

% Minimum allowable bottom depth (relative to MSL) to prevent wetting/drying (otherwise
% the calculation takes a lot longer)
Dmin = -inf;                              
                                          
% Smallest water depth (h+d) allowed before correction
H_small = 0.1;                            

% Plot to screen while running and how often to do so
PLOT=true;
ntout = fix(3600/dt); % Every hour                     

% List of variables to plot, C=sediment/scalar, u/v = velocity components, h=free surface, q=quiver plot:
vars_to_plot='hq';                       

% Variables needed to output time series and the locations at which
% those time series are desired. C=sediment/scalar, u/v = velocity components, h=free surface
nout=1; % Output every time step
vars_to_output='h'; % Only free surface

%
% Output data at these points. Must store x_transect, y_transect
% as follows (for example):
%
% x_transect = [20000 40000];
% y_transect = [20000 20000];
% save data/output_locations x_transect y_transect
%
load('data/output_locations');
                                          
