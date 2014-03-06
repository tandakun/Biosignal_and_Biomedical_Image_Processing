%% 7   2014/3/1   ¡Ë≥ø 1:55
fs = 500; N = 1024;
f1 = 2; f2 = 100;
t  =(1:N)/fs;
x = chirp(t,f1,1,f2);
% 
L = 3;
h0 = daub(4);
wp = w_packet(x,h0,L);
W = reshape(wp,2^L,[]);
clc
k = 2^L;
for i =1:k
    subplot(k/2,2,i);plot(t(1:N/k),W(i,:));
    if i==1
        title('Lowpass');
    else if i ==2
            title('Highpass');
        end
    end
end