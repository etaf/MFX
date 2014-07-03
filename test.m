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
global ETAF_SENTENCE_PLOT;
%% get test people number
ps = dir(test_dir);
test_people_num = size(ps,1)-2 ;
%%

dist_seg = [0,800,2800,inf];
score_seg = [100,95,1,0];
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
    scores = zeros(n,1);

    for i=1:n
        dist = test_unit([test_pep_dir,num2str(i),'.wav'],feature_mat{i},etaf_debug,etaf_rmzero,etaf_fs );
        dist_sum = dist_sum + dist;
        score = get_score(dist,dist_seg,seg_num,cof_ab);
        scores(i) = score;
        if(ETAF_SENTENCE)
            fprintf('%s %s %dth sentence: score=%.2f dist=%.2f\n',song_name,ps(p+2).name,i,score,dist)
        end
    end
    

    avg_dist = dist_sum / n;
    scores = sort(scores,'descend');
    topn = min(3,n);
    highest_score = sum(scores(1:topn))/topn;
    
    final_score = get_score(avg_dist,dist_seg,seg_num,cof_ab);
%     final_score = final_score*0.9 + highest_score*0.1;
    results(p) = struct('name',ps(p+2).name,'final_score',final_score,'avg_dist',avg_dist,'highest_score',highest_score);;
    
      
    if(ETAF_SENTENCE_PLOT)
        plot_sentences(song_name,ps(p+2).name,scores);
    end
end
%%
output_results(song_name,results,false);


end

function plot_sentences(song_name,singer_name,scores)
figure;
x = 1:length(scores);
plot(x,scores,'--rs','LineWidth',2,...
    'MarkerEdgeColor','g',...
    'MarkerFaceColor','g',...
    'MarkerSize',5);
axis([0,20,0,100]);
set(gca,'XTick',0:1:20);
set(gca,'YTick',0:2:100);
grid on;
set(gca,'GridLineStyle','-');
grid(gca,'minor');
xlabel('¾ä×Ó');
ylabel('·ÖÊý');
title([song_name,': ',singer_name]);
end


