function Pb = MMcc(c, norm_load)
    rho = norm_load*c;
    k   = [0:1:c];
    den = (rho.^k)./factorial(k);
    den = sum(den);
    Pb  = (rho^c/factorial(c))/den;
end
