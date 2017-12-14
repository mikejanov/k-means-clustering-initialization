% Michael Janov
% December 13, 2017
% Updated: December 13, 2017
%
% get_accuracy.m
% This function takes in two (n x 1)-sized matrices of data labels. The
%   accuracy as a decimal percentage is returned based on the number of
%   correct versus incorrect classifications.
%
%   Variables and Notation:
%       n = number of data points
%
%   <--[percentage] Fractional value of the percentage of correct
%                   classified labels.
%   -->[observed_labels] The 'true' label dataset sized (n x 1)
%   -->[classified_labels] The labels assigned by k-means clustering
%                          sized (n x 1)


function [percentage] = get_accuracy(observed_labels, classified_labels)
    total_correct = 0;
    
    for row = 1:size(observed_labels,1)
        if observed_labels(row) == classified_labels(row)
            total_correct = total_correct + 1;
        end
    end

    percentage = total_correct / size(observed_labels,1);
end