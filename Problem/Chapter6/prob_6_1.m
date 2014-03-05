%��ʼ��
clear all; close all;

%����һЩ����
N = 512;        %��������
fs = 500;       %������
f1 = 10;        %��ʼƵ��
f2 = 200;       %����Ƶ��  
t = (1:N)/fs;   %��������ʱ��̶�

%����chirp�ź�
fc = ((1:N)*((f2-f1)/N)) + f1;
x = sin(pi*t.*fc);

%��Ӳ�ͬ�Ĵ���
%============================
%h = hanning
%b = blackman
%c = chebwin
%============================
name_window = ['c','b','h'];
length_name = length(name_window);

%���ĳ�����ڵĿɱ䳤��
length_window = [128 64 32];
length_size = length(length_window);


for j = 1:length_name
    figure;
    %ѡȡһ������
    win_name = name_window(j);
    %�Ը�ѡȡ��ͬ����
    for i = 1:length_size 
        [B f t] = fun_spectog(x,win_name,length_window(i),0,fs);
        subplot(length_size,2,(i-1)*2+1);
            %��ͼ
            mesh(t,f,abs(B));
            xlabel('Time (s)');
            ylabel('Frequency (Hz)');
            zlabel('Sp(t,f)');
            title(['STFT with ',num2str(length_window(i)),'points ','window(',win_name,')']);
        subplot(length_size,2 ,i*2);
            %��ͼ
            contour(t,f,abs(B));
            xlabel('Time (s)');
            ylabel('Frequency (Hz)');
            title(['STFT with ',num2str(length_window(i)),'points ','window(',win_name,')']);
    end
end