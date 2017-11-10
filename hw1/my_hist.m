function F = my_hist(I)
    counts = zeros(1,257);
    cc = 0;
    
    for row = 1:size(I, 1)
        for col = 1:size(I, 2)
            val = floor(I(row, col) * 256) + 1;
%             disp(val);
            counts(1,val) = counts(1,val) + 1;
            cc = cc + 1;
%             disp(counts(val));
        end
    end

    p = ones(1,257);
    for color = 1:size(counts,2)
        p(1,color) = counts(1,color)/cc;
    end
    
    cdf = zeros(1,257);
    prev = 0;
    for color = 1:size(counts,2)
        cdf(1,color) = p(1,color) + prev;
        prev = cdf(1,color);
    end
%     disp(cdf(1,:));
    
    for row = 1:size(I, 1)
        for col = 1:size(I, 2)
            val = floor(I(row, col) * 256);
            idx = val + 1;
            I(row, col) = floor(256 * cdf(1,idx)) / 256;
        end
    end
    F = I;
end