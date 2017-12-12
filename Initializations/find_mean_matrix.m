% Michael Janov
% December 12, 2017
% Updated: December 12, 2017
%
% find_mean_matrix.m
% This function returns a list of mus that best represent the data
%   classified according to their label.
%
%   <--[final_mus] List of true mu values given labelled data
%   -->[labels] Assigned class (from 1 to k) of each data point.
%               (data_num_row x 1) matrix.
%   -->[num_k_means] The number of mus that are in the data set.
%   -->[mus] List of all reps' mus

function [final_mus] = find_mean_matrix(data, labels, num_k_means, mus) 
    classified_data = [data labels];
    final_mus = zeros(num_k_means, size(mus,2));
    
    % Iterate through each class
    ii_class = 1;
    while(ii_class <= num_k_means)
        % Find which class we're in and update the conditional
        idx = (classified_data(:,size(classified_data,2)) == ii_class);
        % Create temporary variable to store only the values we care about
        % The '+ 0.0001' prevents true 0 values from being removed on
        % 	the resizing step.
        class_data = (data + 0.0001) .* idx;
        % Resize the temp variables to remove the 0s
        class_data(~any(class_data,2),:) = [];
        
        % Sum up the components in each dim (including labels, which get
        % ignored) and divide by the number of data points to get the mean
        % for each dim.
        final_mus(ii_class,:) = sum(class_data) ./ size(class_data,1);
        
        ii_class = ii_class + 1;
    end
end