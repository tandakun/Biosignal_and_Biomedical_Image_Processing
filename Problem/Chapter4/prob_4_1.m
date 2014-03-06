%%  page 123 ÕÂËÄ Problems
%%  1
b = [.2 .2 .2 .2 .2];
N = 512;  fs = 1000;
f = (1:N)*(fs/N);
% way 1
H = abs(fft(b,N));
subplot(3,1,1);plot(f,H);
% way 2
[h,w] = freqz(b,1,N,fs);
subplot(3,1,2);  plot(w*2,abs(h));
% way 3
noise = wgn(1,1024,0);
y = filter(b,1,noise);
subplot(3,1,3);  plot(f,abs(fft(y,N)));
%%