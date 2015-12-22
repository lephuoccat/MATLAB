function AutoCorrCoeff_1 = STfirstAutoCorrCoeff(Buffer_windowed,L)
    AutoCorrNum = sum(Buffer_windowed(2:L,:).*...
        Buffer_windowed(1:(L-1),:),1);
    AutoCorrDen = sqrt((eps+sum((Buffer_windowed(1:L,:)).^2,1)).*...
        (1e-5 + sum((Buffer_windowed(1:(L-1),:).^2))));
    AutoCorrCoeff_1 = AutoCorrNum./AutoCorrDen;
end