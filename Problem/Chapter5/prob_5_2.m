%%  2
clear all;close all;
fs = 1000; N = 64;   p = 50;
for i = 1:5
[x] = sig_noise([200,220],-i,N);
[ps,f] = pburg(x,p,[],fs);
subplot(5,2,i*2-1); plot(f,ps);  
title(['SNR = -',num2str(i),'   order = ',num2str(p)]);
end