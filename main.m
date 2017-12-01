% Michael Janov
% November 29, 2017
% main.m
% This script runs and plots the data analysis
% 
% Data Sources
% ------------
% iris data set:
%     R.A. Fisher. “UCI Machine Learning Repository: Iris Data Set,” 1936.
%     Irvine, CA: University of California, School of Information and
%     Computer Science.
% wine data set:
%     Forina, M. et al. “UCI Machine Learning Repository: Wine Data Set,”
%     1991. Irvine, CA: University of California, School of Information
%     and Computer Science.
% glass data set:
%     B. German. “UCI Machine Learning Repository: Glass Identification
%     Data Set,” 1987. Irvine, CA: University of California, School of
%     Information and Computer Science.

%%%%%%%%%%%%%
% Import Data
%%%%%%%%%%%%%

importfile('gauss2');
importfile('iris');
importfile('wine');
importfile('glass');

gauss2_num_k = max(gauss2(:,size(gauss2,2)));
iris_num_k = max(iris(:,size(iris,2)));
wine_num_k = max(wine(:,size(wine,2)));
glass_num_k = max(glass(:,size(glass,2)));

%%%%%%%%%%%
% Plot Data
%%%%%%%%%%%

% Supervised
%%%%%%%%%%%%

dummy_mean = [0 0];

figure;

subplot(2,2,1)
gauss2_x = 1;
gauss2_y = 2;
plotClasses(gauss2, dummy_mean, gauss2_num_k, gauss2_x, gauss2_y, 0);
add_plot_info('gauss2', gauss2_x, gauss2_y);

subplot(2,2,2)
iris_x = 3;
iris_y = 4;
plotClasses(iris, dummy_mean, iris_num_k, iris_x, iris_y, 0);
add_plot_info('iris', iris_x, iris_y);

subplot(2,2,3)
wine_x = 7;
wine_y = 10;
plotClasses(wine, dummy_mean, wine_num_k, wine_x, wine_y, 0);
add_plot_info('wine', wine_x, wine_y);

subplot(2,2,4)
glass_x = 1;
glass_y = 7;
plotClasses(glass, dummy_mean, glass_num_k, glass_x, glass_y, 0);
add_plot_info('glass', glass_x, glass_y);

%{
for ii = 1:9
    figure;
    for jj = 1:9
        subplot(3,3,jj)
        glass_x = ii;
        glass_y = jj;
        plotClasses(glass, dummy_mean, glass_num_k, glass_x, glass_y, 0);
        add_plot_info('glass', glass_x, glass_y);
    end
end
%}