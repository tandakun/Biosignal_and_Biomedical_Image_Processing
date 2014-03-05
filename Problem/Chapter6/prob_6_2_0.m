%初始化
clear all; close all;

%定义一些常量
N = 512;        %采样点数
fs = 500;       %采样率
f1 = 10;        %频率1
f2 = 40;        %频率2
tn = (1:N/4)/fs;   %构建虚拟时间刻度

%创建信号
sig = [zeros(N/4,1); sin(2*pi*f1*tn)'; sin(2*pi*f2*tn)';zeros(N/4,1)];

[WD f t] = fun_wvd(sig,fs);
WD = abs(WD);
subplot(2,2,1);
    mesh(t,f,WD);
    view(100,40);
    xlabel('Time (s)');
    ylabel('Frequency (Hz)');
    zlabel('WD(t,f)');
    title(['WD without adding analytic function ']);
subplot(2,2,2);
    contour(t,f,WD);
    xlabel('Time (s)');
    ylabel('Frequency (Hz)');
    title(['WD without adding analytic function ']);
    
%使用analytic函数 Notice：sig变成了复合变量了 这儿有轭装换？
sig = hilbert(sig);

[WD f t] = fun_wvd(sig,fs);
WD = abs(WD);
subplot(2,2,3);
    mesh(t,f,WD);
    view(100,40);
    xlabel('Time (s)');
    ylabel('Frequency (Hz)');
    zlabel('WD(t,f)');
    title(['WD with adding analytic function ']);
subplot(2,2,4);
    contour(t,f,WD);
    xlabel('Time (s)');
    ylabel('Frequency (Hz)');
    title(['WD with adding analytic function ']);