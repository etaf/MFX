function  etaf()


FS = 16000;


[y,fs] = wavread('songs/忘情水/origin/4.wav');
if fs ~= FS
    y = resample(y,etaf_fs,fs);
    fs = FS;
end

y=filter([1 -0.9375],1,y);
frameTime = 15;
frameSize = 256;   %帧长
overLap = floor(frameSize/3);           %帧重叠

x = enframe(y,frameSize,overLap);

[nf,frameSize] = size(x);

bank = (melbankm1(24,256,16000,0,0.5)');
figure;
plot(bank);
y = x(1,:);
s = y' .* hamming(frameSize);
t = abs(fft(s));
t = t.^2;
figure;
plot(t);
end

