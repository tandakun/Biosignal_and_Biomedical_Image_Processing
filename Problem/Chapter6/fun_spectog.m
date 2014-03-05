function [B,f,t] = fun_spectog(x,win_type,nfft,noverlap,fs)
% Function to calculate spectrogram
% Output arguments
%   sp spectrogram
%   t time vector for plotting
%   f frequency vector for plotting
% Input arguments
%   x data
%   win_type window type
%   nfft window size
%   fs sample frequency
%   noverlap numbers of overlapping points in adjacent segments
% Uses Hanning window
%
[N xcol] = size(x);
%列向量提高运行速度
if N < xcol
    x = x';
    N = xcol;
end

%选择不同的窗口函数
%============================
%h = hanning
%b = blackman
%c = chebwin
%============================
if win_type(1)=='h'
    window_data = hanning(nfft);
elseif win_type(1) == 'b'
    window_data = blackman(nfft);
elseif win_type(1) == 'c'
    window_data = chebwin(nfft);
end

%调整窗口重叠大小 想到了pwelch法 呵呵！
incr = nfft - noverlap;
%在原始数据前后分别添加长度为一半窗口长度的零值 为啥？下面你就懂了
hwin = fix(nfft/2);
x_mod  = [zeros(hwin,1);x;zeros(hwin,1)];
%只须取一半频率 这是奈特斯特法则
f = (1:hwin)*(fs/nfft);

%循环体 用于滑动窗口分析
j = 1;
for i = 1:incr:N
    data = x_mod(i:i+nfft-1).*window_data;% diffrent window filter
    ft = abs(fft(data));
    B(:,j) = ft(1:hwin);
    t(j) = i/fs;%t位置长度 未预分配 有点问题
    j = j+1;
end