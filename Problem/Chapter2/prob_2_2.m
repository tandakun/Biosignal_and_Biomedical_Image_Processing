clear all;close all;
L = [2048 256];
for i = 1:2
    L_row = L(i);
    N_row_uniform = rand(1,L_row);
    N_row_normol = randn(1,L_row);
    [N_uniform_auto lags_uni]= xcorr(N_row_uniform,'coeff');
    [N_normol_auto lags_nor]= xcorr(N_row_normol,'coeff');
    subplot(2,2,i*2-1);
    plot(lags_uni(1,:),N_uniform_auto(1,:),'k');
    subplot(2,2,i*2);
    plot(lags_nor(1,:),N_normol_auto(1,:),'k');
    
end