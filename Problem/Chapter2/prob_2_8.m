clear all; close all;
fs = 500;%Hz
fn = [10 20];%Hz
delta = 0.04;
N = fs*2;
t = (1:N)/fs;
num = 4;
y = zeros(N,4);

    y(:,1) = ((delta/(delta-1))*exp(-delta*2*pi*fn(1)*t).*sin(2*pi*fn(1)*sqrt(1-delta^2)*t))';
    y(:,2) = ((delta/(delta-1))*exp(-delta*2*pi*fn(2)*t).*sin(2*pi*fn(2)*sqrt(1-delta^2)*t))';
    y(:,3) = ((delta/(delta-1))*exp(-delta*2*pi*fn(1)*t).*cos(2*pi*fn(1)*sqrt(1-delta^2)*t))';
    y(:,num) = ((delta/(delta-1))*exp(-delta*2*pi*fn(2)*t).*cos(2*pi*fn(2)*sqrt(1-delta^2)*t))';
    subplot(3,1,1);
    plot(t,y);
    %axis([1 400 0 1.2]);
    noise = rand(1,512);
    for i =1:num
    y_conv(:,i) = conv(noise',y(:,i));
    end
    subplot(3,1,2);
    plot(y_conv)
    [y_corr lags] = xcorr(y_conv,'coeff');
    subplot(3,1,3);
    plot(lags,y_corr);
    a= zeros(num,num);
    for i  = 1: num
        for j = i:num
            a(i,j)= y(:,i)'*y(:,j);
        end
    end
    a
