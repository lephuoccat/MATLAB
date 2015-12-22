function y = saveraw(signal,filename,Precision)
%SAVERAW(X,'FILENAME',Precision) writes the data X to
%  a raw file named FILENAME as a format specified by Precision,
%  e.g., Precision='float32', or those specicfied in fread(). 
%  If Preision is not given, Precision='int16' by default, i.e.,
%  2 bytes/sample and each sample should be btw -32768 and +32767
%  An error message is produced if the data is 
%  outside the range requested.
%
%  If X is a matrix, the data will be interleavely stored as 
%  multi-channel with data along the longest dimension considered a 
%  single channel. 
%
%  SAVERAW returns the number of samples saved.
%
%  Author: Stanley Kuo 5/7/99

low=min(min(signal));
high=max(max(signal));

if (nargin==2), Precision='int16'; end

if strcmp(Precision,'int16') & (low < -32768 | high > 32767),
   error('saveraw: Integer Data out of 16-bit range.');
end

% adjust filename if no extension
if all(filename ~= '.')
	filename=[filename,'.',Precision];
end;

% make data row-wise to support interleaving of multi-channels
[m,n] = size(signal);
if n < m,
	signal = signal';
end;

% get number of channels and samples-per-channel
nchan = min(size(signal));
Ns = max(size(signal));

% interleaving the signal if it is multi-channel
if nchan > 1
   len = nchan * Ns;
   out = zeros(1,len);
   for i=1:nchan
      out(i:nchan:len) = signal(i,:);
   end
else
   out = signal;
   len = Ns;
end

% time to open the file
[fid,message]=fopen(filename,'wb');
if fid<0
	error(message)
end

% write data
fwrite(fid,out,Precision);

% done with file
fclose(fid);

% output requested?
if nargout == 1,
	y = len;
elseif nargout > 1,
	error('saveraw: Invalid number of output arguments.');
end;
