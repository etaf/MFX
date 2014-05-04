function ccc = mfcc(y,fs)

y=filter([1 -0.9375],1,y);
frameTime = 15;
frameSize = floor(fs*frameTime/1000);   %帧长
overLap = floor(frameSize/3);           %帧重叠

x = enframe(y,frameSize,overLap);

%%
[nf,frameSize] = size(x);
filter_num = 24; %三角滤波器个数
coef_num = 12; %阶数


% mel滤波器组系数
bank=melbankm1(filter_num,frameSize,fs,0,0.5,'tz');

% DCT系数,coef_num*filter_num;
for k=1:coef_num
  n=1:filter_num;
  dctcoef(k,:)=cos((n-0.5)*k*pi/(filter_num));
end

% 归一化倒谱提升窗口
w = 1 + 6 * sin(pi * [1:coef_num] ./ coef_num);
w = w/max(w);

m= zeros(nf,coef_num);
j=1;
for i=1:nf
  y = x(i,:);
%   if y(:)==0
%     m(j,:)=0;
%     j=j+1;
%     continue;
%   end
  if y(:) < 1E-4
      y(:) = 1E-20;
%       fprintf('0-frame!\n');
  end
  
  s = y' .* hamming(frameSize);
  t = abs(fft(s));
  t = t.^2;
  c1=dctcoef * log(bank * t(1:1+floor(frameSize/2)));
  c2 = c1.*w';
% c2 = c1;
  if size(m,2) ~= size(c2,1)
    fprintf('size of m = %dx%d \t size of c2 = %d\n',size(m,1),size(m,2),size(c2,1));
  end
  m(j,:)=c2';
  j = j+1;
end

% for i=1:nfwe
%   y = x(i,:);
%   s = y' .* hamming(frameSize);
%   t = abs(fft(s));
%   t = t.^2;
%   c1=dctcoef * log(bank * t(1:1+floor(frameSize/2)));
%   c2 = c1.*w';
%   m(i,:)=c2';
% 
% end

%差分系数
% dtm = zeros(size(m));
% for i=3:size(m,1)-2
%     dtm(i,:) = -2*m(i-2,:) - m(i-1,:) + m(i+1,:) + 2*m(i+2,:);
% end
% 
% dtm = dtm / 3;

ccc = [m get_det(m)];
% ccc = ccc(3:size(m,1)-2,:);
