%% P 144 problem
%% 1
clear all;close all;
fs = 1000;         p = 24;
[x] = sig_noise([200,220],-5,254);
[ps,f] = pburg(x,p,[],fs);
subplot(2,1,1); plot(f,ps);  
title('SNR = -5   order = 24');
q = 27;
[x] = sig_noise([200,220],-10,254);
[ps,f] = pburg(x,q,[],fs);
subplot(2,1,2); plot(f,ps);
title('SNR = -10  order = 27');
