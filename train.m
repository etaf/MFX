function  [feature_mat] = train(train_dir)

global ETAF_DEBUG;
etaf_debug = ETAF_DEBUG;
global ETAF_RMZERO;
etaf_rmzero = ETAF_RMZERO;
global ETAF_FS;
etaf_fs = ETAF_FS;

%% get song segments number n
files = dir(train_dir);
[n,~] = size(files);
n = n-2;

%% start training for each song segments
%   trained feature stored in feature_mat

feature_mat = cell(n,1);

for i =1:n
    waveFile = [train_dir,num2str(i),'.wav'];
    [y,fs,nbits] = wavread(waveFile);
    
    if(etaf_debug)
        fprintf('fs = %d nbits=%d\n',fs,nbits);
    end
    
    if(fs ~= etaf_fs)
        y = resample(y,etaf_fs,fs);
        fs = etaf_fs;
    end
%     [x,zcr,shortEnergy] = pre_process(waveFile,y,fs,nbits);
    if(etaf_rmzero)
        y=remove_zero(y);
    end    
    feature_mat{i}= feature_extract(y,fs);
    
end
end

