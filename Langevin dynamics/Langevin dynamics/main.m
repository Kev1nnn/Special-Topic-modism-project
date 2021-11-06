clear all;close all;clc
tic
tmax = 5; % terminal time 
dt = 1e-5; % temporal step size
N = 50; % number of water molecules
V_two_body = zeros(N,N); % two_body potential
N_pos = zeros(12*N,1); % position of molecules
L0 = 5;
Re = 0.9572; % equilibrium bond length
te = deg2rad(104.52); % equilibrium bond angle

% initial condition 
N_pos(7:12:end) = linspace(1/4,L0/2,N);
N_pos(8:12:end) = 0;
N_pos(9:12:end) = 0;

N_pos(1:12:end) = N_pos(7:12:end);
N_pos(2:12:end) = Re;
N_pos(3:12:end) = 0;

N_pos(4:12:end) = N_pos(7:12:end);
N_pos(5:12:end) = Re*cos(te);
N_pos(6:12:end) = Re*sin(te);


N_pos(10:12:end) =  N_pos(7:12:end);
N_pos(11:12:end) =  0.3;
N_pos(12:12:end) =  0.3;

T = 2;

% Potential parameters of the NCC water potential 
A_OO = 2.8682660;
B_OO = 1.2390449;
A_HH = 0.1531258;
B_HH = 1.0133393;
A_OH = 41.5624830;
B_OH = 1.2227832;
A_OH_p = 40.0772130;
B_OH_p = 1.2111490;
A_PH = 14.3170660;
B_PH = 2.7567793;
A_PO = 51.1496400;
B_PO = 2.7194969;
q = 0.5525372;
negative_charge_pos = 0.4481389;
pos_dipole_moment = 0.8181759;
alpha_s = 4.1030772;
alpha_b = 1.6275863;

% Force constants for the intramolecular terms of the potential
f_RR = 8.5120;
f_TT = 0.7987;
N_record(:,:,1) = N_pos;

for t = 1:floor(tmax/dt)

    
    W = randn(12*N,1);
    N_pos = N_pos - dt*totalinter_grad(N_pos,A_OO,B_OO,A_HH,B_HH,A_OH,B_OH,A_OH_p,B_OH_p,A_PH,B_PH,A_PO,B_PO,q) ...
            -dt*total_intra_grad(N_pos,Re,te,f_RR,f_TT)...
            + sqrt(2*dt)*W;
    
   if(mod(t,200) == 0)
       
       N_record(:,:,t/200+1) = N_pos;
       
   end

end
toc
visualization