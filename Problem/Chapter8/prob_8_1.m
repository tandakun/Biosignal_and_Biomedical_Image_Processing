%%  241
% poblem 1
%   figure ; plot(t,x)
clear all;
% close all;clc;
N = 1000; fs = 1000;     L_all = [2 6 12];
[x,t,xd] = sig_noise([10,20],8,N);figure
subplot(2,2,1);plot(t,xd);
b = zeros(3,max(L_all));
for i = 1:3
    L = L_all(i);
    bb = wiener_hopf1(x,xd,L);
    b(i,1:L) = bb;
    y = filter(b(i),1,x);
    subplot(2,2,(i+1));plot(t,y);
end