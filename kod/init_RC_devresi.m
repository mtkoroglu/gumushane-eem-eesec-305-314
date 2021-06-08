clear all; close all; clc;
T = 0.01; % sample time = 10ms
stopTime = 2;
Vcc = 5; % 5V
V0 = 0; % kapasitörün başlangıç voltajı
R = 1000; % 470ohm
C = 1e-4; % 100uF
tau = R*C;
sim('RC_devresi.mdl');