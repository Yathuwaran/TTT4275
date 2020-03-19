%% Histograms for the features and classes
% Constants
bins = 10;
y = [0 30];
x = [0 8];
fontsz_legend = 12;
fontsz_title = 14;

%% Iris Setosa
figure(3);

subplot(3,1,1);
hold on;

histogram(x1(:, 1), bins);
histogram(x1(:, 2), bins);
histogram(x1(:, 3), bins);

ylim(y);
xlim(x);
grid on;
title('Data Iris Setosa', 'fontsize', fontsz_title);
legend('Sepal length', 'Petal length', 'Petal width', 'fontsize', fontsz_legend);

%% Iris Versicolor
subplot(3,1,2);
hold on;
histogram(x2(:, 1), bins);
histogram(x2(:, 2), bins);
histogram(x2(:, 3), bins);

ylim(y);
xlim(x);
grid on;
title('Data Iris Versicolor', 'fontsize', fontsz_title);
legend('Sepal length', 'Petal length', 'Petal width', 'fontsize', fontsz_legend);

%% Iris Virginica
subplot(3,1,3);
hold on;
histogram(x3(:, 1), bins);
histogram(x3(:, 2), bins);
histogram(x3(:, 3), bins);

ylim(y);
xlim(x);
grid on;
title('Data I. virginica', 'fontsize', fontsz_title);
legend('Sepal length', 'Petal length', 'Petal width', 'fontsize', fontsz_legend);
