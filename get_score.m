function score = get_score( dist ,dist_seg,seg_num,cof_ab)


for j=1:seg_num
    if(dist_seg(j)<=dist && dist <=dist_seg(j+1))
        score = dist*cof_ab(j,1) + cof_ab(j,2);
    end
end

end

