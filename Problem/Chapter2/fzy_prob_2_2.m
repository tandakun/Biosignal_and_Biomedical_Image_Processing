%% page 59 ϰ��2
%% �۲���������źų��ȶ������ϵ����Ӱ��
close all; clear all;
L = [2048 256];      % �����������ĳ���
for i = 1:2
    N = L(i);
    noise = randn(N,1);
    [c,lags] = xcorr(noise);
    subplot(2,1,i);
    plot(lags,c,'k');
    xlabel('Lags');
    ylabel('coef');
    title(['Autocorrelation',': Noise length = ',num2str(N)] );
    axis([-2000 2000 -200 2000]);
end