import numpy as np
import scipy as sp
from scipy.ndimage.filters import correlate
import pprint

def align(img1, img2):

    corr_vals = normxcorr(img1, img2)

    return img1

def normxcorr(img1, img2):

    corr_vals = correlate(img1, img2)
    # corr_vals = corr_vals / (np.std(img1) * np.std(img2))
    pprint.pprint(corr_vals)

    return corr_vals

def normalize_img(img):

    # for row in img:
    #     row = row

    return img