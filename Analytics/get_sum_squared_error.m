% Michael Janov
% November 1, 2017
% get_sum_squared_error.m
% This function takes in all classified data points and checks the
% effectiveness of the mus that were randomly selected according to their
% assigned label.

function [sse] = get_sum_squared_error(data, labels, mus)
    sse = 0;
    % Iterate through each data point (row-by-row)
    for ii = 1:size(data,1)
        % Compare against the mu it is labelled
        sse = sse + find_euclidean_distance(mus(labels(ii),:),...
                                            data(ii,:));
    end
end