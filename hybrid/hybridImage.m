function Im = hybridImage(im1, im2, cutoff_low, cutoff_high)
reg_filter = my_filter(9, 1);
low_filter = my_filter(9,2);
im1_low = imfilter(im1, low_filter, 'conv');
im2_low = imfilter(im2, reg_filter, 'conv');
im2_high = im2 - im2_low;

figure(1), hold off, imagesc(im1_low), axis image, colormap gray;
figure(2), hold off, imagesc(im2_high), axis image, colormap gray;

im1 = dot(im1, im1_low);
im2 = dot(im2, im2_high);

Im = im1 * (cutoff_low / 100) + im2 * (cutoff_high / 100);
figure(3), hold off, imagesc(Im), axis image, colormap gray;
end