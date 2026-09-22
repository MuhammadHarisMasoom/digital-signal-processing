%% ================= Half-Sine TX & RX Filter Generator ================= 
clc; clear; close all; 
% ---------------- Parameters ---------------- 
Rb = 16e6;         
L  = 8;           
Fs = Rb * L;       
Ts = 1/Rb;         
% Bit rate 
% Oversampling factor 
% Sampling frequency (128 MHz) 
% Symbol duration 
% ---------------- TX Half-Sine Filter ---------------- 
n = 0:(L-1); 
h_tx = sin(pi*(n + 0.5)/L);    % Standard half-sine pulse 
% Normalizations (optional, choose based on design) 
h_tx_peak   = h_tx / max(h_tx);          
h_tx_sum    = h_tx / sum(h_tx);          
% Peak = 1 
% DC gain = 1 
h_tx_energy = h_tx / sqrt(sum(h_tx.^2)); % Unit energy 
% ---------------- RX Matched Filter ---------------- 
% For half-sine, matched filter is time-reversed version of TX 
% But since it's symmetric, it's the same shape. We use energy normalization. 
% h_rx = fliplr(h_tx) / sqrt(sum(h_tx.^2)); 
h_rx = conj(flip(h_tx)) / sqrt(sum(h_tx.^2)); 
% ---------------- Display Coefficients ---------------- 
disp('--- TX Half-Sine Coefficients (Unnormalized) ---'); 
fprintf('%0.6f ', h_tx); 
fprintf('\n\n'); 
disp('--- TX Half-Sine Coefficients (Energy Normalized) ---'); 
fprintf('%0.6f ', h_tx_energy); 
fprintf('\n\n'); 
disp('--- RX Matched Filter Coefficients (Energy Normalized) ---'); 
fprintf('%0.6f ', h_rx); 
fprintf('\n'); 
% ---------------- Plot TX vs RX ---------------- 
figure; 
subplot(2,1,1); 
stem(n, h_tx, 'filled'); 
title('TX Half-Sine Filter (Unnormalized)'); 
xlabel('Sample Index'); ylabel('Amplitude'); grid on; 
subplot(2,1,2); 
stem(n, h_rx, 'filled'); 
title('RX Matched Filter (Energy Normalized)'); 
xlabel('Sample Index'); ylabel('Amplitude'); grid on;