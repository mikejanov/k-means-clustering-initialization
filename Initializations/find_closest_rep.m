% Michael Janov
% December 12, 2017
% Updated: December 12, 2017
%
% find_closest_rep.m
% This function returns the closest rep and the distance between that rep
%   and the current data point.
%
%   <--[rep] Representative cluster number that the point is closest to
%   <--[distance] Distance from the nearest existing rep
%   -->[point] Data point to assign
%   -->[mus] List of all reps' mus
%   -->[num_reps] Number of reps currently defined. Used for iterative
%                 approach.

function [rep, distance] = find_closest_rep(point, mus, num_reps)
    distances = zeros(num_reps, 1);
    
    % Look at distances between data point and each rep's mu
    for ii_rep = 1:num_reps
        distances(ii_rep,1) = find_euclidean_distance(mus(ii_rep,:), point);
    end
    
    % Pick out the minimum as the final rep assignment
    [distance, rep] = min(distances);
end