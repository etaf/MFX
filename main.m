function main(song_name)

close all;
warning off

% clear all;

%% global setting
global ETAF_DEBUG;
ETAF_DEBUG = false;

global ETAF_RMZERO;
ETAF_RMZERO = false;
global ETAF_FS;
ETAF_FS = 16000;
global  ETAF_MULTIPLE_THREAD;
ETAF_MULTIPLE_THREAD = true;

%% args process
if nargin == 1
    song_name_list = {song_name};
else
    song_name_list = {...
        '十年',...
        };
end

%% 
if( ETAF_MULTIPLE_THREAD)
    open_multiple_thread();
end
for i=1:length(song_name_list)
    
    [validated , train_dir,test_dir] = song_dir_validate(song_name_list{i});
    if (validated  == false )
        continue;
    end
    
    feature_mat = train(train_dir);

    test(test_dir,feature_mat,song_name_list{i});
    
end


end

