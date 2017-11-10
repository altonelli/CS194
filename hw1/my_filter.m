function F = my_filter(size, sigma);
    m = ones(size, size);
    center = ceil(size / 2);
    disp(center);
    
    for x = 1:size
       for y = 1:size
            rel_x = x - center;
            rel_y = y - center;
            m(x,y) = exp(-((rel_x^2)+(rel_y^2))/(2*(sigma^2)))
       end    
    end
    m = (1/(2*pi*(sigma^2))) * m;
    F = m;
end