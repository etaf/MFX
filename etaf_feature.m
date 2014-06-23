function v = etaf_feature(y,fs)
    n  = 256;
    inc = 128;
    z = enframe(y,hamming(n),inc);
    f = fft(z.');
 
end