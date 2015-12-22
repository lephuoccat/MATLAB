

function delta = nextDelta(delta_last,delta_min,delta_max,P, code_last)
	% This function determines the next quantizer step size
	%     

    if (code_last == 1) || (code_last == 3)
        M = P;
    elseif (code_last == 0) || (code_last == 2)
        M = 1/P;
    end
    
    delta = M*delta_last;
    if delta < delta_min
        delta = delta_min;
    elseif delta > delta_max
        delta = delta_max;
    end
end