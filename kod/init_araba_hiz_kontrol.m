clear all; close all; clc;
m = 1000; % arabanın kütlesi - kg
b = 50; % sönümleme katsayısı - Ns/m
r = 90; % hız kontolünde ulaşmak istediğimiz hız - m/s (km/s)
x10 = 0;
x20 = 0;
Kp = 500;
Ki = 50;
Kd = 25; % türevsel kontrol katsayısı
A = [0 1; 0 -b/m];
B = [0; 1/m];
C = [0 1];
D = 0;
sim('araba_hiz_kontrol.mdl');