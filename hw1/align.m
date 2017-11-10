% ## Copyright (C) 2017 Arthur Tonelli
% ## 
% ## This program is free software; you can redistribute it and/or modify it
% ## under the terms of the GNU General Public License as published by
% ## the Free Software Foundation; either version 3 of the License, or
% ## (at your option) any later version.
% ## 
% ## This program is distributed in the hope that it will be useful,
% ## but WITHOUT ANY WARRANTY; without even the implied warranty of
% ## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% ## GNU General Public License for more details.
% ## 
% ## You should have received a copy of the GNU General Public License
% ## along with this program.  If not, see <http://www.gnu.org/licenses/>.
% 
% ## -*- texinfo -*- 
% ## @deftypefn {Function File} {@var{retval} =} align (@var{input1}, @var{input2})
% ##
% ## @seealso{}
% ## @end deftypefn
% 
% ## Author: Arthur Tonelli <arthurtonelli@Arthurs-MBP.hsd1.ca.comcast.net>
% ## Created: 2017-01-29

function F = align(T, B);

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
F = circshift(T,[yoffset xoffset]);
% F = circshift(T,[0 0]);
end
