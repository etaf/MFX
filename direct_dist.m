function dist = direct_dist( s , t)
%DIRECT_DIST Summary of this function goes here
%   Detailed explanation goes here
ns = size(s,1);
nt = size(t,1);

n = min(ns,nt);
dist = 0;
for i=1:n
    dist = dist + sum( (s(i,:)-t(i,:)).^2 );
end

end

