function F = alignment(T, B);

C = normxcorr2(T(:,:,1),B(:,:,1));

% figure, surf(C), shading flat;

% offset found by correlationq
[max_C, imax] = max(abs(C(:)));
[ypeak, xpeak] = ind2sub(size(C), imax(1));
fprintf('y peak %i\n', ypeak);
fprintf('x peak %i\n', xpeak);
corr_offset = [(xpeak-size(T,2)) (ypeak-size(T,1))];
fprintf('y corr_offset %i\n', corr_offset(1));
fprintf('x corr_offset %i\n', corr_offset(2));

% relative offset of position of subimages
rect_offset = [(B(1)-T(1)) (B(2)-T(2))]
           
% total offset
offset = corr_offset + rect_offset;
xoffset = round(offset(1))
yoffset = round(offset(2))
% F = circshift(T,corr_offset);
F = [yoffset xoffset];
% F = circshift(T,[0 0]);
end