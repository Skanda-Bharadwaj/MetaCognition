%  ------------------------------------------------------------------------
%  Meta Cognition : 
%  ------------------------------------------------------------------------
%  
% 
%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [x_w2, x_p, ...
          y_w2, y_p, ...
          z_w2, z_p, ...
          error] = HAR_MC_cognition_component(signal_chuck,         ... 
                                              current_signal_label, ...
                                              x_w1, y_w1, z_w1,     ... 
                                              x_w2, y_w2, z_w2,     ...
                                              x_p, y_p, z_p)
                                                 
 

    [x_w2, x_p, x_error] = HAR_MC_sela(signal_chuck(:, 1), current_signal_label, x_w1, x_w2, x_p); 
    [y_w2, y_p, y_error] = HAR_MC_sela(signal_chuck(:, 2), current_signal_label, y_w1, y_w2, y_p);
    [z_w2, z_p, z_error] = HAR_MC_sela(signal_chuck(:, 3), current_signal_label, z_w1, z_w2, z_p);
    
    error = [x_error, y_error, z_error];
  
             
end