clear all; close all;
fs = 500;%Hz
fn = 10;%Hz
delta = 0.1;
N = fs*2;
t = (1:N)/fs;
y = (delta/(delta-1))*exp(-delta*2*pi*fn*t).*sin(2*pi*fn*sqrt(1-delta^2)*t);
subplot(3,1,1);
plot(t,y);
%axis([1 400 0 1.2]);
noise = rand(1,512);
y_conv = conv(noise,y);
subplot(3,1,2);
plot(y_conv)
[y_corr lags] = xcorr(y_conv,'coeff');
subplot(3,1,3);
plot(lags,y_corr)