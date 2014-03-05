clear all; close all;
load ensemble_data.mat
[l_row l_col] = size(data);
a = floor(rand(1,l_row)*l_row);

for i = 1:10
    plot(data(a(i),:),'k');
    hold on;
end

data_temp = mean(data,1);
plot(data_temp-3,'--k');
figure;
x_std = std(data,1);
plot(x_std,'--k');
figure;
x_norm = var(data,1);
plot(x_norm,'-o');