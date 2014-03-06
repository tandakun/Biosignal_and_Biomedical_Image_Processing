%%  6
clear all;close all;clc;
load('C:\Users\fengzhiyan\Desktop\62301CD\Chapter 7\Prob7_7_data');
sig =x;L = 3;
fs = 500; N = length(sig); t = (1:N)/fs;
sigma = max(sig)*.05;  % .005 没有明显的间断点
% Offset function
offset = zeros(size(sig));
n = 0;
for i = 30:(150+8*i):N
    offset(i:end) = sigma;
    n = n+1;
    sigma = sigma/2;
end
signal = sig+offset;
x = integer(integer(signal));
h0 = daub(10);
an1 = analysis(x,h0,L);
h00 = [1/2;1/2];
an2 = analysis(x,h00,L);
figure;plot(t(1:N/2),an1((N/2+1):end),'r');
hold on;plot(t(1:N/2),(an2((N/2+1):end)+1),'--k');legend('Duab','Haar');
%  figure; subplot(2,1,1);plot(offset);subplot(2,1,2),plot(signal)