% Michael Janov
% November 1, 2017
%
% find_euclidean_distance.m
% This function finds the euclidean distance between two n-dimensional
%   points.

function [distance] = find_euclidean_distance(point_a, point_b)
    distance = 0;
    for ii = 1:size(point_a,2)
        distance = distance + (point_a(ii) - point_b(ii))^2;
    end
    distance = sqrt(distance);
end