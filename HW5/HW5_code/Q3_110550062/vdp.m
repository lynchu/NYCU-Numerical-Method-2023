function dy=vdp(t,y)
    dy = [y(2) y(3) y(1)*2-t*y(2)+t]';
end
