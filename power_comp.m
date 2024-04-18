%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Ahmet Turan Ates %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 1901022033 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Vrms = 230; % RMS voltage
f = 50; % Frequency 
% Power factor range
pf_range = 0.7:0.01:1;
% Capacitance range
C_range = 1e-6:1e-7:1e-5;
% Assign Variables
current_values = zeros(length(C_range), length(pf_range));

% Capacitance and Power Factor Equations
for i = 1:length(C_range)
 for j = 1:length(pf_range)
 % Impedence
 Xc = 1 / (2 * pi * f * C_range(i));
 Z = Xc;
 
 I = Vrms / Z;
 current_values(i, j) = I;
 end
end
[pf_mesh, C_mesh] = meshgrid(pf_range, C_range);
% Plotting
figure;
surf(pf_mesh, C_mesh, current_values);
xlabel('Power Factor(PF)');
ylabel('Capacitance(F)');
zlabel('Current(A)');
title('Power Compansation');
view(45, 30);