%%   10
N = 512;fs = 1000;
x = sig_noise(150,350,-14,N);
n = 16;
f = [0 .26 .28 .32 .34 .66 .68 .72 .74 1];  % length of 10
a = [0   0   1   1   0   0  1   1   0  0];
[b,a] = yulewalk(n,f,a);
subplot(3,1,1);plot(abs(fft(x,N)));title('Ô­Ê¼ÐÅºÅ');
y = filter(b,a,x);
subplot(3,1,2);Y = abs(fft(y,N));plot(Y(1:N/2));title('Filtered signal');
h = freqz(b,a,N,fs);
subplot(3,1,3);plot(abs(h));title('Frequency of Filter');