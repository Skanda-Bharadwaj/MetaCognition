%  ------------------------------------------------------------------------
%  Meta Cognition : Sequential Extreme Learning Algorithm
%  ------------------------------------------------------------------------
%  
% 
%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [w2, p, error] = HAR_MC_sela(signal_chunk, label, w1, w2, p)
    
    a = 1.7159;
    b = 2/3;

    yd = ((1:size(w2, 1)) == label)';

    x  = signal_chunk; 
    x1 = [1; x];
    v1 = w1*x1;
    y1 = a*tanh(b*v1);

    x2 = [1; y1];
    
    py  = p * x2;
    yTp = x2'* p; 
    p  = p - (py * yTp) ./ (1 + (x2' * py)); 
    
    w2 = w2 + ((yd - (w2 * x2)) * (x2' * p));
    
    h1 = a * tanh(b * ([1 x'] * w1'));
    h2 = ([1 h1] * w2');
    
    e = yd - h2';
    error = mean(e);

end