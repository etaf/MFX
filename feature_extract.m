function [ v ] = feature_extract( y,fs )


% v = melcepst(y,fs,'Rd',12,24,frameSize,floor(frameSize/3) );

% v = melcepst(y,fs,'Rd',20,36,512,256);

v = mfcc(y,fs);

end

