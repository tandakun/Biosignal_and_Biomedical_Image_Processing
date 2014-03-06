%%  3
clear all;close all;
fs = 1000; N = 128;
p = 18;
q = 12;
[x] = sig_noise([200,230],[-5,-9],N)
% Welch;
[ps,f] = pwelch(x,N,[],[],fs);
subplot(3,1,1); plot(f,ps);  
title('Pwelch');
% mcov
[ps,f] = pcov(x,p,N,fs);
subplot(3,1,2);plot(f,ps);
title('Modified Covariance');
%  pmusic
[ps,f] = pmusic(x,q,N,fs);
subplot(3,1,3);plot(f,ps);
title('Modified Covariance');