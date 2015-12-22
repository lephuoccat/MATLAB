function [c,xhat]=compute_cep(bn,L,cepl,FS);
% function to compute real and complex cepstrum from a zero-only system of
% roots
%
% Inputs:
%   bn: numerator polynomial of length L samples, normalized so that bn(1)=1
%   L: length of numerator polynomial
%   cepl: length of cepstrum computation
%   FS: sampling rate of digital signal
%
% Outputs:
%   c(-cepl:cepl): real cepstrum (computed from complex cepstrum using symmetry
%   formula), shifted so that cepr covers range c(1:2*cepl+1)
%   xhat(-cepl:cepl): complex cepstrum, shifted so that cepc covers range
%   xhat(1:2*cepl+1)

% find roots of bn
% z=lroots(bn); complex root finding routine -- not used here
    z=roots(bn); % alternate root finder
    
% sort roots based on magnitudes and angles into complex and real roots
% outside the unit circle, and complex and real roots inside the unit
% circle
    zm=abs(z);
    zang=atan2(imag(z),real(z));
    zfreq=zang*FS/(2*pi);
    
    zp=z(find(zm > 1.0));
    zpa=atan2(imag(zp),real(zp));
    zm=z(find(zm <= 1.0));
    zma=atan2(imag(zm),real(zm));
    
% compute complex cepstrum components   
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
            xhat(1:cepl)=xhat(1:cepl)-2*abs(zp(index)).^(indexn).*cos(zpa(index).*(index1))./index1;
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
            xhat(index3)=xhat(index3)-2*abs(zm(index)).^index2.*cos(zma(index).*index2)./index2;
        end
    end

% compute real cepstrum from complex cepstrum
    c=(xhat+fliplr(xhat))/2;
    c(cepl+1)=0;
    
end