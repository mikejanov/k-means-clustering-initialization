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
%
% Initialization Types
% --------------------
% 1) Randomized Means
% 2) Kaufman Approach
% 3) Cheng's Two Pass Linear
% 4) Yuan's Density

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

num_diff_inits = 4; % Four different initialization types
num_diff_data_sets = 4;
num_random_restarts = 10;

gauss2_num_dimms = size(gauss2,2)-1;
iris_num_dimms = size(iris,2)-1;
wine_num_dimms = size(wine,2)-1;
glass_num_dimms = size(glass,2)-1;

%%%%%%%%%%%%%%%
% Classify Data
%%%%%%%%%%%%%%%

gauss2_classified = [gauss2(:,1:gauss2_num_dimms) zeros(size(gauss2,1),1)];
gauss2_classified = repmat(gauss2_classified, [1,1,num_diff_inits]);
gauss2_mus = zeros(gauss2_num_k, gauss2_num_dimms, num_diff_inits);

iris_classified = [iris(:,1:iris_num_dimms) zeros(size(iris,1),1)];
iris_classified = repmat(iris_classified, [1,1,num_diff_inits]);
iris_mus = zeros(iris_num_k, iris_num_dimms, num_diff_inits);

wine_classified = [wine(:,1:wine_num_dimms) zeros(size(wine,1),1)];
wine_classified = repmat(wine_classified, [1,1,num_diff_inits]);
wine_mus = zeros(wine_num_k, wine_num_dimms, num_diff_inits);

glass_classified = [glass(:,1:glass_num_dimms) zeros(size(glass,1),1)];
glass_classified = repmat(glass_classified, [1,1,num_diff_inits]);
glass_mus = zeros(glass_num_k, glass_num_dimms, num_diff_inits);

% zeros(size(gauss2,1), size(gauss2,2), num_diff_inits);
% iris_classified = zeros(size(iris,1), size(iris,2), num_diff_inits);
% wine_classified = zeros(size(wine,1), size(wine,2), num_diff_inits);
% glass_classified = zeros(size(glass,1), size(glass,2), num_diff_inits);

% Stores the algorithm execution data for random restarts. Each column
%   is a different data set.
time_randomized = zeros(num_random_restarts, num_diff_data_sets);

% Random Init
%%%%%%%%%%%%%

[gauss2_mus(:,:,1),...
    ~,...
    gauss2_classified(:,size(gauss2,2),1),...
    time_randomized(:,1)] = cluster_random_init(num_random_restarts,...
                                                gauss2_num_k,...
                                                gauss2(:,1:gauss2_num_dimms));
                                            
%%%%%%%%%%%
% Plot Data
%%%%%%%%%%%

% Choosing which attributes to plot for each data set

gauss2_x = 1;
gauss2_y = 2;

iris_x = 3;
iris_y = 4;

wine_x = 7;
wine_y = 10;

glass_x = 1;
glass_y = 7;

% Supervised
%%%%%%%%%%%%

%{
dummy_mean = [0 0];

figure;

subplot(2,2,1)
plotClasses(gauss2, dummy_mean, gauss2_num_k, gauss2_x, gauss2_y, 0);
add_plot_info('gauss2', gauss2_x, gauss2_y);
title('\{Supervised\} 2-Class Multivariate Gaussian Data')

subplot(2,2,2)
plotClasses(iris, dummy_mean, iris_num_k, iris_x, iris_y, 0);
add_plot_info('iris', iris_x, iris_y);
title('\{Supervised\} Iris Plants Data')

subplot(2,2,3)
plotClasses(wine, dummy_mean, wine_num_k, wine_x, wine_y, 0);
add_plot_info('wine', wine_x, wine_y);
title('\{Supervised\} Wine Recognition Data')

subplot(2,2,4)
plotClasses(glass, dummy_mean, glass_num_k, glass_x, glass_y, 0);
add_plot_info('glass', glass_x, glass_y);
title('\{Supervised\} Glass Identification Data')
%}

% Random Init
%%%%%%%%%%%%%

figure;

subplot(2,2,1)
plotClasses(gauss2_classified, gauss2_mus, gauss2_num_k, gauss2_x, gauss2_y, 1);
add_plot_info('gauss2', gauss2_x, gauss2_y);
title('\{Test\} Gauss2')

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