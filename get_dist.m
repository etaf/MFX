function dist = get_dist(feature_origin,feature)
    [n,~] = size(feature_origin);
    [m,~] = size(feature);

    
    nm = max(n,m);
    if(m<n)
        feature = etaf_extend(feature,nm);
    end
    if(m>n)
        feature_origin = etaf_extend(feature_origin,nm);
    end
    
    [n,~] = size(feature_origin);
    [m,~] = size(feature);
    
    if(n ~= m)
        fprintf('|origin:%d |test:%d |\n',n,m);
    end
    
    dist = 0;
    for i=1:nm
        dist = dist + sum( (feature_origin(i,:)-feature(i,:)).^2 );
    end
    dist = dist/nm;
end