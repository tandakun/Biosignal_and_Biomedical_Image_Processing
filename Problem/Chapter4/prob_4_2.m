%%  2   
%  Use function  y = sig_noise(f1,f2,snr,n);
%  y = sig_noise(200,222,5,1024);
%  Y = fft(y,256);
%  plot((1:256)*(1000/256),abs(Y));
%  axis([0,500,0,300])
clear all;close all;clc;
SNR = [-8 -12];
SNR_l = 10.^(SNR/20);
n = 512; fs = 1000;
for i = 1:2
    snr = SNR_l(i);
    sig = sig_noise(200,230,5,n);
    Sig = abs(fft(sig)); f = (1:n/2)*(fs/n);
    figure
    subplot(2,1,1);
    plot(Sig(1:n/2),'--k');
    b = fir1(23,[.4 .46]);
    y = filter(b,1,sig);
    Y = abs(fft(y,n));f = (1:n/2)*(fs/n);
    subplot(2,1,2);plot(f,Y(1:n/2));
    axis([0,300,0,40]);
end
