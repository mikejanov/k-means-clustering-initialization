% Michael Janov
% November 1, 2017
% Updated: December 10, 2017
%
% cluster_random_init.m
% This function handles integration of all k-means clustering functions.
%   Initialization Function 1: Random Restart
%
%   Variables and Notation:
%       d = number of dimentions
%       k = number of clusters
%       mu = centroid of a given class cluster
%
%   <--[final_mus] Selected mus as centroids for clusters. (k x d) matrix.
%   <--[all_mus] Each mu for every iteration. (k x d x num_restarts) matrix.
%                Used for rating classification later.
%   <--[labels] Assigned class (from 1 to k) of each data point.
%               (data_num_row x 1) matrix.
%   <--[time] Execution systime of each iteration. (1 x num_restarts)
%             smatrix.
%
%   -->[num_restarts] The number of random restarts to find the best mus.
%   -->[num_k_means] The number of mus that are in the data set.
%   -->[data] (row x d) data set to classify.

function [final_mus, all_mus, labels, time] =...
         cluster_random_init(num_restarts, num_k_means, data)
    % Stores all mus that were randomly selected for comparison later. 3D
    % array, where the Page# (3rd D) is correlated to the restart count
    all_mus = zeros(num_k_means, size(data,2), num_restarts);
    scores = zeros(num_restarts,1);
    all_labels = zeros(size(data,1), num_restarts);
    time = zeros(num_restarts, 1);
    
    for ii = 1:num_restarts
        tic % Start stopwatch timer
        all_mus(:,:,ii) = randomize_means(num_k_means, data);
        all_labels(:,ii) = classify_data(data, all_mus(:,:,ii));
        scores(ii) = get_sum_squared_error(data, ...
                                           all_labels(:,ii), ...
                                           all_mus(:,:,ii));
        time(ii) = toc; % Finish stopwatch timer
    end
    
    [~,best_fit_iteration] = min(scores);
    final_mus = all_mus(:,:,best_fit_iteration);
    labels = all_labels(:,best_fit_iteration);
end