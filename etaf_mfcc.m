function ccc = etaf_mfcc( y,fs )
%ETAF_MFCC Summary of this function goes here
%   Detailed explanation goes here
FrameSize = 256
OverLap = 128
x = etaf_enframe(y,FrameSize,OverLap);

[nf,frameSize] = size(x);
filter_num = 24;
coef_num = 12;
bank = melbankm(filter_num,frameSize);
m = zeros(nf,coef_num)
s = x' .* hamming(FrameSize);
for i=1:nf
    y = x(i,:);
    s = y' .* hamming(FrameSize);
    t = abs(fft(s));
end

end

