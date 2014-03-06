%% page 59 习题6
%% tao 不一样 
clear all; close all;
N = 256;
fs = 200;
n = 1:N;
tao = [1 .2];
noise = randn(512,1);
for i = 1:2
    tt = tao(i);
    y(i,:) = exp(- n/(200 * tt));
    out(i,:) = conv(y(i,:),noise');
    [c,log] = xcorr(out(i,:));
    subplot(2,2,2*i-1);
    plot(y(i,:));
    subplot(2,2,2*i);
    plot(log,c,'k');
end
%%