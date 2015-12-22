function makeTrainingSet(codeWordStr,Fs,recLen,numRecs,lastName,startNum)
% USAGE:
%   1) Make an empty folder named 'ZZZ'
%   2) Use only one folder per code word
%   3) If it is the first run in an empty folder the function will start
%       numbering wave files at '1'
%       If it is not the first run, the function will get the last numbered
%       wave file and start numbering after that.
%   4) file name will be:
%       'CodeWord_codeWordStr_fileNumber_lastName.wav'

% codeWord: utterance for the recording
% Fs: sampling freq
% recLen: length of recording in seconds
% numRecs: number of consecutive recordings
% lastName: your last name to avoid naming clashes



% [y,fs,bits,fmt]=loadwav(name)
% y = savewav(signal,filename,fs,bits)
    
  
    counterStart = startNum;
%     fprintf('the counter starts at: %d\n',counterStart)
    nBits = 16;
    nChannels = 1;
    recorder = audiorecorder(Fs,nBits,nChannels);
    
    fprintf('Starting run of training set recordings\n')
    fprintf('Code Word to be recorded is: %s\n',codeWordStr)
    pause(1);
    fprintf('Consecutive recordings: %d\n',numRecs)
    fprintf('Seconds per recording: %d\n',recLen)
    fprintf('File number start: %d\n',counterStart)
    fprintf('File number end: %d\n', (counterStart+numRecs-1));
    fprintf('Press any key to begin\n')
    fprintf('To Abort press CTRL-C\n');
    pause
    % create random data to test
%     signal = uint8(255*randi(100,1));
    
    for k = counterStart:(counterStart+numRecs-1)
        fileName = sprintf('CodeWord_%s_%d_%s.wav',...
            codeWordStr,k,lastName);
        pause(.5)
        fprintf('Making recording: %d\n',k)
        pause(.5)
        fprintf('Starting in: 3\n')
        pause(.5)
        fprintf('2\n');
        pause(.5)
        fprintf('1\n');
        pause(.5)
        fprintf('START\n');
        recordblocking(recorder,recLen)
        fprintf('END\n');
        signal = getaudiodata(recorder);
        wavwrite(signal,Fs,nBits,fileName)
        
        [nonBGsig, melCoeffs] = SpeechAnalysisScript(signal,Fs);
        melFileName = sprintf('CodeWord_%s_MFCC_%d_%s.mat',...
            codeWordStr,k,lastName);
        save(melFileName,'melCoeffs')
    end
%     calculate for frame 5;
%     N = 4096;
%     
%     fSig = nonBGsig(:,10);
%     
%     FFT = log(abs(fft(fSig,N));
%     
%     Pxx = pyulear(fSig,12,N);
%     % plot FFT spec
%     plot((0:(N/2))*Fs/N,FFT(1:(N/2+1)))
%     hold on
%     % plot power spectral density
%     plot((0:(N/2))*Fs/(2*pi),Pxx)
    
    
    
end

    
    
    
    
    
    