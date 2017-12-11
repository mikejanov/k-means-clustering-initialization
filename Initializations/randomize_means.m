% Michael Janov
% November 1, 2017
% Updated: December 10, 2017
%
% randomize_means.m
% This function takes in a n x d data set and randomly chooses
%   k points from that set as means 'mu'.
%
%   Variables and Notation:
%       k = number of mus chosen
%       n = number of data points
%       d = number of dimensions in the data set
%
%   <--[mus] Random mus chosen. (num_k_means x d) matrix.
%   -->[num_k_means] Number of mus chosen as cluster centroids.
%   -->[data] (row x d) data set to classify.

function [mus] = randomize_means(num_k_means, data)
    % Initialize output array with correct size
    mus = zeros(num_k_means, size(data,2));
    
    for ii = 1:num_k_means
        % Select a random mu from 1 to number.of.rows.in.data
        rand_row = randi([1 size(data,1)],1,1);
        rand_mu = data(rand_row,:);
        
        % Reroll if the randomly-selected mu was already selected
        while(ismember(rand_mu, mus, 'rows'))
            rand_row = randi([1 size(data,1)],1,1);
            rand_mu = data(rand_row,:);
        end
        % Store in the output matrix
        mus(ii,:) = rand_mu;
    end
end