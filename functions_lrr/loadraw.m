function [y, N] = loadraw(filename,Precision,nch)
% [y N] = LOADRAW('FILENAME',Precision,nch) loads 'nch' channels 
%    interleaved raw signal with Precision from the file 'FILENAME'.
%    Preision = 'int16' by default, i.e., 2 bytes/sample 
%    nch = 2 by default. Other options of Precision can be found
%    in the help page of fread.
%
% LOADRAW returns the loaded signal y in an N x nch matrix.
%
% Author: Stanley Kuo 5/7/99

if (nargin==1), 
   Precision='int16'; 
   nch = 2;
elseif (nargin == 2)
   nch = 2;   
end

[fid, msg]=fopen(filename,'rb');
if fid<0
	error(msg);
end
[sig,slen]=fread(fid,Precision);

if ( mod(slen,nch) ~= 0 ) error('wrong file size'); end;

N = slen/nch;

y = [];
for i=1:nch,
   y = [y sig(i:nch:slen)];
end

%for i=1:nch,
%   subplot(nch,1,i);
%   plot(y(:,i));
%end
%zoom on;

fclose(fid);

