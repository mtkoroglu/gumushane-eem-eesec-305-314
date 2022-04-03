clear all; close all; clc;
n = [0, 0, 1]; d = [1, 3, 2];
sys = tf(n,d)
figure(1); clf;
rlocus(sys);
axis([-2.5 -0.5 -15 15])
%%
T = 0.01; stopTime = 5;
t = [0:T:stopTime]';
blokDiyagram = imread('./../şekil/root locus example 2.jpg');
% aşağıdaki Boolean değişkenlerden aynı anda sadece birisini true yapın
generateGif = false;
generateVideo = false;
if generateVideo
    v = VideoWriter('rlocus basamak cevabı animasyonu.mp4', 'MPEG-4');
    v.Quality = 100; v.FrameRate = 30;
    open(v);
end
figure(2); clf; set(gcf, 'position', [725 68 783 697], 'color', 'w');
for K=[0:0.01:0.25 0.3:0.05:5 6:224]
    simResults = sim('root_locus_sim_example_2.mdl');
    r  = simResults.data(:,2);
    y = simResults.data(:,3);
    clf;
    subplot(2,2,1); cla; hold on;
    plot(t, r, 'r-', 'linewidth', 1.2);
    plot(t, y, 'b-', 'linewidth', 1.2);
    hold off;
    axis([0 stopTime -0.5 2]);
    grid on; set(gca, 'gridlinestyle', '--', ...
        'position', [0.0644 0.5352 0.9073 0.4028], 'xtick', [0:0.5:stopTime],...
        'ytick', [-0.5:0.5:2.5], 'yticklabel', {'','0','','1','','2',''});
    xlabel('Zaman (s)', 'fontsize', 14);
    ylabel('Sistem Cevabı', 'fontsize', 14);
    textTitle = sprintf('K=%.2f için basamak cevabı', K);
    title(textTitle, 'fontsize', 12);
    legend('r(t)', 'y(t)', 'location', 'northeast');
    set(legend, 'fontsize', 15, 'interpreter', 'latex');
    subplot(2,2,3);
    imshow(blokDiyagram);
    set(gca, 'position', [0.03, 0.03, 1.55*0.3347, 1.55*0.3412]);
    subplot(2,2,4);
    poles = roots([d(1:2) d(3)+K]);
    hold on;
    plot(real(poles(2)), imag(poles(2)), 'gs');
    plot(real(poles(1)), imag(poles(1)), 'bo');
    rlocus(sys);
    hold off;
    axis([-2.5 -0.5 -15 15]);
%     grid on; set(gca, 'gridlinestyle', '--', 'xtick', [-3:1:0], 'ytick', [-2:0.5:2]);
%     set(gca, 'position', [0.6247    0.05    0.35    0.35]);
    axIm = findall(gcf,'String','Imaginary Axis (seconds^{-1})');
    axRe = findall(gcf,'String','Real Axis (seconds^{-1})');
    set(axIm,'String','Sanal Eksen', 'position', [288 108 0]);
    set(axRe,'String','Reel Eksen');
    legend('kutup 1', 'kutup 2', 'location', 'northeast');
    set(legend, 'fontsize', 10, 'interpreter', 'latex');
%     pause(0.1);
    % make gif animation
    frame = getframe(gcf);
    img = frame2im(frame);
    if generateGif
        [imgGif, cmap] = rgb2ind(img,256);
        if K == 0
            imwrite(imgGif, cmap, 'rlocus basamak cevabı animasyonu.gif', 'gif', 'LoopCount', Inf, 'DelayTime', 0);
        else
            imwrite(imgGif, cmap, 'rlocus basamak cevabı animasyonu.gif', 'gif', 'WriteMode', 'append', 'DelayTime', 0);
        end
    end
    if generateVideo
        writeVideo(v, img);
    end
end
if generateVideo
    close(v);
end