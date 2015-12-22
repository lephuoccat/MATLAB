function cnew=centroidcal(assignment,ncentroid,c,L)
%  create new centroids based on assignment of training frames
%
% Inputs:
%   assignment: current assignment of training vectors to centroids
%   ncentroid: number of centroids
%   c: training set of cepstral coefficients
%   L: number of cepstral coefficients in each vector
%
% Output:
%   cnew=set of new centroids

    for i=1:ncentroid
        cnew(i,:)=sum(c(find(assignment == i),:));
        count=length(find(assignment == i));
        cnew(i,:)=cnew(i,:)/count;
    end
end