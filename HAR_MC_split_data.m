%--------------------------------------------------------------------------
%  Meta Cognition : Data Split
%--------------------------------------------------------------------------
%  
% The function splits the feature matrix in to training and testing data
% based on the required percentage.
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author : Skanda Bharadwaj 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
function  [X_train, y_train, X_test, y_test] = HAR_MC_split_data(X, y, Training_data_percentage)
    
    % Create a random matrix of size equal to dataset
    dataset_size = size(X);
    rand_num     = randperm(dataset_size(1))';

    X_train = cell(ceil((Training_data_percentage/100)*dataset_size(1)),... 
                   dataset_size(2));
    X_test  = cell(dataset_size(1) - ceil((Training_data_percentage/100)*dataset_size(1)),... 
                   dataset_size(2));

    X_train_length = length(X_train);
    X_test_length  = length(X_test);

    y_train = zeros(X_train_length, 1);
    y_test  = zeros(X_test_length,  1);

    % Create train and test from rand_num
    for i = 1:X_train_length
        X_train{i, 1} = X{rand_num(i), 1};
        y_train(i, 1) = y(rand_num(i), 1);
    end

    k = 0;
    for j = i+1:dataset_size(1)
        k = k+1;
        X_test{k, 1} = X{rand_num(j), 1};
        y_test(k, 1) = y(rand_num(j), 1);
    end

end
%--------------------------------------------------------------------------
%% END    
    