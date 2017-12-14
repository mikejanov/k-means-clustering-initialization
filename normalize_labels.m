% Michael Janov
% December 13, 2017
% Updated: December 13, 2017
%
% normalize_labels.m
% This function serves to swap labels to the "correct" naming scheme.
%   K-means clustering serves only to cluster and not to name clusters
%   appropriately. This function looks at frequency of appearance for each
%   named-and-real classification and swaps around the label names to
%   precisely fit the original classification naming scheme.
%
%   Variables and Notation:
%       n = number of data points
%
%   <--[normalized_labels] (n x 1) matrix of the corrected label matrix
%   -->[observed_labels] The 'true' label dataset sized (n x 1)
%   -->[classified_labels] The labels assigned by k-means clustering
%                          sized (n x 1)
%   -->[num_k_means] Number of classes in the data set

function [normalized_labels] = normalize_labels(observed_labels,...
                                                classified_labels,...
                                                num_k_means)
    scored_labels = zeros(num_k_means, num_k_means);
    normalized_labels = zeros(size(classified_labels,1),1);
    
    % Generate the frequency score matrix
    for row = 1:size(observed_labels,1)
        scored_labels(observed_labels(row), classified_labels(row)) =...
            scored_labels(observed_labels(row), classified_labels(row)) + 1;
    end
    
    % Swap labels according to frequency matrix
    for ii_class = 1:num_k_means
        % Find which class it should have been named
        [~,classified_class] = max(scored_labels(ii_class,:));
        
        % Go through data and insert data where it should belong
        for ii_swap = 1:size(normalized_labels)
            % Insert label in correct "naming" position
            if classified_labels(ii_swap) == classified_class
                normalized_labels(ii_swap) = ii_class;        
            end
        end
    end
end