% Script farrow_2.m for fractional delay farrow filter.
% Change the value of "Delay" variable between 0 and 1 and examine the
% results.
clc; clear; close all;

% ------ Initializations
fs = 1000;     Ts = 1/fs;  % Sample frequency; Sample Period

Tf = 1;                    % Simulation duration


% ------ Matrix C of coefficients
Delta = 0.5;                    % The delay parameter
C = [-0.1667, 0.5, -0.3333, 0;
    0.5,-1,-0.5,1;
    -0.5, 0.5, 1,0;
    0.1667, 0, -0.1667, 0];

%h = flipud(CD)'; % Impulse response of the FIR interpolation filter

% ------ Call up the simulation
sim('Farrow2',[0,Tf]);
% sim('Farrow21',[0,Tf]);

t = y1.Time;
yc = y1.Data;

yinp = y.Data(:,1);      % Input signal 
ydel = y.Data(:,2);      % Interpolated signal

n = length(y.Data(:,1));

figure(1);   clf;

% stem((0:n-1)*Ts, yinp,'k-','LineWidth',1.5, 'Color','b');
plot((0:n-1)*Ts, yinp);
hold on;
% stem(((0:n-1)-2+Delta)*Ts, ydel,'k--','LineWidth',1,'Marker','*', 'Color','r');
plot(((0:n-1)-2+Delta)*Ts, ydel);
% plot(t, yc,'k-','LineWidth',1);
title(['blue = orignal input, red = delayed output'...
    ' for \Delta = ',num2str(Delta)]);
xlabel('t');   grid on;
La = axis;   axis([0.3, 0.32, -1, 2.5]);



% t = 0:Ts/100:Tf;           % Time for the time-continuous signals

% fsig1 = 10;    ampl1 = 1;        % The three input signals 
% sig1 = ampl1*cos(2*pi*fsig1*t);
% 
% fsig2 = 50;    ampl2 = 1;
% sig1 = ampl2*cos(2*pi*fsig2*t);
% 
% fsig3 = 100;    ampl3 = 1;
% sig1 = ampl3*cos(2*pi*fsig3*t);

% subplot(211),
% stem((0:n-1)*Ts, yinp,'k-','LineWidth',1.5);
% hold on;
% stem(((0:n-1))*Ts, ydel,'k--','LineWidth',1,'Marker','*');
% plot(t, yc,'k-','LineWidth',1);
% title(['Interpolated signal (*) at the calculation points'...
%      ' for \Delta = ',num2str(Delta)]);
% xlabel('t');   grid on;
% La = axis;   axis([0.3, 0.32, -1, 2.5]);
% 
% subplot(212),









