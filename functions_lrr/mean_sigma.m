function [mean,sigma]=mean_sigma(data)
%
% data = input data sequence
% mean = mean of data sequence
% sigma = sigma of data sequence
%
    mean=sum(data)/length(data);
    sigma=sqrt(sum(data.^2)/length(data)-mean^2);
    % fprintf('nfrm: %d, mean,sigma: %6.2f %6.2f \n',length(data),mean,sigma);
end