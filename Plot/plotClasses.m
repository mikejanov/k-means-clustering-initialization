% Michael Janov
% November 30, 2017
% plotClasses.m
% Plots color-coded data according to the number of classes in a given
%   data set.
% Asks which two attribute columns to plot with xVar and yVar.

function plotClasses(data, means, kClasses, xVar, yVar, isEncircled)
    numCols = size(data,2);
    
    % Iterate through each class
    iiClass = 1;
    while(iiClass <= kClasses)
        % Find which class we're in and update the conditional
        idx = (data(:,numCols) == iiClass);
        % Create temporary variables to store only the values we care about
        % The '+ 0.0001' prevents true 0 values from being removed on
        % 	the resizing step.
        tempX = (data(:,xVar) + 0.0001) .* idx;
        tempY = (data(:,yVar) + 0.0001) .* idx;
        % Resize the temp variables to remove the 0s
        tempX(tempX==0) = [];
        tempY(tempY==0) = [];
        
        % Plot the data 
        plot(tempX, tempY, '*');
        hold on;
        
        % Encircle the data, if the argument is set
        if isEncircled == 1
            dist_outlier = find_farthest_euclidean([tempX tempY],...
                                                   means(iiClass,:));
            plotCircle(dist_outlier, means(iiClass,:))
            hold on;
        end
        
        % Next iteration
        iiClass = iiClass + 1;
    end
end

        %{
        xlim([min(data(:,xVar)) max(data(:,xVar))]);
        ylim([min(data(:,yVar)) max(data(:,yVar))]);
        %}