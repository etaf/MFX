function dist = lr_dist(s,t)

ns = size(s,1);
nt = size(t,1);

dist = 0;
limit_l = 0;
limit_r = 2;
for i=1:nt 
    min_dist = inf;
    left_bound = min(ns,max(1,i-limit_l));
    right_bound = min(ns,i+limit_r);
    for j = left_bound : right_bound
        min_dist = min(min_dist , sum( ( t(i,:) - s(j,:)).^2) );
    end
    dist = dist  + min_dist;
end
dist = dist/nt;
end
