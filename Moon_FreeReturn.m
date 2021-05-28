%% Moon_FreeReturn.m
% Moon Free Return Trajectory in the Rotating Frame
%
% Reference: Mark Jesick and Cesar Ocampo, "Automated Generation of
% Symmetric Lunar Free-Return Trajectories," Journal of Guidance, Control,
% and Dynamics, Vol. 34, No. 1, January?February 2011, pp. 98--106.
%
% This trajectory is simulated using the constants and initial condition
% kindly provided by Mark Jesick and Cesar Ocampo.
clear all
close all
clc
% Constants of Earth-Moon system
mu1 = 3.986e5; % km^3/s^2
mu2 = 4.9e3; % km^3/s^2
rb1 = 4668.05452292441; % km
rb2 = 379731.945477076; % km
omega = sqrt((mu1+mu2)/(rb1+rb2)^3); % rad/s
% Initial conditions in km (position) and km/s (velocity)
X0 = [-1.240598960513758e4; 0; 0; 4.008300548151220; -9.226107074413168; 0];
% ode45 parameter
options = odeset('Reltol',3e-14,'AbsTol',3e-14);
% Time vector
tf = 495000;
t = linspace(0, tf, 10000);
% Orbit propagation
[T, X] = ode45(@CR3BP, t, X0, options, mu1, mu2, rb1, rb2, omega);
%Plot Orbit
figure
hold on
plot(-rb1,0,'ok', 'MarkerSize',5,'MarkerFaceColor','k');
plot(+rb2,0,'ok', 'MarkerSize',2,'MarkerFaceColor','k');
plot(X(:,1),X(:,2),'b')
xlabel('X (km)')
ylabel('Y (km)')
grid on