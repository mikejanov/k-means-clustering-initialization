% Michael Janov
% November 30, 2017
% find_farthest_euclidean.m
% Iterates through a data set to return the distance of the farthest
%  point from the mean.

function [distance] = find_farthest_euclidean(data, mean)
    distance = 0;
    for row = 1:size(data, 1)
        this_dist = find_euclidean_distance(mean, data(row, :));
        if distance < this_dist
            distance = this_dist;
        end
    end
end