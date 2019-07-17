%  ------------------------------------------------------------------------
%  Meta Cognition : Main script 
%  ------------------------------------------------------------------------
%  
%  The main script to run meta-cognition
%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author : Skanda Bharadwaj 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ========================== Initialize ==================================

clear; close all; clc;

%% ========================================================================

load ('HAR_MC_full_dataset.mat');

Training_data_percentage = 75;

% Split the data
[X_train, ... 
 y_train, ...
 X_test , ...
 y_test]   =  HAR_MC_split_data(X, y, Training_data_percentage);

% Define network parameters
input_layer       = 20;
init_hidden_layer = 30;
output_layer      = 6;

% Define upper and lower bounds
epsilon_1 = [3e-08, 0.3e-08, 0.3e-08];
epsilon_2 = [0.8e-07, 0.8e-07, 0.8e-07];

% Initialize Network
[w1,        ... 
 x_w2, x_p, ...
 y_w2, y_p, ...
 z_w2, z_p] = HAR_MC_initialize_network(input_layer,        ...
                                        init_hidden_layer,  ...
                                        output_layer);

% Train Meta-cognition Network
[x_w1, x_w2, ...
 y_w1, y_w2, ...
 z_w1, z_w2] = HAR_MC_Train_Network(X_train, y_train, input_layer, ...
                                    w1, x_w2, y_w2, z_w2,          ...
                                    x_p, y_p, z_p,                 ...
                                    epsilon_1, epsilon_2);

% Test the network
[Training_Accuracy] = HAR_MC_Test_Network(X_train, y_train, w1, w2);
[Testing_Accuracy]  = HAR_MC_Test_Network(X_test,  y_test,  w1, w2);

sprintf('Training_Accuracy of the network %f\n', Training_Accuracy);
sprintf('Testing_Accuracy of the network %f\n', Testing_Accuracy);

%--------------------------------------------------------------------------
%% END
