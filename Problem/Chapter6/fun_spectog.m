function [B,f,t] = fun_spectog(x,win_type,nfft,noverlap,fs)
% Function to calculate spectrogram
% Output arguments
%   sp spectrogram
%   t time vector for plotting
%   f frequency vector for plotting
% Input arguments
%   x data
%   win_type window type
%   nfft window size
%   fs sample frequency
%   noverlap numbers of overlapping points in adjacent segments
% Uses Hanning window
%
[N xcol] = size(x);
%��������������ٶ�
if N < xcol
    x = x';
    N = xcol;
end

%ѡ��ͬ�Ĵ��ں���
%============================
%h = hanning
%b = blackman
%c = chebwin
%============================
if win_type(1)=='h'
    window_data = hanning(nfft);
elseif win_type(1) == 'b'
    window_data = blackman(nfft);
elseif win_type(1) == 'c'
    window_data = chebwin(nfft);
end

%���������ص���С �뵽��pwelch�� �Ǻǣ�
incr = nfft - noverlap;
%��ԭʼ����ǰ��ֱ���ӳ���Ϊһ�봰�ڳ��ȵ���ֵ Ϊɶ��������Ͷ���
hwin = fix(nfft/2);
x_mod  = [zeros(hwin,1);x;zeros(hwin,1)];
%ֻ��ȡһ��Ƶ�� ��������˹�ط���
f = (1:hwin)*(fs/nfft);

%ѭ���� ���ڻ������ڷ���
j = 1;
for i = 1:incr:N
    data = x_mod(i:i+nfft-1).*window_data;% diffrent window filter
    ft = abs(fft(data));
    B(:,j) = ft(1:hwin);
    t(j) = i/fs;%tλ�ó��� δԤ���� �е�����
    j = j+1;
end