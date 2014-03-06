%%  4
clear all;close all;
fs = 1000; N = 1024;  q = [7 13];
[x] = sig_noise([200,240],-10,254);
for i = 1:2
    p = q(i);
    % pmusic
    [ps,f] = pmusic(x,p,N,fs);
    subplot(2,2,i); plot(f,ps);
    title(['pmusic   ',num2str(p)]);
    % peig
    [ps,f] = pmusic(x,p,N,fs);
    subplot(2,2,i+2); plot(f,ps);
    title(['peig     ',num2str(p)]);    
end