%��ʼ��
clear all; close all;

%����һЩ����
N = 512;        %��������
fs = 500;       %������
f1 = 10;        %Ƶ��1
f2 = 40;        %Ƶ��2
tn = (1:N/4)/fs;   %��������ʱ��̶�

%�����ź�
sig = [zeros(N/4,1); sin(2*pi*f1*tn)'; sin(2*pi*f2*tn)';zeros(N/4,1)];

[WD f t] = fun_wvd(sig,fs);
WD = abs(WD);
subplot(2,2,1);
    mesh(t,f,WD);
    view(100,40);
    xlabel('Time (s)');
    ylabel('Frequency (Hz)');
    zlabel('WD(t,f)');
    title(['WD without adding analytic function ']);
subplot(2,2,2);
    contour(t,f,WD);
    xlabel('Time (s)');
    ylabel('Frequency (Hz)');
    title(['WD without adding analytic function ']);
    
%ʹ��analytic���� Notice��sig����˸��ϱ����� �������װ����
sig = hilbert(sig);

[WD f t] = fun_wvd(sig,fs);
WD = abs(WD);
subplot(2,2,3);
    mesh(t,f,WD);
    view(100,40);
    xlabel('Time (s)');
    ylabel('Frequency (Hz)');
    zlabel('WD(t,f)');
    title(['WD with adding analytic function ']);
subplot(2,2,4);
    contour(t,f,WD);
    xlabel('Time (s)');
    ylabel('Frequency (Hz)');
    title(['WD with adding analytic function ']);