clear all; close all; clc;
stopTime = 10;
m = 1000; % arabanın kütlesi - kg
b = 50; % damping coefficient (sönümleme katsayısı) - Ns/m = kg/s
r = 90; % referans sinyali (hız kontrolünde ulaşmak istediğimiz hız) - m/s (km/s)
x10 = 0; % başlangıç konumu
x20 = 0; % başlangıç hızı
A = [0 1; 0 -b/m]; % sistem matrisi
B = [0; 1/m]; % giriş matrisi
C = [0 1]; % çıkış matrisi
D = 0; % ileri besleme matrisi
%%
Kp = 5000; % oransal kontrol kazancı - 5000
Ki = 70; % integral kontrol kazancı - 70
Kd = 195; % türevsel kontrol kazancı - 195
sim('araba_hiz_kontrol.mdl');