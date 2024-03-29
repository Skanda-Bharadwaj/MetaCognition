function [mc_x_w2, mc_y_w2, mc_z_w2,  ...
          mc_x_p, mc_y_p, mc_z_p,     ...
          meta_cognitive_component_desicion] = HAR_MC_meta_cognitive_component(signal_chuck,         ... 
                                                                               current_signal_label, ...
                                                                               x_w1, y_w1, z_w1,     ...
                                                                               x_w2, y_w2, z_w2,     ...
                                                                               x_p, y_p, z_p,        ...
                                                                               train_the_network,    ...
                                                                               discard_signal_chunk, ...
                                                                               increase_neuron,      ...
                                                                               epsilon_1,            ...
                                                                               epsilon_2)


    meta_cognitive_component_desicion = zeros(1, 3);
    
    [mc_x_w2, mc_x_p, ...
     mc_y_w2, mc_y_p, ...
     mc_z_w2, mc_z_p, ...
     error] = HAR_MC_cognition_component(signal_chuck,         ... 
                                         current_signal_label, ...
                                         x_w1, y_w1, z_w1,     ... 
                                         x_w2, y_w2, z_w2,     ...
                                         x_p, y_p, z_p); 
                                     
                                     
                                     
    for i = 1:3
        
        if (error(i) <= epsilon_1(i))

           meta_cognitive_component_desicion(i) = discard_signal_chunk;

        elseif ((error(i) > epsilon_1(i)) && (error(i) <= epsilon_2(i)))

           meta_cognitive_component_desicion(i) = train_the_network;

        elseif (error(i) > epsilon_2(i))

           meta_cognitive_component_desicion(i) = increase_neuron;

        else

            % do nothing

        end
        
    end

end
