%  ------------------------------------------------------------------------
%  Meta Cognition : Initialization of the network parameters
%  ------------------------------------------------------------------------
%
%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author : Skanda Bharadwaj 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [w1,        ... 
          x_w2, x_p, ...
          y_w2, y_p, ...
          z_w2, z_p] = HAR_MC_initialize_network(input_layer,        ...
                                                 init_hidden_layer,  ...
                                                 output_layer)
     
    % Initialize weights
    w1      = HAR_MC_random_weights(input_layer, init_hidden_layer);
    w2_init = zeros(output_layer, init_hidden_layer+1);
    
    % Regularization parameter
    lambda = 10^-6;
    p_init = 1/lambda * eye(init_hidden_layer+1);

    x_w2 = w2_init;
    y_w2 = w2_init;
    z_w2 = w2_init;
    
    x_p  = p_init;
    y_p  = p_init;
    z_p  = p_init;
end
%--------------------------------------------------------------------------
%% END