%% page 59 œ∞Ã‚7
close all; clear all;
N = 1024;
fs = 500;
fn = 10;
delta = .1;
n = 1:N;
hn = delta/(delta-1)*exp(-delta*2*pi*fn*n/fs) .* sin(2*pi*fn*(1-delta^2*n/fs).^(1/2));
plot(n,hn);
% and so on
%%