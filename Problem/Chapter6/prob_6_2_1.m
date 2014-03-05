%��ʼ��
clear all; close all;

%����һЩ����
N = 512;        %��������
fs = 500;       %������
f1 = 10;        %��ʼƵ��
f2 = 200;       %����Ƶ��  
tn = (1:N)/fs;   %��������ʱ��̶�

%����chirp�ź�
sig = chirp(tn, f1, 1,f2);

[WD f t] = fun_wvd(sig,fs);
WD = abs(WD);
subplot(2,2,1);
    mesh(t,f,WD);
    xlabel('Time (s)');
    ylabel('Frequency (Hz)');
    zlabel('WD(t,f)');
    title(['WD without adding analytic function ']);
subplot(2,2,2);
    contour(t,f,WD);
    xlabel('Time (s)');
    ylabel('Frequency (Hz)');
    title(['WD without adding analytic function ']);
    
%ʹ��analytic���� Notice��sig����˸��ϱ����� ���Ӧ���и���װ�� �ǲ��ǰ���
sig = conj(hilbert(sig));

[WD f t] = fun_wvd(sig,fs);
WD = abs(WD);
subplot(2,2,3);
    mesh(t,f,WD);
    xlabel('Time (s)');
    ylabel('Frequency (Hz)');
    zlabel('WD(t,f)');
    title(['WD with adding analytic function ']);
subplot(2,2,4);
    contour(t,f,WD);
    xlabel('Time (s)');
    ylabel('Frequency (Hz)');
    title(['WD with adding analytic function ']);