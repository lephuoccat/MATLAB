function ZeroCross = STzeroCrossing(Buffer_windowed,L)
ZeroBuffer_1 = circshift(Buffer_windowed,[-1,0]);
ZeroBuffer_1(end,:) = 0;
ZeroCross = sum(abs(sign(Buffer_windowed)-...
    sign(ZeroBuffer_1)),1);
ZeroCross = ZeroCross/(2*L);
end