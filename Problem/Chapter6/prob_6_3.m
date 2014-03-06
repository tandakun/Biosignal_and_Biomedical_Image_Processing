%% P 210     3
%
clear all;close all;
fs = 100;
N =  128;
haar = [.5;.5];
daub1 = daub(4);
daub2 = daub(10);
f(1,:) = fft(haar,N);
f(2,:) = fft(daub1,N);
f(3,:) = fft(daub2,N);
F = abs(f);
ff = (1:N/2)/fs;
for i = 1:3
    subplot(3,2,i*2-1);
    plot(ff,F(i,1:N/2));
    subplot(3,2,i*2);
    angl = angle(f(i,:));
    plot(angl);
end