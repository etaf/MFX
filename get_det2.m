function v = get_det2( m )

[r,c] = size(m);
v = zeros(r,c);
for i = 1:r-1
    v(i,:) = m(i+1,:) - m(i,:);
end
v(r,:) = v(r-1,:);

