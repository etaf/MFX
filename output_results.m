function  output_results( song_name,results ,plot_opt )


fprintf('######## %s: sorted result:########\n',song_name);
[sorted_dist,pos] = sort([results.avg_dist],'ascend');
[~,n] = size(results);
for i=1:n
    fprintf('%d\t%s\tscore=%.2f\tdist=%.2f\n',i,results(pos(i)).name,results(pos(i)).final_score,results(pos(i)).avg_dist);
end

% fprintf('======================== test end ========================\n');

%%
fp = fopen('report.txt','a+');
now_time = [num2str(hour(now)),':',num2str(minute(now)),' ',num2str(year(now)),'-',num2str(month(now)),'-',num2str(day(now))];

fprintf(fp,'======================== test begin ========================\n');

fprintf(fp,'test_report at %s\n',now_time);
fprintf(fp,'%s: sorted result:\n',song_name);

for i=1:n
    fprintf(fp,'%d\t%s\tscore=%.2f\tdist=%.2f\n',i,results(pos(i)).name,results(pos(i)).final_score,results(pos(i)).avg_dist);
end

fprintf(fp,'======================== test end ========================\n\n\n');

fclose(fp);
%%


if plot_opt == true
    plot_testers(song_name,results);
end

end

function plot_testers(song_name,results)
[scores,~] = sort([results.final_score],'descend');
    x =1:length(scores);
    
    figure;
    plot(x,scores,'--rs','LineWidth',2,...
        'MarkerEdgeColor','g',...
        'MarkerFaceColor','g',...
        'MarkerSize',5);
    axis([0,30,0,100]);
    set(gca,'XTick',0:1:30);
    set(gca,'YTick',0:2:100);
    grid on;
    set(gca,'GridLineStyle','-');
    grid(gca,'minor');
    xlabel('ÅÅÃû');
    ylabel('·ÖÊý');
    title(song_name);
end
