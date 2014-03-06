%%  6
clear all;close all;
fs = 1000; N = 1024;
n = 12;
f = [0 .25 .25 .5 .5  1];
m = [0   0  1   1  0  0];
[b,a] = yulewalk(n,f,m);
sig = randn(1,N);
x = filter(b,a,sig);
%  fft
B = (abs(fft(b,N))).^2;
A = (abs(fft(a,N))).^2;
H = B./A;
subplot(2,1,1);plot(H(1:N/2));
% [h,f] = freqz(b,a,N,fs);
% HH = (abs(h)).^2;
% subplot(2,1,2);plot(HH);