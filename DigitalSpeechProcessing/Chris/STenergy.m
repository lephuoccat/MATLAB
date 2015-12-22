function  E = STenergy(Buffer_windowed)
    E = sum(Buffer_windowed.^2,1);
end