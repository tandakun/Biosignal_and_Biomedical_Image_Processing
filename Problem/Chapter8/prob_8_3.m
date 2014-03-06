%% 3
%    figure
clear all;clc;
N = 1024;fs = 1000;L = 128; D = N/4; a = .25;
[x,t] = sig_noise(20,8,N);
dpx = 10*L*sum(x.^2)/(N+1);
delt = a/dpx;
xd = [x(D:end) x(1:D-1)];
[b y out] = lms(x,xd,L,delt);
subplot(3,1,1); plot(t,x);
subplot(3,1,2); plot(t,y);
subplot(3,1,3); plot(t,out);