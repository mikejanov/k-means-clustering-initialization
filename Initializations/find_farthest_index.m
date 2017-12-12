% Michael Janov
% December 11, 2017
% Updated: December 12, 2017
%
% find_farthest_index.m
% This function returns the index and the distance of the data point that
%   is farthest from the already-selected mus. Used primarily for the LAKM
%   initialization algorithm.
%
%   Variables and Notation:
%       d = number of dimentions
%       k = number of clusters
%       mu = centroid of a given class cluster
%
%   <--[index] Index from data that the farthest point can be found
%   <--[distance] Distance from the nearest existing rep
%   -->[mus] List of all reps' mus, even blanks where they do not yet exist
%   -->[data] Data set used to compare against
%   -->[num_reps] Number of reps currently defined. Used for iterative
%                 approach.

function [index, distance] = find_farthest_index(mus, data, num_reps)
    distances = zeros(size(data,1), num_reps);
    
    % Look at each value against the current rep's mu
    for ii_rep = 1:num_reps
        for jj_data = 1:size(data,1)
            distances(jj_data, ii_rep) = find_euclidean_distance(mus(ii_rep,:), data(jj_data,:));
        end
    end
    
    % Find the distance to the nearest rep of each point and store it in a
    % new (n x 1) array
    mins = min(distances,[],2);
    
    % Find the index of the maximum value from that list. This is the new
    % rep
    [distance,index] = max(mins);
end