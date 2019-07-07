function Y = f(y1,y2)
    %y1'
    Y(1) = y1 - 0.5*y1*y2;
    %y2'
    Y(2) = 0.4*y1*y2 - 0.8*y2;
end
