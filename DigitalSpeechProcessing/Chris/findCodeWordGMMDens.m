function findCodeWordGMMDens(numDens,CodeWordStr)
% find the GMM for a given codeword given a specified number of densities


%   fileList = ls;
% fileList = cellstr(fileList);
% REGSTR = 'CodeWord_[ABC123]_MFCC_([0-9]+)_.*\.mat';
% found = regexpi(fileList,REGSTR,'tokens');
flist=dir('*.mat'); % will give you list of specifed files
all = [];
for ii=1:length(flist)
    flist(ii).name;
     load(flist(ii).name,'melCoeffs') % load files in workspace
     all = [all melCoeffs];
end

    % all is 12xn
    
    trainingData = all.';
    model = gmdistribution.fit(trainingData,numDens,'CovType','diagonal');
% model = gmdistribution.fit(trainingData,numDens,'regularize',1e-5);
%     save(CodeWordStr,'GMM');
    FILESTR = sprintf('CodeWord_%s_GMM.mat',CodeWordStr);
    save(FILESTR,'model')

end