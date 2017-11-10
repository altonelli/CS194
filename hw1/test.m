imname = 'monastery.jpg';

fullim = imread(imname);

fullim = im2double(fullim);

imNew = my_img_pyramid(fullim, 1);

Iblur = imgaussfilt(fullim, 2);

Icrop = impyramid(fullim,'reduce')

figure, imshow(Icrop);
figure, imshow(imNew);

% % compute the height of each part (just 1/3 of total)
% height = floor(size(fullim,1)/3);
% % separate color channels
% B = fullim(1:height,:);
% G = fullim(height+1:height*2,:);
% R = fullim(height*2+1:height*3,:);