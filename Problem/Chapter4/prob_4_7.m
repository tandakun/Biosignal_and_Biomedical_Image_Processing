%% 7
fs = 1000; N = 512; n = 12; wn = .5;
[b,a] = butter(12,wn);
[h,w] = freqz(b,a,N,fs);
subplot(2,1,1); plot(w,abs(h));title(['IIR  Order = ',num2str(n)]);
fc = 250;% get from the butterworth filter
ff = [fc-10 fc+10];
aa = [1     0   ];
dev = [.01 .11];
[n,f0,a0,w] = firpmord(ff,aa,dev,fs);
bb = firpm(n,f0,a0,w);
[h,w] = freqz(bb,1,N,fs);
subplot(2,1,2); plot(w,abs(h));title(['FIR  Order = ',num2str(n)]);