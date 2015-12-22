function    [peakl,peakh]=findpeak(vm,f,peak,bwlevel)
%
% function to find peaks (formant frequencies) and bandwidths (formant
% bandwidths) of log magnitude spectrum from high resolution spectra
%
% Inputs:
%   vm=log magnitude of transfer function
%   f=formant frequency
%   peak=formant log magnitude level
%   bwlevel=number of db below peak which define bandwidth points
%
% Outputs:
%   peakl=first frequency below f where vm(f)<peak-bwlevel
%   peakh=first frequency above f where vm(f)<peak-bwlevel
%
% fprintf('f: %4.1f, peak: %4.1f, bwlevel:%4.1f \n',peak,f,bwlevel);
% find lower bandwidth frequency
    fl=length(vm);
    fi=f;
    while (vm(fi) > peak-bwlevel)
        fi=fi-1;
        if (fi < 1) fprintf('no lower frequency found--using f=0 \n');
            fi=1;
            break
        elseif (vm(fi) > vm(fi+1)) ...
            fprintf('no lower frequency found--using minimum point: %d \n',fi);
            break
        end
    end
    peakl=fi;
    
% find upper bandwidth frequency
    fi=f;
    while (vm(fi) > peak-bwlevel)
        fi=fi+1;
        if (fi > fl) fprintf('no upper frequency found--using f=fl \n');
            fi=fl;
            break
        elseif (vm(fi) > vm(fi-1)) ...
            fprintf('no upper frequency found--using maximum point: %d \n',fi);
            break
        end
    end
    peakh=fi;
    fprintf('fi: %4.1f, peakl: %4.1f, peakh: %4.1f \n',fi,peakl,peakh);
end