function [xhat]=poly_roots_complex_cep(z,L,cepl,fs)
%
% function to convert from numerator polynomial roots to complex cepstrum
%
% INPUTS:
%   z=roots of numerator polynomial
%   L=number of terms in numerator polynomial
%   cepl=length of cepstrum computation
%   fs=sampling rate of digital system
%
% OUTPUTS:
%   xhat=complex cepstrum

% sort roots based on magnitudes and angles into complex and real roots
% outside the unit circle, and complex and real roots inside the unit
% circle
    zm=abs(z);
    zang=atan2(imag(z),real(z));
    zfreq=zang*fs/(2*pi);
    
    zp=z(find(zm > 1.0));
    zpa=atan2(imag(zp),real(zp));
    zm=z(find(zm <= 1.0));
    zma=atan2(imag(zm),real(zm));
    
% compute complex cepstrum components
    nz=L-1;
    % for index=1:nz
    % fprintf('ind:%d, zm, zang: %f6.2 %f6.2 \n',index,zm(index),zang(index));
    % end
    
    xhat=zeros(1,2*cepl+1);
    
% process zeros outside unit circle
    zpl=length(zp);
    index1=cepl:-1:1;
    indexn=-cepl:-1;
    for index=1:zpl
        if (imag(zp(index)) == 0) % real root
            xhat(cepl+1)=xhat(cepl+1)+log(abs(1/real(zp(index))));
            xhat(1:cepl)=xhat(1:cepl)-real(zp(index)).^(indexn)./(index1);
        end
        if (imag(zp(index)) > 0) % complex root
            xhat(cepl+1)=xhat(cepl+1)+log(abs(1/real(zp(index))));
            xhat(1:cepl)=xhat(1:cepl)-2*abs(zp(index)).^(indexn)...
                .*cos(zpa(index).*(index1))./index1;
        end
    end
    
% process zeros inside unit circle
    zml=length(zm);
    index2=1:cepl;
    index3=cepl+2:2*cepl+1;
    for index=1:zml
        if (imag(zm(index)) == 0) % real root
            xhat(index3)=xhat(index3)-real(zm(index)).^index2./index2;
        end
        if (imag(zm(index)) > 0) % complex root
            xhat(index3)=xhat(index3)-2*abs(zm(index)).^index2...
                .*cos(zma(index).*index2)./index2;
        end
    end
end