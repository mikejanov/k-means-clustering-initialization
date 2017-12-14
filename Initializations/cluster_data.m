% Michael Janov
% November 1, 2017
% Updated: December 10, 2017
%
% cluster_data.m
% This function ties everything together for k-means clustering and selects
% the most optimal mus given its parameters.

function [final_mus, all_mus, labels, scores] =...
         cluster_data(num_restarts, num_k_means, data)
    % Stores all mus that were randomly selected for comparison later. 3D
    % array, where the Page# (3rd D) is correlated to the restart count
    all_mus = zeros(num_k_means, size(data,2), num_restarts);
    scores = zeros(num_restarts,1);
    all_labels = zeros(size(data,1), num_restarts);
    
    for ii = 1:num_restarts
        all_mus(:,:,ii) = randomize_means(num_k_means, data);
        all_labels(:,ii) = classify_data(data, all_mus(:,:,ii));
        scores(ii) = get_sum_squared_error(data, ...
                                           all_labels(:,ii), ...
                                           all_mus(:,:,ii));
    end
    
    [~,best_fit_iteration] = min(scores);
    final_mus = all_mus(:,:,best_fit_iteration);
    labels = all_labels(:,best_fit_iteration);
end