
%%  4
clear all;clc;
N = 1024;fs = 1000;   %  LL = [128 256];
a = .25;                 L = 256;
[xd,t,xx] = sig_noise([10,20],-8,N);
subplot(4,4,1);plot(t,xx);title('未加噪原始信号');
delay = 4:18;
m = length(delay);
yy = zeros(m,N);
for i = 1:m
    D = delay(i);
    x = [xd(D:end) xd(1:D-1)];
    dpx = 10*L*sum((x.^2))/(N+1);
    delt = a/dpx;
    [b,y] = lms(x,xd,L,delt);
    yy(i,:) = y;
    subplot(4,4,(i+1));plot(t,y);title(['delay : ',num2str(D)]);
end
% change the L,and compare
% yy2 = yy;
% subplot(2,1,1);plot(yy(5,:));subplot(2,1,2);plot(yy2(5,:));