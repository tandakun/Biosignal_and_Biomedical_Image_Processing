%% page 59 习题3 习题4  习题5
%% 噪声的平滑滤波 + 自相关计算
close all; clear all;
N = 512;    % 噪声长度
noise = randn(N,1);
for i = 3:N
    out(i) = (noise(i) + noise(i-1) + noise(i-2))/3;
end
[c,lags] = xcorr(out);
subplot(3,1,1);
plot(lags,c,'k');
xlabel('Lags');
ylabel('coef');
title('Autocorrelation');

hn = [1/3 1/3 1/3];
y = conv(noise,hn);
[c1,lags1] = xcorr(y);
subplot(3,1,2);
plot(lags1,c1,'k');
xlabel('Lags');
ylabel('Convoluion');
title('Autocorrelation');

hn1 = [.1 .1 .1 .1 .1 .1 .1 .1 .1 .1];
y = conv(noise,hn1);
[c2,lags2] = xcorr(y);
subplot(3,1,3);
plot(lags2,c2,'k');
xlabel('Lags');
ylabel('Convoluion');
title('Autocorrelation');