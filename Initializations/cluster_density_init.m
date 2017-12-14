% Michael Janov
% December 13, 2017
% Updated: December 13, 2017
%
% cluster_density_init.m
% This function handles integration of all k-means clustering functions.
%   Initialization Function 3: Density
%
% See original paper:
%   Q. Yuan, H. Shi and X. Zhou, "An optimized initialization center
%       K-means clustering algorithm based on density," 2015 IEEE
%       International Conference on Cyber Technology in Automation,
%       Control, and Intelligent Systems (CYBER), Shenyang, 2015,
%       pp. 790-794.
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
%   <--[iterations] Number of 'true means' iterations until convergence.
%   -->[num_k_means] The number of mus that are in the data set.
%   -->[data] (row x d) data set to classify.

function [final_mus, labels, time, iterations] =...
         cluster_density_init(num_k_means, data)
     
    final_mus = zeros(num_k_means, size(data,2));
    labels = zeros(size(data,1),1);
    
    tic % Start stopwatch timer
    
    % Calculate and store distances between each point in the data set
    distances = zeros(size(data,1), size(data,1));
    for ii = 1:size(data,1)
        for jj = 1:size(data,1)
            distances(ii, jj) = find_euclidean_distance(data(ii,:), data(jj,:));
        end
    end
    
    % Determine points (as their row-col matrix) that are farthest from
    % each other. This provides the 'global radius'. Then find the local
    % radius based on the number of k-means.
%     temp_distances = distances;
%     temp_distances(:); % Make into single column. Ignore error.
%     [global_radius,~] = max(temp_distances(:)); % Find distance
%     local_radius = global_radius / num_k_means; 
    local_radius = 0.75;
    
    % Create new matrix that filters out distance values that lie outside
    % the local radius of the point.
    local_distances = distances;
    for row = 1:size(local_distances, 1)
        for col = 1:size(local_distances, 2)
            if local_distances(row,col) > local_radius
                local_distances(row,col) = 0;
            end
        end
    end
    
    % Now calculate the local density at each point
    densities = zeros(size(local_distances, 1), 1);
    for row = 1:size(local_distances, 1)
        for col = 1:size(local_distances, 2)
            densities(row) = densities(row) + ...
                exp(-local_distances(row, col)^2 / (2 * local_radius^2));
        end
    end
    
    % Assign the largest density as a center
    [~,largest_density_row] = max(densities);
    final_mus(1,:) = data(largest_density_row,:);

    % Now iterate through and find the remaining centers
    kk = 2;
    while kk <= num_k_means
        % First remove all densities from points that are within the
        % previous center's local radius
        densities(largest_density_row) = 0;
        for col = 1:size(local_distances, 2)
            if local_distances(largest_density_row, col) ~= 0
                densities(col) = 0;
            end
        end
        
        % Next recalculate max density from the remaining values
        [~,largest_density_row] = max(densities);
        final_mus(kk,:) = data(largest_density_row,:);
        kk = kk + 1;
    end
    
    % Next, assign labels based on nearness to mu
    for nn = 1:size(data,1)
        [labels(nn),~] = find_closest_rep(data(nn,:),final_mus, num_k_means);
    end
    
    % For this block, iterate until there is no change in labels (that is
    % to say, there is convergence).
    last_labels = zeros(size(labels,1),1);
    iterations = 0;
    while (~min(last_labels==labels))
        last_labels = labels; % Reset last_label storage
        
        % Find Cluster Means Matrix. Calculate each cluster's true mean
        % independent of provided data points.
        final_mus = find_mean_matrix(data, labels, num_k_means, final_mus);

        % Reassign points according to new means
        for ii = 1:size(data,1)
            labels(ii) = find_closest_rep(data(ii,:),final_mus,num_k_means);
        end
        iterations = iterations + 1;
    end
    
    time = toc; % Finish stopwatch timer
end