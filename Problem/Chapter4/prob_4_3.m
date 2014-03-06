%%  3  
fs = 1000; n = 512;
sig = sig_noise(512,0,-20,512);
fh = 210;  fl = 190;
L = 128;
b = zeros(1,L);
for i = 1:L
    if i ~= L/2
        k1 = sin(2*pi*fh/fs*(i-L/2))/(pi*(i-L/2));
        k2 = sin(2*pi*fl/fs*(i-L/2))/(pi*(i-L/2));
        b(i) = k1 - k2;
    else
        b(i) = 2*(fh - fl)/fs;
    end
end
X = abs(fft(sig,n));
y = filter(b,1,sig);
Y = abs(fft(y,n));
f = (1:n)*(fs/n);
subplot(2,1,1);plot(f,X);
subplot(2,1,2);plot(f(1:n/2),Y(1:n/2),'k');
