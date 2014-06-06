function [ output_args ] = etaf_compare_mfcc( input_args )
%ETAF_COMPARE_MFCC Summary of this function goes here
%   Detailed explanation goes here
[y,fs,nbit] = wavread('songs/ÍüÇéË®/origin/1.wav');
etaf_fs = 16000;

if(fs ~= etaf_fs)
    y = resample(y,etaf_fs,fs);
    fs = etaf_fs;
end
v1 = mfcc(y,fs);
v2 = melfcc(y,fs)';
v2 = [v2 get_det(v2)];
end

