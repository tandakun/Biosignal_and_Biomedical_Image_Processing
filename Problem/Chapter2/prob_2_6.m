clear all; close all;

fs = 200;%HZ
n = 5*fs;
tol = 0.2;%s
t = (1:n)/fs;
impluse = exp(-t/tol);
subplot(3,1,1);
plot(t,impluse);
%axis([1 400 0 1.2]);
noise = rand(1,512);
y = conv(noise,impluse);
subplot(3,1,2);
plot(y)
[y_corr lags] = xcorr(y,'coeff');
subplot(3,1,3);
plot(lags,y_corr)