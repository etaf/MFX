function [ result,train_dir,test_dir ] = song_dir_validate( song_name )
%SONG_DIR_INVALIDATE Summary of this function goes here
%   Detailed explanation goes here
    fprintf('######## song: %s ########\n',song_name);
    result = true;
    train_dir = ['songs/',song_name,'/origin/'];
    if ~isdir(train_dir)
        fprintf('%s train_set does not exit!\n',song_name);
        result = false;
    end
    test_dir =  ['songs/',song_name,'/test/'];
    if ~isdir(test_dir)
        fprintf('%s test_set does not exit!\n',song_name);
        result = false;
    end
end

