function [assignment,distortion,localcount,localdistortion]=assign(c,nframes,L,newcentroid,ncentroid)
%  assigns cepstral coefficient vectors in c to one of ncentroid centroids
%  in newcentroid
%
% Inputs:
%   c: training set of (nframes,L) cepstral coefficients
%   nframes: number of training vectors in the training set
%   L: number of cepstral coefficients in each training vector
%   newcentroid: putative set of centroids
%   ncentroid: number of centroids
%
% Outputs:
%   assignment: set of indices of closest centroid for each of the
%       nframes in the training set
%   distortion: set of distances to the closest centroid for each of
%       the nframes in the training set
%   localcount: count of number of vectors assigned to each centroid
%   localdistortion: average distortion of vectors assigned to each
%       centroid

    distortion(1:nframes)=1.e15;
    assignment(1:nframes)=0;
    for j=1:ncentroid
        c2=newcentroid(j,:);
        for i=1:nframes
            c1=c(i,:);
            d(i,j)=sum((c1-c2).^2);
            if (d(i,j) < distortion(i))
                distortion(i)=d(i,j);
                assignment(i)=j;
            end
        end
    end
%    fprintf('\n distance loop finished, nframes: %d, ncentroid: %d \n',nframes,ncentroid);
    
%    fprintf('assignment: %d %d %d %d %d %d %d %d %d %d \n',assignment);
%    fprintf('distortion: %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f \n',distortion);

% determine and print out counts for each codeword
    for j=1:ncentroid
        indices=find(assignment==j);
        localdistortion(j)=0;
        if (length(indices) > 0)
            localdistortion(j)=sum(distortion(indices))/length(indices);
        end
        localcount(j)=length(indices);
    end
end