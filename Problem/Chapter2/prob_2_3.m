clear all; close all;
N = 512; 
b = rand(1,N)*10;
for i = 1:N-2
    a(i)=b(i)+b(i+1)+b(i+2);
end
[a_auto lags] = xcorr(a,'coeff');
subplot(2,1,1);
plot(a,'k');
subplot(2,1,2);
plot(lags,a_auto);


 