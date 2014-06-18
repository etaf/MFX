function [ v ] = feature_extract( y,fs )
% zeroth = 1e-30;
% for i=1:length(y)
%     if( abs( y(i) ) < zeroth)
%         if( y(i)<0 )
%             y(i) = -zeroth;
%         else
%             y(i) = zeroth;
%         end
%     end
% end
% v = melcepst(y,fs,'Rd',12,24,frameSize,floor(frameSize/3) );

% v = etaf_melcepst(y,fs,'Mp',12,24,256,128);
% v = [v get_det(v)];
v = mfcc(y,fs);

% [v,~,~] = melfcc(y,fs);
% v= v';
% v = [v get_det(v)];
% v = v(3:size(v,1)-2,:);

% v = etaf_feature(y,fs);
end

