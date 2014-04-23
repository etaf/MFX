function dist = get_dist( s,t )

ns = size(s,1);
nt = size(t,1);
if ns ~= nt
    fprintf('+-------------------+\n');
    fprintf('| ns=%04d | nt=%04d |\n',ns,nt);
    fprintf('+-------------------+\n');
end


dist = direct_dist(s,t);
%     dist = get_extend_dist(s,t);
%     dist = dtw(s,t);
% dist = dist/size(s,1);
dist = dist/ns;
end

