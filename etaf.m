function  etaf()
%ETAF Summary of this function goes here
%   Detailed explanation goes here
[y1,fs1] = wavread('songs/十年/test/刘旺/5.wav');
[y2,fs2] = wavread('songs/十年/test/刘旺乱唱/5.wav');
x = 1;
y = fun(x);
fprintf('x=%d y=%d\n',x,y);
end

