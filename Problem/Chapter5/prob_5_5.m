%% 5
clear all;close all;
fs = 1000; N = 1024; n = 64;
p = 14;
q = 8;
[x] = sig_noise([300,330],-3,n);
% pwelch
[ps,f] = pwelch(x,n,[],[],fs);
subplot(3,1,1); plot(f,ps);  
title('Pwelch');
% pburg
[ps,f] = pcov(x,p,N,fs);
subplot(3,1,2);plot(f,ps);
title('AR  Burg');
%  pmusic
[ps,f] = pmusic(x,q,N,fs);
subplot(3,1,3);plot(f,ps);
title('MUSIC');