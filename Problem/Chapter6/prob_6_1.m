%初始化
clear all; close all;

%定义一些常量
N = 512;        %采样点数
fs = 500;       %采样率
f1 = 10;        %开始频率
f2 = 200;       %结束频率  
t = (1:N)/fs;   %构建虚拟时间刻度

%产生chirp信号
fc = ((1:N)*((f2-f1)/N)) + f1;
x = sin(pi*t.*fc);

%添加不同的窗口
%============================
%h = hanning
%b = blackman
%c = chebwin
%============================
name_window = ['c','b','h'];
length_name = length(name_window);

%添加某个窗口的可变长度
length_window = [128 64 32];
length_size = length(length_window);


for j = 1:length_name
    figure;
    %选取一个窗口
    win_name = name_window(j);
    %对该选取不同长度
    for i = 1:length_size 
        [B f t] = fun_spectog(x,win_name,length_window(i),0,fs);
        subplot(length_size,2,(i-1)*2+1);
            %画图
            mesh(t,f,abs(B));
            xlabel('Time (s)');
            ylabel('Frequency (Hz)');
            zlabel('Sp(t,f)');
            title(['STFT with ',num2str(length_window(i)),'points ','window(',win_name,')']);
        subplot(length_size,2 ,i*2);
            %画图
            contour(t,f,abs(B));
            xlabel('Time (s)');
            ylabel('Frequency (Hz)');
            title(['STFT with ',num2str(length_window(i)),'points ','window(',win_name,')']);
    end
end