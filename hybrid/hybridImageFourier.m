function Im = hybridImageFourier(im1, im2, cutoff_low, cutoff_high)
reg_filter = my_filter(9, 1);
low_filter = my_filter(9,2);
im1F = fft2(im1);
im2F = fft2(im2);

figure(4), hold off, imagesc(im1F), axis image, colormap gray;
figure(5), hold off, imagesc(im2F), axis image, colormap gray;

im1_low = imfilter(im1, low_filter, 'conv');
im2_low = imfilter(im2, reg_filter, 'conv');
im2_high = im2 - im2_low;

im1 = dot(im1, im1_low);
im2 = dot(im2, im2_high);

Im = im1 * (cutoff_low / 100) + im2 * (cutoff_high / 100);
figure(6), hold off, imagesc(Im), axis image, colormap gray;
end