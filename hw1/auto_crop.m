function F = auto_crop(I, rows)
    h = size(I,1);
    w = size(I,2);
    
    imshow(I);
    
    newTop = rows(1,1);
    newRight = rows(1,2);
    newBot = rows(1,3);
    newLeft = rows(1,4);
    
    newH = newBot - newTop;
    newW = newRight - newLeft;
    
%     [xmin ymin width height]
    newImg = imcrop(I, [newLeft, newTop, newW, newH]);
    
%     newImg = I(newTop:newBot, newLeft:newRight);

    F = newImg;
end