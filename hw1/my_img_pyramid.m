function F = my_img_pyramid(I, sigma);
    start_width = size(I,2);
    start_height = size(I,1);
    
    newImg = ones(floor(start_height/2), floor(start_width/2));
    intImg = ones(floor(start_height), floor(start_width/2));
    
    filter = my_filter(9, sigma);
    
    I = conv2(I, filter, 'same');
    
    for x = 1:size(intImg,2)
        intImg(:,x) = I(:, (x * 2));
    end
    for y = 1:size(newImg,1)
        newImg(y,:) = intImg((y * 2), :);
    end

    F = newImg;
end