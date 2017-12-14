% Michael Janov
% November 1, 2017
% Updated: December 10, 2017
%
% classify_data.m
% This function iterates through all data points and classifies each one
%   into a cluster based on euclidean distance. This classification is
%   returned as an [n x 1] vector.
%
%   Variables and Notation:
%       k = number of means
%       n = number of data points
%       d = number of dimensions in the data set
%
%   <--[labels] Assigned class (from 1 to k) of each data point.
%               (data_num_row x 1) matrix.
%   -->[data] (n x d) data set to classify.
%   -->[mus] Centroids to classify data against. (k x d) matrix

function [labels] = classify_data(data, mus)
    % Preinitialize size to [n x 1]
    labels = zeros(size(data,1),1);
    
    % Iterate through each data point and classify
    for ii = 1:size(labels,1)
        labels(ii) = choose_cluster(mus, data(ii,:));
    end
end