function ye=echo_file(xin,delay,alpha)
%
% echo a file by adding a delayed and scaled version of a signal to itself

% create a reverberant speech file with a single echo of fixed delay and
% gain
%
% Inputs:
%   xin: signal array to which echo is added
%   delay: delay in samples of echo
%   alpha: scaling factor for echo
%
% Output:
%   ye: echoed signal

% determine number of samples in original (unechoed) signal
    nsamp=length(xin);

% create sum of original plus scaled and delayed speech file
	ye=[xin', zeros(1,delay)];
	ye(delay:delay+nsamp-1)=ye(delay:delay+nsamp-1)+xin'*alpha;        
end