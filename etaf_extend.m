function new_mat = etaf_extend(old_mat,new_n)
    
    [old_n,coln] = size(old_mat);
    dn = new_n-old_n;
    new_mat = zeros(new_n,coln);
    divn = floor(old_n/dn);
    nowp = 1;
    nowq = 1;
    for i=1:dn
   
        new_mat(nowp:nowp + divn-1,:) = old_mat(nowq:nowq+divn-1,:);
        nowq = nowq + divn;
        nowp = nowp + divn;
        if nowp == new_n
            new_mat(nowp,:) = 0.25*new_mat(nowp-2,:)+0.75*new_mat(nowp-1,:);
        else
            new_mat(nowp,:) = 0.5*new_mat(nowp-1,:) + 0.5*new_mat(nowp+1,:);
        end
        nowp = nowp+1;
        
    end
end