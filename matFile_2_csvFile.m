%% ************************************************************************
%************************ MAT-file into a CSV file ************************
%**************************************************************************
%
% Franklenin Sierra
% Department of Neuroscience
% Max Planck Institute for Empirical Aesthetics
%
% franklenin.sierra@protonmail.com
% https://www.aesthetics.mpg.de/en.html
%
% *************************************************************************
% This code transforms the numeric data of your MAT-file into a CSV file.
%
% For our example we will use the file "example_responses.mat", which
% contains four arrays of character data, and a colum of numeric data.
%
% Close all windows, clean the Workspace and delete all the variables
close all;
clear;
clc;

% First step, load your file. Insert the name of your file:
MAT_file = load('example_responses.mat');

% Creating a cell array of character vectors containing the names of the fields in your file
names = fieldnames(MAT_file);

for awesome = 1:length(names)
    variable = names{awesome};
    my_data = MAT_file.(variable);
    
    % A sanity check: we will just save the numeric data
    if ~isnumeric(my_data)
        warning('Unable to write the field %s, which is  %s type instead of numeric data', variable, class(variable));
        
    else
        % Choose a new name for your CSV file.
        my_new_file = sprintf('my_new_awesome_file.csv', variable); % "sprintf" -- Write formatted data to string or character vector
        
        % Finally we create our csv file
        csvwrite(my_new_file, my_data);
    end
    
end
