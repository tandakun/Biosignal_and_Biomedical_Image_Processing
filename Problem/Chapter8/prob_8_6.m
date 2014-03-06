%% 6
clear all; close all;clc;
N = 2000; fs = 2000;   t = (1:N)/fs;
fc = 250; fsig = 5;  wn = .02;  % 20/(2000/2) = 20/1000 = .02
wc = (1:N)*2*pi*fc/fs;  wsig = (1:N)*2*pi*fsig/fs;
[b,a] = butter(2,wn);  % 二阶低通滤波
% AM
Vs = sawtooth(wsig,.5);Vc = sin(wc);
V_AM = (1+.5*Vs).*Vc;
subplot(3,1,1);plot(t,V_AM);
% Noisy signal
noi = sin(2*pi*60*(1:N)/fs); scale = mean(Vs)/mean(noi)*10;
V1 = V_AM+scale*noi;subplot(3,1,2);plot(t,V1);
% 解调    
shift = 1;%  fix(fs/(2*fc));
Vc = [Vc(shift:end) Vc(1:shift-1)];
V_dam = V1.*Vc;  vout = filter(b,a,V_dam);
subplot(3,1,3);plot(t,vout);
