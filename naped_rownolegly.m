close all
load dane.mat;
load FC_SI95.mat;
load PM_UQM_motor_100kW.mat;
%%



%%
omega_ICE = 150;
torque_ICE = 400; 

figure
surfl(mc_map_spd, mc_map_trq, mc_eff_map')
xlabel('predkosc obrotowa [rad/s]');
ylabel('moment [Nm]');
zlabel('sprawnosc [-]');
colorbar

%%
figure
contourf(mc_map_spd, mc_map_trq*1.5, mc_eff_map')
hold on;
plot(mc_map_spd, mc_max_trq*1.5, 'r', 'linewidth', 2.);
plot(mc_map_spd, -mc_max_trq*1.5, 'r', 'linewidth', 2.);
plot(mc_map_spd, mc_max_cont_trq*1.5, 'g', 'linewidth', 2.);
plot(mc_map_spd, -mc_max_cont_trq*1.5, 'g', 'linewidth', 2.);
plot(out.omega_motor(:,2), out.torque_motor(:,2),'red*');
xlabel('predkosc obrotowa [rad/s]');
ylabel('moment [Nm]');
zlabel('sprawnosc [-]');
%%
figure
contourf(fc_map_spd, fc_map_trq, fc_fuel_map_gpkWh');
hold on
plot(fc_map_spd, 22500./fc_map_spd, 'r', 'LineWidth', 2);
xlabel('predkosc obrotowa [rad/s]');
ylabel('moment [Nm]');
%%
figure
contourf(mc_map_spd, mc_map_trq, mc_eff_map')
hold on;
plot(mc_map_spd, -mc_max_trq, 'r', 'linewidth', 2.);
plot(mc_map_spd, -mc_max_cont_trq, 'g', 'linewidth', 2.);
plot(mc_map_spd, -22500./mc_map_spd, 'r');
hold on
Z=interp2(mc_map_spd, mc_map_trq, mc_eff_map',mc_map_spd, -22500./mc_map_spd); 
plot(mc_map_spd, (-22500./mc_map_spd)./Z);
xlabel('predkosc obrotowa [rad/s]');
ylabel('moment [Nm]');

%% 
figure
contourf(fc_map_spd, fc_map_trq, fc_fuel_map_gpkWh');
hold on
plot(fc_map_spd, fc_max_trq, 'r', 'linewidth',2.)
xlabel('predkosc obrotowa [rad/s]');
ylabel('moment [Nm]');
%%
figure
contourf(fc_map_spd, fc_map_trq, fc_fuel_map_gpkWh');
hold on
plot(mc_map_spd, (22500./mc_map_spd)./Z);
xlabel('predkosc obrotowa [rad/s]');
ylabel('moment [Nm]');
%%
figure
ZZ=interp2(fc_map_spd,fc_map_trq, fc_fuel_map_gpkWh',mc_map_spd, (22500 ./mc_map_spd)./Z);
hold off
plot(mc_map_spd,(22.5./Z).*ZZ);
plot3(mc_map_spd, (22500 ./mc_map_spd)./Z, (22.5./Z).*ZZ);
xlabel('predkosc obrotowa [rad/s]');
ylabel('moment [Nm]');
%%
figure
contourf(fc_map_spd, fc_map_trq, fc_fuel_map_gpkWh');
hold on;
plot(fc_map_spd, fc_max_trq, 'r', 'linewidth', 2.);
plot(out.omega_ICE, out.torque_ICE, 'r*');
xlabel('speed [rad/s]');
ylabel('torque [Nm]');
colorbar;
%%
figure
contourf(mc_map_spd, mc_map_trq, mc_eff_map');
hold on;
plot(omega_ICE, -torque_ICE, 'r*');
plot(mc_map_spd, -mc_max_trq, 'r', 'linewidth', 2.);
plot(mc_map_spd, -mc_max_cont_trq, 'g', 'linewidth', 2.);
plot(mc_map_spd, mc_max_trq, 'r', 'linewidth', 2.);
plot(mc_map_spd, mc_max_cont_trq, 'g', 'linewidth', 2.);
xlabel('speed [rad/s]');
ylabel('torque [Nm]');
colorbar;
title(colorbar, 'specific fuel consumption [g/kWh]')
%%
figure
contourf(mc_map_spd, mc_map_trq, mc_eff_map');
hold on;
plot(out.omega_motor, out.torque_motor, 'r*');
plot(mc_map_spd, -mc_max_trq, 'r', 'linewidth', 2.);
plot(mc_map_spd, -mc_max_cont_trq, 'g', 'linewidth', 2.);
plot(mc_map_spd, mc_max_trq, 'r', 'linewidth', 2.);
plot(mc_map_spd, mc_max_cont_trq, 'g', 'linewidth', 2.);
xlabel('speed [rad/s]');
ylabel('torque [Nm]');
colorbar;
title(colorbar, 'sprawność [%]')
%%
figure
plot(out.litry)
xlabel ('Czas [s]')
ylabel ('Całkowite zużycie paliwa [l]')
%%
figure
plot(out.SOC)
xlabel ('Czas [s]')
ylabel ('SOC baterii')