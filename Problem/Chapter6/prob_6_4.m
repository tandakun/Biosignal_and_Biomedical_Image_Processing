%%   
clear all;close all;
fs = 100;
N  = 128;
n = 10;
h0 = daub(n)';
f = (1:N/2)/fs;
for i = 1:n
    h1(i) = (-1)^(i+1)*h0(n-i+1);
end
g0 = h0(n:-1:1);
g1 = h1(n:-1:1);
hh = [h0;h1;g0;g1];
H = fft(hh',N);
H = H';
HH = abs(H);
L = 4;%length(H(:,1));
for i = 1:L
    subplot(L,2,i*2-1);
    plot(f,HH(i,1:N/2));
    subplot(L,2,i*2);
    angl = angle(H(i,:));
    plot(angl);
end