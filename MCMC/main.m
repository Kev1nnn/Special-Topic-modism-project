clear all;close all;clc

total = 1e5; 
N = 50; % number of water molecules

N_pos = zeros(12*N,1); % position of molecules
L0 = 5;
oh_angle = deg2rad(104.52);

N_pos(7:12:end) = linspace(1/4,L0-1/N,N);
N_pos(8:12:end) = 0;
N_pos(9:12:end) = 0;

N_pos(1:12:end) = N_pos(7:12:end);
N_pos(2:12:end) = 0.9572;
N_pos(3:12:end) = 0;

N_pos(4:12:end) = N_pos(7:12:end);
N_pos(5:12:end) = 0.9572*cos(oh_angle);
N_pos(6:12:end) = 0.9572*sin(oh_angle);


N_pos(10:12:end) =  N_pos(7:12:end);
N_pos(11:12:end) =  0.3;
N_pos(12:12:end) =  0.3;

figure(1)
inter_record=zeros(total,1);
intra_record=zeros(total,1);
total_record=zeros(total,1);


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
f_RRR = -9.497;
f_RRRR = 14.0;
f_RRRpT = 0.1;
f_TT = 1.7987;
f_TTT = -0.1268;
f_TTTT = -0.032;
f_RRTT = -0.08;
f_RRp = -0.0967;
f_RRRp = -0.031;
f_RRRRp = -0.05;
f_RRpTT = 0.35;
f_RT = 0.2732;
f_RRT = -0.034;
f_RRRpRp = 0.06;
f_RTTT = 0.104;
f_RRpT = -0.512;
f_RRRT = -0.2;
f_RTT = -0.1565;
Re = 0.9572;

len = length(N_pos);
d=3;
accept =0 ;
sig = 0.002;
N_record = zeros(12*N,1,1000);
for t = 1:total
    
    random = normrnd(0,sig,len,1);

    proposal = N_pos+random;
    %Calculate the potential for current position and proposed position
    V_inter_ori = totalinter(N_pos,d,A_OO,B_OO,A_HH,B_HH, A_OH, B_OH, A_OH_p, B_OH_p, A_PH, B_PH, A_PO, B_PO, q);
    V_intra_ori = total_intra(N_pos,d,Re,oh_angle,f_RR,f_TT,f_RRp,f_RT,f_RRR,f_TTT,f_RRRp,f_RRT,f_RRpT,f_RTT,f_RRRR,f_TTTT,f_RRRRp,f_RRRpRp,f_RRRT,f_RRRpT,f_RRTT,f_RRpTT,f_RTTT);
    V_total_ori = V_intra_ori + V_inter_ori;
    
    V_inter_pro = totalinter(proposal,d,A_OO,B_OO,A_HH,B_HH, A_OH, B_OH, A_OH_p, B_OH_p, A_PH, B_PH, A_PO, B_PO, q);
    V_intra_pro = total_intra(proposal,d,Re,oh_angle,f_RR,f_TT,f_RRp,f_RT,f_RRR,f_TTT,f_RRRp,f_RRT,f_RRpT,f_RTT,f_RRRR,f_TTTT,f_RRRRp,f_RRRpRp,f_RRRT,f_RRRpT,f_RRTT,f_RRpTT,f_RTTT);
    V_total_pro = V_intra_pro + V_inter_pro;
    
    %data record
    inter_record(t) = (V_inter_ori);
    intra_record(t) = V_intra_ori;
    total_record(t) = V_total_ori;
    %acceptance rate
    ratio = min(1,exp(-V_total_pro+V_total_ori));

    accept = accept+ratio;
    x= rand;
    %Metropolis accepting part
    if (x<=ratio)
        N_pos = proposal;
    end
    if(mod(t,1000) == 0)
       
       N_record(:,:,t/1000+1) = N_pos;
       
   end
   
end
disp(accept/total);

%%
%Calculate mean angle
angle_OH = zeros(N,1);
for i = 1:N
    angle_OH(i) = rad2deg(angle(N_pos(i*12-11:i*12)));
     if(angle_OH(i)<0)
         angle_OH(i) = angle_OH(i)+360;
     end
end
plot(angle_OH,"-o")
disp(accept/total);
%%
%Plot the last iteration of system
 for i = 1:N
    
        H2 = [N_pos(i*12-11) N_pos(i*12-10) N_pos(i*12-9)];
        H1 = [N_pos(i*12-8) N_pos(i*12-7) N_pos(i*12-6)];
        O = [N_pos(i*12-5) N_pos(i*12-4) N_pos(i*12-3)];
        xyz = vertcat(H1,O,H2);
        plot3(xyz(:,1),xyz(:,2),xyz(:,3),'-o')
        hold on
 end
 hold off
 %%
 %Calculate mean bond length
 avg = 0;
 for i = 1:N
    tmp1 = N_pos(12*i-11:12*i);
    avg = avg + R(tmp1,1,3) + R(tmp1,2,3);

 end
 disp(avg/(2*N));