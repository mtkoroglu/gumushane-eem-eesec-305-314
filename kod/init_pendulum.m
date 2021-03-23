clear all; close all; clc;
T = 0.1;
stopTime = 50;
g = 9.8; % m/s^2
l = 1; % m
b = 0.2; % sürtünme kuvveti katsayısı
m = 1; % çubuğun ucundaki noktasal kütle
x1_0 = 1; % açının başlangıç değeri
x2_0 = 0; % açısal hızın başlangıç değeri
sim('pendulum.mdl');