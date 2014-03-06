%%  5
clear all;close all;clc;
fs = 1000; N = 512;
fc = .15; n = 12; wn = fc; rp = .5; rs = 80;
[b1,a1] = butter(n,wn);
[b2,a2] = cheby1(n,rp,wn);
[b3,a3] = cheby2(n,rs,wn);
[b4,a4] = ellip(n,rp,rs,wn);
figure;freqz(b1,a1,N,fs);
figure;freqz(b2,a2,N,fs);
figure;freqz(b3,a3,N,fs);
figure;freqz(b4,a4,N,fs);