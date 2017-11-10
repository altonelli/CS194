% CS194-26 (cs219-26): Project 1, starter Matlab code

% name of the input file
imname = 'monastery.jpg';
% imname = 'settlers.jpg';
% imname = 'tobolsk.jpg';
% imname = 'melons.tif';
% imname = 'emir.tif';

% read in the image
fullim = imread(imname);

% convert to double matrix (might want to do this later on to same memory)
fullim = im2double(fullim);

% compute the height of each part (just 1/3 of total)
height = floor(size(fullim,1)/3);
% separate color channels
B = fullim(1:height,:);
G = fullim(height+1:height*2,:);
R = fullim(height*2+1:height*3,:);

BI = B;
GI = G;
RI = R;

num_of_resize = 0;
while size(BI,1) > 1500
    num_of_resize = num_of_resize + 1;
    BI = my_img_pyramid(BI, 1)
    GI = my_img_pyramid(GI, 1)
    RI = my_img_pyramid(RI, 1)
end

BCI = edge(BI, 'canny');
GCI = edge(GI, 'canny');
RCI = edge(RI, 'canny');

BC = edge(B, 'canny');
GC = edge(G, 'canny');
RC = edge(R, 'canny');



% Align the images
% Functions that might be useful to you for aligning the images include: 
% "circshift", "sum", and "imresize" (for multiscale)

% aG2 = align(G2,B2);
% aR2 = align(R2,B2);
% imNew = cat ( 3, aG2, aR2, B2);

% aG = align(G,B);
% aR = align(R,B);

scale = num_of_resize * 2;
if scale == 0
    scale = 1;
end
disp(scale);

alG = alignment(GCI,BCI) * scale;
alR = alignment(RCI,BCI) * scale;

fprintf('alG %i\n', alG);
fprintf('alR %i\n', alR);

aG = circshift(G, alG);
aR = circshift(R, alR);

pG = polish(aG, B);
pR = polish(aR, B);

% hG = histeq(pG);
% hR = histeq(pR);
% hB = histeq(B);

mG = my_hist(pG);
mR = my_hist(pR);
mB = my_hist(B);

% imN = cat ( 3, pR, pG, B);
% imNew = cat ( 3, hR, hG, hB);
myIm = cat ( 3, mR, mG, mB);

r2c = rows_to_crop(myIm, .1, .90, .25);
disp(r2c);

myIm = auto_crop(myIm, r2c);
% figure, imshow(imN);
% figure, imshow(imNew);
figure, imshow(myIm);

% open figure
%figure(1);

% create a color image (3D array)
% ... use the "cat" command
% show the resulting image
% ... use the "imshow" command
% save result image
%% imwrite(colorim,['result-' imname]);