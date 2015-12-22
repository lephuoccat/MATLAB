function Pb = MM1c(c, norm_load)
    rho = norm_load;
    k = [0:1:c];
    den = sum(rho.^k);
    Pb = rho^c/den;    
end