clear all; close all; clc;
T = 0.01;
stopTime = 50;
g = 9.8; % m/s^2
l = 1; % m
b = 0.2; % sürtünme kuvveti katsayısı
m = 1; % çubuğun ucundaki noktasal kütle
x10 = 0; % açının başlangıç değeri
x20 = 0; % açısal hızın başlangıç değeri
r = (85/180)*pi; % referans sinyali
Kp = 80; % 80
Ki = 10; % 70
Kd = 15; % 15
umax = 100; umin = -100;
sim('pendulum_with_input.mdl');