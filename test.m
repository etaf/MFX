function test( test_dir,feature_mat,song_name )

global ETAF_DEBUG;
etaf_debug = ETAF_DEBUG;
global ETAF_RMZERO;
etaf_rmzero = ETAF_RMZERO;
global ETAF_FS;
etaf_fs = ETAF_FS;

%% get test people number
ps = dir(test_dir);
test_people_num = size(ps,1)-2 ;
%%
%fprintf('======================== testing =========================\n');

for p = 1:test_people_num
    
    test_pep_dir = [test_dir,ps(p+2).name,'/'];
    files = dir(test_pep_dir);
    n = size(files,1)-2;

    dist_sum =0;
    
    parfor i=1:n
        dist = test_unit([test_pep_dir,num2str(i),'.wav'],feature_mat{i},etaf_debug,etaf_rmzero,etaf_fs );
        score = get_score(dist);
        dist_sum = dist_sum + dist;
    end
    
    avg_dist = dist_sum / n;
    final_score = get_score(avg_dist);
    
    if(etaf_debug)
        fprintf('### %s final score = %.2f\n',ps(p+2).name,final_score);
    end
    
    results(p) = struct('name',ps(p+2).name,'final_score',final_score,'avg_dist',avg_dist);
    
end

%%
output_results(song_name,results);


end





