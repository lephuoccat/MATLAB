% test_lpc.m

% load speech from file 1A.waV
    [xx,fs]=loadwav('1A.waV');
    % [xx,fs]=loadwav('test_16k.wav');
    
% define lpc parameters
    L=40*fs/1000;
    p=12;
    nfft=1000;
    ss=5000;
    % ss=1430;
    
% plot stft
    xs=xx(ss:ss+L-1).*hamming(L)/32768.;
    XS=20*log10(abs(fft(xs,nfft)));
    
% lpc analysis (rectangular window)
    x=xx(ss:ss+L-1)/32768;
    [A,G,a,r]=autolpc(x,p);
    
% lpc spectrum
    denom=[1 -a(1:p)'];
    xs2=20*log10(G)-20*log10(abs(fft(denom,nfft)));
    
% plot lpc spectrum
    figure(1);subplot(211),plot(xs2(1:nfft/2),'b');
    hold on;
    plot(XS(1:nfft/2),'m');
    
% lpc analysis (Hamming window)
    x=xx(ss:ss+L-1).*hamming(L)/32768.;
    [A,G,a,r]=autolpc(x,p);
    denom=[1 -a(1:p)'];
    
% lpc spectrum
    xs2=20*log10(G)-20*log10(abs(fft(denom,nfft)));
    plot(xs2(1:nfft/2),'r');
    
% window compensation
    Uh=sum(hamming(L).^2)/L;
    Uhlog=10*log10(Uh);
    
% Durbin ac routine
    wtype=1;  % Hamming window
    [R,E,k,alpha,G]=durbin(xx(ss:ss+L-1)/32768.,L,p,wtype); 
    denom=[1 -alpha(1:p,p)'];
    
% lpc spectrum
    xs2=20*log10(G)-20*log10(abs(fft(denom,nfft)));
    subplot(212),plot(xs2(1:nfft/2),'k');hold on;
    
    wtype=0;  % rectangular window
    [R,E,k,alpha,G]=durbin(xx(ss:ss+L-1)/32768.,L,p,wtype);
    denom=[1 -alpha(1:p,p)'];
    
% lpc spectrum
    xs2=20*log10(G)-20*log10(abs(fft(denom,nfft)));
    plot(xs2(1:nfft/2),'k:');
    