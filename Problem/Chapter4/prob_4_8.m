%% 8
close all;clear all;clc;
fs = 1000; N = 512;
n = 100;
L = 10;
b1 = zeros(1,2*L+1);  % 两点中心差分滤波
b1(1) = -fs/(2*L);
b1(2*L+1) = fs/(2*L);
[h1 w1] = freqz(b1,1,N,fs);
subplot(2,1,1); plot(w1,abs(h1));
fc =25*2/fs; 
f = [0.001 fc-.001 fc+.001 1];
a = [0   1       0     0];
b2 = firls(n,f,a);
[h2 w2]= freqz(b2,1,N,fs);
subplot(2,1,2); plot(w2,abs(h2));