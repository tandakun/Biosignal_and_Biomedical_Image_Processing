
%%  5
clear all;close all;
fs = 500; N = 1024;
% 参数 of Wavelet
L = 5; n = 6;  h0 = daub(n);
%  Chirp
f1 = 2;f2 = 30;t = (1:N)/fs;
sig = chirp(t,f1,1,f2);
noi = randn(1,N);
m = var(sig)/var(noi); x = sig+m*noi;
% analysis
an = analysis(x,h0,L); k = N/2;
sigma = var(an((k+1):end))/12; % 2 3
te = find(an((k+1):end))< sigma; an(k+te) = 0;
% reconstruction
xr = synthesisf(an,h0,L);
subplot(2,1,1);plot(t,x);title('原始信号');
subplot(2,1,2);plot(t,xr);title('Reconstruct--Signal');