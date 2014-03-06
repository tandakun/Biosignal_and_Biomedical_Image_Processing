%%  4   plot first 150 个点
clear all;close all;clc;
fs = 1000; N = 512; f = (1:N)*fs/N;
fc = 0.15; 
fn = [0 fc-.01 fc+.01  1];
a = [1 1 0 0]; 
x = [0,ones(1,N-1)];
b1 = firpm(15,fn,a);h1 = abs(fft(b1,N))/max(abs(fft(b1,N)));
b2 = firls(15,fn,a);h2 = abs(fft(b2,N))/max(abs(fft(b2,N)));
b3 = fir2 (15,fn,a);h3 = abs(fft(b3,N))/max(abs(fft(b3,N)));
b4 = fir2 (30,fn,a);h4 = abs(fft(b4,N))/max(abs(fft(b4,N)));
subplot(4,1,1);plot(f(1:N/2),h1(1:N/2),'linewidth',2); title('P-M');
subplot(4,1,2);plot(f(1:N/2),h2(1:N/2),'linewidth',2); title('最小二乘');
subplot(4,1,3);plot(f(1:N/2),h3(1:N/2),'linewidth',2); title('Rectangular-15');
subplot(4,1,4);plot(f(1:N/2),h4(1:N/2),'linewidth',2); title('Rectangular-30');