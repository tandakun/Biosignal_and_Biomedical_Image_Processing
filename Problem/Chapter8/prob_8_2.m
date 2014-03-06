
%%  2
%   figure
clear all;clc;
N = 1000; fs =1000;
a = .25;  L =32;
bu = [.2 .5]; au = [1 -.2 .8];
f = (1:N)*fs/N;
x = randn(1,N);
dpx = L*10*sum(x.^2)/(L+1);
delt = a/dpx;
xd = filter(bu,au,x);
b = lms(x,xd,L,delt);
hu = abs(freqz(bu,au,N));
hm = abs(freqz(b,1,N));
subplot(2,1,1);plot(f,hu);title('unknown');
subplot(2,1,2);plot(f,hm);title('Match');