function F = rows_to_crop(I, lower_threshold, threshold, fraction)
    r2c = [0 0 0 0];
    
    h = size(I,1);
    w = size(I,2);
    
    for row = 1:h
        row_count = 0;
        for col = 1:w
            px = impixel(I, col, row);
            if px(1,1) >= threshold || px(1,2) >= threshold || px(1,3) >= threshold
                row_count = row_count + 1;
            elseif px(1,1) <= lower_threshold || px(1,2) <= lower_threshold || px(1,3) <= lower_threshold
                row_count = row_count + 1;
            end
        end
        if row_count > w * fraction
            r2c(1,1) = row;
        elseif row_count < w * fraction
            break;
        end
    end
    
    for row = h:-1:1
        row_count = 0;
        for col = 1:w
            px = impixel(I, col, row);
            if px(1,1) >= threshold || px(1,2) >= threshold || px(1,3) >= threshold
                row_count = row_count + 1;
            elseif px(1,1) <= lower_threshold || px(1,2) <= lower_threshold || px(1,3) <= lower_threshold
                row_count = row_count + 1;
            end
        end
        if row_count > w * fraction
            r2c(1,3) = row;
        elseif row_count < w * fraction
            break;
        end
    end
    
    for col = 1:w
        col_count = 0;
        for row = 1:h
            px = impixel(I, col, row);
            if px(1,1) >= threshold || px(1,2) >= threshold || px(1,3) >= threshold
                col_count = col_count + 1;
            elseif px(1,1) <= lower_threshold || px(1,2) <= lower_threshold || px(1,3) <= lower_threshold
                col_count = col_count + 1;
            end
        end
        if col_count > h * fraction
            r2c(1,4) = col;
        elseif col_count < h * fraction
            break;
        end
    end
    
    for col = w:-1:1
        col_count = 0;
        for row = 1:h
            px = impixel(I, col, row);
%             disp(px);
            if px(1,1) >= threshold || px(1,2) >= threshold || px(1,3) >= threshold
                col_count = col_count + 1;
            elseif px(1,1) <= lower_threshold || px(1,2) <= lower_threshold || px(1,3) <= lower_threshold
                col_count = col_count + 1;
            end
        end
        if col_count > h * fraction
            r2c(1,2) = col;
        elseif col_count < h * fraction
            break;
        end
    end

    
    F = r2c;
end