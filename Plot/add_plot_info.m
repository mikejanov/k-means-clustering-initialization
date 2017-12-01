function add_plot_info(name, var_x, var_y)
    if strcmp(name,'gauss2')
        legend('K1 \mu=[1,1] \Sigma=I',...
               'K2: \mu=[4,4] \Sigma=I',...
               'Location', 'northwest')
        title('\{Supervised\} 2-Class Multivariate Gaussian Data')
        xlabel('X1')
        ylabel('X2')
    end
    
    if strcmp(name,'iris')
        legend('Iris Setosa',...
               'Iris Versicolour',...
               'Iris Virginica',...
               'Location', 'northwest')
        title('\{Supervised\} Iris Plants Data')
        
        switch var_x
            case 1
                xlabel('Sepal Length (cm)')
            case 2
                xlabel('Sepal Width (cm)')
            case 3
                xlabel('Petal Length (cm)')
            case 4
                xlabel('Petal Width (cm)')
            otherwise
                xlabel('Error: Not Found')
        end
        
        switch var_y
            case 1
                ylabel('Sepal Length (cm)')
            case 2
                ylabel('Sepal Width (cm)')
            case 3
                ylabel('Petal Length (cm)')
            case 4
                ylabel('Petal Width (cm)')
            otherwise
                ylabel('Error: Not Found')
        end
    end
    
    if strcmp(name,'wine')
        legend('Cultivar 1',...
               'Cultivar 2',...
               'Cultivar 3',...
               'Location', 'northeast')
        title('\{Supervised\} Wine Recognition Data')
        
        switch var_x
            case 1
                xlabel('Alcohol')
            case 2
                xlabel('Malic Acid')
            case 3
                xlabel('Ash')
            case 4
                xlabel('Alcalinity of Ash')
            case 5
                xlabel('Magnesium')
            case 6
                xlabel('Total Phenols')
            case 7
                xlabel('Flavanoids')
            case 8
                xlabel('Nonflavanoid Phenols')
            case 9
                xlabel('Proanthocyanis')
            case 10
                xlabel('Color Intensity')
            case 11
                xlabel('Hue')
            case 12
                xlabel('OD280/OD315 of Diluted Wines')
            case 13
                xlabel('Proline')
            otherwise
                xlabel('Error: Not Found')
        end
        
         switch var_y
            case 1
                ylabel('Alcohol')
            case 2
                ylabel('Malic Acid')
            case 3
                ylabel('Ash')
            case 4
                ylabel('Alcalinity of Ash')
            case 5
                ylabel('Magnesium')
            case 6
                ylabel('Total Phenols')
            case 7
                ylabel('Flavanoids')
            case 8
                ylabel('Nonflavanoid Phenols')
            case 9
                ylabel('Proanthocyanis')
            case 10
                ylabel('Color Intensity')
            case 11
                ylabel('Hue')
            case 12
                ylabel('OD280/OD315 of Diluted Wines')
            case 13
                ylabel('Proline')
            otherwise
                ylabel('Error: Not Found')
         end
    end
    
    if strcmp(name,'glass')
        %{
        legend('1 building windows float processed',...
               '2 building windows non float processed',...
               '3 vehicle windows float processed',...
               '5 containers',...
               '6 tableware',...
               '7 headlamps',...
               'Location', 'northwest')
        %}
        legend('1 b-w-f-p',...
               '2 b-w-n-f-p',...
               '3 v-w-f-p',...
               '5 containers',...
               '6 tableware',...
               '7 headlamps',...
               'Location', 'northeast')
        title('\{Supervised\} Glass Identification Data')

        switch var_x
            case 1
                xlabel('RI: Refractive Index')
            case 2
                xlabel('Na: Sodium')
            case 3
                xlabel('Mg: Magnesium')
            case 4
                xlabel('Al: Aluminum')
            case 5
                xlabel('Si: Silicon')
            case 6
                xlabel('K: Potassium')
            case 7
                xlabel('Ca: Calcium')
            case 8
                xlabel('Ba: Barium')
            case 9
                xlabel('Fe: Iron')
            otherwise
                xlabel('Error: Not Found')
        end
        
        switch var_y
            case 1
                ylabel('RI: Refractive Index')
            case 2
                ylabel('Na: Sodium')
            case 3
                ylabel('Mg: Magnesium')
            case 4
                ylabel('Al: Aluminum')
            case 5
                ylabel('Si: Silicon')
            case 6
                ylabel('K: Potassium')
            case 7
                ylabel('Ca: Calcium')
            case 8
                ylabel('Ba: Barium')
            case 9
                ylabel('Fe: Iron')
            otherwise
                ylabel('Error: Not Found')
        end
    end
end