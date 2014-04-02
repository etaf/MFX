function  output_results( song_name,results )

fprintf('######## %s: sorted result:########\n',song_name);
[etaf_ans,pos] = sort([results.avg_dist],'ascend');
[~,n] = size(results);
for i=1:n
    fprintf('%d: %s score=%.2f dtw_dist=%.2f\n',i,results(pos(i)).name,results(pos(i)).final_score,results(pos(i)).avg_dist);
end

% fprintf('======================== test end ========================\n');

%%
fp = fopen('test_report.txt','a+');
now_time = [num2str(hour(now)),':',num2str(minute(now)),' ',num2str(year(now)),'-',num2str(month(now)),'-',num2str(day(now))];

fprintf(fp,'======================== test begin ========================\n');

fprintf(fp,'test_report at %s\n',now_time);
fprintf(fp,'%s: sorted result:\n',song_name);

for i=1:n
    fprintf(fp,'%d: %s score=%.2f dtw_dist=%.2f\n',i,results(pos(i)).name,etaf_ans(i),results(pos(i)).avg_dist);
end

fprintf(fp,'======================== test end ========================\n\n\n');

fclose(fp);

end

