function [ v ] = feature_extract( y,fs )
% return  feature vector v
%  frameTime 每帧的时间 单位ms


frameTime = 15;

frameSize = floor(fs*frameTime/1000);

v = melcepst(y,fs,'Rd',12,24,frameSize,floor(frameSize/3) );
    
end

