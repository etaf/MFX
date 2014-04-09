function dist = test_unit( waveFile,feature_origin,etaf_debug,etaf_rmzero,etaf_fs )
%����
[y,fs,nbits] = wavread(waveFile);
if(etaf_debug)
    fprintf('fs = %d nbits=%d\n',fs,nbits);
end
if(fs ~= etaf_fs)
    y = resample(y,etaf_fs,fs);
    fs = etaf_fs;
end
if(etaf_debug)
    fprintf('resample: fs = %d\n',fs);
end
%wavplay(y,fs);
%[x,zcr,shortEnergy] = pre_process(waveFile,y,fs,nbits);
if(etaf_rmzero)
    y = remove_zero(y);
end
if(length(y)<256)
    dist =Inf;
else
    feature =  feature_extract(y,fs);
%     dist = get_dist(feature_origin,feature);
    dist = dtw(feature_origin,feature);
    dist = dist/size(feature_origin,1);
end

if(etaf_debug)
    fprintf('%dth sentence origin_frame_num = %d; test_frame_num=%d\n',i,size(feature_mat{i},1),size(feature,1));
end

end

