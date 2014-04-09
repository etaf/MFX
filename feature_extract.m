function [ v ] = feature_extract( y,fs )


frameTime = 15;

frameSize = floor(fs*frameTime/1000);

% v = melcepst(y,fs,'Rd',12,24,frameSize,floor(frameSize/3) );
%   v = melcepst(y,fs,'Rd',12,24,512,128);
v = fxrapt(y,fs);
end

