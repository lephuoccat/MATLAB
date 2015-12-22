function [f0,f1] = spPitchCepstrum(c, fs)
 % search for maximum  between 2ms (=500Hz) and 20ms (=50Hz)
 ms2=floor(fs*0.002); % 2ms
 ms20=floor(fs*0.02); % 20ms
 [maxi,idx]=max(abs(c(ms2:ms20)));
 f0 = fs/(ms2+idx-1);
 
 ms3=floor(fs*0.001);
 ms30=floor(fs*0.002);
 [maxi,idx]=max(abs(c(ms3:ms30)));
 f1 = fs/(ms3+idx-1);
end