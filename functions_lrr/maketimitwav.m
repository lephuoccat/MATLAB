function y=maketimitwav(fin,fout)
% function to convert speech file from TIMIT database (Texas
% Instruments-MIT) format (.ADC) to standard wave file (.wav) format
% and to save converted file
%
% Note: fs=16000 for all TIMIT files
%
% Inputs:
%   fin: timit filename (e.g., SX106.ADC)
%   fout: output filename (input filename with .ADC replaced by .wav)
%
% Output:
%   y: speech file samples

%
% Elliot Moore II with mods by RWS on 12-27-02
% CSIP

% Open timit wave file
    fid1=fopen(fin,'rb');
    ytmp=fread(fid1,'integer*2');

% Remove the header information
    y=ytmp(520:length(ytmp))./max(abs(ytmp(520:length(ytmp))));
    fclose(fid1);

% scale file to +/- 32000 range
    ymax=max(max(y),-min(y));
    y=y*32000/ymax;
    
% Save file to fout .wav file
    savewav(y,fout,16000);
end