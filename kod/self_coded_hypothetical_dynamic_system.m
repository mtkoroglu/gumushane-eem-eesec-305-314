clear all; close all; clc;
T = 0.01; % örnekleme periyodu
stopTime = 10; % son zaman
t = 0:T:stopTime; % zamanı oluşturalım
x0 = [13, 18, -12]; % başlangıç koşulları
x1(1) = x0(1); x2(1) = x0(2); x3(1) = x0(3);
% forward euler tekniği ile nümerik integral alarak dinamik sistemi koşturalım
for i = 2:length(t)
    x1(i) = x1(i-1) + x2(i-1)*T;
    x2(i) = x2(i-1) + x3(i-1)*T;
    x3(i) = x3(i-1) - (6*x1(i-1) + 11*x2(i-1) + 6*x3(i-1))*T;
end
%%
figure(1); set(gcf, 'position', [5, 380, 416, 372]);
plot3(x1, x2, x3, 'k-', 'linewidth', 1.6);
hold on;
plot3(x1(1), x2(1), x3(1), 'ro');
plot3(x1(end), x2(end), x3(end), 'go');
grid on; set(gca, 'gridlinestyle', '--', 'position', [0.1266 0.0907 0.8311 0.9009]);
xlabel('x_1'); ylabel('x_2'); zlabel('x_3');
legend('durum değişkenlerinin yörüngesi', 'başlangıç', 'bitiş');
set(legend, 'position', [0.2593 0.2441 0.5359 0.1419]);
hold off;
figure(2); set(gcf, 'position', [426, 416, 1070, 280]);
subplot(1,3,1);
plot(t, x1, 'b-'); xlabel('time (s)'); ylabel('x_1');
grid on; set(gca, 'gridlinestyle', '--', 'position', [0.0441, 0.15, 0.28, 0.82]);
subplot(1,3,2);
plot(t, x2, 'r-'); xlabel('time (s)'); ylabel('x_2');
grid on; set(gca, 'gridlinestyle', '--', 'position', [0.3754, 0.15, 0.28, 0.82]);
subplot(1,3,3);
plot(t, x3, 'g-'); xlabel('time (s)'); ylabel('x_3');
grid on; set(gca, 'gridlinestyle', '--', 'position', [0.7045, 0.15, 0.28, 0.82]);