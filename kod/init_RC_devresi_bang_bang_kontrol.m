clear all; close all; clc;
T = 0.001; % sample time = 10ms
stopTime = 0.5;
r = 5; % kapasitörün 5V olmasını istiyoruz
A = 10000;
V0 = 0; % kapasitörün başlangıç voltajı
R = 1000; % 470ohm
C = 1e-4; % 100uF
sim('RC_devresi_bang_bang_kontrol.mdl');