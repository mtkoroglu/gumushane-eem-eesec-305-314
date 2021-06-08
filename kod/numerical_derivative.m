clear all; close all; clc;
T = 0.001; % örnekleme periyodu
stopTime = 0.04; % 2 periyoda bakalım
t = 0:T:stopTime;
f = 50; % frekans - Hz
A = 220;
y = A*sin(2*pi*f*t);
y_turev = A*cos(2*pi*f*t)*2*pi*f;
y_numerik_turev = zeros(1,length(t));
y_numerik_turev(1) = 70000;
for i=2:length(t)
    y_numerik_turev(i) = (y(i) - y(i-1)) / T;
end
%%
figure(1); set(gcf, 'position', [30, 210, 1392, 326]);
subplot(1,3,1);
plot(t, y, 'k.-', 'linewidth', 1);
grid on; set(gca, 'gridlinestyle', '--');
xlabel('Time (s)'); ylabel('Volt'); title('Priz sinyali');
subplot(1,3,2);
plot(t, y_turev, 'r.-', 'linewidth', 1);
grid on; set(gca, 'gridlinestyle', '--');
xlabel('Time (s)'); ylabel('Volt/s'); title('Priz sinyalinin türevi');
subplot(1,3,3);
plot(t, y_numerik_turev, 'b.-', 'linewidth', 1);
grid on; set(gca, 'gridlinestyle', '--');
xlabel('Time (s)'); ylabel('Volt/s'); title('Priz sinyalinin nümerik türevi');