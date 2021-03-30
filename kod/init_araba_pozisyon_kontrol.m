clear all; close all; clc;
stopTime = 50;
m = 1000; % arabanın kütlesi - kg
b = 50; % damping coefficient (sönümleme katsayısı) - Ns/m = kg/s
r = 1000; % % referans sinyali (hız kontrolünde gitmek istediğimiz pozisyon) - m (km)
x10 = 0; % başlangıç konumu
x20 = 0; % başlangıç hızı
A = [0 1; 0 -b/m]; % sistem matrisi
B = [0; 1/m]; % giriş matrisi
C = [1 0]; % çıkış matrisi
D = 0; % ileri besleme matrisi
%%
Kp = 20; % oransal kontrol kazancı - 20
Ki = 0; % integral kontrol kazancı - 0
Kd = 375; % türevsel kontrol kazancı - 375
sim('araba_pozisyon_kontrol.mdl');