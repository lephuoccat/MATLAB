function [vuss,confidence]=VUS(x,nfrm,means,stdevs,filename,L,R,p)
%
% Voiced speech (V), Unvoiced speech (U), Background Signal (S) 
% analysis of speech using Bayesian 
% decision rule with single Gaussian densities
%
% Inputs:
%   x: matrix with columns representing:
%       energy=log energy measurement (1:nfrm)
%       zerocrossings=zc measurement (1:nfrm)
%       c1: first speech correlation (1:nfrm)
%       alpha1: first lpc coefficient (1:nfrm)
%       Vp: lpc normalized log error (1:nfrm)
%   nfrm: number of frames in utterance
%   means: matrix of means of 5 parameters in format 
%       mean=[logesm, zcsm, c1sm, alpha1sm, Vpsm; logeum, zcum, c1um,
%       alpha1um, Vpum; logevm, zcvm, c1vm, alpha1vm, Vpvm];
%   stdevs: matrix of standard deviations of 5 parameters in format:
%       stdev=[logess, zcss, c1ss, alpha1ss, Vpss; logeus, zcus, c1us,
%       alpha1us, Vpus; logevs, zcvs, c1vs, alpha1vs, Vpvs];
%   filename: file being processed
%   L: frame length in samples
%   R: frame shift in samples
%   p: lpc analysis order
% Outputs:
%   vuss: VUS contour (1:nfrm)
%   confidence: confidence countour (1:nfrm)

% calculate distances and confidence scores (c1-c5) for background
% signal, (d1), unvoiced speech, (d2), and voiced speech, (d3),
% distributions
    for i=1:nfrm
        d1(i)=sum((x(:,i)'-means(1,:)).^2./(stdevs(1,:).^2));
        d2(i)=sum((x(:,i)'-means(2,:)).^2./(stdevs(2,:).^2));
        d3(i)=sum((x(:,i)'-means(3,:)).^2./(stdevs(3,:).^2));
        den=d1(i)*d2(i)+d1(i)*d3(i)+d2(i)*d3(i);
        c1(i)=d2(i)*d3(i)/den;
        c2(i)=d1(i)*d3(i)/den;
        c3(i)=d1(i)*d2(i)/den;
    end
    
% save results in arrays vuss and confidence
    dist=[d1; d2; d3];
    conf=[c1; c2; c3];
    for i=1:nfrm
        xx=min(dist(:,i));
        yy=find(dist(:,i)==xx);
        vuss(i)=yy(1);
        confidence(i)=conf(vuss(i),i);
    end
    
% set vuss score to 0 when confidence score falls below threshold, conf_thr
    conf_thr=0.4;
    
% median filter VUS contour; threshold median filtered contour to eliminate
% low confidence regions
    vuss=medf(vuss,5,nfrm);
    vuss_init=vuss;
    vuss(find(confidence < conf_thr))=0;
    
% plot VUS scores and confidence scores 
    h2=figure;orient landscape;
    set(h2,'Position',[280 278 990 660]);
    n=1:nfrm;
    subplot(311),plot(n,vuss_init,'g--',n,vuss,'r',n,confidence*3,'b--','LineWidth',2),...
        xlabel('frame number'),ylabel('VUS');hold on, ...
        legend('1=silence, 2=unvoiced, 3=voiced',...
        'thresholded by confidence score','confidence score (scaled by 3)');
        axis([1 nfrm .5 3.5]);
        stitle=sprintf('filename: %s, N,M,p: %d %d %d',filename,L,R,p);
        title(stitle);
    subplot(312),plot(n,x(1,:),'r','LineWidth',2),xlabel('frame number'),...
        ylabel('log energy (dB)');xmax=max(x(1,:));xmin=min(x(1,:));...
        axis([1 nfrm xmin xmax]),legend('log energy (dB)');
    subplot(313),plot(n,x(2,:),'r','LineWidth',2),xlabel('frame number'),...
        ylabel('zero crossings');xmax=max(x(2,:));xmin=min(x(2,:));...
        axis([1 nfrm xmin xmax]),legend('zero crossings');
end
    