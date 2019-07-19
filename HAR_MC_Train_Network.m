function [x_w1, x_w2, ...
          y_w1, y_w2, ...
          z_w1, z_w2] = HAR_MC_Train_Network(X_train, y_train, input_layer, ...
                                             w1, x_w2, y_w2, z_w2,          ...
                                             x_p, y_p, z_p,                 ...
                                             epsilon_1, epsilon_2)


    train_the_network    = 0;
    discard_signal_chunk = 1;
    increase_neuron      = 2;
    
    x_w1 = w1;
    y_w1 = w1;
    z_w1 = w1;
    
    window_size = input_layer;
    
    for i = 1:length(X_train)
        
        current_signal       = X_train{i, 1};
        current_signal_label = y_train(i, 1);
        
        current_signal_normalized = zeros(size(current_signal));
        for p = 1:size(current_signal, 2)
            current_signal_normalized(:, p) = (current_signal(:, p) - mean(current_signal(:, p)))/max(current_signal(:, p));
        end

        for j = 1:length(current_signal_normalized)-window_size
           
            signal_chunk = current_signal_normalized(j:j+window_size-1, :);

            [mc_x_w2, mc_y_w2, mc_z_w2,  ...
             mc_x_p, mc_y_p, mc_z_p,     ...
             meta_cognitive_component_desicion] = HAR_MC_meta_cognitive_component(signal_chunk,         ... 
                                                                                  current_signal_label, ...
                                                                                  x_w1, y_w1, z_w1,     ...
                                                                                  x_w2, y_w2, z_w2,     ...
                                                                                  x_p, y_p, z_p,        ...
                                                                                  train_the_network,    ...
                                                                                  discard_signal_chunk, ...
                                                                                  increase_neuron,      ...
                                                                                  epsilon_1,            ...
                                                                                  epsilon_2);

             for k = 1:length(meta_cognitive_component_desicion)
                 
                 switch(k)
                     
                     
                     case 1
                         if (meta_cognitive_component_desicion(k) == train_the_network)
                             x_w2 = mc_x_w2;
                             x_p  = mc_x_p;

                         elseif (meta_cognitive_component_desicion(k) == discard_signal_chunk)
                             % do noting

                         elseif (meta_cognitive_component_desicion(k) == increase_neuron)
                             x_w1 = [x_w1; HAR_MC_random_weights(size(x_w1, 2)-1, 1)];
                             x_w2 = [x_w2, HAR_MC_random_weights(0, size(x_w2, 1))];
                             x_p  = [x_p; HAR_MC_random_weights(size(x_p, 2)-1, 1)];
                             x_p  = [x_p, HAR_MC_random_weights(0, size(x_p, 1))];

                             [x_w2, x_p, ~] = HAR_MC_sela(signal_chunk(:, 1), current_signal_label, x_w1, x_w2, x_p);

                         else
                             % do noting
                         end
                         
                         

                     case 2
                         if (meta_cognitive_component_desicion(k) == train_the_network) 
                             y_w2 = mc_y_w2;
                             y_p  = mc_y_p;

                         elseif (meta_cognitive_component_desicion(k) == discard_signal_chunk)
                             % do noting

                         elseif (meta_cognitive_component_desicion(k) == increase_neuron)
                             y_w1 = [y_w1; HAR_MC_random_weights(size(y_w1, 2)-1, 1)];
                             y_w2 = [y_w2, HAR_MC_random_weights(0, size(y_w2, 1))];
                             y_p  = [y_p; HAR_MC_random_weights(size(y_p, 2)-1, 1)];
                             y_p  = [y_p, HAR_MC_random_weights(0, size(y_p, 1))];

                             [y_w2, y_p, ~] = HAR_MC_sela(signal_chunk(:, 2), current_signal_label, y_w1, y_w2, y_p);

                         else
                             % do noting
                         end
                         
                         

                     case 3
                         if (meta_cognitive_component_desicion(k) == train_the_network)
                             z_w2 = mc_z_w2;
                             z_p  = mc_z_p;

                         elseif (meta_cognitive_component_desicion(k) == discard_signal_chunk)
                             % do noting

                         elseif (meta_cognitive_component_desicion(k) == increase_neuron)
                             z_w1 = [z_w1; HAR_MC_random_weights(size(z_w1, 2)-1, 1)];
                             z_w2 = [z_w2, HAR_MC_random_weights(0, size(z_w2, 1))];
                             z_p  = [z_p; HAR_MC_random_weights(size(z_p, 2)-1, 1)];
                             z_p  = [z_p, HAR_MC_random_weights(0, size(z_p, 1))];

                             [z_w2, z_p, ~] = HAR_MC_sela(signal_chunk(:, 3), current_signal_label, z_w1, z_w2, z_p);

                         else
                             % do noting
                         end

                         
                     otherwise
                         % do noting
                 end
                 iter = [i, j, k]
             end
             
        end
        
    end
    
end
