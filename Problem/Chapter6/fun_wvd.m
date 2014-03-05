function [WD f t] = fun_wvd(x,fs)
[N xcol] = size(x);
if N<xcol
    x = x';
    N = xcol;
end

WD = zeros(N,N);
t = (1:N)/fs;
f = (1:N)*fs/(2*N);
for ti = 1:N
    taumax = min([ti-1,N-ti,round(N/2)-1]);
    tau = -taumax:taumax;
    WD(tau-tau(1)+1,ti) = x(ti+tau).*conj(x(ti-tau));    
end
WD = fft(WD);
