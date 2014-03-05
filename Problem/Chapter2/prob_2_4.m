clear all; close all;
N = 512; 
b = rand(1,N)*10;
h = [1/3 1/3 1/3];
y = conv(b,h);
subplot(2,1,1);
plot(b,'k');
subplot(2,1,2);
plot(y,'--k');