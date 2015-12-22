function y=record_speech(fs,nsec)
% fs: sampling frequency
% nsec: number of seconds of recording
%   y: speech samples normalized to 32767
%
        N=fs*nsec;
        ch=1;
        fprintf('ready to record--press any key: \n');
        pause
        y=wavrecord(N,fs,ch,'double');
        fprintf('recording complete: \n');
end
