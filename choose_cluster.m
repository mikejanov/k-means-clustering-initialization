% Michael Janov
% November 1, 2017
% Updated: December 10, 2017
%
% choose_cluster.m
% Given a new data point and the list of means, returns the cluster that
%   best fits the new data.
%
%   Variables and Notation:
%       k = number of means
%       n = number of data points
%       d = number of dimensions in the data set
%
%   <--[class] (1 to k) value of the chosen classification number.
%   -->[mus] Centroids to classify data against. (k x d) matrix
%   -->[data_point] (1 x d) data point to classify.

function [class] = choose_cluster(mus, data_point)
    % There are as many distance values (as rows) as unique mus
    distances = zeros(size(mus,1),1);
    
    % Check Euclidean distance for all mus
    for ii = 1:size(distances,1)
        distances(ii) = find_euclidean_distance(mus(ii,:), data_point);
    end
    
    % Return index (and corresponding class) of the cluster that's
    %   closest. Classes are 1-indexed.
    [~,index] = min(distances);
    class = index;
end