function F = polish(T, B);
    TC = edge(T, 'canny');
    BC = edge(B, 'canny');
    
    max_corr = corr2(TC, BC);
    max_shift = [0 0];
    min_corr = corr2(TC, BC);
    min_shift = [0 0];
    
    for x = [-5,-4,-3,-2,-1,0,1,2,3,4,5]
       for y = [-5,-4,-3,-2,-1,0,1,2,3,4,5]
           disp('shift');
           TShift = circshift(TC,[x y]);
           current_corr = corr2(TShift, BC);
           if current_corr > max_corr
               max_corr = current_corr;
               max_shift = [x y];
           elseif current_corr < min_corr
               min_corr = current_corr;
               min_shift = [x y];
           end
       end
    end
    
    fprintf('polish cor: %i\n',max_shift);

    F = circshift(T, max_shift);
end