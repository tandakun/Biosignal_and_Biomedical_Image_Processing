%初始化
clear all; close all;

%定义一些常量
N = 512;        %采样点数
fs = 500;       %采样率
f1 = 10;        %开始频率
f2 = 200;       %结束频率  
tn = (1:N)/fs;   %构建虚拟时间刻度

%创建chirp信号
sig = chirp(tn, f1, 1,f2);

[WD f t] = fun_wvd(sig,fs);
WD = abs(WD);
subplot(2,2,1);
    mesh(t,f,WD);
    xlabel('Time (s)');
    ylabel('Frequency (Hz)');
    zlabel('WD(t,f)');
    title(['WD without adding analytic function ']);
subplot(2,2,2);
    contour(t,f,WD);
    xlabel('Time (s)');
    ylabel('Frequency (Hz)');
    title(['WD without adding analytic function ']);
    
%使用analytic函数 Notice：sig变成了复合变量了 这儿应该有个轭装换 是不是啊？
sig = conj(hilbert(sig));

[WD f t] = fun_wvd(sig,fs);
WD = abs(WD);
subplot(2,2,3);
    mesh(t,f,WD);
    xlabel('Time (s)');
    ylabel('Frequency (Hz)');
    zlabel('WD(t,f)');
    title(['WD with adding analytic function ']);
subplot(2,2,4);
    contour(t,f,WD);
    xlabel('Time (s)');
    ylabel('Frequency (Hz)');
    title(['WD with adding analytic function ']);