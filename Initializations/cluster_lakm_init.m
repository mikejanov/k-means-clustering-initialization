% Michael Janov
% December 11, 2017
% Updated: December 11, 2017
%
% cluster_lakm_init.m
% This function handles integration of all k-means clustering functions.
%   Initialization Function 2: LAKM - Linear Assignment K-Means
%
% See original paper:
%   K. L. Cheng, J. Fan and J. Wang, "A two-pass clustering
%       algorithm based on linear assignment initialization and k-means
%       method," 2012 5th International Symposium on Communications,
%       Control and Signal Processing, Rome, 2012, pp. 1-5.
%
%   Variables and Notation:
%       d = number of dimentions
%       k = number of clusters
%       mu = centroid of a given class cluster
%
%   <--[final_mus] Selected mus as centroids for clusters. (k x d) matrix.
%   <--[labels] Assigned class (from 1 to k) of each data point.
%               (data_num_row x 1) matrix.
%   <--[time] Execution systime of each iteration. (1 x num_restarts)
%             smatrix.
%
%   -->[num_k_means] The number of mus that are in the data set.
%   -->[data] (row x d) data set to classify.

function [final_mus, labels, time] =...
         cluster_lakm_init(num_k_means, data)
     
    final_mus = zeros(num_k_means, size(data,2));
    labels = zeros(size(data,1));
    
    % Representatives are initial guesses at the mus based on linearizing
    % Stores only the index that the datum is found at
    reps = zeros(num_k_means, 1);
    
    tic % Start stopwatch timer
    
    % Calculate and store distances between each point in the data set
    distances = zeros(size(data,1), size(data,1));
    for ii = 1:size(data,1)
        for jj = 1:size(data,1)
            distances(ii, jj) = find_euclidean_distance(data(ii,:), data(jj,:));
        end
    end
    
    % Determine points (as their row-col matrix) that are farthest from
    % each other. These are the starting two reps.
    distances(:); % Make into single column. Ignore error.
    [~,I] = max(distances(:)); % Find 1-column index
    [reps(1), reps(2)] = ind2sub(size(distances),I); % Get data indices
    % Assign reps' associated data values to mus list
    final_mus(1,:) = data(reps(1),:);
    final_mus(2,:) = data(reps(2),:);
    
    % If there are more than two clusters, this function finds the
    % remainders based on farthest distance from existing cluster reps
    ii_rep = 3;
    while ii_rep <= num_k_means
        reps(ii_rep) = find_farthest_index(final_mus, data, num_k_means);
        final_mus(ii_rep,:) = data(reps(ii_rep),:);
        
        ii_rep = ii_rep + 1;
    end
    final_mus
%         all_mus(:,:,ii) = randomize_means(num_k_means, data);
%         all_labels(:,ii) = classify_data(data, all_mus(:,:,ii));
%         scores(ii) = get_sum_squared_error(data, ...
%                                            all_labels(:,ii), ...
%                                            all_mus(:,:,ii));
    
    time = toc; % Finish stopwatch timer
    
%     [~,best_fit_iteration] = min(scores);
%     final_mus = all_mus(:,:,best_fit_iteration);
%     labels = all_labels(:,best_fit_iteration);
end