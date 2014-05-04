function test( test_dir,feature_mat,song_name )


if ~isempty(str2num(song_name)) %num to song_name
    if ~exist('songname')
        load  songidmap.mat;
    end
    song_name = songname(str2num(song_name));
end


global ETAF_DEBUG;
etaf_debug = ETAF_DEBUG;
global ETAF_RMZERO;
etaf_rmzero = ETAF_RMZERO;
global ETAF_FS;
etaf_fs = ETAF_FS;

global ETAF_SENTENCE;

%% get test people number
ps = dir(test_dir);
test_people_num = size(ps,1)-2 ;
%%

dist_seg = [0,1100,3000,inf];
score_seg = [100,90,1,0];
seg_num = length(score_seg)-1;
cof_ab = zeros(seg_num,2);

for i=1:seg_num
    x1 = dist_seg(i);
    x2 = dist_seg(i+1);
    y1 = score_seg(i);
    y2 = score_seg(i+1);
    cof_ab(i,1) = (y2-y1)/(x2-x1);
    cof_ab(i,2) = y1-cof_ab(i,1)*x1;
end


%fprintf('======================== testing =========================\n');

for p = 1:test_people_num
    
    test_pep_dir = [test_dir,ps(p+2).name,'/'];
    files = dir(test_pep_dir);
    n = size(files,1)-2;
    
    dist_sum =0;
    
    for i=1:n
        dist = test_unit([test_pep_dir,num2str(i),'.wav'],feature_mat{i},etaf_debug,etaf_rmzero,etaf_fs );
        
        score = get_score(dist,dist_seg,seg_num,cof_ab);
        
        if(ETAF_SENTENCE)
            fprintf('%s %s %dth sentence: score=%.2f dist=%.2f\n',song_name,ps(p+2).name,i,score,dist)
            dist_sum = dist_sum + dist;
        end
        
        avg_dist = dist_sum / n;
        final_score = get_score(avg_dist,dist_seg,seg_num,cof_ab);
        
        if(etaf_debug)
            fprintf('### %s final score = %.2f\n',ps(p+2).name,final_score);
        end
        
        results(p) = struct('name',ps(p+2).name,'final_score',final_score,'avg_dist',avg_dist);
        
    end
end
%%
output_results(song_name,results);


end



