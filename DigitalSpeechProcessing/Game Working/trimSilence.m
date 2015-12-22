function keptFrameLog = trimSilence(E,ZeroCross,AutoCorrCoeff)
    

    maxZero_tol = .8;
    maxE_tol = .005;
    maxCorr_tol = .005;
    
    minZero_tol = .001;
    minE_tol = .1;
    minCorr_tol = .2;
    
    maxZeroCross = max(ZeroCross);
    maxE = max(E);
    maxCorr = max(AutoCorrCoeff);
    
    minZeroCross = min(ZeroCross);
    minE = min(E);
    minCorr = min(AutoCorrCoeff);
    
    isAboveEnergy_tol = E == E;
    ind = find(isAboveEnergy_tol);
    isAboveEnergy_tol(ind(1):ind(end)) = true;
    isBelowZeroCross = ZeroCross <= maxZeroCross*maxZero_tol;
    isCorr = AutoCorrCoeff > 0;
%     keptFrameLog = false(length(E),1);
    keptFrameLog = isAboveEnergy_tol;
%     for k = 1:length(keptFrameLog)
%         if isAboveEnergy_tol(k) && ~isBelowZeroCross(k)
%             keptFrameLog(k) = true;
%         elseif isAboveEnergy_tol(k) && isCorr(k);
%             keptFrameLog(k) = true;
%         end
%     end
end